@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_extras.cmd                                        ::
@rem :: Location.....: .\                                                     ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
title BUILD AKELPAD: COLLECT EXTRAS
cd %extras%

copy /y /v AkelUpdater.exe "%target%x86\AkelPad\AkelFiles\"
copy /y /v AkelUpdater.exe "%target%x64\AkelPad\AkelFiles\"
copy /y /v AkelUpdater.exe "%target%x86_64\AkelPad\AkelFiles\"
echo.
copy /y /v Docs\*.* "%target%x86\AkelPad\AkelFiles\Docs\"
copy /y /v Docs\*.* "%target%x64\AkelPad\AkelFiles\Docs\"
copy /y /v Docs\*.* "%target%x86_64\AkelPad\AkelFiles\Docs\"
echo.
copy /y /v Plugs\Coder\*.coder "%target%x86\AkelPad\AkelFiles\Plugs\Coder\"
copy /y /v Plugs\Coder\*.coder "%target%x64\AkelPad\AkelFiles\Plugs\Coder\"
copy /y /v Plugs\Coder\*.coder "%target%x86_64\AkelPad\AkelFiles\Plugs\Coder\"
echo.
xcopy /y /v /s Plugs\SpellCheck "%target%x86\AkelPad\AkelFiles\Plugs\SpellCheck\"
xcopy /y /v /s Plugs\SpellCheck "%target%x86_64\AkelPad\AkelFiles\Plugs\SpellCheck\"
echo.
xcopy /y /v /s Plugs\Templates "%target%x86\AkelPad\AkelFiles\Plugs\Templates\"
xcopy /y /v /s Plugs\Templates "%target%x64\AkelPad\AkelFiles\Plugs\Templates\"
xcopy /y /v /s Plugs\Templates "%target%x86_64\AkelPad\AkelFiles\Plugs\Templates\"
echo.
copy /y /v Plugs\*.* "%target%x86\AkelPad\AkelFiles\Plugs\"
copy /y /v Plugs\*.* "%target%x86_64\AkelPad\AkelFiles\Plugs\"
echo.
copy /y /v Plugs64\*.dll "%target%x64\AkelPad\AkelFiles\Plugs\"
copy /y /v Plugs64\*.dll "%target%x86_64\AkelPad\AkelFiles\Plugs64\"

echo.& echo.
%cechox% {0A}EXTRAS COLLECTED{#}{\n}
>nul timeout /t 2
exit