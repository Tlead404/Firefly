@echo off
chcp 65001 >nul
title Blog - Local Preview
cd /d "%~dp0"

echo ==========================================================
echo   Local preview
echo ----------------------------------------------------------
echo   The site will open in your browser in about 15 seconds.
echo   Address: http://localhost:4321/
echo.
echo   Keep this window open while writing.
echo   Close this window (or press Ctrl+C) to stop the server.
echo ==========================================================
echo.

start "" /b cmd /c "timeout /t 15 /nobreak >nul & start "" http://localhost:4321/"

call node_modules\.bin\astro.cmd dev

echo.
echo Server stopped.
pause
