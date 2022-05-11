@echo off
setlocal enableDelayedExpansion
setlocal enableExtensions

:: Delete any gsc/zip/subfolders inside this folder just in case it was left over from a previous run.
del *.gsc /s /f /q > nul 2>&1
del *.zip /s /f /q > nul 2>&1
for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d"  > nul 2>&1

:: Set SEARCHPATH.
set "crt_dir=%~dp0"
for %%I in ("%crt_dir%\..") do set "root=%%~fI"
set "SEARCHPATH=%root%\src\gsc"
set "COMPILEDDIR=%root%\tools\compiled\t6"

IF /i "%1"=="onefile" goto onefile
IF /i "%1"=="multifile" goto multifile
echo Usage^: compile.bat onefile^|multifile filename.gsc^|filename.zip
goto error

:onefile
set FileName=%2
for /D %%I in ("%SEARCHPATH%\*") do (
    echo Error^: You cannot have folders in src^\gsc.
    goto error
)
:: Generate raw GSC by combining all the .gsc files into one file.
for /F %%x in ('dir /B/D %SEARCHPATH%') do (
  type %SEARCHPATH%\%%x >> "uncompiled.gsc"
)
:: Compile the raw GSC into a single .gsc file.
gsc-tool.exe comp t6 uncompiled.gsc
:: Delete the raw GSC
del /f uncompiled.gsc
:: Copy compiled GSC to root
type %COMPILEDDIR%\uncompiled.gsc >> uncompiled.gsc
:: Delete compiler-generated "compiled" directory after use
rd compiled /s /q
:: Rename GSC to specified filename
ren uncompiled.gsc "%FileName%"

echo - Compiled GSC.
EXIT /B 0

:multifile
set FileName=%2
:: Generate raw GSC for root folder only.
for /F %%x in ('dir /B/D/A:-D %SEARCHPATH%') do (
  type %SEARCHPATH%\%%x >> %%x
)
:: Compile the raw GSC.
for %%I in (%crt_dir%/*.gsc) DO (
    echo %%~nxI
    gsc-tool.exe comp t6 %%~nxI
    del /F %%~nxI
)

:: Recur copy directories from scr\gsc to current dir.
for /F %%x in ('dir /B/D/A:D %SEARCHPATH%') do (
  mkdir %%x > nul 2>&1
  xcopy /E /Y %SEARCHPATH%\%%x %%x > nul 2>&1
)

:: For any subfolders inside %crt_dir%, run compiler
for /f "tokens=*" %%G in ('dir /b /s /a:d "%crt_dir%*"') do (
    for %%I in (%%G\*.gsc) DO (
    start /wait /D %%G %crt_dir%\gsc-tool.exe comp t6 %%I
  )
)

echo - Compiled GSC.

:: Copy GSC to root to ZIP
for /F %%x in ('dir /B/D/A:-D %COMPILEDDIR%') do (
  type %COMPILEDDIR%\%%x >> %%x
)

:: Delete compiler-generated "compiled" directory after use
rd compiled /s /q

:: ZIP all the gsc together
start /wait 7za a %FileName% *.gsc -r
echo - ZIPd GSC.
EXIT /B 0

goto cleanexit

:error
EXIT /B 1

:cleanexit
EXIT /B 0
