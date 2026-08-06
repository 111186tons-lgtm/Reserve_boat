@echo off
setlocal EnableExtensions
set "LINK=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Boat Reserve Public.lnk"
if exist "%LINK%" del /f /q "%LINK%"
echo Boat Reserve autostart removed.
pause
