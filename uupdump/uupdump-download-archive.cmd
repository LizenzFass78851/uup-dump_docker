@echo off
set "scriptDir=%~dp0uup\"
set "aria2=%scriptDir%public\autodl_files\aria2c.exe"
set "a7z=%scriptDir%sta\7za.exe"

set "tmpfile=tmp%random%.txt"
del "%scriptDir%tmp*.txt" 2>nul
rmdir /Q /S "%scriptDir%tmp" 2>nul

echo Downloading archives...

rem fileinfo-master
echo https://github.com/uup-dump-dev/fileinfo/archive/master.zip>>"%scriptDir%\%tmpfile%"
echo   out=fileinfo-master.zip>>"%scriptDir%\%tmpfile%"
echo.>>"%scriptDir%\%tmpfile%"

rem packs-master
echo https://github.com/uup-dump-dev/packs/archive/master.zip>>"%scriptDir%\%tmpfile%"
echo   out=packs-master.zip>>"%scriptDir%\%tmpfile%"

"%aria2%" -x16 -s16 -d"%scriptDir%tmp" -i"%scriptDir%\%tmpfile%"
if %ERRORLEVEL% NEQ 0 echo Failed to download one of files. & pause & exit /b 1
del /F /Q "%scriptDir%\%tmpfile%"

echo.
echo Extracting data...
"%a7z%" x -o"%scriptDir%tmp\extracted" "%scriptDir%tmp\fileinfo-master.zip"
"%a7z%" x -o"%scriptDir%tmp\extracted" "%scriptDir%tmp\packs-master.zip"

echo.
echo Moving data to target directory...

mkdir "%scriptDir%fileinfo" 2>nul
mkdir "%scriptDir%fileinfo\full" 2>nul
mkdir "%scriptDir%fileinfo\metadata" 2>nul
mkdir "%scriptDir%packs" 2>nul

move /y "%scriptDir%tmp\extracted\fileinfo-master\*.*" "%scriptDir%fileinfo" 1>nul
move /y "%scriptDir%tmp\extracted\fileinfo-master\full\*.*" "%scriptDir%fileinfo\full" 1>nul
move /y "%scriptDir%tmp\extracted\fileinfo-master\metadata\*.*" "%scriptDir%fileinfo\metadata" 1>nul
move /y "%scriptDir%tmp\extracted\packs-master\*.*" "%scriptDir%packs" 1>nul

rmdir /Q /S "%scriptDir%tmp" 2>nul

echo.
echo Done.
echo.
pause

popd
exit /b
