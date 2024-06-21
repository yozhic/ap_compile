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

exit