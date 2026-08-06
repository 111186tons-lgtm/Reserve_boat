@echo off
setlocal
cd /d "%~dp0"
py -3 scripts\build_release.py
if errorlevel 1 python scripts\build_release.py
if errorlevel 1 (
  echo.
  echo [ERROR] Release build failed.
  pause
  exit /b 1
)
echo.
echo Safe ZIP created in dist\. It contains no .env, database or Google credentials.
pause
