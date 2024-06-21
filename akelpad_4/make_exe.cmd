@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_exe.cmd                                           ::
@rem :: Location.....: .\                                                     ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
title BUILD AKELPAD%debugstr1%: ALL EXE x86-x64
cd %root%

pushd src\
if %debugcmd%==0 (call Build-Eng.cmd /S /X32 %param%) else (call Build-Eng.cmd /N /X32 %param%)
if "%debug%"=="1" move /y AkelPad.pdb "%pdb%\x86\"

cls
if %debugcmd%==0 (call _Build-Eng-x64_.cmd /S /X64 %param%) else (call _Build-Eng-x64_.cmd /N /X64 %param%)
if "%debug%"=="1" (
  copy /v /y AkelPad64.pdb "%pdb%\x64\AkelPad.pdb"
  move    /y AkelPad64.pdb "%pdb%\"
)

cls
popd

if "%debug%"=="0" (
  pushd src\AkelAdmin\
  if %debugcmd%==0 (call Build.cmd /S) else (call Build.cmd)
  cls
  if %debugcmd%==0 (call _Build-x64_.cmd /S) else (call _Build-x64_.cmd)
  cls
  popd
)

for /r %src% %%f in (*.exe) do move /y %%f %root%

copy /v /y AkelPad64.exe   "%target%x64\AkelPad\AkelPad.exe"
copy /v /y AkelPad.exe     "%target%x86\AkelPad\"
if "%debug%"=="0" (
  copy /v /y AkelAdmin.exe   "%target%x86\AkelPad\AkelFiles\"
  copy /v /y AkelAdmin64.exe "%target%x64\AkelPad\AkelFiles\AkelAdmin.exe"
  move    /y AkelPad64.exe   "%target%x86_64\AkelPad\"
  move    /y AkelAdmin64.exe "%target%x86_64\AkelPad\AkelFiles\"
  move    /y AkelPad.exe     "%target%x86_64\AkelPad\"
  move    /y AkelAdmin.exe   "%target%x86_64\AkelPad\AkelFiles\"
) else (
  del AkelPad64.exe
  del AkelPad.exe
)
if exist AkelPad64.ilk del AkelPad64.ilk

echo.& echo.
if "%debug%"=="0" (
  %cechox% {0A}EXECUTABLES COMPILED{#}{\n}
) else (
  %cechox% {0B}EXECUTABLES COMPILED{#}{\n}
)
>nul timeout /t 2
exit