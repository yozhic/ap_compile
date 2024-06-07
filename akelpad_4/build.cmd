@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: Компиляция AkelPad из исходников                       ::
@rem :: Location.....: .\                                                     ::
@rem :: Version......: 4.1.0                                                  ::
@rem :: C.Date/M.Date: 17.08.2022 / 07.06.2024                                ::
@rem :: Requirements.: cecho.exe   2.0 by Thomas Polaert on codeproject.com   ::
@rem ::                cmdmax.exe  2.0 by Antoni Sawicki on github.com        ::
@rem ::                hscolor.exe 1.0 by Akatov Aleksej                      ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
>nul chcp 866
title BUILD AKELPAD: DECLARE VARIABLES
call cmdmax 0 0 160 80 160 80

cls
hscolor 2 0
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
hscolor 7 0

echo.
%cechox% {0E}  ОТЛАДОЧНЫЙ РЕЖИМ{#}{\n}
%cechox% {0E}  В этом режиме после компиляции каждого файла{#}{\n}
%cechox% {0E}  выполнение сценария будет останавливаться на паузу{#}{\n}{\n}
%cechox%   Чтобы включить,    вводим {E0}1{#} и жмём Enter,{\n}
%cechox%   чтобы не включать, вводим {E0}0{#} и жмём Enter{\n}
%cechox%                      или просто жмём {E0}Enter{#}:
hscolor 0 10
set /p debug=
hscolor 7 0

if not "%debug%"=="1" (
  if not "%debug%"=="0" (
    set debug=0
  )
)

echo.
%cechox% {0E}  ДОБАВЛЕНИЕ КОММЕНТАРИЕВ О КОМПИЛЯЦИИ{#}{\n}
%cechox% {0E}  1) В окно About запись о номере и дате Revision{#}{\n}
%cechox% {0E}  2) В свойства dll записи о номере и дате Revision{#}{\n}{\n}
%cechox%   Чтобы не добавлять, вводим {E0}0{#} и жмём Enter,{\n}
%cechox%   чтобы добавить,     вводим {E0}1{#} и жмём Enter{\n}
%cechox%                       или просто жмём {E0}Enter{#}:
hscolor 0 10
set /p cont=
hscolor 7 0

if not "%cont%"=="0" (
  if not "%cont%"=="1" (
    set cont=1
  )
)

if "%cont%"=="0" goto :tbx

echo.& %cechox% {0E}  ВВОДИМ НОМЕР РЕДАКЦИИ{#}{\n}  например, {0E}r4416{#}:
hscolor 10 0
set /p rev=
hscolor 7 0

echo.& %cechox% {0E}  ВВОДИМ ДАТУ РЕДАКЦИИ{#}{\n}  например, {0E}14.08.2022{#}:
hscolor 10 0
set /p data=
hscolor 7 0

:tbx
echo.& %cechox% {0E}  КОМПИЛЯЦИЯ ДОПОЛНИТЕЛЬНОЙ TOOLBAR{#}{\n}
%cechox%   Чтобы не компилировать, вводим {E0}0{#} и жмём Enter,{\n}
%cechox%   чтобы компилировать,    вводим {E0}1{#} и жмём Enter{\n}
%cechox%                           или просто жмём {E0}Enter{#}:
hscolor 0 10
set /p toolbarx=
hscolor 7 0

if not "%toolbarx%"=="0" (
  if not "%toolbarx%"=="1" (
    set toolbarx=1
  )
)

echo.
%cechox% {0E}  ДРУГИЕ ДОПОЛНЕНИЯ{#}{\n}
%cechox% {0E}  1) Коррекция цвета выделения в теме Solarized Light (предложение DV){#}{\n}
%cechox% {0E}  2) Цветовая тема One Dark Pro (предложение Rinat){#}{\n}{\n}
%cechox%   Чтобы не делать, вводим {E0}0{#} и жмём Enter,{\n}
%cechox%   чтобы делать,    вводим {E0}1{#} и жмём Enter{\n}
%cechox%                    или просто жмём {E0}Enter{#}:
hscolor 0 10
set /p buns=
hscolor 7 0

if not "%buns%"=="0" (
  if not "%buns%"=="1" (
    set buns=1
  )
)


set root=%~dp0
set src=%root%src\
set target=%root%build\%rev%\
set extras=%root%extras\

if not exist %src%. (
  echo.
  %cechox% {0C}  Должна быть папка{#} {C0}src{#} {0C}и в ней файлы исходников{#}{\n}
  %cechox% {0C}  Сейчас этой папки нет или скрипт её не видит{#}{\n}
  %cechox% {0C}  Прекращаем выполнение сценария{#}{\n}
  pause>NUL
  exit
)

if not exist %extras%. (
  echo.
  %cechox% {0C}  Должна быть папка{#} {C0}extras{#} {0C}и в ней дополнительные плагины{#}{\n}
  %cechox% {0C}  Сейчас этой папки нет или скрипт её не видит{#}{\n}
  %cechox% {0C}  Прекращаем выполнение сценария{#}{\n}
  pause>NUL
  exit
)

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE DIRECTORIES TREE
echo.& echo.  Start creating Directories Tree...
start /min /wait make_dirs.cmd
%cechox% {0A}  DIRECTORIES TREE CREATION IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE RESOURCES
echo.& echo.  Start creating Resources...
start /wait make_res.cmd
%cechox% {0A}  RESOURCES CREATION IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE x86-x64 EXE
echo.& echo.  Start compiling Executables...
start /wait make_exe.cmd
%cechox% {0A}  EXECUTABLES COMPILATION IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: COLLECT DOCS ^& INT-EXTRAS
echo.& echo.  Start collecting Docs ^& int-Extras...
start /wait make_docs.cmd
%cechox% {0A}  DOCS {\u0026} INT-EXTRAS COLLECTING IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE x86 DLLS
echo.& echo.  Start compiling x86 DLLS...
start /wait make_dlls32.cmd
%cechox% {0A}  x86 DLLS COMPILATION IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE x64 DLLS
echo.& echo.  Start compiling x64 DLLS...
start /wait make_dlls64.cmd
%cechox% {0A}  x64 DLLS COMPILATION IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: COLLECT EXTRAS
echo.& echo.  Start collecting Extras...
start /wait make_extras.cmd
%cechox% {0A}  EXTRAS COLLECTING IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: CREATE README.TXT
echo.& echo.  Start creating ReadMe.txt...
start /min /wait make_readme.cmd
%cechox% {0A}  README.TXT IS CREATED{#}{\n}
%cechox% {0A}  BUILDING HAVE DONE{#}{\n}
echo.
hscolor 2 0
echo. ┌────────────────────────────────────────────────────────────────────────────────────────┐
echo. ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
>nul timeout /t 15
exit
