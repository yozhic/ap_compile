@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_dlls32.cmd                                        ::
@rem :: Location.....: .\                                                     ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
title BUILD AKELPAD%debugstr1%: ALL DLL x86
cd %src%

pushd AkelFiles\Langs\
if %debugcmd%==0 (call Build-All.cmd /S /X32 %param%) else (call Build-All.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\Clipboard\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\Coder\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\ContextMenu\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\Exit\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\Explorer\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\Fonts\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\Format\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\FullScreen\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\HexSel\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\Hotkeys\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\LineBoard\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\Log\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\Macros\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\MinimizeToTray\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\RecentFiles\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\SaveFile\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\Scripts\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\Scroll\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\Sessions\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\Sounds\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\SpecialChar\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\Stats\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)
popd

cls
pushd AkelFiles\Plugs\ToolBar\Source\
if %debugcmd%==0 (call Build.cmd /S /X32 %param%) else (call Build.cmd /N /X32 %param%)

cls
cd "%root%"
if %toolbarx%==1 (
  if %debugcmd%==0 (call make_toolbarx.cmd /S /X32) else (call make_toolbarx.cmd /N /X32)
  cd "%root%"
)

cls
for /r %src% %%f in (*.dll) do move /y "%%f" %root%
if "%debug%"=="1" for /r %src% %%f in (*.pdb) do move /y "%%f" %root%

if "%debug%"=="0" (
  copy /y /v  Belorussian.dll             "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Brazilian.dll               "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Catalan.dll                 "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  "Chinese (Simplified).dll"  "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  "Chinese (Traditional).dll" "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Czech.dll                   "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Dutch.dll                   "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  English.dll                 "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Finnish.dll                 "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  French.dll                  "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  German.dll                  "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Greek.dll                   "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Hungarian.dll               "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Italian.dll                 "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Japanese.dll                "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Korean.dll                  "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Polish.dll                  "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Romanian.dll                "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Russian.dll                 "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Slovak.dll                  "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Spanish.dll                 "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Ukrainian.dll               "%target%x86_64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Uzbek.dll                   "%target%x86_64\AkelPad\AkelFiles\Langs\"
)

echo.
move /y Belorussian.dll             "%target%x86\AkelPad\AkelFiles\Langs\"
move /y Brazilian.dll               "%target%x86\AkelPad\AkelFiles\Langs\"
move /y Catalan.dll                 "%target%x86\AkelPad\AkelFiles\Langs\"
move /y "Chinese (Simplified).dll"  "%target%x86\AkelPad\AkelFiles\Langs\"
move /y "Chinese (Traditional).dll" "%target%x86\AkelPad\AkelFiles\Langs\"
move /y Czech.dll                   "%target%x86\AkelPad\AkelFiles\Langs\"
move /y Dutch.dll                   "%target%x86\AkelPad\AkelFiles\Langs\"
move /y English.dll                 "%target%x86\AkelPad\AkelFiles\Langs\"
move /y Finnish.dll                 "%target%x86\AkelPad\AkelFiles\Langs\"
move /y French.dll                  "%target%x86\AkelPad\AkelFiles\Langs\"
move /y German.dll                  "%target%x86\AkelPad\AkelFiles\Langs\"
move /y Greek.dll                   "%target%x86\AkelPad\AkelFiles\Langs\"
move /y Hungarian.dll               "%target%x86\AkelPad\AkelFiles\Langs\"
move /y Italian.dll                 "%target%x86\AkelPad\AkelFiles\Langs\"
move /y Japanese.dll                "%target%x86\AkelPad\AkelFiles\Langs\"
move /y Korean.dll                  "%target%x86\AkelPad\AkelFiles\Langs\"
move /y Polish.dll                  "%target%x86\AkelPad\AkelFiles\Langs\"
move /y Romanian.dll                "%target%x86\AkelPad\AkelFiles\Langs\"
move /y Russian.dll                 "%target%x86\AkelPad\AkelFiles\Langs\"
move /y Slovak.dll                  "%target%x86\AkelPad\AkelFiles\Langs\"
move /y Spanish.dll                 "%target%x86\AkelPad\AkelFiles\Langs\"
move /y Ukrainian.dll               "%target%x86\AkelPad\AkelFiles\Langs\"
move /y Uzbek.dll                   "%target%x86\AkelPad\AkelFiles\Langs\"

echo.
copy /y /v *.dll "%target%x86\AkelPad\AkelFiles\Plugs\"
if "%debug%"=="0" (
  move /y *.dll "%target%x86_64\AkelPad\AkelFiles\Plugs\"
) else (
  del *.dll
)

if "%debug%"=="1" (
  echo.
  move /y *.pdb "%pdb%\x86\"
)

echo.& echo.
if "%debug%"=="0" (
  %cechox% {0A}X86 DLLS COMPILED{#}{\n}
) else (
  %cechox% {0B}X86 DLLS COMPILED{#}{\n}
)
>nul timeout /t 2
exit