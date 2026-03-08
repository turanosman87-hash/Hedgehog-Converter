@echo off
echo ========================================
echo Hedgehog Converter - EXE Builder
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python is not installed or not in PATH!
    echo Please install Python from https://www.python.org/
    pause
    exit /b 1
)

echo [1/4] Installing required packages...
pip install -r requirements.txt
if errorlevel 1 (
    echo [ERROR] Failed to install dependencies!
    pause
    exit /b 1
)

echo [2/4] Installing PyInstaller...
pip install pyinstaller
if errorlevel 1 (
    echo [ERROR] Failed to install PyInstaller!
    pause
    exit /b 1
)

echo [3/4] Building executable...
pyinstaller --onefile --windowed --icon=hedgehog.png --name=HedgehogConverter hedgehog_app.py
if errorlevel 1 (
    echo [ERROR] Failed to build executable!
    pause
    exit /b 1
)

echo [4/4] Cleaning up build files...
rmdir /s /q build
del hedgehog_app.spec

echo.
echo ========================================
echo [SUCCESS] EXE created successfully!
echo Location: dist\HedgehogConverter.exe
echo ========================================
pause
