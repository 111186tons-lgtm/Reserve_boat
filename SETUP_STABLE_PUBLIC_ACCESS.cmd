@echo off
chcp 65001 >nul 2>&1
title Boat Reserve - Optional stable address
echo.
echo This optional file is NOT required for Boat Reserve.
echo The normal START_ALL.cmd works without registration through temporary Pinggy/Cloudflare addresses.
echo.
echo A permanent address requires a separate external account, so this automatic setup is disabled.
echo Run START_ALL.cmd instead.
echo.
pause
exit /b 0
