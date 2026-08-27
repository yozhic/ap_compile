@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: reqcheck.cmd                                           ::
@rem :: Location.....: .\                                                     ::
@rem :: Encoding.....: 866 OEM Russian                                        ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
title BUILD AKELPAD: REQUIREMENTS CHECKING

if exist .\tools\nul PATH %~dp0tools;%PATH%

for %%x in (cecho.exe) do (
  set FOUND=%%~$PATH:x
  if not exist "!FOUND!" call :requirements %%x
)

for %%x in (jrepl.bat) do (
  set FOUND=%%~$PATH:x
  if not exist "!FOUND!" call :requirements %%x
)

if not exist "c:\Program Files\Microsoft Platform SDK\Bin\win64\cl.exe" call :requirements Microsoft Platform SDK
if not exist "c:\Program Files\Microsoft Visual C++ Toolkit 2003\bin\cl.exe" call :requirements Microsoft Visual C++ Toolkit 2003

if not exist "%src%." call :src "Сейчас этой папки нет или скрипт её не видит"

for /f "delims=" %%f in ('dir src /b') do set isempty=%%f
if "%isempty%"=="" call :src "Сейчас эта папка пуста, исходников не видно"

goto :EOF

:requirements
echo.  \__/ 
echo.  (oo)   Не найдены необходимые утилиты: %*
echo. //^|^|\\  Отменяем запуск сценария
>nul timeout /t 20
exit

:src
echo.
cecho {0C}   \__/    {#}Должна быть папка {C0}src{#} и в ней файлы исходников{\n}
cecho {0C}   ^(oo^)    {#}%~1{\n}
cecho {0C}  //^|^|\\   {#}Отменяем запуск сценария{\n}
>nul timeout /t 20
exit
