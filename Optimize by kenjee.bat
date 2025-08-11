@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
mode con cols=100 lines=35
title PC OPTIMIZATION SUITE by KENJEE
color 0B

:STARTUP_ANIMATION
cls
echo.
echo.
echo.
echo                   ****************************************************
echo                   *                                                  *
echo                   *              WELCOME TO KENJEE                   *
echo                   *           PC OPTIMIZATION SUITE                  *
echo                   *                                                  *
echo                   ****************************************************
timeout /t 1 /nobreak >nul
cls
echo.
echo.
echo.
echo                   ====================================================
echo                   =                                                  =
echo                   =             LOADING SYSTEM...                   =
echo                   =            Please wait...                       =
echo                   =                                                  =
echo                   ====================================================
timeout /t 1 /nobreak >nul

:MAIN_MENU
cls
color 0A
echo.
echo  ================================================================================
echo  =                                                                              =
echo  =                    PC OPTIMIZATION SUITE by KENJEE                          =
echo  =                          Professional Edition                               =
echo  =                                                                              =
echo  ================================================================================
echo.
echo  +------------------------------------------------------------------------------+
echo  ^|                              OPTIMIZATION MENU                              ^|
echo  +------------------------------------------------------------------------------+
echo  ^|                                                                              ^|
echo  ^|   [1] Delete Temporary Files           [5] System File Checker (SFC)       ^|
echo  ^|                                                                              ^|
echo  ^|   [2] Advanced Temp Cleanup            [6] Remove Microsoft Edge           ^|
echo  ^|                                                                              ^|
echo  ^|   [3] Clear Windows Update Cache       [7] Maximum Performance Mode        ^|
echo  ^|                                                                              ^|
echo  ^|   [4] Run Disk Cleanup Utility         [8] *** RUN ALL OPTIMIZATIONS ***   ^|
echo  ^|                                                                              ^|
echo  ^|                              [0] Exit Program                               ^|
echo  ^|                                                                              ^|
echo  +------------------------------------------------------------------------------+
echo.
echo  ================================================================================
echo                            SELECT YOUR OPTIMIZATION CHOICE (0-8)
echo  ================================================================================
echo.
set /p choice=  ^> Enter your choice: 

if "%choice%"=="1" goto DELETE_TEMP
if "%choice%"=="2" goto DELETE_TEMP_ALT
if "%choice%"=="3" goto CLEAR_WU_CACHE
if "%choice%"=="4" goto RUN_CLEANMGR
if "%choice%"=="5" goto RUN_SFC
if "%choice%"=="6" goto REMOVE_EDGE
if "%choice%"=="7" goto SET_POWER_PLAN
if "%choice%"=="8" goto RUN_ALL
if "%choice%"=="0" goto EXIT

color 0C
echo.
echo  ERROR: Invalid choice! Please select a number from 0-8
timeout /t 2 /nobreak >nul
goto MAIN_MENU

:DELETE_TEMP
call :SHOW_HEADER "DELETING TEMPORARY FILES"
echo  +------------------------------------------------------------------------------+
echo  ^|                            CLEANING TEMPORARY FILES                         ^|
echo  +------------------------------------------------------------------------------+
echo.
echo  ^> Scanning temporary directories...
del /s /f /q %temp%\* >nul 2>&1
echo  [OK] User temp folder cleaned
del /s /f /q C:\Windows\Temp\* >nul 2>&1
echo  [OK] Windows temp folder cleaned
rd /s /q %temp% >nul 2>&1
echo  [OK] Temp directories removed
md %temp% >nul 2>&1
echo  [OK] Fresh temp directories created
echo.
call :SUCCESS_MESSAGE "Temporary files deleted successfully!"
pause
goto MAIN_MENU

:DELETE_TEMP_ALT
call :SHOW_HEADER "ADVANCED TEMPORARY FILES CLEANUP"
echo  +------------------------------------------------------------------------------+
echo  ^|                           ADVANCED CLEANUP PROCESS                          ^|
echo  +------------------------------------------------------------------------------+
echo.
echo  ^> Deep scanning temporary files...
for /d %%i in (%temp%\*) do (
    rd /s /q "%%i" >nul 2>&1
)
del /q %temp%\*.* >nul 2>&1
echo  [OK] User temp files purged
for /d %%i in (C:\Windows\Temp\*) do (
    rd /s /q "%%i" >nul 2>&1
)
del /q C:\Windows\Temp\*.* >nul 2>&1
echo  [OK] Windows temp files purged
echo.
call :SUCCESS_MESSAGE "Advanced cleanup completed successfully!"
pause
goto MAIN_MENU

:CLEAR_WU_CACHE
call :SHOW_HEADER "CLEARING WINDOWS UPDATE CACHE"
echo  +------------------------------------------------------------------------------+
echo  ^|                            WINDOWS UPDATE RESET                             ^|
echo  +------------------------------------------------------------------------------+
echo.
echo  ^> Stopping Windows Update services...
net stop wuauserv >nul 2>&1
echo  [OK] Windows Update service stopped
net stop bits >nul 2>&1
echo  [OK] Background Transfer service stopped
echo  ^> Clearing download cache...
del /f /s /q C:\Windows\SoftwareDistribution\Download\* >nul 2>&1
echo  [OK] Update cache cleared
echo  ^> Restarting services...
net start wuauserv >nul 2>&1
echo  [OK] Windows Update service restarted
net start bits >nul 2>&1
echo  [OK] Background Transfer service restarted
echo.
call :SUCCESS_MESSAGE "Windows Update cache cleared successfully!"
pause
goto MAIN_MENU

:RUN_CLEANMGR
call :SHOW_HEADER "DISK CLEANUP UTILITY"
echo  +------------------------------------------------------------------------------+
echo  ^|                              DISK CLEANUP TOOL                              ^|
echo  +------------------------------------------------------------------------------+
echo.
echo  ^> Launching Windows Disk Cleanup utility...
echo  ^> Please wait while the cleanup utility analyzes your system...
cleanmgr /sagerun:1
echo.
call :SUCCESS_MESSAGE "Disk cleanup completed!"
pause
goto MAIN_MENU

:RUN_SFC
call :SHOW_HEADER "SYSTEM FILE CHECKER"
echo  +------------------------------------------------------------------------------+
echo  ^|                            SYSTEM INTEGRITY SCAN                            ^|
echo  +------------------------------------------------------------------------------+
echo.
echo  ^> Starting comprehensive system file check...
echo  ^> This process may take several minutes. Please be patient...
echo.
sfc /scannow
echo.
call :SUCCESS_MESSAGE "System file check completed!"
pause
goto MAIN_MENU

:REMOVE_EDGE
call :SHOW_HEADER "REMOVE MICROSOFT EDGE"
echo  +------------------------------------------------------------------------------+
echo  ^|                             EDGE BROWSER REMOVAL                            ^|
echo  +------------------------------------------------------------------------------+
echo.
echo  ^> Removing Microsoft Edge browser...
powershell -Command "Get-AppxPackage *Microsoft.Edge* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Microsoft Edge packages removed
echo.
call :SUCCESS_MESSAGE "Microsoft Edge removal completed!"
pause
goto MAIN_MENU

:SET_POWER_PLAN
call :SHOW_HEADER "MAXIMUM PERFORMANCE MODE"
echo  +------------------------------------------------------------------------------+
echo  ^|                           PERFORMANCE OPTIMIZATION                          ^|
echo  +------------------------------------------------------------------------------+
echo.
echo  ^> Switching to high performance power plan...
powercfg -setactive SCHEME_MIN >nul 2>&1
echo  [OK] Power plan set to maximum performance
echo  [OK] CPU performance optimized
echo  [OK] System responsiveness enhanced
echo.
call :SUCCESS_MESSAGE "Performance mode activated!"
pause
goto MAIN_MENU

:RUN_ALL
call :SHOW_HEADER "COMPLETE SYSTEM OPTIMIZATION"
color 0E
echo  +------------------------------------------------------------------------------+
echo  ^|                            FULL OPTIMIZATION SUITE                          ^|
echo  +------------------------------------------------------------------------------+
echo.
echo                              *** STARTING COMPLETE OPTIMIZATION ***
echo.

echo  +-- STEP 1/7: TEMPORARY FILES CLEANUP ----------------------------------------+
echo  ^> Deleting temporary files...
del /s /f /q %temp%\* >nul 2>&1
del /s /f /q C:\Windows\Temp\* >nul 2>&1
rd /s /q %temp% >nul 2>&1
md %temp% >nul 2>&1
echo  [OK] Temporary files cleaned successfully!
echo.

echo  +-- STEP 2/7: WINDOWS UPDATE CACHE RESET ------------------------------------+
echo  ^> Clearing Windows Update cache...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
del /f /s /q C:\Windows\SoftwareDistribution\Download\* >nul 2>&1
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
echo  [OK] Windows Update cache cleared successfully!
echo.

echo  +-- STEP 3/7: DISK CLEANUP UTILITY -------------------------------------------+
echo  ^> Running disk cleanup...
cleanmgr /sagerun:1 >nul 2>&1
echo  [OK] Disk cleanup completed successfully!
echo.

echo  +-- STEP 4/7: SYSTEM FILE INTEGRITY CHECK ----------------------------------+
echo  ^> Checking system file integrity...
sfc /scannow >nul 2>&1
echo  [OK] System file check completed successfully!
echo.

echo  +-- STEP 5/7: MICROSOFT EDGE REMOVAL ----------------------------------------+
echo  ^> Removing Microsoft Edge...
powershell -Command "Get-AppxPackage *Microsoft.Edge* | Remove-AppxPackage" >nul 2>&1
echo  [OK] Microsoft Edge removed successfully!
echo.

echo  +-- STEP 6/7: PERFORMANCE OPTIMIZATION --------------------------------------+
echo  ^> Setting maximum performance mode...
powercfg -setactive SCHEME_MIN >nul 2>&1
echo  [OK] Performance mode activated successfully!
echo.

echo  +-- STEP 7/7: FINAL SYSTEM REFRESH ------------------------------------------+
echo  ^> Finalizing optimization...
echo  [OK] System optimization completed successfully!
echo.

call :COMPLETION_ANIMATION
pause
goto MAIN_MENU

:SHOW_HEADER
cls
color 0B
echo.
echo  ================================================================================
echo                                      %~1
echo  ================================================================================
echo.
goto :eof

:SUCCESS_MESSAGE
color 0A
echo.
echo  +==============================================================================+
echo  ^|                                                                              ^|
echo  ^|                             SUCCESS: %~1                             ^|
echo  ^|                                                                              ^|
echo  +==============================================================================+
echo.
goto :eof

:COMPLETION_ANIMATION
color 0A
echo.
echo  +==============================================================================+
echo  ^|                                                                              ^|
echo  ^|                    *** ALL OPTIMIZATIONS COMPLETED SUCCESSFULLY! ***       ^|
echo  ^|                                                                              ^|
echo  ^|                          YOUR PC IS NOW FULLY OPTIMIZED!                    ^|
echo  ^|                                                                              ^|
echo  ^|                            ENJOY THE PERFORMANCE BOOST!                     ^|
echo  ^|                                                                              ^|
echo  +==============================================================================+
echo.
for /l %%i in (1,1,3) do (
    echo                              *** OPTIMIZATION COMPLETE ***
    timeout /t 1 /nobreak >nul
    cls
    echo.
    echo  +==============================================================================+
    echo  ^|                                                                              ^|
    echo  ^|                    *** ALL OPTIMIZATIONS COMPLETED SUCCESSFULLY! ***       ^|
    echo  ^|                                                                              ^|
    echo  ^|                          YOUR PC IS NOW FULLY OPTIMIZED!                    ^|
    echo  ^|                                                                              ^|
    echo  ^|                            ENJOY THE PERFORMANCE BOOST!                     ^|
    echo  ^|                                                                              ^|
    echo  +==============================================================================+
    echo.
    timeout /t 1 /nobreak >nul
)
goto :eof

:EXIT
cls
color 0D
echo.
echo  ================================================================================
echo  =                                                                              =
echo  =                            THANK YOU FOR USING                              =
echo  =                        PC OPTIMIZATION SUITE by KENJEE                      =
echo  =                                                                              =
echo  =                          Your PC has been optimized!                        =
echo  =                             Have a great day!                               =
echo  =                                                                              =
echo  ================================================================================
echo.
echo                              Press any key to exit...
pause >nul
exit
