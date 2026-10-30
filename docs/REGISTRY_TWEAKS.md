# Ghost Toolbox - Forensic Registry Tweaks Ledger

This document classifies and details all unique registry modifications performed across Ghost Toolbox.

## Windows Update & Servicing (20 Entries)

| Action | Registry Key Path | Value Name | Type | Value Data |
| :--- | :--- | :--- | :--- | :--- |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX` | `IsConvergedUpdateStackEnabled` | `REG_DWORD` | `1` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings` | `ActiveHoursEnd` | `REG_DWORD` | `1` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings` | `ActiveHoursStart` | `REG_DWORD` | `8` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings` | `AllowAutoWindowsUpdateDownloadOverMeteredNetwork` | `REG_DWORD` | `0` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings` | `DeferFeatureUpdatesPeriodInDays` | `REG_DWORD` | `0` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings` | `DeferQualityUpdatesPeriodInDays` | `REG_DWORD` | `0` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings` | `ExcludeWUDriversInQualityUpdate` | `REG_DWORD` | `0` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings` | `FlightCommitted` | `REG_DWORD` | `0` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings` | `LastToastAction` | `REG_DWORD` | `0` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings` | `UxOption` | `REG_DWORD` | `0` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings` | `InsiderProgramEnabled` | `REG_DWORD` | `0` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings` | `PendingRebootStartTime` | `REG_SZ` | `2` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings` | `PauseFeatureUpdatesStartTime` | `REG_SZ` | `2` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings` | `PauseQualityUpdatesStartTime` | `REG_SZ` | `2` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings` | `PauseUpdatesExpiryTime` | `REG_SZ` | `2` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings` | `PauseFeatureUpdatesEndTime` | `REG_SZ` | `2` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings` | `PauseQualityUpdatesEndTime` | `REG_SZ` | `2` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings` | `PauseUpdatesStartTime` | `REG_SZ` | `2` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\Settings` | `PausedFeatureStatus` | `REG_DWORD` | `2` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\Settings` | `PausedQualityStatus` | `REG_DWORD` | `2` |

## Windows 11 Explorer & Context Menus (28 Entries)

| Action | Registry Key Path | Value Name | Type | Value Data |
| :--- | :--- | :--- | :--- | :--- |
| `ADD` | `HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer` | `DisableNotificationCenter` | `REG_DWORD` | `0` |
| `ADD` | `HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer` | `DisableSearchBoxSuggestions` | `REG_DWORD` | `0` |
| `DELETE` | `HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent` | `AccentColorMenu` | `REG_DWORD` | `4` |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent` | `AccentPalette` | `REG_BINARY` | `9` |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent` | `StartColorMenu` | `REG_DWORD` | `2` |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced` | `TaskbarDa` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced` | `TaskbarAl` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced` | `ShowCortanaButton` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced` | `ShowCopilotButton` | `REG_DWORD` | `0` |
| `DELETE` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKEY_CURRENT_USER\Software\ExplorerPatcher` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced` | `TaskbarMn` | `REG_DWORD` | `1` |
| `DELETE` | `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ExplorerPatcher` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer` | `DisableNotificationCenter` | `REG_DWORD` | `0` |
| `DELETE` | `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{D17F1E1A-5919-4427-8F89-A1A8503CA3EB}_ExplorerPatcher` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced` | `UseOLEDTaskbarTransparency` | `REG_DWORD` | `0` |
| `DELETE` | `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Browser Helper Objects\{1FD49718-1D00-4B19-AF5F-070AF6D5D54C}` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize` | `StartupDelayInMSec` | `REG_DWORD` | `0` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer` | `SettingsPageVisibility` | `REG_SZ` | `` |
| `DELETE` | `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer` | `DisableNotificationCenter` | `REG_DWORD` | `0` |
| `DELETE` | `HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\Browser Helper Objects\{1FD49718-1D00-4B19-AF5F-070AF6D5D54C}` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows\Explorer` | `DisableNotificationCenter` | `REG_DWORD` | `0` |
| `DELETE` | `HKLM\Software\ExplorerPatcher` | `(Key Deletion)` | `N/A` | `DELETED` |

## Telemetry, Cortana & Search (4 Entries)

| Action | Registry Key Path | Value Name | Type | Value Data |
| :--- | :--- | :--- | :--- | :--- |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Search` | `BingSearchEnabled` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Search` | `SearchboxTaskbarMode` | `REG_DWORD` | `0` |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings` | `IsDynamicSearchBoxEnabled` | `REG_DWORD` | `0` |
| `ADD` | `HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search` | `AllowCortana` | `REG_DWORD` | `1` |

## Gaming, GPU & Performance (4 Entries)

| Action | Registry Key Path | Value Name | Type | Value Data |
| :--- | :--- | :--- | :--- | :--- |
| `ADD` | `HKCU\SOFTWARE\Microsoft\GameBar` | `(Default)` | `REG_SZ` | `` |
| `DELETE` | `HKCU\SOFTWARE\Microsoft\GameBar` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKEY_CURRENT_USER\Software\Microsoft\GameBar` | `AllowAutoGameMode` | `REG_DWORD` | `0` |
| `ADD` | `HKEY_CURRENT_USER\Software\Microsoft\GameBar` | `UseNexusForGameBarEnabled` | `REG_DWORD` | `0` |

## System, Security & Console (83 Entries)

| Action | Registry Key Path | Value Name | Type | Value Data |
| :--- | :--- | :--- | :--- | :--- |
| `ADD` | `HKCU\Console` | `WindowAlpha` | `REG_DWORD` | `2` |
| `ADD` | `HKCU\Console` | `VirtualTerminalLevel` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Console` | `ColorTable00` | `REG_DWORD` | `7` |
| `ADD` | `HKCU\Console` | `ColorTable01` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Console` | `ColorTable02` | `REG_DWORD` | `9` |
| `ADD` | `HKCU\Console` | `ColorTable03` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Console` | `ColorTable04` | `REG_DWORD` | `2` |
| `ADD` | `HKCU\Console` | `ColorTable05` | `REG_DWORD` | `9` |
| `ADD` | `HKCU\Console` | `ColorTable06` | `REG_DWORD` | `4` |
| `ADD` | `HKCU\Console` | `ColorTable07` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Console` | `ColorTable08` | `REG_DWORD` | `7` |
| `ADD` | `HKCU\Console` | `ColorTable09` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Console` | `ColorTable10` | `REG_DWORD` | `8` |
| `ADD` | `HKCU\Console` | `ColorTable11` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Console` | `ColorTable12` | `REG_DWORD` | `5` |
| `ADD` | `HKCU\Console` | `ColorTable13` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Console` | `ColorTable14` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Console` | `ColorTable15` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Console` | `DefaultBackground` | `REG_DWORD` | `4` |
| `ADD` | `HKCU\Console` | `DefaultForeground` | `REG_DWORD` | `4` |
| `DELETE` | `HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System` | `DisableTaskMgr` | `N/A` | `DELETED` |
| `ADD` | `HKCU\Software\Policies\Microsoft\Windows\Windows Error Reporting` | `Disabled` | `REG_DWORD` | `0` |
| `ADD` | `HKCU\System\GameConfigStore` | `GameDVR_Enabled` | `REG_DWORD` | `0` |
| `ADD` | `HKEY_CURRENT_USER\Console` | `VirtualTerminalLevel` | `REG_DWORD` | `1` |
| `ADD` | `HKEY_CURRENT_USER\System\GameConfigStore` | `GameDVR_Enabled` | `REG_DWORD` | `0` |
| `ADD` | `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot` | `TurnOffWindowsCopilot` | `REG_DWORD` | `1` |
| `DELETE` | `HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\MicrosoftEdgeElevationService` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\edgeupdate` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\edgeupdatem` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management` | `FeatureSettingsOverride` | `REG_DWORD` | `3` |
| `ADD` | `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management` | `FeatureSettingsOverrideMask` | `REG_DWORD` | `3` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System` | `FilterAdministratorToken` | `REG_DWORD` | `1` |
| `ADD` | `HKLM\SOFTWARE\Policies\Microsoft\Biometrics` | `Enabled` | `REG_DWORD` | `1` |
| `ADD` | `HKLM\SOFTWARE\Policies\Microsoft\Biometrics` | `Credential` | `REG_SZ` | `` |
| `ADD` | `HKLM\SOFTWARE\Policies\Microsoft\Biometrics` | `FacialFeatures` | `REG_DWORD` | `1` |
| `ADD` | `HKLM\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures` | `EnhancedAntiSpoofing` | `REG_DWORD` | `0` |
| `ADD` | `HKLM\SOFTWARE\Policies\Microsoft\Dsh` | `AllowNewsAndInterests` | `REG_DWORD` | `0` |
| `ADD` | `HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKLM\SOFTWARE\Policies\Microsoft\PassportForWork` | `Enabled` | `REG_DWORD` | `1` |
| `ADD` | `HKLM\SOFTWARE\Policies\Microsoft\TPM` | `OSManagedAuthLevel` | `REG_SZ` | `5` |
| `ADD` | `HKLM\SOFTWARE\Policies\Microsoft\TPM` | `ClearTPMIfNotReadyGP` | `REG_SZ` | `1` |
| `DELETE` | `HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive` | `DisableFileSyncNGSC` | `REG_DWORD` | `0` |
| `ADD` | `HKLM\SOFTWARE\Policies\Microsoft\Windows\System` | `DisableAcrylicBackgroundOnLogon` | `REG_DWORD` | `1` |
| `ADD` | `HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting` | `Disabled` | `REG_DWORD` | `0` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Control` | `SvcHostSplitThresholdInKB` | `REG_DWORD` | `3` |
| `DELETE` | `HKLM\SYSTEM\CurrentControlSet\Control\FeatureManagement\Overrides\0` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Control\FeatureManagement\Overrides\0\2093230218` | `EnabledState` | `REG_DWORD` | `2` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Control\FeatureManagement\Overrides\0\2093230218` | `EnabledStateOptions` | `REG_DWORD` | `0` |
| `DELETE` | `HKLM\SYSTEM\CurrentControlSet\Control\FeatureManagement\Overrides\14\156965516` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Control\FeatureManagement\Overrides\4\1887869580` | `EnabledState` | `REG_DWORD` | `2` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Control\FeatureManagement\Overrides\4\1887869580` | `EnabledStateOptions` | `REG_DWORD` | `0` |
| `DELETE` | `HKLM\SYSTEM\CurrentControlSet\Control\FeatureManagement\Overrides\4\1887869580` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Control\FeatureManagement\Overrides\4\215754378` | `EnabledState` | `REG_DWORD` | `2` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Control\FeatureManagement\Overrides\4\215754378` | `EnabledStateOptions` | `REG_DWORD` | `1` |
| `DELETE` | `HKLM\SYSTEM\CurrentControlSet\Control\FeatureManagement\Overrides\4\3036241548` | `EnabledState` | `N/A` | `DELETED` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Control\FeatureManagement\Overrides\8\3036241548` | `EnabledState` | `REG_DWORD` | `2` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Control\FeatureManagement\Overrides\8\3036241548` | `EnabledStateOptions` | `REG_DWORD` | `0` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Control\FeatureManagement\Overrides\8\3036241548` | `Variant` | `REG_DWORD` | `0` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Control\FeatureManagement\Overrides\8\3036241548` | `VariantPayload` | `REG_DWORD` | `0` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Control\FeatureManagement\Overrides\8\3036241548` | `VariantPayloadKind` | `REG_DWORD` | `0` |
| `DELETE` | `HKLM\SYSTEM\CurrentControlSet\Control\FeatureManagement\Overrides\8\3036241548` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management` | `PagingFiles` | `REG_MULTI_SZ` | `C` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management` | `ClearPageFileAtShutdown` | `REG_DWORD` | `0` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack` | `Start` | `REG_DWORD` | `2` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Services\SENS` | `Start` | `REG_DWORD` | `2` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Services\Sysmain` | `Start` | `REG_DWORD` | `2` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Services\TabletInputService` | `Start` | `REG_DWORD` | `3` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Services\TextInputManagementService` | `Start` | `REG_DWORD` | `2` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Services\WbioSrvc` | `Start` | `REG_DWORD` | `2` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Services\WerSvc` | `Start` | `REG_DWORD` | `3` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Services\WpnService` | `Start` | `REG_DWORD` | `3` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Services\WpnUserService` | `Start` | `REG_DWORD` | `2` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Services\WpnUserService_3c549` | `Start` | `REG_DWORD` | `2` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Services\cbdhsvc` | `Start` | `REG_DWORD` | `3` |
| `ADD` | `HKLM\SYSTEM\CurrentControlSet\Services\cbdhsvc_59ed3` | `Start` | `REG_DWORD` | `2` |
| `ADD` | `HKLM\SYSTEM\Software\Microsoft\BuildLayers\DesktopEditions` | `IsTopLevel` | `REG_DWORD` | `1` |
| `ADD` | `HKLM\SYSTEM\Software\Microsoft\ServicingLayers\_EDITION_` | `IsTopLevel` | `REG_DWORD` | `1` |
| `ADD` | `HKLM\Software\Policies\Microsoft\MRT` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKLM\Software\Policies\Microsoft\MRT` | `DontOfferThroughWUAU` | `REG_DWORD` | `1` |
| `DELETE` | `HKLM\Wim_SYSTEM\Software\Microsoft\BuildLayers\DesktopEditions` | `IsTopLevel` | `N/A` | `DELETED` |
| `DELETE` | `HKLM\Wim_SYSTEM\Software\Microsoft\ServicingLayers\_EDITION_` | `IsTopLevel` | `N/A` | `DELETED` |

## Other Applications & Modding (173 Entries)

| Action | Registry Key Path | Value Name | Type | Value Data |
| :--- | :--- | :--- | :--- | :--- |
| `DELETE` | `%%h\%%~p` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `%%k` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `%key%` | `%value%` | `REG_DWORD` | `0` |
| `ADD` | `HKCR\*\shell\runas` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCR\*\shell\runas` | `NoWorkingDirectory` | `REG_SZ` | `` |
| `DELETE` | `HKCR\*\shell\runas` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKCR\*\shell\runas\command` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCR\*\shell\runas\command` | `IsolatedCommand` | `REG_SZ` | `c` |
| `DELETE` | `HKCR\.htm\OpenWithProgIds` | `MSEdgeHTM` | `N/A` | `DELETED` |
| `DELETE` | `HKCR\.html\OpenWithProgIds` | `MSEdgeHTM` | `N/A` | `DELETED` |
| `DELETE` | `HKCR\.shtml\OpenWithProgids` | `MSEdgeHTM` | `N/A` | `DELETED` |
| `DELETE` | `HKCR\.svg\OpenWithProgIds` | `MSEdgeHTM` | `N/A` | `DELETED` |
| `DELETE` | `HKCR\.webp\OpenWithProgids` | `MSEdgeHTM` | `N/A` | `DELETED` |
| `DELETE` | `HKCR\.xhtml\OpenWithProgIds` | `MSEdgeHTM` | `N/A` | `DELETED` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode` | `Icon` | `REG_SZ` | `%` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode` | `MUIVerb` | `REG_SZ` | `G` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode` | `Position` | `REG_SZ` | `M` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode` | `SubCommands` | `REG_SZ` | `` |
| `DELETE` | `HKCR\DesktopBackground\Shell\GhostMode` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01` | `Icon` | `REG_SZ` | `%` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01` | `MUIVerb` | `REG_SZ` | `P` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01` | `Position` | `REG_SZ` | `M` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01` | `SubCommands` | `REG_SZ` | `` |
| `DELETE` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\01menu` | `MUIVerb` | `REG_SZ` | `P` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\01menu` | `Icon` | `REG_SZ` | `%` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\01menu\command` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\02menu` | `MUIVerb` | `REG_SZ` | `B` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\02menu` | `Icon` | `REG_SZ` | `%` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\02menu\command` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\03menu` | `MUIVerb` | `REG_SZ` | `H` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\03menu` | `Icon` | `REG_SZ` | `%` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\03menu\command` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\04menu` | `MUIVerb` | `REG_EXPAND_SZ` | `G` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\04menu` | `Icon` | `REG_EXPAND_SZ` | `%` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\04menu` | `CommandFlags` | `REG_DWORD` | `3` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\04menu\command` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\06menu` | `MUIVerb` | `REG_EXPAND_SZ` | `D` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\06menu` | `Icon` | `REG_EXPAND_SZ` | `%` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\06menu\command` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\07menu` | `MUIVerb` | `REG_SZ` | `P` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\07menu` | `Icon` | `REG_SZ` | `p` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\07menu` | `CommandFlags` | `REG_DWORD` | `3` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\01\Shell\07menu\command` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\02` | `Icon` | `REG_EXPAND_SZ` | `%` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\02` | `MUIVerb` | `REG_EXPAND_SZ` | `T` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\02` | `CommandFlags` | `REG_DWORD` | `3` |
| `DELETE` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\02` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\02\command` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\04` | `Icon` | `REG_EXPAND_SZ` | `%` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\04` | `MUIVerb` | `REG_EXPAND_SZ` | `R` |
| `DELETE` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\04` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\04\command` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\05` | `Icon` | `REG_EXPAND_SZ` | `%` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\05` | `MUIVerb` | `REG_EXPAND_SZ` | `G` |
| `DELETE` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\05` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\05\command` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\07` | `Icon` | `REG_SZ` | `%` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\07` | `MUIVerb` | `REG_SZ` | `P` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\07` | `Position` | `REG_SZ` | `M` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\07` | `SubCommands` | `REG_SZ` | `` |
| `DELETE` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\07` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\07\Shell\01menu` | `MUIVerb` | `REG_SZ` | `G` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\07\Shell\01menu\command` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\07\Shell\02menu` | `MUIVerb` | `REG_SZ` | `C` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\07\Shell\02menu\command` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\07\Shell\07menu` | `MUIVerb` | `REG_SZ` | `C` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\07\Shell\07menu` | `CommandFlags` | `REG_DWORD` | `3` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\07\Shell\07menu\command` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\08` | `Icon` | `REG_EXPAND_SZ` | `%` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\08` | `MUIVerb` | `REG_EXPAND_SZ` | `C` |
| `DELETE` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\08` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKCR\DesktopBackground\Shell\GhostMode\Shell\08\command` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCR\Directory\shell\runas` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCR\Directory\shell\runas` | `NoWorkingDirectory` | `REG_SZ` | `` |
| `DELETE` | `HKCR\Directory\shell\runas` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKCR\Directory\shell\runas\command` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCR\Directory\shell\runas\command` | `IsolatedCommand` | `REG_SZ` | `c` |
| `DELETE` | `HKCR\MSEdgeHTM` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKCU\SOFTWARE\Microsoft\Edge` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKCU\SOFTWARE\Microsoft\EdgeUpdate` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKCU\SOFTWARE\Microsoft\TabletTip\1.7` | `TipbandDesiredVisibility` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR` | `AppCaptureEnabled` | `REG_DWORD` | `0` |
| `ADD` | `HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR` | `GameDVR_Enabled` | `REG_DWORD` | `1` |
| `DELETE` | `HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR` | `AudioCaptureEnabled` | `N/A` | `DELETED` |
| `ADD` | `HKCU\SOFTWARE\Valve\Steam\Apps\993090` | `Installed` | `REG_DWORD` | `1` |
| `DELETE` | `HKCU\Software\Classes\CLSID\{d93ed569-3b3e-4bff-8355-3c44f6a52bb5}` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKCU\Software\Classes\CLSID\{d93ed569-3b3e-4bff-8355-3c44f6a52bb5}\InprocServer32` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKCU\Software\Microsoft\Clipboard` | `EnableClipboardHistory` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR` | `AppCaptureEnabled` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications` | `ToastEnabled` | `REG_DWORD` | `1` |
| `DELETE` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Run` | `Microsoft` | `N/A` | `DELETED` |
| `DELETE` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Run` | `*MicrosoftEdgeAutoLaunch*` | `N/A` | `DELETED` |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Start\Companions\Microsoft.YourPhone_8wekyb3d8bbwe` | `IsAvailable` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Start\Companions\Microsoft.YourPhone_8wekyb3d8bbwe` | `IsEnabled` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize` | `EnableTransparency` | `REG_DWORD` | `0` |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize` | `ColorPrevalence` | `REG_DWORD` | `0` |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize` | `AppsUseLightTheme` | `REG_DWORD` | `0` |
| `ADD` | `HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize` | `SystemUsesLightTheme` | `REG_DWORD` | `0` |
| `ADD` | `HKCU\Software\Microsoft\Windows\DWM` | `Composition` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Software\Microsoft\Windows\DWM` | `AccentColorInactive` | `REG_DWORD` | `4` |
| `ADD` | `HKCU\Software\Microsoft\Windows\DWM` | `ColorizationColor` | `REG_DWORD` | `9` |
| `ADD` | `HKCU\Software\Microsoft\Windows\DWM` | `ColorizationColorBalance` | `REG_DWORD` | `8` |
| `ADD` | `HKCU\Software\Microsoft\Windows\DWM` | `ColorizationAfterglow` | `REG_DWORD` | `9` |
| `ADD` | `HKCU\Software\Microsoft\Windows\DWM` | `ColorizationAfterglowBalance` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Software\Microsoft\Windows\DWM` | `ColorizationBlurBalance` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Software\Microsoft\Windows\DWM` | `EnableWindowColorization` | `REG_DWORD` | `0` |
| `ADD` | `HKCU\Software\Microsoft\Windows\DWM` | `ColorizationGlassAttribute` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Software\Microsoft\Windows\DWM` | `AccentColor` | `REG_DWORD` | `9` |
| `ADD` | `HKCU\Software\Microsoft\Windows\DWM` | `ColorPrevalence` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Software\Microsoft\Windows\DWM` | `EnableAeroPeek` | `REG_DWORD` | `1` |
| `DELETE` | `HKCU\Software\Microsoft\Windows\ShellNoRoam\BagMRU` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKCU\Software\Microsoft\Windows\ShellNoRoam\Bags` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKCU\Software\Microsoft\Windows\Shell\BagMRU` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKCU\Software\Microsoft\Windows\Shell\Bags` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKCU\Software\Microsoft\Windows\Shell\Copilot` | `CopilotDisabledReason` | `REG_SZ` | `F` |
| `ADD` | `HKCU\Software\Microsoft\Windows\Shell\Copilot` | `IsCopilotAvailable` | `REG_DWORD` | `0` |
| `ADD` | `HKCU\Software\Microsoft\Windows\Shell\Copilot` | `Test` | `REG_DWORD` | `1` |
| `ADD` | `HKCU\Software\Microsoft\Windows\Shell\Copilot\BingChat` | `IsUserEligible` | `REG_DWORD` | `0` |
| `DELETE` | `HKCU\Software\Microsoft\Windows\Shell\Copilot\BingChat` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKCU\Software\StartIsBack` | `ModernIconsColorized` | `REG_DWORD` | `0` |
| `ADD` | `HKCU\Software\StartIsBack` | `SettingsVersion` | `REG_DWORD` | `5` |
| `ADD` | `HKCU\Software\StartIsBack` | `FrameStyle` | `REG_DWORD` | `0` |
| `ADD` | `HKCU\Software\StartIsBack` | `AlterStyle` | `REG_SZ` | `` |
| `ADD` | `HKCU\Software\StartIsBack` | `TaskbarStyle` | `REG_SZ` | `` |
| `ADD` | `HKCU\Software\StartIsBack` | `SysTrayStyle` | `REG_DWORD` | `0` |
| `ADD` | `HKCU\Software\StartIsBack` | `BottomDetails` | `REG_DWORD` | `0` |
| `DELETE` | `HKEY_CURRENT_USER\SOFTWARE\Microsoft\Edge` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKEY_CURRENT_USER\SOFTWARE\Microsoft\EdgeUpdate` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR` | `AppCaptureEnabled` | `REG_DWORD` | `0` |
| `DELETE` | `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run` | `!EDGE0001!` | `N/A` | `DELETED` |
| `ADD` | `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework` | `OnlyUseLatestCLR` | `REG_DWORD` | `0` |
| `DELETE` | `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\.NETFramework` | `OnlyUseLatestCLR` | `REG_DWORD` | `0` |
| `DELETE` | `HKLMSOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{3A3A0B10-D8A1-4F0C-A721-FA41AF4A82D1}` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKLM\!key!` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKLM\SOFTWARE\Clients\StartMenuInternet\Microsoft Edge` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{9459C573-B17A-45AE-9F64-1857B5D58CEE}` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKLM\SOFTWARE\Microsoft\Edge` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\EdgeUpdate` | `DoNotUpdateToEdgeWithChromium` | `REG_DWORD` | `1` |
| `DELETE` | `HKLM\SOFTWARE\Microsoft\EdgeUpdate` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\PolicyManager\default\Settings\AllowSignInOptions` | `value` | `REG_DWORD` | `1` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\OEM` | `DeviceForm` | `REG_DWORD` | `4` |
| `DELETE` | `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{03121D36-214E-4004-AB4E-93C70686A7F0}` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{07D6D643-A772-4464-9498-9B69F17DDB96}` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{DC3C87C7-19F7-4104-9A07-4A609B923700}` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\MicrosoftEdgeUpdateTaskMachineUA` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform` | `KeyManagementServiceName` | `REG_SZ` | `` |
| `DELETE` | `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\msedge.exe` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock` | `AllowDevelopmentWithoutDevLicense` | `REG_DWORD` | `1` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\!app!` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\EndOfLife\S-1-5-18\!app!` | `(Default)` | `REG_SZ` | `` |
| `ADD` | `HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting` | `Disabled` | `REG_DWORD` | `0` |
| `DELETE` | `HKLM\SOFTWARE\WOW6432Node\Clients\StartMenuInternet\Microsoft Edge` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `HKLM\SOFTWARE\WOW6432Node\GhostSpectre` | `Memory` | `REG_SZ` | `` |
| `ADD` | `HKLM\SOFTWARE\WOW6432Node\GhostSpectre` | `Ghost_Revision` | `REG_SZ` | `1` |
| `ADD` | `HKLM\SOFTWARE\WOW6432Node\GhostSpectre` | `Youtube_DL` | `REG_SZ` | `[` |
| `ADD` | `HKLM\SOFTWARE\WOW6432Node\GhostSpectre` | `YoutubeURL` | `REG_SZ` | `` |
| `ADD` | `HKLM\SOFTWARE\WOW6432Node\GhostSpectre` | `YoutubeVideo` | `REG_SZ` | `%` |
| `ADD` | `HKLM\SOFTWARE\WOW6432Node\GhostSpectre` | `YoutubeAudio` | `REG_SZ` | `%` |
| `ADD` | `HKLM\SOFTWARE\WOW6432Node\GhostSpectre` | `AndroidADB` | `REG_SZ` | `` |
| `ADD` | `HKLM\SOFTWARE\WOW6432Node\GhostSpectre` | `AndroidAPK` | `REG_SZ` | `` |
| `ADD` | `HKLM\SOFTWARE\WOW6432Node\GhostSpectre` | `Check_Update` | `REG_DWORD` | `0` |
| `DELETE` | `HKLM\SOFTWARE\WOW6432Node\GhostSpectre` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\App Paths\msedge.exe` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\StartIsBack` | `(Key Deletion)` | `N/A` | `DELETED` |
| `DELETE` | `HKLM\Software\Microsoft\Windows\CurrentVersion\Run` | `Microsoft` | `N/A` | `DELETED` |
| `DELETE` | `HKLM\Software\Microsoft\Windows\CurrentVersion\Run` | `*MicrosoftEdgeAutoLaunch*` | `N/A` | `DELETED` |
| `DELETE` | `HKLM\Software\Microsoft\Windows\Shell\Copilot\BingChat` | `(Key Deletion)` | `N/A` | `DELETED` |
| `ADD` | `hku\Default\Software\Microsoft\Windows\CurrentVersion\RunOnce` | `New` | `REG_SZ` | `` |

