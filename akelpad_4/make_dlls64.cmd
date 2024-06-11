@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_dlls64.cmd                                        ::
@rem :: Location.....: .\                                                     ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
title BUILD AKELPAD%debugstr1%: ALL DLL x64
cd %src%

if "%debug%"=="0" (
  pushd AkelFiles\Langs\
  if %debugcmd%==0 (call _Build-x64_.cmd /S) else (call _Build-x64_.cmd)
  popd
)

cls
pushd AkelFiles\Plugs\Clipboard\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\Coder\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\ContextMenu\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\Exit\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\Explorer\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\Fonts\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\Format\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\FullScreen\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\HexSel\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\Hotkeys\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\LineBoard\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\Log\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\Macros\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\MinimizeToTray\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\RecentFiles\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\SaveFile\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\Scripts\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\Scroll\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\Sessions\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\Sounds\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\SpecialChar\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\Stats\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
popd

cls
pushd AkelFiles\Plugs\ToolBar\Source\
if %debugcmd%==0 (call Build-x64.cmd /S /X64 %param%) else (call Build-x64.cmd /N /X64 %param%)
cls
if %toolbarx%==1 (
  if %debugcmd%==0 (call _BuildTBX-64_.cmd /S /X64) else (call _BuildTBX-64_.cmd /N /X64)
)

cls
cd %root%

for /r %src% %%f in (*.dll) do move /y "%%f" %root%
echo.
if "%debug%"=="0" (
  copy /y /v  Belorussian.dll            "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Brazilian.dll              "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Catalan.dll                "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v "Chinese (Simplified).dll"  "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v "Chinese (Traditional).dll" "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Czech.dll                  "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Dutch.dll                  "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  English.dll                "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Finnish.dll                "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  French.dll                 "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  German.dll                 "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Greek.dll                  "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Hungarian.dll              "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Italian.dll                "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Japanese.dll               "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Korean.dll                 "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Polish.dll                 "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Romanian.dll               "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Russian.dll                "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Slovak.dll                 "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Spanish.dll                "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Ukrainian.dll              "%target%x64\AkelPad\AkelFiles\Langs\"
  copy /y /v  Uzbek.dll                  "%target%x64\AkelPad\AkelFiles\Langs\"
  echo.
  move /y     Belorussian.dll            "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     Brazilian.dll              "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     Catalan.dll                "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y    "Chinese (Simplified).dll"  "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y    "Chinese (Traditional).dll" "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     Czech.dll                  "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     Dutch.dll                  "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     English.dll                "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     Finnish.dll                "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     French.dll                 "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     German.dll                 "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     Greek.dll                  "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     Hungarian.dll              "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     Italian.dll                "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     Japanese.dll               "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     Korean.dll                 "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     Polish.dll                 "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     Romanian.dll               "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     Russian.dll                "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     Slovak.dll                 "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     Spanish.dll                "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     Ukrainian.dll              "%target%x86_64\AkelPad\AkelFiles\Langs64\"
  move /y     Uzbek.dll                  "%target%x86_64\AkelPad\AkelFiles\Langs64\"
)
echo.
copy /y /v *.dll "%target%x64\AkelPad\AkelFiles\Plugs\"
if "%debug%"=="0" (
  move /y *.dll "%target%x86_64\AkelPad\AkelFiles\Plugs64\"
) else (
  del *.dll
)

echo.
cd %src%
if "%debug%"=="1" (
  move /y AkelFiles\Plugs\Clipboard\Source\Clipboard.pdb           "%pdb%\x64\AkelPad\AkelFiles\Plugs\Clipboard\"
  move /y AkelFiles\Plugs\Coder\Source\Coder.pdb                   "%pdb%\x64\AkelPad\AkelFiles\Plugs\Coder\"
  move /y AkelFiles\Plugs\ContextMenu\Source\ContextMenu.pdb       "%pdb%\x64\AkelPad\AkelFiles\Plugs\ContextMenu\"
  move /y AkelFiles\Plugs\Exit\Source\Exit.pdb                     "%pdb%\x64\AkelPad\AkelFiles\Plugs\Exit\"
  move /y AkelFiles\Plugs\Explorer\Source\Explorer.pdb             "%pdb%\x64\AkelPad\AkelFiles\Plugs\Explorer\"
  move /y AkelFiles\Plugs\Fonts\Source\Fonts.pdb                   "%pdb%\x64\AkelPad\AkelFiles\Plugs\Fonts\"
  move /y AkelFiles\Plugs\Format\Source\Format.pdb                 "%pdb%\x64\AkelPad\AkelFiles\Plugs\Format\"
  move /y AkelFiles\Plugs\FullScreen\Source\FullScreen.pdb         "%pdb%\x64\AkelPad\AkelFiles\Plugs\FullScreen\"
  move /y AkelFiles\Plugs\HexSel\Source\HexSel.pdb                 "%pdb%\x64\AkelPad\AkelFiles\Plugs\HexSel\"
  move /y AkelFiles\Plugs\Hotkeys\Source\Hotkeys.pdb               "%pdb%\x64\AkelPad\AkelFiles\Plugs\Hotkeys\"
  move /y AkelFiles\Plugs\LineBoard\Source\LineBoard.pdb           "%pdb%\x64\AkelPad\AkelFiles\Plugs\LineBoard\"
  move /y AkelFiles\Plugs\Log\Source\Log.pdb                       "%pdb%\x64\AkelPad\AkelFiles\Plugs\Log\"
  move /y AkelFiles\Plugs\Macros\Source\Macros.pdb                 "%pdb%\x64\AkelPad\AkelFiles\Plugs\Macros\"
  move /y AkelFiles\Plugs\MinimizeToTray\Source\MinimizeToTray.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\MinimizeToTray\"
  move /y AkelFiles\Plugs\RecentFiles\Source\RecentFiles.pdb       "%pdb%\x64\AkelPad\AkelFiles\Plugs\RecentFiles\"
  move /y AkelFiles\Plugs\SaveFile\Source\SaveFile.pdb             "%pdb%\x64\AkelPad\AkelFiles\Plugs\SaveFile\"
  move /y AkelFiles\Plugs\Scripts\Source\Scripts.pdb               "%pdb%\x64\AkelPad\AkelFiles\Plugs\Scripts\"
  move /y AkelFiles\Plugs\Scroll\Source\Scroll.pdb                 "%pdb%\x64\AkelPad\AkelFiles\Plugs\Scroll\"
  move /y AkelFiles\Plugs\Sessions\Source\Sessions.pdb             "%pdb%\x64\AkelPad\AkelFiles\Plugs\Sessions\"
  move /y AkelFiles\Plugs\Sounds\Source\Sounds.pdb                 "%pdb%\x64\AkelPad\AkelFiles\Plugs\Sounds\"
  move /y AkelFiles\Plugs\SpecialChar\Source\SpecialChar.pdb       "%pdb%\x64\AkelPad\AkelFiles\Plugs\SpecialChar\"
  move /y AkelFiles\Plugs\Stats\Source\Stats.pdb                   "%pdb%\x64\AkelPad\AkelFiles\Plugs\Stats\"
  move /y AkelFiles\Plugs\ToolBar\Source\ToolBar.pdb               "%pdb%\x64\AkelPad\AkelFiles\Plugs\ToolBar\"
  echo.
  move /y      AkelFiles\Plugs\Clipboard\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\Clipboard\"
  move /y          AkelFiles\Plugs\Coder\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\Coder\"
  move /y    AkelFiles\Plugs\ContextMenu\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\ContextMenu\"
  move /y           AkelFiles\Plugs\Exit\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\Exit\"
  move /y       AkelFiles\Plugs\Explorer\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\Explorer\"
  move /y          AkelFiles\Plugs\Fonts\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\Fonts\"
  move /y         AkelFiles\Plugs\Format\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\Format\"
  move /y     AkelFiles\Plugs\FullScreen\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\FullScreen\"
  move /y         AkelFiles\Plugs\HexSel\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\HexSel\"
  move /y        AkelFiles\Plugs\Hotkeys\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\Hotkeys\"
  move /y      AkelFiles\Plugs\LineBoard\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\LineBoard\"
  move /y            AkelFiles\Plugs\Log\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\Log\"
  move /y         AkelFiles\Plugs\Macros\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\Macros\"
  move /y AkelFiles\Plugs\MinimizeToTray\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\MinimizeToTray\"
  move /y    AkelFiles\Plugs\RecentFiles\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\RecentFiles\"
  move /y       AkelFiles\Plugs\SaveFile\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\SaveFile\"
  move /y        AkelFiles\Plugs\Scripts\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\Scripts\"
  move /y         AkelFiles\Plugs\Scroll\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\Scroll\"
  move /y       AkelFiles\Plugs\Sessions\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\Sessions\"
  move /y         AkelFiles\Plugs\Sounds\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\Sounds\"
  move /y    AkelFiles\Plugs\SpecialChar\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\SpecialChar\"
  move /y          AkelFiles\Plugs\Stats\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\Stats\"
  move /y        AkelFiles\Plugs\ToolBar\Source\vc80.pdb "%pdb%\x64\AkelPad\AkelFiles\Plugs\ToolBar\"
)

echo.& echo.
if "%debug%"=="0" (
  %cechox% {0A}X64 DLLS COMPILED{#}{\n}
) else (
  %cechox% {0B}X64 DLLS COMPILED{#}{\n}
)
>nul timeout /t 2
exit