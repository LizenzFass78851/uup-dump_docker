@echo off
rem Set phprun to 0 if you do not want to start local server automatically
set "phprun=0"

rem Set autorun to 0 if you do not want to start your browser automatically
set "autorun=1"

set "scriptDir=%~dp0"
set "php=%scriptDir%php\php.exe"
set "fetchdetect="%php%" "%scriptDir%uup\sta\fetchdetect.php""
set "serverPort=44400"

rmdir /Q /S "%scriptDir%uup\uuptmp" 2>nul
pushd "%scriptDir%uup"

echo Client
%fetchdetect% All Retail Mainline 17763 1 125
%fetchdetect% All Retail Mainline 19044 1
%fetchdetect% All Retail Mainline 19045 1
%fetchdetect% All Retail Mainline 22000 1
%fetchdetect% All Retail Mainline 22621 1

%fetchdetect% All ReleasePreview Mainline 19044 1
%fetchdetect% All ReleasePreview Mainline 19045 1
%fetchdetect% All ReleasePreview Mainline 22000 1
%fetchdetect% All ReleasePreview Mainline 22621 1

%fetchdetect% All Beta Mainline 22621 1
%fetchdetect% All Beta Mainline 22624 1

%fetchdetect% All Dev Mainline 22621 1
%fetchdetect% All Canary Mainline Latest
echo.

echo Server
%fetchdetect% All Retail Mainline 20348 1 8
%fetchdetect% All Retail Mainline 20348 1 406
%fetchdetect% All Retail Mainline 20349 1 406

%fetchdetect% All ReleasePreview Mainline 20348 1 8
%fetchdetect% All ReleasePreview Mainline 20348 1 406
%fetchdetect% All ReleasePreview Mainline 20349 1 406

echo.
echo Done.
echo.

if %phprun% EQU 0 goto :exit

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

:exit
pause
