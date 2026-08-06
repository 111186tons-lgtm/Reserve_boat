@echo off
setlocal EnableExtensions
pushd "%~dp0"
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\ensure_venv.ps1"
if errorlevel 1 goto :fail
"%~dp0.venv\Scripts\python.exe" "%~dp0scripts\connect_google.py"
echo.
pause
popd
exit /b 0
:fail
echo Could not prepare Python environment.
pause
popd
exit /b 1
