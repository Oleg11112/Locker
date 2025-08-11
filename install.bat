@echo off
title Windows Optimization Tools - Emergency Install
color 0C

echo ========================================
echo   EMERGENCY PYTHON INSTALLATION
echo ========================================
echo.
echo This script is only needed if EXE files don't work
echo Try running "Optimize by kenjee.bat" first!
echo.
echo If you see this, it means:
echo - Your antivirus blocked the EXE files, OR
echo - You need to install Python dependencies
echo.

pause

echo.
echo Installing Python dependencies...
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    py --version >nul 2>&1
    if %ERRORLEVEL% NEQ 0 (
        echo ❌ Python is not installed!
        echo.
        echo Please install Python 3.x from: https://python.org
        echo Make sure to check "Add Python to PATH" during installation
        echo.
        pause
        exit
    ) else (
        set PYTHON_CMD=py
    )
) else (
    set PYTHON_CMD=python
)

echo ✅ Python found!
echo.

%PYTHON_CMD% -m pip install customtkinter>=5.2.0 keyboard>=0.13.5 pywin32>=306

echo.
echo ========================================
echo   INSTALLATION COMPLETED!
echo ========================================
echo.
echo Now you can run "Optimize by kenjee.bat"
echo.
pause