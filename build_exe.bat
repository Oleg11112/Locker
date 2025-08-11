@echo off
title Building Windows EXE Files
color 0E

echo ========================================
echo   BUILDING WINDOWS EXE FILES
echo   Automated PyInstaller Script
echo ========================================
echo.

REM Check if Python is available
python --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    py --version >nul 2>&1
    if %ERRORLEVEL% NEQ 0 (
        echo ❌ Python not found! Install Python first
        pause
        exit
    ) else (
        set PYTHON_CMD=py
    )
) else (
    set PYTHON_CMD=python
)

REM Check if PyInstaller is installed
%PYTHON_CMD% -c "import PyInstaller" >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Installing PyInstaller...
    %PYTHON_CMD% -m pip install pyinstaller --user
    if %ERRORLEVEL% NEQ 0 (
        echo ❌ Failed to install PyInstaller
        pause
        exit
    )
)

echo ✅ Python and PyInstaller ready
echo.

REM Clean previous builds
if exist dist rmdir /s /q dist
if exist build rmdir /s /q build
if exist *.spec del *.spec

echo 🔨 Building OptimizationTools.exe...
%PYTHON_CMD% -m PyInstaller --onefile --noconsole --name="OptimizationTools" --distpath=. --clean launcher.py
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Failed to build OptimizationTools.exe
    pause
    exit
)

echo 🔨 Building SystemCleaner.exe...
%PYTHON_CMD% -m PyInstaller --onefile --noconsole --name="SystemCleaner" --distpath=. --clean locker.py
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Failed to build SystemCleaner.exe
    pause
    exit
)

REM Clean up build files
if exist build rmdir /s /q build
if exist *.spec del *.spec

echo.
echo ========================================
echo   BUILD COMPLETED SUCCESSFULLY!
echo ========================================
echo.

if exist OptimizationTools.exe (
    echo ✅ OptimizationTools.exe created
) else (
    echo ❌ OptimizationTools.exe missing
)

if exist SystemCleaner.exe (
    echo ✅ SystemCleaner.exe created
) else (
    echo ❌ SystemCleaner.exe missing
)

echo.
echo 🎉 EXE files ready! Run "Optimize by kenjee.bat" to test
echo.
pause