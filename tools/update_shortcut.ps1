$sh = New-Object -ComObject WScript.Shell
$sc = $sh.CreateShortcut("C:\Users\Administrator\Desktop\Ghost_Toolbox_Standalone\Ghost Toolbox.lnk")
$sc.TargetPath = "C:\Users\Administrator\Desktop\Ghost_Toolbox_Standalone\GhostToolbox.bat"
$sc.WorkingDirectory = "C:\Users\Administrator\Desktop\Ghost_Toolbox_Standalone"
$sc.IconLocation = "C:\Users\Administrator\Desktop\Ghost_Toolbox_Standalone\tools\system_deps\nhcolor.exe,0"
$sc.Description = "Ghost Toolbox Ultimate 2026 Standalone"
$sc.Save()
Write-Host "[+] Shortcut updated to point to local GhostToolbox.bat"
