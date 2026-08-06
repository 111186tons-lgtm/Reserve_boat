@echo off
setlocal EnableExtensions
pushd "%~dp0" >nul 2>&1
if errorlevel 1 goto path_error
call "%~dp0START_PUBLIC_SITE_AND_BOT.cmd"
set "RC=%ERRORLEVEL%"
popd
exit /b %RC%
:path_error
echo Cannot open the Boat Reserve folder. Extract the ZIP completely.
pause
exit /b 1
