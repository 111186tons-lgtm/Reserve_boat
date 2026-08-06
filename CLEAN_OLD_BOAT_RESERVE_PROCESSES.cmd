@echo off
setlocal EnableExtensions
chcp 65001 >nul 2>&1
echo Stopping stale Boat Reserve processes from old extracted folders...
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "$me=$PID; Get-CimInstance Win32_Process ^| Where-Object { $_.ProcessId -ne $me -and $_.CommandLine -and $_.CommandLine -match '(?i)boat_reserve' -and ($_.CommandLine -match '(?i)public_launcher\.py' -or $_.CommandLine -match '(?i)uvicorn.*app\.main:app' -or $_.CommandLine -match '(?i)run_telegram_bot\.py') } ^| ForEach-Object { taskkill.exe /PID $_.ProcessId /T /F ^| Out-Null }"
echo Done. You can now run START_ALL.cmd.
pause
