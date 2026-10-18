@echo off
chcp 65001 >nul
title Blog - Publish
cd /d "%~dp0"

echo ==========================================================
echo   Publish changes
echo ----------------------------------------------------------
echo   This will commit all changes and push to GitHub.
echo   Cloudflare will rebuild the site in about 1-2 minutes.
echo ==========================================================
echo.

echo Pending changes:
git status --short
echo.

set /p msg=Commit message - press Enter to use default: 
if "%msg%"=="" set msg=update: site content

git add -A
git commit -m "%msg%"
if errorlevel 1 goto nothing

git push
if errorlevel 1 goto pushfail

echo.
echo Done. Your site will be updated in 1-2 minutes.
echo URL: https://blog-2i1.pages.dev/
goto end

:nothing
echo.
echo Nothing to commit - the working tree is clean.
goto end

:pushfail
echo.
echo Push failed. If a browser window opened, finish the GitHub login
echo and run this file again.

:end
echo.
pause
