@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: reqcheck.cmd                                           ::
@rem :: Location.....: .\                                                     ::
@rem :: Encoding.....: 866 OEM Russian                                        ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off

if exist .\tools\nul PATH %~dp0tools;%PATH%

setlocal enabledelayedexpansion
for %%x in (cmdmax.exe) do (
  set FOUND=%%~$PATH:x & if exist "!FOUND!" goto :step1
  call :requirements %%x
)

:step1
for %%x in (cecho.exe) do (
  set FOUND=%%~$PATH:x & if exist "!FOUND!" goto :step2
  call :requirements %%x
)

:step2
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
