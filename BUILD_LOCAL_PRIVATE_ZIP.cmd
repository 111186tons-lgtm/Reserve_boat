@echo off
setlocal
cd /d "%~dp0"
echo WARNING: This ZIP may contain the Telegram token, database and private settings.
echo Never upload it to GitHub or send it to third parties.
echo.
py -3 scripts\build_release.py --private
if errorlevel 1 python scripts\build_release.py --private
if errorlevel 1 (
  echo.
  echo [ERROR] Private ZIP build failed.
  pause
  exit /b 1
)
echo.
echo Private local ZIP created in dist\ with PRIVATE_DO_NOT_UPLOAD in its name.
pause
