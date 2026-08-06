@echo off
setlocal EnableExtensions
pushd "%~dp0" >nul 2>&1
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\install_autostart.ps1"
popd
