<#
.SYNOPSIS
    Ghost Toolbox Master Launcher (PowerShell Orchestrator)
.DESCRIPTION
    Launches either the newly built native C++ release binary (toolbox.updater.x64.exe),
    the modernized interactive Cyberpunk Dashboard (GhostToolboxUltimate.ps1),
    or directly executes the core engine (run.ghost.cmd) with verified Administrator privileges.
    Automatically resolves runtime dependencies (nhcolor.exe, hashsum.bat, 7za, wget).
#>

[CmdletBinding()]
param(
    [switch]$DirectCore,
    [switch]$Ultimate,
    [switch]$Rebuild,
    [switch]$RunTests
)

# 1. Administrator Elevation Check
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "[*] Elevation required. Relaunching as Administrator..." -ForegroundColor Yellow
    $argsList = "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    if ($DirectCore) { $argsList += " -DirectCore" }
    if ($Ultimate)   { $argsList += " -Ultimate" }
    if ($Rebuild)    { $argsList += " -Rebuild" }
    if ($RunTests)   { $argsList += " -RunTests" }
    Start-Process powershell.exe -Verb RunAs -ArgumentList $argsList
    exit
}

$WorkspaceRoot = $PSScriptRoot
$BinPath       = Join-Path $WorkspaceRoot "bin\toolbox.updater.x64.exe"
$CorePath      = Join-Path $WorkspaceRoot "run.ghost.cmd"
$UltimatePath  = Join-Path $WorkspaceRoot "GhostToolboxUltimate.ps1"
$BuildScript   = Join-Path $WorkspaceRoot "src\updater\build.bat"
$SysDepsPath   = Join-Path $WorkspaceRoot "tools\system_deps"
$WgetPath      = Join-Path $WorkspaceRoot "tools\wget"
$SevenZipPath  = Join-Path $WorkspaceRoot "tools\7zip_2026"
$TestScript    = Join-Path $WorkspaceRoot "tools\master_verification.py"
$ModulePath    = Join-Path $WorkspaceRoot "tools\GhostToolbox.psm1"

Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "                 GHOST TOOLBOX - RECONSTRUCTED ORCHESTRATOR                    " -ForegroundColor Green
Write-Host "===============================================================================" -ForegroundColor Cyan

# 2. Inject Portable Tooling Dependencies into Process PATH & Repair Environment
$env:PATH = "$SysDepsPath;$SevenZipPath;$WgetPath;$WgetPath\7z1900-extra\x64;$env:PATH"
if (Test-Path $ModulePath) {
    Import-Module $ModulePath -Force
    Repair-GhostEnvironment
}

# 3. Optional: Execute Automated Test Suite
if ($RunTests) {
    Write-Host "[*] Executing Ghost Toolbox Systematic Verification Suite..." -ForegroundColor Yellow
    python $TestScript
    Write-Host "[+] Testing complete. Continuing execution..." -ForegroundColor Green
}

# 4. Binary Rebuild or Validation
if ($Rebuild -or (-not (Test-Path $BinPath))) {
    Write-Host "[*] Compiling native release updater..." -ForegroundColor Yellow
    & cmd.exe /c "`"$BuildScript`""
    if (-not (Test-Path $BinPath)) {
        Write-Warning "[-] Binary build failed or not found. Falling back to direct script execution."
        $DirectCore = $true
    }
}

# 5. Launch Target
if ($Ultimate) {
    Write-Host "[+] Launching Ghost Toolbox Ultimate 2026 Dashboard..." -ForegroundColor Magenta
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $UltimatePath
} elseif ($DirectCore) {
    Write-Host "[+] Launching Ghost Toolbox Core directly (Patched & Self-Healing)..." -ForegroundColor Green
    if (Test-Path $CorePath) {
        cmd.exe /c "`"$CorePath`""
    } else {
        Write-Error "[-] Core script not found at $CorePath"
    }
} else {
    Write-Host "[+] Launching reconstructed native updater binary..." -ForegroundColor Green
    Start-Process -FilePath $BinPath -WorkingDirectory (Join-Path $WorkspaceRoot "tools") -Wait
}
