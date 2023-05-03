@echo off
set "scriptDir=%~dp0"
set "php=%scriptDir%php\php.exe"
set "serverPort=44401"

rmdir /Q /S "%scriptDir%json-api\api" 2>nul
rmdir /Q /S "%scriptDir%json-api\fileinfo" 2>nul
rmdir /Q /S "%scriptDir%json-api\packs" 2>nul

mklink /D "%scriptDir%json-api\api" "%scriptDir%uup\api" 1>nul
mklink /D "%scriptDir%json-api\fileinfo" "%scriptDir%uup\fileinfo" 1>nul
mklink /D "%scriptDir%json-api\packs" "%scriptDir%uup\packs" 1>nul

echo UUP dump JSON API
echo.
echo This server is powered by PHP internal web server.
echo.
echo UUP dump JSON API instance address:
echo http://127.0.0.1:%serverPort%
echo.
echo Close this window to stop the server.
echo.

echo ----- PHP log -----
"%php%" -c "%scriptDir%php\php.ini" -S 127.0.0.1:%serverPort% -t "%scriptDir%json-api"
