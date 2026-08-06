@echo off
setlocal
cd /d "%~dp0"
if not exist .git (
  echo [ERROR] This folder is not a Git repository.
  echo Clone the repository first or run PUBLISH_FIRST_VERSION.cmd for an empty remote repository.
  pause
  exit /b 1
)
call BACKUP_LOCAL_DATA.cmd
git status --short
git pull --ff-only
if errorlevel 1 (
  echo.
  echo [ERROR] Git pull failed. Local source files may have uncommitted changes.
  pause
  exit /b 1
)
echo.
echo Source updated. Ignored local files such as .env and boat_reserve.db were preserved.
pause
