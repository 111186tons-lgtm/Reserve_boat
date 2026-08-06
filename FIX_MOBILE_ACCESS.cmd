@echo off
setlocal EnableExtensions
pushd "%~dp0" >nul 2>&1
chcp 65001 >nul 2>&1
title Boat Reserve - Mobile access without registration
echo.
echo Boat Reserve no longer requires Tailscale registration.
echo Starting the normal public mode through Pinggy and Cloudflare...
echo.
call "%~dp0START_ALL.cmd"
set "RC=%ERRORLEVEL%"
popd
exit /b %RC%
