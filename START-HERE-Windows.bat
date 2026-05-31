@echo off
REM Manufacturing Boot Camp - local test launcher (Windows)
REM Double-click this file. It starts a small local web server in this folder
REM and opens the app in your browser. Everything works, including the
REM Advanced Mold Making lessons.

cd /d "%~dp0"
echo.
echo   Manufacturing Boot Camp - starting local test server...
echo   Leave this window open while you test.
echo   When you're done, close this window to stop the server.
echo.

where python >nul 2>nul
if %errorlevel%==0 (
  start "" "http://localhost:8765/index.html"
  python -m http.server 8765
  goto :eof
)

where py >nul 2>nul
if %errorlevel%==0 (
  start "" "http://localhost:8765/index.html"
  py -m http.server 8765
  goto :eof
)

echo   Python isn't installed. Easiest fix: just double-click index.html
echo   (everything works except the Mold lessons, which need this server).
pause
