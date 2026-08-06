@echo off
setlocal EnableExtensions
pushd "%~dp0" >nul 2>&1
if errorlevel 1 goto :path_error

chcp 65001 >nul 2>&1
set "PYTHONUTF8=1"
set "PYTHONIOENCODING=utf-8"
title Boat Reserve Premium V7.2 and Telegram Bot

if exist ".venv\Scripts\python.exe" goto :venv_ready

call :find_python
if not defined PYTHON_CMD goto :python_error

echo Creating virtual environment...
call %PYTHON_CMD% -m venv ".venv"
if errorlevel 1 goto :error

:venv_ready
echo Installing and checking dependencies...
".venv\Scripts\python.exe" -m pip install --disable-pip-version-check -r "requirements.txt"
if errorlevel 1 goto :error

echo.
echo Boat Reserve and the Telegram bot are starting...
echo Client catalog: http://127.0.0.1:8000/
echo Admin panel:    http://127.0.0.1:8000/admin
echo Telegram status: http://127.0.0.1:8000/v1/telegram/status
echo Telegram bot: @SPB_boat_bot
echo Keep this window open. Do not run START_BOT_ONLY.cmd at the same time.
echo.

start "" powershell -NoProfile -WindowStyle Hidden -Command "Start-Sleep -Seconds 3; Start-Process ('http://127.0.0.1:8000/?refresh=' + [DateTimeOffset]::Now.ToUnixTimeSeconds())"
".venv\Scripts\python.exe" -m uvicorn app.main:app --host 127.0.0.1 --port 8000

echo.
echo The application has stopped.
pause
popd
exit /b 0

:find_python
set "PYTHON_CMD="
py -3.13 -c "import sys" >nul 2>&1 && set "PYTHON_CMD=py -3.13" && exit /b 0
py -3.12 -c "import sys" >nul 2>&1 && set "PYTHON_CMD=py -3.12" && exit /b 0
py -3.11 -c "import sys" >nul 2>&1 && set "PYTHON_CMD=py -3.11" && exit /b 0
py -3.10 -c "import sys" >nul 2>&1 && set "PYTHON_CMD=py -3.10" && exit /b 0
py -c "import sys" >nul 2>&1 && set "PYTHON_CMD=py" && exit /b 0
python -c "import sys" >nul 2>&1 && set "PYTHON_CMD=python" && exit /b 0
exit /b 1

:python_error
echo.
echo ERROR: Python 3.10 or newer was not found.
pause
popd
exit /b 1

:path_error
echo ERROR: Cannot open the project folder.
echo Extract the ZIP completely before running this file.
pause
exit /b 1

:error
echo.
echo STARTUP ERROR. Copy the complete error text from this window.
pause
popd
exit /b 1
