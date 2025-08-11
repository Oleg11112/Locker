@echo off
setlocal enabledelayedexpansion
mode con cols=120 lines=40
title ✨ PC OPTIMIZATION SUITE by KENJEE ✨

:: Define color codes
set "R=[91m"
set "G=[92m"
set "Y=[93m"
set "B=[94m"
set "M=[95m"
set "C=[96m"
set "W=[97m"
set "BG_B=[44m"
set "BG_G=[42m"
set "BG_R=[41m"
set "BG_Y=[43m"
set "BG_M=[45m"
set "BG_C=[46m"
set "RESET=[0m"
set "BOLD=[1m"
set "DIM=[2m"
set "BLINK=[5m"

:STARTUP_ANIMATION
cls
echo.
echo.
echo                    %B%██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗%RESET%
echo                    %B%██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝%RESET%
echo                    %B%██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗%RESET%
echo                    %B%██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝%RESET%
echo                    %B%╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗%RESET%
echo                     %B%╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝%RESET%
timeout /t 1 /nobreak >nul
cls
echo.
echo.
echo                %C%████████╗ ██████╗     ██╗  ██╗███████╗███╗   ██╗     ██╗███████╗███████╗%RESET%
echo                %C%╚══██╔══╝██╔═══██╗    ██║ ██╔╝██╔════╝████╗  ██║     ██║██╔════╝██╔════╝%RESET%
echo                %C%   ██║   ██║   ██║    █████╔╝ █████╗  ██╔██╗ ██║     ██║█████╗  █████╗%RESET%
echo                %C%   ██║   ██║   ██║    ██╔═██╗ ██╔══╝  ██║╚██╗██║██   ██║██╔══╝  ██╔══╝%RESET%
echo                %C%   ██║   ╚██████╔╝    ██║  ██╗███████╗██║ ╚████║╚█████╔╝███████╗███████╗%RESET%
echo                %C%   ╚═╝    ╚═════╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝ ╚════╝ ╚══════╝╚══════╝%RESET%
timeout /t 1 /nobreak >nul

:MAIN_MENU
cls
echo.
echo %BG_B%%W%════════════════════════════════════════════════════════════════════════════════════════════════════════════%RESET%
echo %BG_B%%W%                                                                                                                %RESET%
echo %BG_B%%W%          ██████╗  ██████╗    ██████╗ ██████╗ ████████╗██╗███╗   ███╗██╗███████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗%RESET%
echo %BG_B%%W%          ██╔══██╗██╔════╝   ██╔═══██╗██╔══██╗╚══██╔══╝██║████╗ ████║██║╚══███╔╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║%RESET%
echo %BG_B%%W%          ██████╔╝██║        ██║   ██║██████╔╝   ██║   ██║██╔████╔██║██║  ███╔╝ ███████║   ██║   ██║██║   ██║██╔██╗ ██║%RESET%
echo %BG_B%%W%          ██╔═══╝ ██║        ██║   ██║██╔═══╝    ██║   ██║██║╚██╔╝██║██║ ███╔╝  ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║%RESET%
echo %BG_B%%W%          ██║     ╚██████╗   ╚██████╔╝██║        ██║   ██║██║ ╚═╝ ██║██║███████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║%RESET%
echo %BG_B%%W%          ╚═╝      ╚═════╝    ╚═════╝ ╚═╝        ╚═╝   ╚═╝╚═╝     ╚═╝╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝%RESET%
echo %BG_B%%W%                                                                                                                %RESET%
echo %BG_B%%W%                                    ███████╗██╗   ██╗██╗████████╗███████╗    ██████╗ ██╗   ██╗                        %RESET%
echo %BG_B%%W%                                    ██╔════╝██║   ██║██║╚══██╔══╝██╔════╝    ██╔══██╗╚██╗ ██╔╝                        %RESET%
echo %BG_B%%W%                                    ███████╗██║   ██║██║   ██║   █████╗      ██████╔╝ ╚████╔╝                         %RESET%
echo %BG_B%%W%                                    ╚════██║██║   ██║██║   ██║   ██╔══╝      ██╔══██╗  ╚██╔╝                          %RESET%
echo %BG_B%%W%                                    ███████║╚██████╔╝██║   ██║   ███████╗    ██████╔╝   ██║                           %RESET%
echo %BG_B%%W%                                    ╚══════╝ ╚═════╝ ╚═╝   ╚═╝   ╚══════╝    ╚═════╝    ╚═╝                           %RESET%
echo %BG_B%%W%                                                                                                                %RESET%
echo %BG_B%%W%                                           ██╗  ██╗███████╗███╗   ██╗     ██╗███████╗███████╗                        %RESET%
echo %BG_B%%W%                                           ██║ ██╔╝██╔════╝████╗  ██║     ██║██╔════╝██╔════╝                        %RESET%
echo %BG_B%%W%                                           █████╔╝ █████╗  ██╔██╗ ██║     ██║█████╗  █████╗                          %RESET%
echo %BG_B%%W%                                           ██╔═██╗ ██╔══╝  ██║╚██╗██║██   ██║██╔══╝  ██╔══╝                          %RESET%
echo %BG_B%%W%                                           ██║  ██╗███████╗██║ ╚████║╚█████╔╝███████╗███████╗                        %RESET%
echo %BG_B%%W%                                           ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝ ╚════╝ ╚══════╝╚══════╝                        %RESET%
echo %BG_B%%W%                                                                                                                %RESET%
echo %BG_B%%W%════════════════════════════════════════════════════════════════════════════════════════════════════════════%RESET%
echo.
echo %BG_G%%W%╔══════════════════════════════════════════════════════════════════════════════════════════════════════════╗%RESET%
echo %BG_G%%W%║                                                                                                              ║%RESET%
echo %BG_G%%W%║   %Y%🗑️  1.%W% DELETE TEMPORARY FILES                    %Y%🔄  5.%W% SYSTEM FILE CHECKER (SFC)             ║%RESET%
echo %BG_G%%W%║                                                                                                              ║%RESET%
echo %BG_G%%W%║   %Y%🗂️  2.%W% ADVANCED TEMP CLEANUP                    %Y%🌐  6.%W% REMOVE MICROSOFT EDGE               ║%RESET%
echo %BG_G%%W%║                                                                                                              ║%RESET%
echo %BG_G%%W%║   %Y%📦  3.%W% CLEAR WINDOWS UPDATE CACHE               %Y%⚡  7.%W% MAXIMUM PERFORMANCE MODE            ║%RESET%
echo %BG_G%%W%║                                                                                                              ║%RESET%
echo %BG_G%%W%║   %Y%🧹  4.%W% RUN DISK CLEANUP UTILITY                 %Y%🚀  8.%W% ✨ RUN ALL OPTIMIZATIONS ✨          ║%RESET%
echo %BG_G%%W%║                                                                                                              ║%RESET%
echo %BG_G%%W%║                                          %R%❌  0.%W% EXIT PROGRAM                                         ║%RESET%
echo %BG_G%%W%║                                                                                                              ║%RESET%
echo %BG_G%%W%╚══════════════════════════════════════════════════════════════════════════════════════════════════════════╝%RESET%
echo.
echo %BG_M%%W%                          ═══════════════════════════════════════════════════════════                          %RESET%
echo %BG_M%%W%                             %BLINK%✨ SELECT YOUR OPTIMIZATION CHOICE (0-8) ✨%RESET%%BG_M%%W%                             %RESET%
echo %BG_M%%W%                          ═══════════════════════════════════════════════════════════                          %RESET%
echo.
set /p choice=%C%► Enter your choice: %RESET%

if "%choice%"=="1" goto DELETE_TEMP
if "%choice%"=="2" goto DELETE_TEMP_ALT
if "%choice%"=="3" goto CLEAR_WU_CACHE
if "%choice%"=="4" goto RUN_CLEANMGR
if "%choice%"=="5" goto RUN_SFC
if "%choice%"=="6" goto REMOVE_EDGE
if "%choice%"=="7" goto SET_POWER_PLAN
if "%choice%"=="8" goto RUN_ALL
if "%choice%"=="0" goto EXIT

echo %R%✘ Invalid choice! Please select a number from 0-8%RESET%
timeout /t 2 /nobreak >nul
goto MAIN_MENU

:DELETE_TEMP
call :SHOW_HEADER "DELETING TEMPORARY FILES"
echo %Y%┌─────────────────────────────────────────────────────────────────────────────────────────────────────────┐%RESET%
echo %Y%│                                     🗑️  CLEANING TEMPORARY FILES  🗑️                                      │%RESET%
echo %Y%└─────────────────────────────────────────────────────────────────────────────────────────────────────────┘%RESET%
echo.
echo %C%► Scanning temporary directories...%RESET%
del /s /f /q %temp%\* >nul 2>&1
echo %G%✓ User temp folder cleaned%RESET%
del /s /f /q C:\Windows\Temp\* >nul 2>&1
echo %G%✓ Windows temp folder cleaned%RESET%
rd /s /q %temp% >nul 2>&1
echo %G%✓ Temp directories removed%RESET%
md %temp% >nul 2>&1
echo %G%✓ Fresh temp directories created%RESET%
echo.
call :SUCCESS_MESSAGE "Temporary files deleted successfully!"
pause
goto MAIN_MENU

:DELETE_TEMP_ALT
call :SHOW_HEADER "ADVANCED TEMPORARY FILES CLEANUP"
echo %Y%┌─────────────────────────────────────────────────────────────────────────────────────────────────────────┐%RESET%
echo %Y%│                                  🗂️  ADVANCED CLEANUP PROCESS  🗂️                                         │%RESET%
echo %Y%└─────────────────────────────────────────────────────────────────────────────────────────────────────────┘%RESET%
echo.
echo %C%► Deep scanning temporary files...%RESET%
for /d %%i in (%temp%\*) do (
    rd /s /q "%%i" >nul 2>&1
    echo %G%✓ Removed directory: %%i%RESET%
)
del /q %temp%\*.* >nul 2>&1
echo %G%✓ User temp files purged%RESET%
for /d %%i in (C:\Windows\Temp\*) do (
    rd /s /q "%%i" >nul 2>&1
    echo %G%✓ Removed Windows temp directory: %%i%RESET%
)
del /q C:\Windows\Temp\*.* >nul 2>&1
echo %G%✓ Windows temp files purged%RESET%
echo.
call :SUCCESS_MESSAGE "Advanced cleanup completed successfully!"
pause
goto MAIN_MENU

:CLEAR_WU_CACHE
call :SHOW_HEADER "CLEARING WINDOWS UPDATE CACHE"
echo %Y%┌─────────────────────────────────────────────────────────────────────────────────────────────────────────┐%RESET%
echo %Y%│                                   📦  WINDOWS UPDATE RESET  📦                                            │%RESET%
echo %Y%└─────────────────────────────────────────────────────────────────────────────────────────────────────────┘%RESET%
echo.
echo %C%► Stopping Windows Update services...%RESET%
net stop wuauserv >nul 2>&1
echo %G%✓ Windows Update service stopped%RESET%
net stop bits >nul 2>&1
echo %G%✓ Background Transfer service stopped%RESET%
echo %C%► Clearing download cache...%RESET%
del /f /s /q C:\Windows\SoftwareDistribution\Download\* >nul 2>&1
echo %G%✓ Update cache cleared%RESET%
echo %C%► Restarting services...%RESET%
net start wuauserv >nul 2>&1
echo %G%✓ Windows Update service restarted%RESET%
net start bits >nul 2>&1
echo %G%✓ Background Transfer service restarted%RESET%
echo.
call :SUCCESS_MESSAGE "Windows Update cache cleared successfully!"
pause
goto MAIN_MENU

:RUN_CLEANMGR
call :SHOW_HEADER "DISK CLEANUP UTILITY"
echo %Y%┌─────────────────────────────────────────────────────────────────────────────────────────────────────────┐%RESET%
echo %Y%│                                     🧹  DISK CLEANUP TOOL  🧹                                             │%RESET%
echo %Y%└─────────────────────────────────────────────────────────────────────────────────────────────────────────┘%RESET%
echo.
echo %C%► Launching Windows Disk Cleanup utility...%RESET%
echo %Y%► Please wait while the cleanup utility analyzes your system...%RESET%
cleanmgr /sagerun:1
echo.
call :SUCCESS_MESSAGE "Disk cleanup completed!"
pause
goto MAIN_MENU

:RUN_SFC
call :SHOW_HEADER "SYSTEM FILE CHECKER"
echo %Y%┌─────────────────────────────────────────────────────────────────────────────────────────────────────────┐%RESET%
echo %Y%│                                   🔍  SYSTEM INTEGRITY SCAN  🔍                                           │%RESET%
echo %Y%└─────────────────────────────────────────────────────────────────────────────────────────────────────────┘%RESET%
echo.
echo %C%► Starting comprehensive system file check...%RESET%
echo %Y%► This process may take several minutes. Please be patient...%RESET%
echo.
sfc /scannow
echo.
call :SUCCESS_MESSAGE "System file check completed!"
pause
goto MAIN_MENU

:REMOVE_EDGE
call :SHOW_HEADER "REMOVE MICROSOFT EDGE"
echo %Y%┌─────────────────────────────────────────────────────────────────────────────────────────────────────────┐%RESET%
echo %Y%│                                   🌐  EDGE BROWSER REMOVAL  🌐                                            │%RESET%
echo %Y%└─────────────────────────────────────────────────────────────────────────────────────────────────────────┘%RESET%
echo.
echo %C%► Removing Microsoft Edge browser...%RESET%
powershell -Command "Get-AppxPackage *Microsoft.Edge* | Remove-AppxPackage" >nul 2>&1
echo %G%✓ Microsoft Edge packages removed%RESET%
echo.
call :SUCCESS_MESSAGE "Microsoft Edge removal completed!"
pause
goto MAIN_MENU

:SET_POWER_PLAN
call :SHOW_HEADER "MAXIMUM PERFORMANCE MODE"
echo %Y%┌─────────────────────────────────────────────────────────────────────────────────────────────────────────┐%RESET%
echo %Y%│                                  ⚡  PERFORMANCE OPTIMIZATION  ⚡                                         │%RESET%
echo %Y%└─────────────────────────────────────────────────────────────────────────────────────────────────────────┘%RESET%
echo.
echo %C%► Switching to high performance power plan...%RESET%
powercfg -setactive SCHEME_MIN >nul 2>&1
echo %G%✓ Power plan set to maximum performance%RESET%
echo %G%✓ CPU performance optimized%RESET%
echo %G%✓ System responsiveness enhanced%RESET%
echo.
call :SUCCESS_MESSAGE "Performance mode activated!"
pause
goto MAIN_MENU

:RUN_ALL
call :SHOW_HEADER "COMPLETE SYSTEM OPTIMIZATION"
echo %Y%┌─────────────────────────────────────────────────────────────────────────────────────────────────────────┐%RESET%
echo %Y%│                              🚀  FULL OPTIMIZATION SUITE  🚀                                             │%RESET%
echo %Y%└─────────────────────────────────────────────────────────────────────────────────────────────────────────┘%RESET%
echo.
echo %BG_C%%W%                                    ✨ STARTING COMPLETE OPTIMIZATION ✨                                    %RESET%
echo.

echo %Y%┌── STEP 1/7: TEMPORARY FILES CLEANUP ──────────────────────────────────────────────────────────────────┐%RESET%
echo %C%► Deleting temporary files...%RESET%
del /s /f /q %temp%\* >nul 2>&1
del /s /f /q C:\Windows\Temp\* >nul 2>&1
rd /s /q %temp% >nul 2>&1
md %temp% >nul 2>&1
echo %G%✓ Temporary files cleaned successfully!%RESET%
echo.

echo %Y%┌── STEP 2/7: WINDOWS UPDATE CACHE RESET ───────────────────────────────────────────────────────────────┐%RESET%
echo %C%► Clearing Windows Update cache...%RESET%
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
del /f /s /q C:\Windows\SoftwareDistribution\Download\* >nul 2>&1
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
echo %G%✓ Windows Update cache cleared successfully!%RESET%
echo.

echo %Y%┌── STEP 3/7: DISK CLEANUP UTILITY ─────────────────────────────────────────────────────────────────────┐%RESET%
echo %C%► Running disk cleanup...%RESET%
cleanmgr /sagerun:1 >nul 2>&1
echo %G%✓ Disk cleanup completed successfully!%RESET%
echo.

echo %Y%┌── STEP 4/7: SYSTEM FILE INTEGRITY CHECK ──────────────────────────────────────────────────────────────┐%RESET%
echo %C%► Checking system file integrity...%RESET%
sfc /scannow >nul 2>&1
echo %G%✓ System file check completed successfully!%RESET%
echo.

echo %Y%┌── STEP 5/7: MICROSOFT EDGE REMOVAL ───────────────────────────────────────────────────────────────────┐%RESET%
echo %C%► Removing Microsoft Edge...%RESET%
powershell -Command "Get-AppxPackage *Microsoft.Edge* | Remove-AppxPackage" >nul 2>&1
echo %G%✓ Microsoft Edge removed successfully!%RESET%
echo.

echo %Y%┌── STEP 6/7: PERFORMANCE OPTIMIZATION ─────────────────────────────────────────────────────────────────┐%RESET%
echo %C%► Setting maximum performance mode...%RESET%
powercfg -setactive SCHEME_MIN >nul 2>&1
echo %G%✓ Performance mode activated successfully!%RESET%
echo.

echo %Y%┌── STEP 7/7: FINAL SYSTEM REFRESH ─────────────────────────────────────────────────────────────────────┐%RESET%
echo %C%► Finalizing optimization...%RESET%
echo %G%✓ System optimization completed successfully!%RESET%
echo.

call :COMPLETION_ANIMATION
pause
goto MAIN_MENU

:SHOW_HEADER
cls
echo.
echo %BG_C%%W%════════════════════════════════════════════════════════════════════════════════════════════════════════════%RESET%
echo %BG_C%%W%                                          %~1                                          %RESET%
echo %BG_C%%W%════════════════════════════════════════════════════════════════════════════════════════════════════════════%RESET%
echo.
goto :eof

:SUCCESS_MESSAGE
echo.
echo %BG_G%%W%╔════════════════════════════════════════════════════════════════════════════════════════════════════════╗%RESET%
echo %BG_G%%W%║                                                                                                        ║%RESET%
echo %BG_G%%W%║                                     ✅ %~1 ✅                                     ║%RESET%
echo %BG_G%%W%║                                                                                                        ║%RESET%
echo %BG_G%%W%╚════════════════════════════════════════════════════════════════════════════════════════════════════════╝%RESET%
echo.
goto :eof

:COMPLETION_ANIMATION
echo.
echo %BG_G%%W%╔════════════════════════════════════════════════════════════════════════════════════════════════════════╗%RESET%
echo %BG_G%%W%║                                                                                                        ║%RESET%
echo %BG_G%%W%║                            🎉 ALL OPTIMIZATIONS COMPLETED SUCCESSFULLY! 🎉                           ║%RESET%
echo %BG_G%%W%║                                                                                                        ║%RESET%
echo %BG_G%%W%║                              ✨ YOUR PC IS NOW FULLY OPTIMIZED! ✨                                   ║%RESET%
echo %BG_G%%W%║                                                                                                        ║%RESET%
echo %BG_G%%W%║                                   🚀 ENJOY THE PERFORMANCE BOOST! 🚀                                  ║%RESET%
echo %BG_G%%W%║                                                                                                        ║%RESET%
echo %BG_G%%W%╚════════════════════════════════════════════════════════════════════════════════════════════════════════╝%RESET%
echo.
for /l %%i in (1,1,5) do (
    echo %BLINK%%G%                                              ✨ OPTIMIZATION COMPLETE ✨%RESET%
    timeout /t 1 /nobreak >nul
    cls
    echo.
    echo %BG_G%%W%╔════════════════════════════════════════════════════════════════════════════════════════════════════════╗%RESET%
    echo %BG_G%%W%║                                                                                                        ║%RESET%
    echo %BG_G%%W%║                            🎉 ALL OPTIMIZATIONS COMPLETED SUCCESSFULLY! 🎉                           ║%RESET%
    echo %BG_G%%W%║                                                                                                        ║%RESET%
    echo %BG_G%%W%║                              ✨ YOUR PC IS NOW FULLY OPTIMIZED! ✨                                   ║%RESET%
    echo %BG_G%%W%║                                                                                                        ║%RESET%
    echo %BG_G%%W%║                                   🚀 ENJOY THE PERFORMANCE BOOST! 🚀                                  ║%RESET%
    echo %BG_G%%W%║                                                                                                        ║%RESET%
    echo %BG_G%%W%╚════════════════════════════════════════════════════════════════════════════════════════════════════════╝%RESET%
    echo.
    timeout /t 1 /nobreak >nul
)
goto :eof

:EXIT
cls
echo.
echo %BG_M%%W%════════════════════════════════════════════════════════════════════════════════════════════════════════════%RESET%
echo %BG_M%%W%                                                                                                            %RESET%
echo %BG_M%%W%              ████████╗██╗  ██╗ █████╗ ███╗   ██╗██╗  ██╗    ██╗   ██╗ ██████╗ ██╗   ██╗                  %RESET%
echo %BG_M%%W%              ╚══██╔══╝██║  ██║██╔══██╗████╗  ██║██║ ██╔╝    ╚██╗ ██╔╝██╔═══██╗██║   ██║                  %RESET%
echo %BG_M%%W%                 ██║   ███████║███████║██╔██╗ ██║█████╔╝      ╚████╔╝ ██║   ██║██║   ██║                  %RESET%
echo %BG_M%%W%                 ██║   ██╔══██║██╔══██║██║╚██╗██║██╔═██╗       ╚██╔╝  ██║   ██║██║   ██║                  %RESET%
echo %BG_M%%W%                 ██║   ██║  ██║██║  ██║██║ ╚████║██║  ██╗       ██║   ╚██████╔╝╚██████╔╝                  %RESET%
echo %BG_M%%W%                 ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝       ╚═╝    ╚═════╝  ╚═════╝                   %RESET%
echo %BG_M%%W%                                                                                                            %RESET%
echo %BG_M%%W%                                ███████╗ ██████╗ ██████╗                                                   %RESET%
echo %BG_M%%W%                                ██╔════╝██╔═══██╗██╔══██╗                                                  %RESET%
echo %BG_M%%W%                                █████╗  ██║   ██║██████╔╝                                                  %RESET%
echo %BG_M%%W%                                ██╔══╝  ██║   ██║██╔══██╗                                                  %RESET%
echo %BG_M%%W%                                ██║     ╚██████╔╝██║  ██║                                                  %RESET%
echo %BG_M%%W%                                ╚═╝      ╚═════╝ ╚═╝  ╚═╝                                                  %RESET%
echo %BG_M%%W%                                                                                                            %RESET%
echo %BG_M%%W%                        ██╗   ██╗███████╗██╗███╗   ██╗ ██████╗                                             %RESET%
echo %BG_M%%W%                        ██║   ██║██╔════╝██║████╗  ██║██╔════╝                                             %RESET%
echo %BG_M%%W%                        ██║   ██║███████╗██║██╔██╗ ██║██║  ███╗                                            %RESET%
echo %BG_M%%W%                        ██║   ██║╚════██║██║██║╚██╗██║██║   ██║                                            %RESET%
echo %BG_M%%W%                        ╚██████╔╝███████║██║██║ ╚████║╚██████╔╝                                            %RESET%
echo %BG_M%%W%                         ╚═════╝ ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝                                             %RESET%
echo %BG_M%%W%                                                                                                            %RESET%
echo %BG_M%%W%                     ██████╗  ██████╗    ██████╗ ██████╗ ████████╗██╗███╗   ███╗██╗███████╗███████╗██████╗ %RESET%
echo %BG_M%%W%                     ██╔══██╗██╔════╝   ██╔═══██╗██╔══██╗╚══██╔══╝██║████╗ ████║██║╚══███╔╝██╔════╝██╔══██╗%RESET%
echo %BG_M%%W%                     ██████╔╝██║        ██║   ██║██████╔╝   ██║   ██║██╔████╔██║██║  ███╔╝ █████╗  ██████╔╝%RESET%
echo %BG_M%%W%                     ██╔═══╝ ██║        ██║   ██║██╔═══╝    ██║   ██║██║╚██╔╝██║██║ ███╔╝  ██╔══╝  ██╔══██╗%RESET%
echo %BG_M%%W%                     ██║     ╚██████╗   ╚██████╔╝██║        ██║   ██║██║ ╚═╝ ██║██║███████╗███████╗██║  ██║%RESET%
echo %BG_M%%W%                     ╚═╝      ╚═════╝    ╚═════╝ ╚═╝        ╚═╝   ╚═╝╚═╝     ╚═╝╚═╝╚══════╝╚══════╝╚═╝  ╚═╝%RESET%
echo %BG_M%%W%                                                                                                            %RESET%
echo %BG_M%%W%                                         ██████╗ ██╗   ██╗    ██╗  ██╗███████╗███╗   ██╗     ██╗███████╗███████╗%RESET%
echo %BG_M%%W%                                         ██╔══██╗╚██╗ ██╔╝    ██║ ██╔╝██╔════╝████╗  ██║     ██║██╔════╝██╔════╝%RESET%
echo %BG_M%%W%                                         ██████╔╝ ╚████╔╝     █████╔╝ █████╗  ██╔██╗ ██║     ██║█████╗  █████╗%RESET%
echo %BG_M%%W%                                         ██╔══██╗  ╚██╔╝      ██╔═██╗ ██╔══╝  ██║╚██╗██║██   ██║██╔══╝  ██╔══╝%RESET%
echo %BG_M%%W%                                         ██████╔╝   ██║       ██║  ██╗███████╗██║ ╚████║╚█████╔╝███████╗███████╗%RESET%
echo %BG_M%%W%                                         ╚═════╝    ╚═╝       ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝ ╚════╝ ╚══════╝╚══════╝%RESET%
echo %BG_M%%W%                                                                                                            %RESET%
echo %BG_M%%W%════════════════════════════════════════════════════════════════════════════════════════════════════════════%RESET%
echo.
echo %C%                                         ✨ Press any key to exit... ✨%RESET%
pause >nul
exit
