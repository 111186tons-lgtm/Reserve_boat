@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"
set "REMOTE=https://github.com/111186tons-lgtm/Reserve_boat.git"
set "REMOTE_HEADS=%TEMP%\reserve_boat_remote_heads_%RANDOM%.txt"

git --version >nul 2>nul
if errorlevel 1 (
  echo [ERROR] Git is not installed or not available in PATH.
  pause
  exit /b 1
)

git ls-remote --heads "%REMOTE%" >"%REMOTE_HEADS%" 2>nul
if errorlevel 1 (
  del "%REMOTE_HEADS%" >nul 2>nul
  echo [ERROR] Cannot read the GitHub repository.
  echo Check Internet access and sign in to GitHub through Git Credential Manager.
  pause
  exit /b 1
)

for /f %%A in ('find /c /v "" ^< "%REMOTE_HEADS%"') do set "HEADCOUNT=%%A"
del "%REMOTE_HEADS%" >nul 2>nul
if not "!HEADCOUNT!"=="0" (
  echo [STOP] The remote repository already contains branches.
  echo This safety script will not overwrite an existing repository.
  echo Clone the repository and merge the baseline normally.
  pause
  exit /b 2
)

if not exist .git git init
git branch -M main
git remote remove origin >nul 2>nul
git remote add origin "%REMOTE%"
git add .
git commit -m "Baseline Boat Reserve v7.2.4"
if errorlevel 1 (
  echo [ERROR] Commit failed.
  echo Configure Git user.name and user.email if Git requests them.
  pause
  exit /b 1
)

git tag -f v7.2.4
git push -u origin main
if errorlevel 1 (
  echo [ERROR] Main branch push failed.
  echo Sign in through Git Credential Manager when prompted.
  pause
  exit /b 1
)
git push origin v7.2.4
if errorlevel 1 (
  echo [ERROR] Version tag push failed.
  pause
  exit /b 1
)

echo.
echo Baseline v7.2.4 published successfully.
pause
