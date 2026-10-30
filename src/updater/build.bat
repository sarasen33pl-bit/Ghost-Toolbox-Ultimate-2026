@echo off
setlocal

echo ===================================================
echo Compiling Reconstructed Ghost Toolbox Updater (x64)
echo ===================================================

cd /d "%~dp0"

echo [1/3] Compiling Resource Script (llvm-rc)...
llvm-rc /fo updater.res updater.rc
if errorlevel 1 (
    echo [-] Error compiling resources.
    exit /b 1
)

echo [2/3] Compiling C++ Source Code (clang-cl)...
clang-cl /std:c++17 /O2 /W3 /MD /EHsc /Fe:..\..\bin\toolbox.updater.x64.exe main.cpp updater.res /link /SUBSYSTEM:CONSOLE /MACHINE:X64 shell32.lib user32.lib advapi32.lib
if errorlevel 1 (
    echo [-] Error linking executable.
    exit /b 1
)

echo [3/3] Build Complete!
if exist "..\..\bin\toolbox.updater.x64.exe" (
    echo [+] Binary created successfully at bin\toolbox.updater.x64.exe
)
