@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_exe.cmd                                           ::
@rem :: Location.....: .\                                                     ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
title BUILD AKELPAD%debugstr1%: ALL EXE x86-x64
cd %root%
pushd src\

if %debugcmd%==0 (call Build-Eng.cmd /S /X64 %param%) else (call Build-Eng.cmd /N /X64 %param%)
if exist AkelPad.exe move /y AkelPad.exe AkelPad64.exe
if "%debug%"=="1" (
  copy /v /y AkelPad.pdb "%pdb%\x64\AkelPad64.pdb"
  move    /y AkelPad.pdb "%pdb%\x64\"
)

cls
if %debugcmd%==0 (call Build-Eng.cmd /S /X32 %param%) else (call Build-Eng.cmd /N /X32 %param%)
if "%debug%"=="1" move /y AkelPad.pdb "%pdb%\x86\"

cls
popd

if "%debug%"=="0" (
  pushd src\AkelAdmin\
  if %debugcmd%==0 (call Build-x64.cmd /S) else (call Build-x64.cmd)
  if exist AkelAdmin.exe move /y AkelAdmin.exe AkelAdmin64.exe
  cls
  if %debugcmd%==0 (call Build.cmd /S) else (call Build.cmd)
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

echo.& echo.
if "%debug%"=="0" (
  %cechox% {0A}EXECUTABLES COMPILED{#}{\n}
) else (
  %cechox% {0B}EXECUTABLES COMPILED{#}{\n}
)

if %debugcmd%==0 (>nul timeout /t 2) else ("%cechox%" {08} & pause & "%cechox%" {#})

exit