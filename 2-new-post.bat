@echo off
chcp 65001 >nul
title Blog - New Post
cd /d "%~dp0"

echo ==========================================================
echo   Create a new post
echo ----------------------------------------------------------
echo   Type a filename in English or pinyin, no spaces.
echo   Example: autumn-notes
echo ==========================================================
echo.

set /p name=Filename: 

if "%name%"=="" goto cancelled

call node scripts\new-post.js %name%
if errorlevel 1 goto failed

echo.
echo Created: src\content\posts\%name%.md
echo Opening in Notepad...
start "" notepad "src\content\posts\%name%.md"
goto end

:cancelled
echo Cancelled. Nothing created.
goto end

:failed
echo.
echo Failed to create the post. Check the message above.

:end
echo.
pause
