@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_docs.cmd                                          ::
@rem :: Location.....: .\                                                     ::
@rem :: Encoding.....: ANSI                                                   ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
title BUILD AKELPAD%debugstr1%: COLLECT DOCS ^& INT-EXTRAS
cd %root%

for /r %src% %%f in (*.txt) do copy /y /v %%f %root%
for /r %src% %%f in (*.htm) do copy /y /v %%f %root%

copy /y /v *.htm "%target%x86\AkelPad\AkelFiles\Docs\"
echo.
copy /y /v *.txt "%target%x86\AkelPad\AkelFiles\Docs\"
echo.
copy /y /v *.htm "%target%x64\AkelPad\AkelFiles\Docs\"
echo.
copy /y /v *.txt "%target%x64\AkelPad\AkelFiles\Docs\"
echo.
move /y    *.htm "%target%x86_64\AkelPad\AkelFiles\Docs\"
echo.
move /y    *.txt "%target%x86_64\AkelPad\AkelFiles\Docs\"
echo.

cd %src%
copy /y /v .\AkelFiles\Plugs\Coder\Plugs\Coder\*.coder "%target%x86\AkelPad\AkelFiles\Plugs\Coder\"
copy /y /v .\AkelFiles\Plugs\Coder\Plugs\Coder\*.coder "%target%x64\AkelPad\AkelFiles\Plugs\Coder\"
copy /y /v .\AkelFiles\Plugs\Coder\Plugs\Coder\*.coder "%target%x86_64\AkelPad\AkelFiles\Plugs\Coder\"
echo.
copy /y /v .\AkelFiles\Plugs\Scripts\Plugs\Scripts\*.* "%target%x86\AkelPad\AkelFiles\Plugs\Scripts\"
copy /y /v .\AkelFiles\Plugs\Scripts\Plugs\Scripts\*.* "%target%x64\AkelPad\AkelFiles\Plugs\Scripts\"
copy /y /v .\AkelFiles\Plugs\Scripts\Plugs\Scripts\*.* "%target%x86_64\AkelPad\AkelFiles\Plugs\Scripts\"
echo.
copy /y /v .\AkelFiles\Plugs\Scripts\Plugs\Scripts\Include\*.* "%target%x86\AkelPad\AkelFiles\Plugs\Scripts\Include\"
copy /y /v .\AkelFiles\Plugs\Scripts\Plugs\Scripts\Include\*.* "%target%x64\AkelPad\AkelFiles\Plugs\Scripts\Include\"
copy /y /v .\AkelFiles\Plugs\Scripts\Plugs\Scripts\Include\*.* "%target%x86_64\AkelPad\AkelFiles\Plugs\Scripts\Include\"

echo.& echo.
if "%debug%"=="0" (
  %cechox% {0A}DOCS {\u0026} INT-EXTRAS COLLECTED{#}{\n}
) else (
  %cechox% {0B}DOCS {\u0026} INT-EXTRAS COLLECTED{#}{\n}
)

if %debugcmd%==0 (>nul timeout /t 2) else ("%cechox%" {08} & pause & "%cechox%" {#})
exit