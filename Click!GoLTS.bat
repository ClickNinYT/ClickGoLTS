@echo off
mode con cols=98 lines=30
Net session >nul 2>&1 || (PowerShell start -verb runas '%~0' &exit /b)
cd %b2eincfilepath%
timeout 5 >nul
title Starting Click!Go Launcher ...
set counter=0
set counterb=000
set core=ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
set "valuecore=                                                            "
setLocal EnableDelayedExpansion
:start
cls
echo.ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo.º%valuecore:~0,60%º
echo.ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
if %counter% GEQ 60 set msg=complete& set counterb=10000& goto exit
echo. %counterb:~0,-2%%%
set /a counter=counter+1
set /a counterb=counterb+166
set "valuecore=!core:~0,%counter%!                                                            "
set delay=0
:delay
if %delay%==5 goto start
set /a delay=delay+1
goto delay
:exit
echo. %counterb:~0,-2%%% %msg%
ENDLOCAL
cls
:menu
cls
title Click!Go Launcher (LTS) version 1.0.0 (codename Megru)
echo.   
echo.   
echo.                                    Click!Go Interface (DOSgg UI)
echo.                     _________________________________________________________
echo.                    ^|                                                         ^|
Echo.                    ^|   [1] Install Minecraft                                 ^|
Echo.                    ^|                                                         ^|
Echo.                    ^|   [2] Uninstall Minecraft                               ^|
Echo.                    ^|                                                         ^|
Echo.                    ^|   [3] Play Minecraft                                    ^| 
Echo.                    ^|                                                         ^| 
Echo.                    ^|   [4] Advanced Scripting Command                        ^|
Echo.                    ^|                                                         ^|  
Echo.                    ^|   [5] Tutorials                                         ^|
Echo.                    ^|                                                         ^|
Echo.                    ^|   [6] Exit                                              ^|
Echo.                    ^|                   _______________                       ^|
echo.                    ^|                                                         ^| 
Echo.                    ^|_________________________________________________________^|
ECHO.            
choice /C:123456 /N /M ".                    Enter Your Choice [1,2,3,4,5,6] : "
if errorlevel 6 goto:exit
if errorlevel 5 goto:tutorial
if errorlevel 4 goto:script
if errorlevel 3 goto:launch
if errorlevel 2 goto:uns
if errorlevel 1 goto:ins
::---------------------------------------------------------------------------
:exit
cls
exit
::---------------------------------------------------------------------------
:tutorial
cls
echo Scripting commands (In this release)
echo 1 . exit (Exit the launcher)
echo 2 . unsmc (Uninstall MC)
echo 3 . insmc (Install MC)
echo 4 . bst (Start Booster to boost your computer and MC performance)
echo 5 . chkmc (Check if MC is installed)
echo 6 . rprmc (Repair MC if something goes wrong)
echo 7 . fxmss (Fix MS Store)
echo 8 . fxmcstuck (Fix Mojang Studios red screen stucked)
echo 9 . insrt (Check if scripting work correctly)
echo 10 . gb (Go back to the menu)
echo 11 . chkcmpt (Check if your Windows 10 Build can use and run Minecraft)
echo 12 . wv (Show your Windows Build)
echo *WARNING : Commands functions can be updated or removed in a future update .
echo Press any key to go back !
pause >nul
cls
goto :menu
exit
::---------------------------------------------------------------------------
:ins
cls
echo Ender the directory to Minecraft .appx file (Example : c:\ye\mc.appx)
set /p adir=Enter the directory: 
echo Installing Runtimes ...
powershell Add-AppxPackage -Path d1.appx
powershell Add-AppxPackage -Path d2.appx
powershell Add-AppxPackage -Path e1.appx
powershell Add-AppxPackage -Path e2.appx
echo Installing Minecraft ...
powershell Add-AppxPackage -Path %adir%
echo Tweaking Minecraft ...
sc stop ClipSVC
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "DisableSubscription" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "InactivityShutdownDelay" /t REG_DWORD /d "300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "RefreshRequired" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "ServiceDll" /t REG_EXPAND_SZ /d "%%SystemRoot%%\System32\ClipSVC.dlla" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "ServiceDllUnloadOnStop" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "ProcessBiosKey" /t REG_DWORD /d "1" /f
net stop "ClipSVC"
echo Launching Minecraft for the first time ...
echo Default timer : 40 seconds
explorer.exe shell:appsFolder\Microsoft.MinecraftUWP_8wekyb3d8bbwe!App
timeout 40 >nul
taskkill /IM "RuntimeBroker.exe" /F
echo Please setup Minecraft like signin Xbox , tweak Video Setting and set your skin !
echo You have 1 minute for that !
timeout 60 >Nul
echo Minecraft is installed ! Please close the game then launch using "Play Minecraft" option !
echo Press any key to end the installer !
pause >nul
goto :menu
exit 
::---------------------------------------------------------------------
:launch
cls
echo Set the timer for first time initilize (Recommended 30~40 Seconds)
set /p tminit=Timer (Seconds) : 
echo Timer %tminit% set !
echo Starting Minecraft ...
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "DisableSubscription" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "InactivityShutdownDelay" /t REG_DWORD /d "300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "RefreshRequired" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "ServiceDll" /t REG_EXPAND_SZ /d "%%SystemRoot%%\System32\ClipSVC.dlla" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "ServiceDllUnloadOnStop" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "ProcessBiosKey" /t REG_DWORD /d "1" /f
net stop "ClipSVC"
explorer.exe shell:appsFolder\Microsoft.MinecraftUWP_8wekyb3d8bbwe!App
timeout %tminit% >nul
echo Minecraft is launched !
goto :menu
exit
::--------------------------------------------------------------------------
:uns
cls
echo Tweaking your computer before Uninstall Minecraft ...
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "DisableSubscription" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "InactivityShutdownDelay" /t REG_DWORD /d "300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "RefreshRequired" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "ServiceDll" /t REG_EXPAND_SZ /d "%%SystemRoot%%\System32\ClipSVC.dll" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "ServiceDllUnloadOnStop" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "ProcessBiosKey" /t REG_DWORD /d "1" /f
net start "ClipSVC"
powershell Get-AppxPackage Microsoft.MinecraftUWP | Remove-AppxPackage
echo Disabling TurboGG Engine ...
timeout 6 >nul
echo Minecraft has been uninstalled !
echo Press any key to go back !
pause >nul
goto :menu
exit
::--------------------------------------------------------------------------
::----------------------------------------------------------------------
::------------SCRIPT SECTION----------------------------------
:script
cls
echo Enter your command here (Take a look on all command by pressing "5" at main menu)
set /p scrcmd=Command Input : 
if %scrcmd% equ exit goto exit
if %scrcmd% equ unsmc goto scruns
if %scrcmd% equ insmc goto scrins
if %scrcmd% equ bst goto scrbst
if %scrcmd% equ chkmc goto scrchkmc
if %scrcmd% equ rprmc goto scrrs
if %scrcmd% equ fxmss goto scrfms
if %scrcmd% equ fxmcstuck goto scrfmst
if %scrcmd% equ insrt goto scrtest
if %scrcmd% equ gb goto scrgb
if %scrcmd% equ chkcmpt goto scrcot
if %scrcmd% equ wv goto scrwv
goto :warn
cls
exit
::----------------------------END SCRIPT SECTION------------------------------
::-----------------SCRIPTING COMMANDS SECTIONS-----------------------------------
:scruns
cls
goto :uns
exit
:scrins
cls
goto :ins
exit
:scrbst
cls
echo This feature is a placeholder ! TurboGG still WIP (Work in progress)
echo Press any key to go back !
pause >nul
goto :menu
exit
: