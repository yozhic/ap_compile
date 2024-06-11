@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: debug_make_dirs.cmd                                    ::
@rem :: Location.....: .\                                                     ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
if not exist .\build\nul md build
cd build & md %rev%d
cd %rev%d & md x86 & md x64 & md pdb

pushd x86 & md AkelPad
cd AkelPad & md AkelFiles
cd AkelFiles & md Plugs

popd

pushd x64 & md AkelPad
cd AkelPad & md AkelFiles
cd AkelFiles & md Plugs

popd

cd pdb & md x86 & md x64

pushd x86 & md AkelPad
cd AkelPad & md AkelFiles
cd AkelFiles & md Plugs
cd Plugs & call :plugs

popd

cd x64 & md AkelPad
cd AkelPad & md AkelFiles
cd AkelFiles & md Plugs
cd Plugs & call :plugs
exit

:plugs
md Clipboard
md Coder
md ContextMenu
md Exit
md Explorer
md Fonts
md Format
md FullScreen
md HexSel
md Hotkeys
md LineBoard
md Log
md Macros
md MinimizeToTray
md RecentFiles
md SaveFile
md Scripts
md Scroll
md Sessions
md Sounds
md SpecialChar
md Stats
md ToolBar
