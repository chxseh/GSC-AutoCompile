@echo off

type "..\src\gsc\main.gsc" > "release.gsc"
:: If you are using multiple GSC files, simply uncomment the next type line and modify as you wish. You can have as many type's as you want.
:: If you want to add folders to this, you are on your own. It's not hard but at that point you'd might as well switch to PowerShell.
::type "..\src\gsc\second_gsc.gsc" >> "release.gsc"
echo - Generated raw GSC.

Compiler.exe release.gsc
del /f release.gsc
ren "release-compiled.gsc" "release.gsc"
echo - Compiled release file.