@echo off
setlocal EnableExtensions
pushd "%~dp0" >nul 2>&1
if errorlevel 1 goto :path_error
chcp 65001 >nul 2>&1
set "PYTHONUTF8=1"
set "PYTHONIOENCODING=utf-8"
title SPB_boat Telegram Network Diagnostics

powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\ensure_venv.ps1"
if errorlevel 1 goto :env_error

".venv\Scripts\python.exe" "scripts\diagnose_telegram_network.py"
set "CODE=%ERRORLEVEL%"
echo.
if not "%CODE%"=="0" echo Copy the complete output from this window if the problem remains.
pause
popd
exit /b %CODE%

:env_error
echo.
echo PYTHON ENVIRONMENT ERROR. Copy the complete error text above.
pause
popd
exit /b 1

:path_error
echo ERROR: Cannot open the project folder.
echo Extract the ZIP completely before running this file.
pause
exit /b 1
