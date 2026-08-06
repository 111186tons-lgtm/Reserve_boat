@echo off
setlocal EnableExtensions
pushd "%~dp0" >nul 2>&1
if errorlevel 1 goto path_error
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\ensure_venv.ps1"
if errorlevel 1 goto fail
"%~dp0.venv\Scripts\python.exe" "%~dp0scripts\migrate_v71.py"
if errorlevel 1 goto fail
echo.
echo Boat Reserve V7.1 update complete.
echo Start START_PUBLIC_SITE_AND_BOT.cmd
pause
popd
exit /b 0
:path_error
echo Cannot open the project folder.
pause
exit /b 1
:fail
echo.
echo Update failed. Copy the complete output and send it for analysis.
pause
popd
exit /b 1
