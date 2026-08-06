@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"
for /f "tokens=1-4 delims=/. " %%a in ("%date%") do set DATESTAMP=%%d-%%b-%%c
for /f "tokens=1-3 delims=:,. " %%a in ("%time%") do set TIMESTAMP=%%a-%%b-%%c
set TARGET=backups\manual_!DATESTAMP!_!TIMESTAMP!
mkdir "!TARGET!" >nul 2>nul
if exist .env copy /y .env "!TARGET!\.env" >nul
if exist boat_reserve.db copy /y boat_reserve.db "!TARGET!\boat_reserve.db" >nul
if exist google-oauth-token.json copy /y google-oauth-token.json "!TARGET!\google-oauth-token.json" >nul
if exist google-oauth-client.json copy /y google-oauth-client.json "!TARGET!\google-oauth-client.json" >nul
if exist google-service-account.json copy /y google-service-account.json "!TARGET!\google-service-account.json" >nul
echo Local private backup created: !TARGET!
pause
