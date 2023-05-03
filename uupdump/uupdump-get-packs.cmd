@echo off

set "scriptDir=%~dp0"
set "php=%scriptDir%php\php.exe"

rmdir /Q /S "%scriptDir%uup\uuptmp" 2>nul
pushd "%scriptDir%uup"

"%php%" "%scriptDir%uup\sta\packsgen.php"

echo.
echo Done.
echo.

pause
