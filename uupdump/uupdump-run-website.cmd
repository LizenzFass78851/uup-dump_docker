@echo off
rem Set autorun to 0 if you do not want to start your browser automatically
set "autorun=1"

set "scriptDir=%~dp0"
set "php=%scriptDir%php\php.exe"
set "serverPort=44400"

echo UUP dump local server
echo.
echo This server is powered by PHP internal web server.
echo To browse UUP dump use your web browser.
echo.
echo Address of local UUP dump instance:
echo http://127.0.0.1:%serverPort%
echo.
echo Close this window to stop the server.
echo.

if %autorun% EQU 1 start "" "http://127.0.0.1:%serverPort%"

echo ----- PHP log -----
"%php%" -c "%scriptDir%php\php.ini" -S 127.0.0.1:%serverPort% -t "%scriptDir%uup"
