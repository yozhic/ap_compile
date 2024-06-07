@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_exe.cmd                                           ::
@rem :: Location.....: .\                                                     ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@rem Location: .\

@echo off
title BUILD AKELPAD: ALL EXE x86-x64
cd %root%

pushd src\
if %debug%==0 (call Build-Eng.cmd /S) else (call Build-Eng.cmd)
cls
if %debug%==0 (call _Build-Eng-x64_.cmd /S) else (call _Build-Eng-x64_.cmd)
cls
popd

pushd src\AkelAdmin\
if %debug%==0 (call Build.cmd /S) else (call Build.cmd)
cls
if %debug%==0 (call _Build-x64_.cmd /S) else (call _Build-x64_.cmd)
cls
popd

for /r %src% %%f in (*.exe) do move /y %%f %root%

copy /v /y AkelPad64.exe   "%target%x64\AkelPad\AkelPad.exe"
copy /v /y AkelAdmin64.exe "%target%x64\AkelPad\AkelFiles\AkelAdmin.exe"
move    /y AkelPad64.exe   "%target%x86_64\AkelPad\"
move    /y AkelAdmin64.exe "%target%x86_64\AkelPad\AkelFiles\"
copy /v /y AkelPad.exe     "%target%x86\AkelPad\"
copy /v /y AkelAdmin.exe   "%target%x86\AkelPad\AkelFiles\"
move    /y AkelPad.exe     "%target%x86_64\AkelPad\"
move    /y AkelAdmin.exe   "%target%x86_64\AkelPad\AkelFiles\"

echo.& echo.
%cechox% {0A}EXECUTABLES COMPILED{#}{\n}
>nul timeout /t 2
exit