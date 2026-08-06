@echo off
setlocal EnableExtensions
pushd "%~dp0" >nul 2>&1
set "PYEXE="
set "PYARG="
where py.exe >nul 2>&1 && (set "PYEXE=py.exe"&set "PYARG=-3")
if not defined PYEXE where python.exe >nul 2>&1 && (set "PYEXE=python.exe"&set "PYARG=")
if defined PYEXE %PYEXE% %PYARG% "%~dp0scripts\diagnose_public.py"
popd
