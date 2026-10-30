<#
.SYNOPSIS
    Ghost Toolbox Ultimate 2026 - Master Interactive Dashboard
.DESCRIPTION
    Next-generation standalone orchestrator combining modern Win32 low-latency gaming tweaks,
    telemetry debloating, memory optimization, official Winget package deployment,
    and seamless integration with the legacy 26,000-line Ghost Toolbox core engine.
#>

[CmdletBinding()]
param()

# 1. Administrator Elevation Verification
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "[*] Elevation required. Relaunching Ghost Toolbox Ultimate as Administrator..." -ForegroundColor Yellow
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    exit
}

$ScriptDir   = $PSScriptRoot
$ToolsDir    = Join-Path $ScriptDir "tools"
$SysDepsDir  = Join-Path $ToolsDir "system_deps"
$WgetDir     = Join-Path $ToolsDir "wget"
$SevenZipDir = Join-Path $ToolsDir "7zip_2026"
$CorePath    = Join-Path $ScriptDir "run.ghost.cmd"
$ModulePath  = Join-Path $ToolsDir "GhostToolbox.psm1"

# 2. Add local tool paths to process environment
$env:PATH = "$SysDepsDir;$SevenZipDir;$WgetDir;$env:PATH"

# 3. Import Core Automation Module & Repair Environment
Import-Module $ModulePath -Force
Repair-GhostEnvironment

function Show-Header {
    Clear-Host
    $telemetry = Get-GhostSystemTelemetry
    Write-Host "====================================================================================================" -ForegroundColor Magenta
    Write-Host "                           GHOST TOOLBOX ULTIMATE (2026 AAA EDITION)                                " -ForegroundColor Cyan
    Write-Host "====================================================================================================" -ForegroundColor Magenta
    Write-Host " OS: $($telemetry.OSName) | Build: $($telemetry.BuildNumber).$($telemetry.UBR) ($($telemetry.DisplayVersion) $($telemetry.Architecture))" -ForegroundColor White
    Write-Host " CPU: $($telemetry.CPUName) ($($telemetry.Cores)C / $($telemetry.LogicalCPUs)T)" -ForegroundColor Gray
    Write-Host " GPU: $($telemetry.GPUName) | HAGS: $($telemetry.HAGS) | GameDVR: $($telemetry.GameDVR)" -ForegroundColor Gray
    Write-Host " RAM: $($telemetry.UsedRamGB) GB / $($telemetry.TotalRamGB) GB ($($telemetry.RamUsagePercent)%) | Updates: $(if($telemetry.UpdatesFrozen){'Frozen 2077'}else{'Active'})" -ForegroundColor Green
    Write-Host " Edition: $($telemetry.GhostEdition) [Rev $($telemetry.GhostRevision)] | Power: $($telemetry.ActivePowerPlan)" -ForegroundColor Yellow
    Write-Host "====================================================================================================" -ForegroundColor Magenta
}

while ($true) {
    Show-Header
    Write-Host ""
    Write-Host "  SYSTEM OPTIMIZATIONS & GAMING                  WINDOWS 10/11 & PRIVACY" -ForegroundColor Yellow
    Write-Host "  -----------------------------                  -----------------------" -ForegroundColor Gray
    Write-Host "  [1] Low-Latency Gaming & Responsiveness        [5] Deep Telemetry & Copilot Debloat" -ForegroundColor Cyan
    Write-Host "  [2] Fast Memory WorkingSet Flush               [6] Win11 Classic Context Menu (Toggle)" -ForegroundColor Cyan
    Write-Host "  [3] Freeze Windows Updates until 2077          [7] Purge Windows Event Logs" -ForegroundColor Cyan
    Write-Host "  [4] Restore Standard Windows Updates           [8] System Health Check (SFC & DISM)" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  DEPLOYMENT & RUNTIMES                          SECURITY & CORE ENGINES" -ForegroundColor Yellow
    Write-Host "  ---------------------                          -----------------------" -ForegroundColor Gray
    Write-Host "  [9]  Deploy Essential Runtimes (AIO+DX+.NET)   [12] Launch Patched Classic Ghost Core" -ForegroundColor Green
    Write-Host "  [10] Deploy High-Speed Browsers                [13] Universal Archive Decryptor" -ForegroundColor Green
    Write-Host "  [11] Deploy Gaming Launchers & Utilities       [14] Run Master System Verification" -ForegroundColor Green
    Write-Host ""
    Write-Host "  [0] Exit Ghost Toolbox Ultimate" -ForegroundColor White
    Write-Host "====================================================================================================" -ForegroundColor Magenta
    Write-Host ""
    
    $choice = Read-Host "  Select option"
    
    switch ($choice) {
        "1" {
            Optimize-GamingLowLatency
            Pause
        }
        "2" {
            Invoke-FastMemoryClean
            Pause
        }
        "3" {
            Set-WindowsUpdatePause2077
            Pause
        }
        "4" {
            Reset-WindowsUpdatePause
            Pause
        }
        "5" {
            Optimize-PrivacyAndTelemetry
            Pause
        }
        "6" {
            $t = Get-GhostSystemTelemetry
            if ($t.IsWindows11) {
                $clsid = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}"
                if (Test-Path $clsid) {
                    Disable-Win11ClassicContextMenu
                } else {
                    Enable-Win11ClassicContextMenu
                }
            } else {
                Write-Host "[!] Classic context menu is native to Windows 10." -ForegroundColor Yellow
            }
            Pause
        }
        "7" {
            Clear-WindowsEventLogs
            Pause
        }
        "8" {
            Write-Host "[*] Executing Component Store & System File Health Scan..." -ForegroundColor Cyan
            sfc /scannow
            Dism /Online /Cleanup-Image /ScanHealth
            Pause
        }
        "9" {
            Write-Host ""
            Write-Host "--- ESSENTIAL RUNTIMES & FRAMEWORKS ---" -ForegroundColor Yellow
            Write-Host "[1] Visual C++ 2015-2022 Redistributable (x64)" -ForegroundColor Cyan
            Write-Host "[2] Microsoft .NET 8.0 Desktop Runtime (x64 LTS)" -ForegroundColor Cyan
            Write-Host "[3] Microsoft .NET 9.0 Desktop Runtime (x64 2026)" -ForegroundColor Cyan
            Write-Host "[4] DirectX End-User Runtimes (June 2010)" -ForegroundColor Cyan
            Write-Host "[B] Back to Main Menu" -ForegroundColor White
            $sub = Read-Host "Select runtime option"
            if ($sub -eq "1") { Install-GhostPackage -PackageId "Microsoft.VCRedist.2015+.x64" }
            if ($sub -eq "2") { Install-GhostPackage -PackageId "Microsoft.DotNet.DesktopRuntime.8" }
            if ($sub -eq "3") { Install-GhostPackage -PackageId "Microsoft.DotNet.DesktopRuntime.9" }
            if ($sub -eq "4") { Install-GhostPackage -PackageId "Microsoft.DirectX" }
            Pause
        }
        "10" {
            Write-Host ""
            Write-Host "--- HIGH-PERFORMANCE BROWSERS ---" -ForegroundColor Yellow
            Write-Host "[1] Google Chrome" -ForegroundColor Cyan
            Write-Host "[2] Mozilla Firefox" -ForegroundColor Cyan
            Write-Host "[3] Brave Browser" -ForegroundColor Cyan
            Write-Host "[4] Opera GX" -ForegroundColor Cyan
            Write-Host "[5] Thorium Browser (Ultra-Fast Chromium)" -ForegroundColor Cyan
            Write-Host "[6] LibreWolf (Hardened Firefox)" -ForegroundColor Cyan
            Write-Host "[B] Back to Main Menu" -ForegroundColor White
            $b = Read-Host "Select browser option"
            if ($b -eq "1") { Install-GhostPackage -PackageId "Google.Chrome" }
            if ($b -eq "2") { Install-GhostPackage -PackageId "Mozilla.Firefox" }
            if ($b -eq "3") { Install-GhostPackage -PackageId "Brave.Brave" }
            if ($b -eq "4") { Install-GhostPackage -PackageId "Opera.OperaGX" }
            if ($b -eq "5") { Install-GhostPackage -PackageId "Alex313031.Thorium" }
            if ($b -eq "6") { Install-GhostPackage -PackageId "LibreWolf.LibreWolf" }
            Pause
        }
        "11" {
            Write-Host ""
            Write-Host "--- GAMING ESSENTIALS & UTILITIES ---" -ForegroundColor Yellow
            Write-Host "[1] Steam Client" -ForegroundColor Cyan
            Write-Host "[2] Epic Games Launcher" -ForegroundColor Cyan
            Write-Host "[3] Discord" -ForegroundColor Cyan
            Write-Host "[4] OBS Studio" -ForegroundColor Cyan
            Write-Host "[5] Voidtools Everything (Instant Search)" -ForegroundColor Cyan
            Write-Host "[6] System Informer (Advanced Task Manager)" -ForegroundColor Cyan
            Write-Host "[7] 7-Zip Modern Suite" -ForegroundColor Cyan
            Write-Host "[8] Notepad++" -ForegroundColor Cyan
            Write-Host "[B] Back to Main Menu" -ForegroundColor White
            $g = Read-Host "Select utility option"
            if ($g -eq "1") { Install-GhostPackage -PackageId "Valve.Steam" }
            if ($g -eq "2") { Install-GhostPackage -PackageId "EpicGames.EpicGamesLauncher" }
            if ($g -eq "3") { Install-GhostPackage -PackageId "Discord.Discord" }
            if ($g -eq "4") { Install-GhostPackage -PackageId "OBSProject.OBSStudio" }
            if ($g -eq "5") { Install-GhostPackage -PackageId "voidtools.Everything" }
            if ($g -eq "6") { Install-GhostPackage -PackageId "SystemInformer.SystemInformer" }
            if ($g -eq "7") { Install-GhostPackage -PackageId "7zip.7zip" }
            if ($g -eq "8") { Install-GhostPackage -PackageId "Notepad++.Notepad++" }
            Pause
        }
        "12" {
            Write-Host "[*] Launching 26,426-line Patched Ghost Toolbox Core Engine..." -ForegroundColor Cyan
            cmd.exe /c "`"$CorePath`""
        }
        "13" {
            $arc = Read-Host "Enter path to encrypted archive (.bin, .update, .7z)"
            if (Test-Path $arc) {
                python (Join-Path $ToolsDir "ghost_decryptor.py") $arc -o (Join-Path $ScriptDir "extracted_output")
            } else {
                Write-Warning "File not found."
            }
            Pause
        }
        "14" {
            python (Join-Path $ToolsDir "master_verification.py")
            Pause
        }
        "0" {
            Write-Host "Exiting Ghost Toolbox Ultimate. Goodbye!" -ForegroundColor Green
            exit
        }
        default {
            Write-Warning "Invalid option selected."
            Start-Sleep -Seconds 1
        }
    }
}
