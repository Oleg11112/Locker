@echo off
title Windows Optimization Tools - Installation
color 0B

echo ========================================
echo   WINDOWS OPTIMIZATION TOOLS
echo   Installation and Setup
echo ========================================
echo.
echo This will install Python dependencies for the optimization tools
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
        echo After installing Python, run this script again
        echo.
        pause
        exit
    ) else (
        set PYTHON_CMD=py
        echo ✅ Python found: py command
    )
) else (
    set PYTHON_CMD=python
    echo ✅ Python found: python command
)

echo.
echo Installing required packages...
echo.

echo Installing CustomTkinter...
%PYTHON_CMD% -m pip install customtkinter>=5.2.0 --user
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Failed to install CustomTkinter
    pause
    exit
)

echo Installing Keyboard library...
%PYTHON_CMD% -m pip install keyboard>=0.13.5 --user
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Failed to install Keyboard
    pause
    exit
)

echo Installing Windows libraries...
%PYTHON_CMD% -m pip install pywin32>=306 --user
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
echo ✅ All Python dependencies installed
echo ✅ Optimization tools ready to use
echo.
echo You can now run "Optimize by kenjee.bat"
echo.
pause