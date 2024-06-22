@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: reqcheck.cmd                                           ::
@rem :: Location.....: .\                                                     ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

if exist .\tools\nul PATH %~dp0tools;%PATH%

setlocal enabledelayedexpansion
for %%x in (cmdmax.exe,cmdmax.cmd) do (set FOUND=%%~$PATH:x & if exist "!FOUND!" goto :next1)
endlocal
goto :requirements

:next1
endlocal
if not defined cocolor (
  set cocolor=%~dp0tools\cocolor.exe
  if not exist "%cocolor%" goto :requirements
)

:next2
if not defined cechox (
  set cechox=%~dp0tools\cecho.exe
  if not exist "%cechox%" goto :requirements
)
if not defined AKELPAD goto :requirements

goto :EOF

:requirements
echo.
echo. Необходимые утилиты не найдены
echo. Выполнение сценария прервано
pause>nul
exit
