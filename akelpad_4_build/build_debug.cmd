@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: build_debug.cmd                                        ::
@rem :: Location.....: .\                                                     ::
@rem :: Encoding.....: 866 OEM Russian                                        ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
>nul chcp 866
setlocal enabledelayedexpansion

set root=%~dp0
set src=%root%src\
set save=1

call reqcheck.cmd %~1

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

title BUILD AKELPAD DEBUG: INFO REQUEST
cls

call :head

cecho {08}  1. Номер редакции:{\t 07}%rev%{\n}
cecho {08}  2. Дата редакции:{\t  07}%data%{\n}
cecho {07}
if %hints%==1 echo.
if %hints%==1 cecho {0E}  Редактирование настроек{\n}
if %hints%==1 cecho {08}     оставить как есть: {0E}Enter {08}или любая клавиша{\n}
if %hints%==1 cecho {08}     редактировать всё: {0E}+{\n}
if %hints%==1 cecho {08}             выборочно: {0E}2{08}, например{\n}
if %hints%==1 cecho {08}                      : {0B}
if %hints%==0 cecho {08}                        {0B}

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
  goto :go
)
for %%a in (%edit%) do call :edit %%a

:go
if %save%==1 (
  >arguments.cfg echo./rv:%rev% /dt:%data% /cm:%cont% /tx:%toolbarx% /bs:%buns% /db:%debugcmd% /hs:%hints%
)

set target=%root%build\%rev%d\
set pdb=%target%pdb
set debugcmd=0
set toolbarx=0
set cont=1
set buns=0
set debug=1
set debugstr1= DEBUG
set debugstr2=DEBUG version. 
set param=/D

echo.
cecho {0B}
echo.  ─════════════════════════════════════════════════─
cecho {07}

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: MAKE DIRECTORIES TREE
echo.&echo.
cecho {08}  Создаём папки...{#}
start /min /wait debug_make_dirs.cmd
cecho {\t\t\t 0B}Готово.{\n #}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: REFRESH BACKUPS
cecho {08}  Подготавливаем ресурсы...{#}
start /wait make_res_bkp.cmd
cecho {\t\t 0B}Готово.{\n #}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: MAKE RESOURCES
cecho {08}  Редактируем ресурсы...{#}
start /wait make_res.cmd
cecho {\t\t 0B}Готово.{\n #}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: MAKE x86-x64 EXE
cecho {08}  Создаём программы...{#}
start /wait make_exe.cmd
cecho {\t\t\t 0B}Готово.{\n #}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: MAKE x86 DLLS
cecho {08}  Создаём 32-битные библиотеки...{#}
start /wait make_dlls32.cmd
cecho {\t 0B}Готово.{\n #}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: MAKE x64 DLLS
cecho {08}  Создаём 64-битные библиотеки...{#}
start /wait make_dlls64.cmd
cecho {\t 0B}Готово.{\n #}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: CREATE README.TXT
cecho {08}  Создаём ReadMe.txt...{#}
start /min /wait debug_make_readme.cmd
cecho {\t\t\t 0B}Готово.{\n #}

for %%x in (rar.exe) do (set FOUNDRAR=%%~$PATH:x)
if defined FOUNDRAR (
  cecho {08}  Создаём rar...{#}
  cd build
  rar a -m5 -rr -inul %rev%d.rar %rev%d
  cecho {\t\t\t 0B}Готово.{\n #}
)

cecho {\n 0B}  СБОРКА ЗАВЕРШЕНА{\n #}
echo.
cecho {0B}
echo. ┌────────────────────────────────────────────────────────────────────────────────────────┐
echo. ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
endlocal
>nul timeout /t 15
exit

:head
cecho {0B}
echo.
echo.   ▀█▐▀███ ▀█▐ ███ ▀█▐▀███ ▀█▐▀    ▀█▐▀███ ▀█▐▀███ ▀█▐▀███        o       o                
echo.    █▐▄███  █▐▄██▀  █▐▄     █▐      █▐ ███  █▐▄███  █▐ ███         \_____/                 
echo.    █▐ ███  █▐ ███  █▐ ▄██  █▐ ███  █▐▀▀▀▀  █▐ ███  █▐ ███         /=O=O=\     _______     
echo.   ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀ ▀▀▀▀    ▀▀▀ ▀▀▀ ▀▀▀▀▀▀▀        /   ^^   \   /\\\\\\\\    
echo.   ▀█▐▀███ ▀█▐▀███ ▀█▐▀███ ▀█▐ ███ ▀█▐▀███                        \  ───  /  /\   ___  \   
echo.    █▐ ███  █▐▄     █▐▄██▀  █▐ ███  █▐                             \_ V _/  /\   /\\\\  \  
echo.    █▐ ███  █▐ ▄██  █▐ ███  █▐ ███  █▐ ▀██                           \  \__/\   /\ @_/  /  
echo.   ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀                            \____\____\______/   
echo. ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo. └────────────────────────────────────────────────────────────────────────────────────────┘
echo.
cecho {07}
exit /b

:rev
if %hints%==1 cecho {0E}  1. ВВОДИМ НОМЕР РЕДАКЦИИ{\n}
if %hints%==1 cecho {08}     формат r4416: {0B}
if %hints%==0 cecho {0E}  1. Номер редакции: {\t 0B}
set rev=
set /p rev=
if %hints%==1 echo.
exit /b

:data
if %hints%==1 cecho {0E}  2. ВВОДИМ ДАТУ РЕДАКЦИИ{\n}
if %hints%==1 cecho {08}     формат %DATE%: {0B}
if %hints%==0 cecho {0E}  2. Дата редакции: {\t 0B}
set data=
set /p data=
if %hints%==1 echo.
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
