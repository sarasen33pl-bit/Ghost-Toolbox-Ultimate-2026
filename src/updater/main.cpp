/**
 * ============================================================================
 * Ghost Toolbox Launcher & Updater (Reconstructed Architecture - 2026 AAA Edition)
 * Fully reverse-engineered, modernized, and reconstructed from toolbox.updater.x64.exe
 * Target OS: Windows 10 / Windows 11 / Windows Server (x86_64)
 * ============================================================================
 * Disassembly Source:
 *   PE Image Base: 0x140000000
 *   Entry Function: 0x14000D700 (called from main @ 0x14009CD54)
 *   Archive Password: ghostX2021
 *   Target Deploy: %Windir%\System32\migwiz\dlmanifests\run.ghost.cmd
 * ============================================================================
 */

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <shellapi.h>
#include <iostream>
#include <string>
#include <vector>
#include <filesystem>

namespace fs = std::filesystem;

#define ANSI_RESET   "\033[0m"
#define ANSI_BOLD    "\033[1m"
#define ANSI_RED     "\033[91m"
#define ANSI_GREEN   "\033[92m"
#define ANSI_YELLOW  "\033[93m"
#define ANSI_BLUE    "\033[94m"
#define ANSI_MAGENTA "\033[95m"
#define ANSI_CYAN    "\033[96m"
#define ANSI_WHITE   "\033[97m"

bool IsRunAsAdmin() {
    BOOL isAdmin = FALSE;
    PSID adminGroup = NULL;
    SID_IDENTIFIER_AUTHORITY ntAuthority = SECURITY_NT_AUTHORITY;

    if (AllocateAndInitializeSid(&ntAuthority, 2, SECURITY_BUILTIN_DOMAIN_RID,
        DOMAIN_ALIAS_RID_ADMINS, 0, 0, 0, 0, 0, 0, &adminGroup)) {
        CheckTokenMembership(NULL, adminGroup, &isAdmin);
        FreeSid(adminGroup);
    }
    return isAdmin == TRUE;
}

void RelaunchElevated(int argc, wchar_t* argv[]) {
    wchar_t szPath[MAX_PATH];
    if (GetModuleFileNameW(NULL, szPath, MAX_PATH)) {
        std::wstring parameters = L"";
        for (int i = 1; i < argc; ++i) {
            parameters += L"\"";
            parameters += argv[i];
            parameters += L"\" ";
        }

        SHELLEXECUTEINFOW sei = { sizeof(sei) };
        sei.lpVerb = L"runas";
        sei.lpFile = szPath;
        sei.lpParameters = parameters.c_str();
        sei.nShow = SW_SHOWNORMAL;

        if (!ShellExecuteExW(&sei)) {
            std::cerr << ANSI_RED << "[-] UAC Elevation was rejected or failed." << ANSI_RESET << std::endl;
        }
    }
}

void EnableVirtualTerminal() {
    HANDLE hOut = GetStdHandle(STD_OUTPUT_HANDLE);
    if (hOut == INVALID_HANDLE_VALUE) return;

    DWORD dwMode = 0;
    if (GetConsoleMode(hOut, &dwMode)) {
        dwMode |= ENABLE_VIRTUAL_TERMINAL_PROCESSING;
        SetConsoleMode(hOut, dwMode);
    }
    SetConsoleOutputCP(65001);
}

int ExecCommand(const std::string& cmd, bool suppressOutput = false) {
    std::string fullCmd = cmd;
    if (suppressOutput) {
        fullCmd += " >nul 2>nul";
    }
    return system(fullCmd.c_str());
}

std::string GetExeDirectory() {
    char szPath[MAX_PATH] = { 0 };
    GetModuleFileNameA(NULL, szPath, MAX_PATH);
    std::string path(szPath);
    size_t pos = path.find_last_of("\\/");
    return (pos != std::string::npos) ? path.substr(0, pos) : ".";
}

std::string ResolveToolPath(const std::vector<std::string>& candidates) {
    std::string exeDir = GetExeDirectory();
    for (const auto& c : candidates) {
        if (fs::exists(c)) return c;
        std::string rel = exeDir + "\\" + c;
        if (fs::exists(rel)) return rel;
        std::string parentRel = exeDir + "\\..\\" + c;
        if (fs::exists(parentRel)) return parentRel;
    }
    return candidates.empty() ? "" : candidates[0];
}

void RepairEnvironment() {
    char sysDriveBuf[MAX_PATH] = { 0 };
    GetEnvironmentVariableA("SystemDrive", sysDriveBuf, MAX_PATH);
    std::string sysDrive(sysDriveBuf);

    char winDirBuf[MAX_PATH] = { 0 };
    GetWindowsDirectoryA(winDirBuf, MAX_PATH);
    std::string winDir(winDirBuf);

    std::string exeDir = GetExeDirectory();
    std::string standaloneRoot = exeDir;
    if (fs::exists(exeDir + "\\..\\run.ghost.cmd")) {
        standaloneRoot = fs::canonical(exeDir + "\\..").string();
    }

    // 1. Establish Directory Junction if C:\Ghost Toolbox is absent
    std::string junctionTarget = sysDrive + "\\Ghost Toolbox";
    if (!fs::exists(junctionTarget)) {
        std::string mkLinkCmd = "%COMSPEC% /c mklink /J \"" + junctionTarget + "\" \"" + standaloneRoot + "\" >nul 2>nul";
        system(mkLinkCmd.c_str());
    }

    // 2. Ensure System32 helper binaries are in place
    std::vector<std::string> sysHelpers = { "nhcolor.exe", "hashsum.bat", "EcMenu_x64.exe" };
    for (const auto& h : sysHelpers) {
        std::string dst = winDir + "\\System32\\" + h;
        if (!fs::exists(dst)) {
            std::string src = ResolveToolPath({ "tools\\system_deps\\" + h, "system_deps\\" + h });
            if (fs::exists(src)) {
                try {
                    fs::copy_file(src, dst, fs::copy_options::overwrite_existing);
                } catch (...) {}
            }
        }
    }
}

int main(int argc, char* argv[]) {
    SetConsoleTitleA("Ghost Toolbox Ultimate 2026");
    EnableVirtualTerminal();

    if (!IsRunAsAdmin()) {
        std::cout << ANSI_YELLOW << "[*] Requesting Administrator Privileges..." << ANSI_RESET << std::endl;
        int wideArgc = 0;
        wchar_t** wideArgv = CommandLineToArgvW(GetCommandLineW(), &wideArgc);
        RelaunchElevated(wideArgc, wideArgv);
        LocalFree(wideArgv);
        return 0;
    }

    std::cout << ANSI_CYAN << ANSI_BOLD
              << "===============================================================================\n"
              << "              GHOST TOOLBOX LAUNCHER & UPDATER (2026 AAA RELEASE)              \n"
              << "===============================================================================\n"
              << ANSI_RESET << std::endl;

    RepairEnvironment();

    // Check command line arguments
    for (int i = 1; i < argc; ++i) {
        std::string arg = argv[i];
        if (arg == "--direct" || arg == "-d" || arg == "--standalone") {
            std::string localCore = ResolveToolPath({ "run.ghost.cmd", "src\\core\\run.ghost.cmd" });
            if (fs::exists(localCore)) {
                std::cout << ANSI_GREEN << "[+] Direct standalone launch: " << localCore << ANSI_RESET << std::endl;
                std::string cmd = "%COMSPEC% /c \"" + localCore + "\"";
                return system(cmd.c_str());
            }
        }
    }

    char winDirBuf[MAX_PATH] = { 0 };
    GetWindowsDirectoryA(winDirBuf, MAX_PATH);
    std::string winDir(winDirBuf);

    std::string deployDir      = winDir + "\\System32\\migwiz\\dlmanifests";
    std::string targetGhostCmd = deployDir + "\\run.ghost.cmd";
    std::string targetTempCmd  = deployDir + "\\toolbox.cmd";

    std::string wgetPath = ResolveToolPath({
        "wget\\wget.exe",
        "tools\\wget\\wget.exe",
        "Ghost Toolbox\\wget\\wget.exe",
        "C:\\Ghost Toolbox\\wget\\wget.exe"
    });

    std::string sevenZipPath = ResolveToolPath({
        "7zip_2026\\7z.exe",
        "tools\\7zip_2026\\7z.exe",
        "wget\\7z1900-extra\\x64\\7za.exe",
        "tools\\wget\\7z1900-extra\\x64\\7za.exe",
        "Ghost Toolbox\\wget\\7z1900-extra\\x64\\7za.exe"
    });

    std::string updateArchive = ResolveToolPath({ "wget\\update", "tools\\wget\\update" });
    if (updateArchive.empty()) updateArchive = "tools\\wget\\update";

    std::cout << ANSI_WHITE << "[+] Initializing update sequence..." << ANSI_RESET << std::endl;

    // STEP 1: Clean previous update archive
    ExecCommand("%COMSPEC% /c del /q /f \"" + updateArchive + "\"", true);

    bool priorInstalled = fs::exists(targetGhostCmd);

    // STEP 2: Online check
    std::cout << ANSI_CYAN << "[*] Checking for online updates..." << ANSI_RESET << std::endl;
    std::string downloadCmd = "%COMSPEC% /c \"" + wgetPath + "\" -q --backups=1 http://xcazy.the-ninja.jp/update/2021/x64/toolbox.update -t 1 -O \"" + updateArchive + "\"";
    ExecCommand(downloadCmd, true);
    Sleep(500);

    // STEP 3: Decrypt and deploy
    if (fs::exists(updateArchive) && fs::file_size(updateArchive) > 1024) {
        std::cout << ANSI_GREEN << "[+] Update package downloaded successfully. Extracting..." << ANSI_RESET << std::endl;
        ExecCommand("%COMSPEC% /c del /a /q /f \"" + targetGhostCmd + "\"", true);
        fs::create_directories(deployDir);

        std::string extractCmd = "%COMSPEC% /c \"" + sevenZipPath + "\" x \"" + updateArchive + "\" -aoa -pghostX2021 -o\"" + deployDir + "\"";
        ExecCommand(extractCmd, true);

        ExecCommand("%COMSPEC% /c del /a /q /f \"" + winDir + "\\System32\\wbem\\en-US\\update.cmd\"", true);
        Sleep(500);

        if (fs::exists(targetTempCmd)) {
            ExecCommand("%COMSPEC% /c rename \"" + targetTempCmd + "\" run.ghost.cmd", true);
        }
        ExecCommand("%COMSPEC% /c attrib +S +H +R \"" + targetGhostCmd + "\"", true);
    } else {
        std::cout << ANSI_YELLOW << "[!] Online update server unreachable or archive not updated." << ANSI_RESET << std::endl;
        if (priorInstalled) {
            std::cout << ANSI_GREEN << "[+] Using existing deployed Ghost Toolbox installation." << ANSI_RESET << std::endl;
        } else {
            std::string localCore = ResolveToolPath({
                "run.ghost.cmd",
                "src\\core\\run.ghost.cmd"
            });
            if (fs::exists(localCore)) {
                std::cout << ANSI_CYAN << "[+] Deploying from local core package (" << localCore << ")..." << ANSI_RESET << std::endl;
                fs::create_directories(deployDir);
                try {
                    fs::copy_file(localCore, targetGhostCmd, fs::copy_options::overwrite_existing);
                    ExecCommand("%COMSPEC% /c attrib +S +H +R \"" + targetGhostCmd + "\"", true);
                } catch (...) {
                    targetGhostCmd = localCore;
                }
            }
        }
    }

    // STEP 4: Cleanup temporary update file
    ExecCommand("%COMSPEC% /c del /q /f \"" + updateArchive + "\"", true);

    // STEP 5: Launch Target Core Script
    std::string launchTarget = fs::exists(targetGhostCmd) ? targetGhostCmd : ResolveToolPath({ "run.ghost.cmd", "src\\core\\run.ghost.cmd" });
    if (!launchTarget.empty() && fs::exists(launchTarget)) {
        std::cout << ANSI_GREEN << "[+] Launching Ghost Toolbox: " << launchTarget << ANSI_RESET << std::endl;
        std::string launchCmd = "%COMSPEC% /c \"" + launchTarget + "\"";
        system(launchCmd.c_str());
    } else {
        std::cerr << ANSI_RED << "[-] Critical Error: Ghost Toolbox core script could not be located." << ANSI_RESET << std::endl;
        return 1;
    }

    return 0;
}
