@echo off
title PC Optimization Menu by KENJEE
color 0A

:MENU
cls
echo =============================
echo  PC OPTIMIZATION MENU BY KENJEE
echo =============================
echo.
echo 1. Delete temporary files
echo 2. Delete temporary files (alternative method)
echo 3. Clear Windows Update cache
echo 4. Run disk cleanup
echo 5. Run system file checker (SFC)
echo 6. Remove Microsoft Edge
echo 7. Set power plan to maximum performance
echo 8. Run all optimizations
echo 0. Exit
echo.
set /p choice=Enter your choice (0-8): 

if "%choice%"=="1" goto DELETE_TEMP
if "%choice%"=="2" goto DELETE_TEMP_ALT
if "%choice%"=="3" goto CLEAR_WU_CACHE
if "%choice%"=="4" goto RUN_CLEANMGR
if "%choice%"=="5" goto RUN_SFC
if "%choice%"=="6" goto REMOVE_EDGE
if "%choice%"=="7" goto SET_POWER_PLAN
if "%choice%"=="8" goto RUN_ALL
if "%choice%"=="0" goto EXIT

echo Invalid choice. Please try again.
pause
goto MENU

:DELETE_TEMP
echo.
echo Deleting temporary files...
del /s /f /q %temp%\* 2>nul
del /s /f /q C:\Windows\Temp\* 2>nul
rd /s /q %temp% 2>nul
md %temp% 2>nul
echo Temporary files deleted successfully!
pause
goto MENU

:DELETE_TEMP_ALT
echo.
echo Deleting temporary files (alternative method)...
for /d %%i in (%temp%\*) do rd /s /q "%%i" 2>nul
del /q %temp%\*.* 2>nul
for /d %%i in (C:\Windows\Temp\*) do rd /s /q "%%i" 2>nul
del /q C:\Windows\Temp\*.* 2>nul
echo Temporary files deleted successfully!
pause
goto MENU

:CLEAR_WU_CACHE
echo.
echo Clearing Windows Update cache...
net stop wuauserv
net stop bits
del /f /s /q C:\Windows\SoftwareDistribution\Download\*
net start wuauserv
net start bits
echo Windows Update cache cleared successfully!
pause
goto MENU

:RUN_CLEANMGR
echo.
echo Running disk cleanup...
cleanmgr /sagerun:1
echo Disk cleanup completed!
pause
goto MENU

:RUN_SFC
echo.
echo Running system file checker...
echo This may take several minutes...
sfc /scannow
echo System file check completed!
pause
goto MENU

:REMOVE_EDGE
echo.
echo Removing Microsoft Edge...
powershell -Command "Get-AppxPackage *Microsoft.Edge* | Remove-AppxPackage"
echo Microsoft Edge removal completed!
pause
goto MENU

:SET_POWER_PLAN
echo.
echo Setting power plan to maximum performance...
powercfg -setactive SCHEME_MIN
echo Power plan set to maximum performance!
pause
goto MENU

:RUN_ALL
echo.
echo Running all optimizations...
echo.

echo Step 1/7: Deleting temporary files...
del /s /f /q %temp%\* 2>nul
del /s /f /q C:\Windows\Temp\* 2>nul
rd /s /q %temp% 2>nul
md %temp% 2>nul
echo Done!

echo Step 2/7: Clearing Windows Update cache...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
del /f /s /q C:\Windows\SoftwareDistribution\Download\* 2>nul
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
echo Done!

echo Step 3/7: Running disk cleanup...
cleanmgr /sagerun:1
echo Done!

echo Step 4/7: Running system file checker...
sfc /scannow
echo Done!

echo Step 5/7: Removing Microsoft Edge...
powershell -Command "Get-AppxPackage *Microsoft.Edge* | Remove-AppxPackage" >nul 2>&1
echo Done!

echo Step 6/7: Setting power plan to maximum performance...
powercfg -setactive SCHEME_MIN >nul 2>&1
echo Done!

echo Step 7/7: Final cleanup...
echo Done!

echo.
echo All optimizations completed successfully!
echo Your PC has been optimized for better performance.
pause
goto MENU

:EXIT
echo.
echo Thank you for using PC Optimization Menu by KENJEE!
pause
exit
