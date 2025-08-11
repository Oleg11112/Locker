@echo off
title Installation - System Optimization Tools
color 0B

echo ========================================
echo   INSTALLATION SYSTEM OPTIMIZATION TOOLS
echo ========================================
echo.
echo This script will install required dependencies
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

echo Installing dependencies...
echo.

%PYTHON_CMD% -m pip install --upgrade pip
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Failed to upgrade pip
    pause
    exit
)

%PYTHON_CMD% -m pip install customtkinter>=5.2.0
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Failed to install customtkinter
    pause
    exit
)

%PYTHON_CMD% -m pip install keyboard>=0.13.5
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Failed to install keyboard
    pause
    exit
)

%PYTHON_CMD% -m pip install pywin32>=306
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Failed to install pywin32
    pause
    exit
)

echo.
echo ========================================
echo   INSTALLATION COMPLETED SUCCESSFULLY!
echo ========================================
echo.
echo You can now run "Optimize by kenjee.bat"
echo.
pause