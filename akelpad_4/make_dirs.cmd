@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_dirs.cmd                                          ::
@rem :: Location.....: .\                                                     ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
md build
cd build & md %rev%
cd %rev% & md x86_64 & md x86 & md x64

pushd x86_64 & md AkelPad
cd AkelPad & md AkelFiles
cd AkelFiles & md Docs & md Langs & md Langs64 & md Plugs & md Plugs64
cd Plugs & md Coder & md Scripts
cd Scripts & md Include
popd

pushd x86 & md AkelPad
cd AkelPad & md AkelFiles
cd AkelFiles & md Docs & md Langs & md Plugs
cd Plugs & md Coder & md Scripts
cd Scripts & md Include
popd

cd x64 & md AkelPad
cd AkelPad & md AkelFiles
cd AkelFiles & md Docs & md Langs & md Plugs
cd Plugs & md Coder & md Scripts
cd Scripts & md Include
exit