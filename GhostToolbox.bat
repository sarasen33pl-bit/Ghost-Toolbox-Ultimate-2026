@echo off
setlocal EnableDelayedExpansion

:: ============================================================================
:: GHOST TOOLBOX ULTIMATE 2026 - MASTER UNIVERSAL LAUNCHER
:: Compatible with Windows 10, Windows 11, and Windows Server (x86 / x64 / ARM64)
:: ============================================================================

title Ghost Toolbox Ultimate 2026 [Master Standalone Launcher]

:: 1. Administrator Elevation Check & Self-Elevation
net session >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [*] Requesting Administrator Privileges...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process cmd.exe -Verb RunAs -ArgumentList '/c `\"%~f0`\"'" >nul 2>&1
    if %ERRORLEVEL% NEQ 0 (
        echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
        echo UAC.ShellExecute "%~f0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
        "%temp%\getadmin.vbs"
        del /q "%temp%\getadmin.vbs" >nul 2>&1
    )
    exit /b
)

:: 2. Dynamic Workspace Path & Environment Resolution
set "GHOST_ROOT=%~dp0"
if "%GHOST_ROOT:~-1%"=="\" set "GHOST_ROOT=%GHOST_ROOT:~0,-1%"
set "GHOST_TOOLS=%GHOST_ROOT%\tools"
set "GHOST_SYSDEPS=%GHOST_TOOLS%\system_deps"
set "GHOST_WGET=%GHOST_TOOLS%\wget"
set "GHOST_7ZIP=%GHOST_TOOLS%\7zip_2026"
set "GHOST_COLOR=%GHOST_TOOLS%\colortool"
set "GHOST_BIN=%GHOST_ROOT%\bin"

set "PATH=%GHOST_SYSDEPS%;%GHOST_WGET%;%GHOST_WGET%\7z1900-extra\x64;%GHOST_7ZIP%;%GHOST_COLOR%;%GHOST_BIN%;%PATH%"

:: 3. Console & CodePage Configuration
chcp 65001 >nul 2>&1
REG ADD "HKCU\Console" /v "VirtualTerminalLevel" /t REG_DWORD /d "1" /f >nul 2>&1

:: 4. Environment Auto-Heal (System32 Binaries & Directory Junction)
if not exist "%SystemRoot%\System32\nhcolor.exe" (
    if exist "%GHOST_SYSDEPS%\nhcolor.exe" copy /y "%GHOST_SYSDEPS%\nhcolor.exe" "%SystemRoot%\System32\" >nul 2>&1
)
if not exist "%SystemRoot%\System32\hashsum.bat" (
    if exist "%GHOST_SYSDEPS%\hashsum.bat" copy /y "%GHOST_SYSDEPS%\hashsum.bat" "%SystemRoot%\System32\" >nul 2>&1
)
if not exist "%SystemRoot%\System32\EcMenu_x64.exe" (
    if exist "%GHOST_SYSDEPS%\EcMenu_x64.exe" copy /y "%GHOST_SYSDEPS%\EcMenu_x64.exe" "%SystemRoot%\System32\" >nul 2>&1
)
if not exist "%SystemDrive%\Ghost Toolbox" (
    mklink /J "%SystemDrive%\Ghost Toolbox" "%GHOST_ROOT%" >nul 2>&1
)

:: 5. Interactive Master Console Menu
:MENU
cls
echo ====================================================================================================
echo                                 GHOST TOOLBOX ULTIMATE (2026 AAA EDITION)
echo ====================================================================================================
echo  Location: %GHOST_ROOT%
echo  Status:   Standalone Isolated Engine ^| Zero External Dependencies
echo ====================================================================================================
echo.
echo   [1] Ghost Toolbox Ultimate 2026 (PowerShell Cyberpunk Dashboard & Live Telemetry)
echo   [2] Classic Ghost Toolbox Core  (Patched 26,426-line Engine ^| All 32 Hidden Keywords)
echo   [3] Standalone Native C++ Updater (Compiled Release Executable)
echo.
echo   --- QUICK ONE-CLICK ACTIONS ---
echo   [4] Quick Gaming Latency Boost   (HAGS + Nagle + Power Scheme + MMCSS Priority)
echo   [5] Quick RAM WorkingSet Flush   (Reclaim Unused Memory via Win32 Engine)
echo   [6] Freeze Windows Updates 2077  (Pause Cumulative Updates until 2077)
echo   [7] Restore Standard Updates     (Unpause Windows Updates)
echo   [8] Universal Archive Decryptor  (Brute-force/Extract protected .bin/.update/.7z)
echo   [9] Run Master System Verification (Self-Test ^& SHA-256 Audit)
echo.
echo   [0] Exit Launcher
echo ====================================================================================================
echo.
set /p "CHOICE=  Select an option [0-9]: "

if "%CHOICE%"=="1" goto LAUNCH_ULTIMATE
if "%CHOICE%"=="2" goto LAUNCH_CLASSIC
if "%CHOICE%"=="3" goto LAUNCH_UPDATER
if "%CHOICE%"=="4" goto QUICK_GAMING
if "%CHOICE%"=="5" goto QUICK_RAM
if "%CHOICE%"=="6" goto QUICK_FREEZE
if "%CHOICE%"=="7" goto QUICK_UNFREEZE
if "%CHOICE%"=="8" goto LAUNCH_DECRYPTOR
if "%CHOICE%"=="9" goto RUN_VERIFY
if "%CHOICE%"=="0" exit /b 0

echo Invalid choice. Please try again.
timeout /t 1 >nul
goto MENU

:LAUNCH_ULTIMATE
cls
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%GHOST_ROOT%\GhostToolboxUltimate.ps1"
goto MENU

:LAUNCH_CLASSIC
cls
call "%GHOST_ROOT%\run.ghost.cmd"
goto MENU

:LAUNCH_UPDATER
cls
if exist "%GHOST_BIN%\toolbox.updater.x64.exe" (
    start "" "%GHOST_BIN%\toolbox.updater.x64.exe"
) else (
    echo [-] Binary not found at %GHOST_BIN%\toolbox.updater.x64.exe
    pause
)
goto MENU

:QUICK_GAMING
cls
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Import-Module '%GHOST_TOOLS%\GhostToolbox.psm1' -Force; Optimize-GamingLowLatency"
pause
goto MENU

:QUICK_RAM
cls
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Import-Module '%GHOST_TOOLS%\GhostToolbox.psm1' -Force; Invoke-FastMemoryClean"
pause
goto MENU

:QUICK_FREEZE
cls
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Import-Module '%GHOST_TOOLS%\GhostToolbox.psm1' -Force; Set-WindowsUpdatePause2077"
pause
goto MENU

:QUICK_UNFREEZE
cls
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Import-Module '%GHOST_TOOLS%\GhostToolbox.psm1' -Force; Reset-WindowsUpdatePause"
pause
goto MENU

:LAUNCH_DECRYPTOR
cls
set /p "ARCPATH=  Enter path to encrypted archive: "
if exist "%ARCPATH%" (
    python "%GHOST_TOOLS%\ghost_decryptor.py" "%ARCPATH%" -o "%GHOST_ROOT%\extracted_output"
) else (
    echo [-] File not found: %ARCPATH%
)
pause
goto MENU

:RUN_VERIFY
cls
python "%GHOST_TOOLS%\master_verification.py"
pause
goto MENU
