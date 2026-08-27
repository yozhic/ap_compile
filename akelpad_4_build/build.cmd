@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: Автоматизация компиляции AkelPad из исходников         ::
@rem :: Location.....: .\                                                     ::
@rem :: Encoding.....: 866 OEM Russian                                        ::
@rem :: Version......: 5.3.0                                                  ::
@rem :: Compatible...: >= r4447                                               ::
@rem :: C.Date/M.Date: 17.08.2022 / 27.08.2026                                ::
@rem :: Requirements.: cecho.exe   2.0 by Thomas Polaert  on codeproject.com  ::
@rem ::                jrepl.bat   8.6 by Dave Benham     on github.com       ::
@rem ::                cmdmax.exe  2.0 by Antoni Sawicki  on github.com       ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
>nul chcp 866
setlocal enabledelayedexpansion

set root=%~dp0
set src=%root%src\
set extras=%root%extras\
set save=1

call reqcheck.cmd %~1

if not exist "%extras%." set extras=0

for %%x in (cmdmax.exe) do (
  set FOUND=%%~$PATH:x
  if exist "!FOUND!" cmdmax 0 0 160 80 160 80
)

if not exist arguments.cfg (
  >arguments.cfg echo./rv:r4544 /dt:%DATE% /cm:1 /tx:0 /bs:0 /db:0 /hs:1
)

set /p args=<arguments.cfg
for %%a in (%args%) do call :args %%a

for %%a in (%*) do call :args %%a

title BUILD AKELPAD: INFO REQUEST
cls

call :head

if "%extras%"=="0" (
  cecho {0E}  {\u26a0}  ОТСУТСТВУЕТ ПАПКА СТОРОННИХ ПЛАГИНОВ{\n}
  cecho {0E}     {07}Чтобы прервать сценарий, вводим {E0}1{07} и жмём Enter,{\n}
  cecho {0E}     {07}чтобы продолжить без них,  просто  жмём  {E0}Enter{#}:
  cecho {E0}
  set /p break=
  cecho {07}
  if "!break!"=="1" goto :EOF
)

cecho {08}  1. Номер редакции:{\t\t       07}%rev%{\n}
cecho {08}  2. Дата редакции:{\t\t        07}%data%{\n}
cecho {08}  3. Сведения о сборке:{\t\t    07}&call :replace %cont%
cecho {08}  4. Дополнительная Toolbar:{\t 07}&call :replace %toolbarx%
cecho {08}  5. Другие дополнения:{\t\t    07}&call :replace %buns%
cecho {08}  6. Режим отладки:{\t\t        07}&call :replace %debugcmd%
cecho {07}
if %hints%==1 echo.
if %hints%==1 cecho {0E}  Редактирование настроек{\n}
if %hints%==1 cecho {08}     оставить как есть: {0E}Enter {08}или любая клавиша{\n}
if %hints%==1 cecho {08}     редактировать всё: {0E}+{\n}
if %hints%==1 cecho {08}             выборочно: {0E}1 2 4{08}, например{\n}
if %hints%==1 cecho {08}                      : {0A}
if %hints%==0 cecho {\t\t\t 08}        {0A}

set /p edit=
cecho {07}

>nul call jrepl "-" "" /s edit
if %errorlevel%==0 (
  set save=0
  set edit=!edit: -=!
  set edit=!edit:-=!
)

if "%edit%"==""  goto :go
if "%edit%"=="+" (
  if %hints%==0 cls & call :head
  call :rev
  call :data
  call :cont
  call :toolbarx
  call :buns
  call :debugcmd
  goto :go
)
for %%a in (%edit%) do call :edit %%a

:go
if %save%==1 (
  >arguments.cfg echo./rv:%rev% /dt:%data% /cm:%cont% /tx:%toolbarx% /bs:%buns% /db:%debugcmd% /hs:%hints%
)

set target=%root%build\%rev%\
set debug=0
set debugstr1=
set debugstr2=
set param=

echo.
cecho {02}
echo.  ─════════════════════════════════════════════════─
cecho {07}

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE DIRECTORIES TREE
echo.&echo.
cecho {08}  Создаём папки...{#}
start /min /wait make_dirs.cmd
cecho {0A}{\t\t\t}Готово.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: REFRESH BACKUPS
cecho {08}  Подготавливаем ресурсы...{#}
start /wait make_res_bkp.cmd
cecho {0A}{\t\t}Готово.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE RESOURCES
cecho {08}  Редактируем ресурсы...{#}
start /wait make_res.cmd
cecho {0A}{\t\t}Готово.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE x86-x64 EXE
cecho {08}  Создаём программы...{#}
start /wait make_exe.cmd
cecho {0A}{\t\t\t}Готово.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: COLLECT DOCS ^& INT-EXTRAS
cecho {08}  Собираем вспомогательные файлы...{#}
start /wait make_docs.cmd
cecho {0A}{\t}Готово.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE x86 DLLS
cecho {08}  Создаём 32-битные библиотеки...{#}
start /wait make_dlls32.cmd
cecho {0A}{\t}Готово.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE x64 DLLS
cecho {08}  Создаём 64-битные библиотеки...{#}
start /wait make_dlls64.cmd
cecho {0A}{\t}Готово.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

if not "%extras%"=="0" (
  title BUILD AKELPAD: COLLECT EXTRAS
  cecho {08}  Собираем сторонние файлы...{#}
  start /wait make_extras.cmd
  cecho {0A}{\t\t}Готово.{#}{\n}
  >nul timeout /t 1
)

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: CREATE README.TXT
cecho {08}  Создаём ReadMe.txt...{#}
start /min /wait make_readme.cmd
cecho {0A}{\t\t\t}Готово.{#}{\n}

for %%x in (tar.exe) do (set FOUNDTAR=%%~$PATH:x)
if defined FOUNDTAR (
  cd build
  if exist %rev%.zip del /q %rev%.zip
  cecho {08}  Создаём zip...{#}
  tar caf %rev%.zip %rev%
  cecho {0A}{\t\t\t}Готово.{#}{\n}
)

endlocal

cecho {0A}{\n}  СБОРКА ЗАВЕРШЕНА{#}{\n}
echo.
cecho {02}
echo. ┌────────────────────────────────────────────────────────────────────────────────────────┐
echo. ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
>nul timeout /t 30
exit

:head
cecho {02}
echo.
echo.  ▄▄▄▄▄▄▄▄▄   ▄▄▄▄   ▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄         ▄▄▄▄▄▄▄▄▄▄    ▄▄▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄  
echo. ███▓┌─ ███▓┐ ███▓│  ███▓│ ███▓┌─ ███▓│ ███▓│░░░░░░░ ███▓┌─ ███▓┐ ███▓┌─ ███▓┐ ███▓┌─ ███▓┐
echo. ███▓│▄▄████│ ████▄▄▄██▀┌┘ ████▄▄  ───┘ ███▓│▒▒▒▒▒▒▒ ████▄▄▄██▀┌┘ ███▓│▄▄████│ ███▓│  ████│
echo. ███▓├─ ████│ ███▓┌─ ███▄┐ ███▓┌─┘▄▄▄▄  ███▓│▓ ▄▄▄▄  ███▓┌────┘ ▒ ███▓├─ ████│ ███▓│  ███▓│
echo. ▓██▓│  ▓██▓│ ▓██▓│  ▓██▓│ ▀███▄▄▄███▓│ ▀███▄▄▄███▓│ ▓███│▀▀▀▀▀▀▀ ▓██▓│  ▓██▓│ ▓███▄▄▄█▓┌─┘
echo.  ───┘   ───┘  ───┘   ───┘    ────────┘    ────────┘  ───┘         ───┘   ───┘  ────────┘  
echo. ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo. └────────────────────────────────────────────────────────────────────────────────────────┘
echo.
cecho {07}
exit /b

:rev
if %hints%==1 cecho {0E}  1. ВВОДИМ НОМЕР РЕДАКЦИИ{\n}
if %hints%==1 cecho {08}     формат r4416: {0A}
if %hints%==0 cecho {0E}  1. Номер редакции:{\t\t 0A}
set rev=
set /p rev=
if %hints%==1 echo.
exit /b

:data
if %hints%==1 cecho {0E}  2. ВВОДИМ ДАТУ РЕДАКЦИИ{\n}
if %hints%==1 cecho {08}     формат %DATE%: {0A}
if %hints%==0 cecho {0E}  2. Дата редакции:{\t\t 0A}
set data=
set /p data=
if %hints%==1 echo.
exit /b

:cont
if %hints%==1 cecho {0E}  3. ДОБАВЛЕНИЕ СВЕДЕНИЙ О СБОРКЕ{\n}
if %hints%==1 cecho {07}     В окно About запись о номере и дате CodeSVN revision{\n}
if %hints%==1 cecho {07}     В свойства .dll записи о номере и дате CodeSVN revision{\n}
if %hints%==1 cecho {08}          не добавлять: {0E}0{\n}
if %hints%==1 cecho {08}              добавить: {0E}1 {08}или {0E}Enter{\n}
if %hints%==1 cecho {08}                      : {0A}
if %hints%==0 cecho {0E}  3. Сведения о сборке:{\t\t 0A}
set cont=
set /p cont=
cecho {07}

if not "!cont!"=="0" set cont=1
exit /b

:toolbarx
if %hints%==1 cecho {0E}  4. СБОРКА ДОПОЛНИТЕЛЬНОЙ TOOLBAR{\n}
if %hints%==1 cecho {08}           не собирать: {0E}0{\n}
if %hints%==1 cecho {08}               собрать: {0E}1 {08}или {0E}Enter{\n}
if %hints%==1 cecho {08}                      : {0A}
if %hints%==0 cecho {0E}  4. Дополнительная Toolbar:{\t 0A}
set toolbarx=
set /p toolbarx=
cecho {07}

if not "!toolbarx!"=="0" set toolbarx=1
exit /b

:buns
if %hints%==1 cecho {0E}  5. ДРУГИЕ ДОПОЛНЕНИЯ{\n}
if %hints%==1 cecho {07}     Цветовая тема One Dark Pro {08}(предложена Rinat'ом){\n}
if %hints%==1 cecho {08}        без дополнений: {0E}0{\n}
if %hints%==1 cecho {08}        с дополнениями: {0E}1 {08}или {0E}Enter{\n}
if %hints%==1 cecho {08}                      : {0A}
if %hints%==0 cecho {0E}  5. Другие дополнения:{\t\t 0A}
set buns=
set /p buns=
cecho {07}

if not "!buns!"=="0" set buns=1
exit /b

:debugcmd
if %hints%==1 cecho {0E}  6. ОТЛАДКА СБОРОЧНОГО СКРИПТА{\n}
if %hints%==1 cecho {07}     В режиме отладки выполнение сценария будет{\n}
if %hints%==1 cecho {07}     периодически останавливаться на паузу{\n}
if %hints%==1 cecho {08}              включить: {0E}1{\n}
if %hints%==1 cecho {08}           не включать: {0E}0 {08}или {0E}Enter{\n}
if %hints%==1 cecho {08}                      : {0A}
if %hints%==0 cecho {0E}  6. Режим отладки скрипта:{\t 0A}
set debugcmd=
set /p debugcmd=
cecho {07}

if not "!debugcmd!"=="1" set debugcmd=0
exit /b

:replace
set return=%1
set return=%return:1=Да%
set return=%return:0=Нет%
echo.%return%
exit /b

:args
set b=%1
if "!b:~1,2!"=="rv" set      rev=!b:/rv:=!
if "!b:~1,2!"=="dt" set     data=!b:/dt:=!
if "!b:~1,2!"=="cm" set     cont=!b:/cm:=!
if "!b:~1,2!"=="tx" set toolbarx=!b:/tx:=!
if "!b:~1,2!"=="bs" set     buns=!b:/bs:=!
if "!b:~1,2!"=="db" set debugcmd=!b:/db:=!
if "!b:~1,2!"=="hs" set    hints=!b:/hs:=!

:edit
set b=%1
if "!b!"=="1" call :rev
if "!b!"=="2" call :data
if "!b!"=="3" call :cont
if "!b!"=="4" call :toolbarx
if "!b!"=="5" call :buns
if "!b!"=="6" call :debugcmd
