@echo off
setlocal EnableExtensions
pushd "%~dp0" >nul 2>&1
if errorlevel 1 goto :path_error

chcp 65001 >nul 2>&1
set "PYTHONUTF8=1"
set "PYTHONIOENCODING=utf-8"
title SPB_boat Telegram Bot

echo ==========================================================
echo SPB_boat Telegram bot launcher
echo Keep this window open while the bot is running.
echo ==========================================================
echo.

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
echo Checking DNS, TLS, proxy and Telegram API access...
".venv\Scripts\python.exe" "scripts\diagnose_telegram_network.py"
if errorlevel 1 goto :network_error

echo.
echo After the Connected message, send /start or /id to @SPB_boat_bot.
echo.
".venv\Scripts\python.exe" "scripts\run_telegram_bot.py"

echo.
echo The bot has stopped. Read the message above for the reason.
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

:network_error
echo.
echo BOT NOT STARTED: Telegram network diagnostics failed.
echo Run DIAGNOSE_TELEGRAM_NETWORK.cmd and copy the complete output.
echo If Telegram requires a proxy, run SET_TELEGRAM_PROXY.cmd.
echo.
pause
popd
exit /b 2

:python_error
echo.
echo ERROR: Python 3.10 or newer was not found.
echo Install Python and enable the Python launcher or add Python to PATH.
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
