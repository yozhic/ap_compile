@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: reqcheck.cmd                                           ::
@rem :: Location.....: .\                                                     ::
@rem :: Encoding.....: 866 OEM Russian                                        ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

if exist .\tools\nul PATH %~dp0tools;%PATH%

setlocal enabledelayedexpansion
for %%x in (cmdmax.exe,cmdmax.cmd) do (set FOUND=%%~$PATH:x & if exist "!FOUND!" goto :next1)
call :requirements cmdmax

:next1
if not defined cechox (
  set cechox=%~dp0tools\cecho.exe
  if not exist "%cechox%" call :requirements cecho
)
if not defined AKELPAD (
  if "%*"=="" (
    set AKELPAD=%~dp0tools\AkelPad.exe
  ) else (
    set AKELPAD=%*
  )
  if not exist "!AKELPAD!" call :requirements !AKELPAD!
)
if not exist "c:\Program Files\Microsoft Platform SDK\Bin\win64\cl.exe" call :requirements Microsoft Platform SDK
if not exist "c:\Program Files\Microsoft Visual C++ Toolkit 2003\bin\cl.exe" call :requirements Microsoft Visual C++ Toolkit 2003

endlocal
goto :EOF

:requirements
echo.
echo. Не найдены необходимые утилиты: %*
echo. Выполнение сценария прервано
pause>nul
exit
