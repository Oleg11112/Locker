@echo off
title PC Optimization Menu
color 0A

:MENU
cls
echo =============================
echo  OPTIMIZATION MENU BY KENJEE
echo =============================
echo 1. Delete temporary files
echo 2. Clear Windows Update cache
echo 3. Run Disk Cleanup (cleanmgr)
echo 4. Check system files (SFC)
echo 5. Remove Microsoft Edge
echo 6. Disable startup programs
echo 7. Set power plan to Maximum Performance
echo 8. Run all optimizations
echo 0. Exit
echo ============================
set /p choice=Enter option number: 

if "%choice%"=="1" goto temp
if "%choice%"=="2" goto wu_cache
if "%choice%"=="3" goto cleanmgr
if "%choice%"=="4" goto sfc
if "%choice%"=="5" goto remove_edge
if "%choice%"=="6" goto disable_startup
if "%choice%"=="7" goto power_plan
if "%choice%"=="8" goto all
if "%choice%"=="0" exit
goto MENU

:temp
echo Deleting temporary files...
del /s /f /q %temp%\*
del /s /f /q C:\Windows\Temp\*
rd /s /q %temp%
md %temp%
echo Done.
pause
goto MENU

:wu_cache
echo Clearing Windows Update cache...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
del /f /s /q C:\Windows\SoftwareDistribution\Download\*
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
echo Done.
pause
goto MENU

:cleanmgr
echo Launching Disk Cleanup...
cleanmgr /sagerun:1
pause
goto MENU

:sfc
echo Checking system file integrity...
sfc /scannow
pause
goto MENU

:remove_edge
echo Removing Microsoft Edge...
:: Uninstall Edge via PowerShell
powershell -Command "Start-Process powershell -ArgumentList 'Get-AppxPackage *Microsoft.Edge* | Remove-AppxPackage' -Verb runAs"
echo Done.
pause
goto MENU

:disable_startup
echo Disabling startup programs...
:: Disable common startup apps via registry (example for Google Chrome)
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Google Chrome" /f >nul 2>&1
:: Add more entries if needed for other apps
echo Done.
pause
goto MENU

:power_plan
echo Switching to Maximum Performance power plan...
:: Switch to High Performance power plan
powercfg -setactive SCHEME_MIN
echo Done.
pause
goto MENU

:all
call :temp
call :wu_cache
call :cleanmgr
call :sfc
call :remove_edge
call :disable_startup
call :power_plan
echo All optimizations completed.
pause
goto MENU
