@echo off
setlocal EnableDelayedExpansion

:: ============================================================================
:: GHOST TOOLBOX ULTIMATE 2026 - GITHUB AUTOMATED DEPLOYMENT
:: ============================================================================

title Push Ghost Toolbox Ultimate 2026 to GitHub

cd /d "%~dp0\.."

echo ===============================================================================
echo            GHOST TOOLBOX ULTIMATE 2026 - GITHUB REPOSITORY PUSH
echo ===============================================================================
echo.
echo Current Local Git State:
git status -s
echo.

:: Check GitHub CLI authentication
gh auth status >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo [+] GitHub CLI is authenticated!
    echo [*] Creating remote repository and pushing...
    gh repo create Ghost-Toolbox-Ultimate-2026 --public --source=. --remote=origin --push
    if %ERRORLEVEL% EQU 0 (
        echo.
        echo [+++] SUCCESS! Project pushed to GitHub successfully!
        goto END
    )
)

echo [!] GitHub CLI is not yet authenticated or repo push needs target URL.
echo.
echo Please choose a method to push to GitHub:
echo   [1] Log in via GitHub CLI (gh auth login - Interactive Browser/Token)
echo   [2] Provide an existing GitHub Remote URL (e.g. https://github.com/USER/REPO.git)
echo   [3] Push using Personal Access Token (PAT)
echo   [0] Cancel
echo.
set /p "METHOD=Select method [0-3]: "

if "%METHOD%"=="1" (
    echo [*] Launching GitHub CLI authentication...
    gh auth login
    echo [*] Creating and pushing repository...
    gh repo create Ghost-Toolbox-Ultimate-2026 --public --source=. --remote=origin --push
    goto END
)

if "%METHOD%"=="2" (
    set /p "REMOTE_URL=Enter GitHub Repository URL: "
    if not "!REMOTE_URL!"=="" (
        git remote remove origin >nul 2>&1
        git remote add origin !REMOTE_URL!
        git branch -M main
        git push -u origin main
    )
    goto END
)

if "%METHOD%"=="3" (
    set /p "GH_USER=Enter GitHub Username: "
    set /p "GH_PAT=Enter GitHub Personal Access Token (PAT): "
    set /p "GH_REPO=Enter Repository Name [Ghost-Toolbox-Ultimate-2026]: "
    if "!GH_REPO!"=="" set "GH_REPO=Ghost-Toolbox-Ultimate-2026"
    git remote remove origin >nul 2>&1
    git remote add origin https://!GH_USER!:!GH_PAT!@github.com/!GH_USER!/!GH_REPO!.git
    git branch -M main
    git push -u origin main
    goto END
)

:END
pause
