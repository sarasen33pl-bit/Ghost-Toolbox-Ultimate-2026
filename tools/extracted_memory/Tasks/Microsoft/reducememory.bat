@echo off
setlocal EnableExtensions
setlocal EnableDelayedExpansion
set RemoteMachine=%1
schtasks /Change /TN "Reduce Memory 1min" /Disable >nul
schtasks /Delete /TN "Reduce Memory 1min" /F >nul
schtasks /Change /TN "Reduce Memory 5min" /Disable >nul
schtasks /Delete /TN "Reduce Memory 5min" /F >nul
schtasks /Change /TN "Reduce Memory 15min" /Disable >nul
schtasks /Delete /TN "Reduce Memory 15min" /F >nul
schtasks /Change /TN "Reduce Memory 30min" /Disable >nul
schtasks /Delete /TN "Reduce Memory 30min" /F >nul
schtasks /Change /TN "Reduce Memory 60min" /Disable >nul
schtasks /Delete /TN "Reduce Memory 60min" /F >nul
if ""=="%1" goto Usage
if "/?"=="%1" goto Usage
if /I "/H"=="%1" goto Usage
if /I "/B"=="%1" goto LocalMachine
if /I "/U"=="%1" goto LocalMachine
if /I "/1"=="%1" goto :1min
if /I "/5"=="%1" goto :5min
if /I "/15"=="%1" goto :15min
if /I "/30"=="%1" goto :30min
if /I "/60"=="%1" goto :60min
if /I "/0"=="%1" goto :0min
set RemoteMachineName=%1
set Action=%2
:1min
cls
echo 1min
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\Reduce Memory 1min"
if %errorlevel% equ 0 (
schtasks /Change /TN "Reduce Memory 1min" /Disable
schtasks /Delete /TN "Reduce Memory 1min" /F
cls
exit
)
schtasks.exe /Create /XML "%Windir%\System32\Tasks\Microsoft\Reduce Memory 1min.xml" /tn "Reduce Memory 1min"
schtasks /Change /TN "Reduce Memory 1min" /Enable
schtasks /run /tn "Reduce Memory 1min"
cls
exit
:5min
cls
echo 5min
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\Reduce Memory 5min"
if %errorlevel% equ 0 (
schtasks /Change /TN "Reduce Memory 1min" /Disable
schtasks /Delete /TN "Reduce Memory 1min" /F
schtasks /Change /TN "Reduce Memory 5min" /Disable
schtasks /Delete /TN "Reduce Memory 5min" /F
schtasks /Change /TN "Reduce Memory 15min" /Disable
schtasks /Delete /TN "Reduce Memory 15min" /F
schtasks /Change /TN "Reduce Memory 30min" /Disable
schtasks /Delete /TN "Reduce Memory 30min" /F
schtasks /Change /TN "Reduce Memory 60min" /Disable
schtasks /Delete /TN "Reduce Memory 60min" /F
exit
)
schtasks.exe /Create /XML "%Windir%\System32\Tasks\Microsoft\Reduce Memory 5min.xml" /tn "Reduce Memory 5min"
schtasks /Change /TN "Reduce Memory 5min" /Enable
schtasks /run /tn "Reduce Memory 5min"
cls
exit
:15min
cls
echo 15min
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\Reduce Memory 15min"
if %errorlevel% equ 0 (
schtasks /Change /TN "Reduce Memory 15min" /Disable
schtasks /Delete /TN "Reduce Memory 15min" /F
cls
exit
)
schtasks.exe /Create /XML "%Windir%\System32\Tasks\Microsoft\Reduce Memory 5min.xml" /tn "Reduce Memory 15min"
schtasks /Change /TN "Reduce Memory 15min" /Enable
schtasks /run /tn "Reduce Memory 15min"
cls
exit
:30min
cls
echo 30min
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\Reduce Memory 30min"
if %errorlevel% equ 0 (
schtasks /Change /TN "Reduce Memory 30min" /Disable
schtasks /Delete /TN "Reduce Memory 30min" /F
cls
exit
)
schtasks.exe /Create /XML "%Windir%\System32\Tasks\Microsoft\Reduce Memory 5min.xml" /tn "Reduce Memory 30min"
schtasks /Change /TN "Reduce Memory 30min" /Enable
schtasks /run /tn "Reduce Memory 30min"
cls
exit


:60min
cls
echo 60min
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\Reduce Memory 60min"
if %errorlevel% equ 0 (
schtasks /Change /TN "Reduce Memory 60min" /Disable
schtasks /Delete /TN "Reduce Memory 60min" /F
cls
exit
)
schtasks.exe /Create /XML "%Windir%\System32\Tasks\Microsoft\Reduce Memory 5min.xml" /tn "Reduce Memory 60min"
schtasks /Change /TN "Reduce Memory 60min" /Enable
schtasks /run /tn "Reduce Memory 60min"
cls
exit
:0min
cls
schtasks /Change /TN "Reduce Memory 1min" /Disable
schtasks /Delete /TN "Reduce Memory 1min" /F
schtasks /Change /TN "Reduce Memory 5min" /Disable
schtasks /Delete /TN "Reduce Memory 5min" /F
schtasks /Change /TN "Reduce Memory 15min" /Disable
schtasks /Delete /TN "Reduce Memory 15min" /F
schtasks /Change /TN "Reduce Memory 30min" /Disable
schtasks /Delete /TN "Reduce Memory 30min" /F
schtasks /Change /TN "Reduce Memory 60min" /Disable
schtasks /Delete /TN "Reduce Memory 60min" /F
exit

