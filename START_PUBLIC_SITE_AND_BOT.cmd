@echo off
setlocal EnableExtensions
pushd "%~dp0" >nul 2>&1
if errorlevel 1 goto path_error
chcp 65001 >nul 2>&1
title Boat Reserve - Public Site and Telegram Bot v7.2.4
set "PYEXE="
set "PYARG="
where py.exe >nul 2>&1 && (set "PYEXE=py.exe"&set "PYARG=-3")
if not defined PYEXE where python.exe >nul 2>&1 && (set "PYEXE=python.exe"&set "PYARG=")
if not defined PYEXE goto python_error
%PYEXE% %PYARG% "%~dp0scripts\public_launcher.py"
set "RC=%ERRORLEVEL%"
if not "%RC%"=="0" echo Launcher exited with code %RC%.
pause
popd
exit /b %RC%
:python_error
echo Python 3 was not found. Install Python 3.10 or newer and enable the Python launcher.
pause
popd
exit /b 1
:path_error
echo Cannot open the Boat Reserve folder. Extract the ZIP before starting.
pause
exit /b 1
