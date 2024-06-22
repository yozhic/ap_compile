@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: ��⮬�⨧��� �������樨 AkelPad �� ��室�����         ::
@rem :: Location.....: .\                                                     ::
@rem :: Version......: 5.2.0                                                  ::
@rem :: Compatible...: >= r4445                                               ::
@rem :: C.Date/M.Date: 17.08.2022 / 22.06.2024                                ::
@rem :: Requirements.: cecho.exe   2.0 by Thomas Polaert  on codeproject.com  ::
@rem ::                cmdmax.exe  2.0 by Antoni Sawicki  on github.com       ::
@rem ::                cocolor.exe 2.1 by Horst Schaeffer on horstmuc.de      ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
>nul chcp 866
title BUILD AKELPAD: DECLARE VARIABLES

call reqcheck.cmd

call cmdmax 0 0 160 80 160 80

cls
call cocolor 02
echo.
echo.  ���������   ����   ����   ����������  ����         ����������    ���������   ����������  
echo. ��۲�� ��۲� ��۲�  ��۲� ��۲�� ��۲� ��۲�������� ��۲�� ��۲� ��۲�� ��۲� ��۲�� ��۲�
echo. ��۲������۳ ������������ ������  ���� ��۲�������� ������������ ��۲������۳ ��۲�  ���۳
echo. ��۲�� ���۳ ��۲�� ���ܿ ��۲�������  ��۲�� ����  ��۲������ � ��۲�� ���۳ ��۲�  ��۲�
echo. ��۲�  ��۲� ��۲�  ��۲� ���������۲� ���������۲� ���۳������� ��۲�  ��۲� �������۲���
echo.  ����   ����  ����   ����    ���������    ���������  ����         ����   ����  ���������  
echo. ������������������������������������������������������������������������������������������
echo. ������������������������������������������������������������������������������������������
echo.
call cocolor 07

echo.
%cechox% {0E}  ������� ������� ����������{#}{\n}
%cechox% {0E}  � ०��� �⫠��� ��᫥ �������樨 ������� 䠩��{#}{\n}
%cechox% {0E}  �믮������ �業��� �㤥� ��⠭���������� �� ����{#}{\n}{\n}
%cechox%   �⮡� �������,    ������ {E0}1{#} � ��� Enter,{\n}
%cechox%   �⮡� �� �������, ������ {E0}0{#} � ��� Enter{\n}
%cechox%                      ��� ���� ��� {E0}Enter{#}:
call cocolor A0
set /p debugcmd=
call cocolor 07

if not "%debugcmd%"=="1" (
  if not "%debugcmd%"=="0" (
    set debugcmd=0
  )
)

echo.& %cechox% {0E}  ������ ����� ��������{#}{\n}  ���ਬ��, {0E}r4416{#}:
call cocolor 0A
set /p rev=
call cocolor 07

echo.& %cechox% {0E}  ������ ���� ��������{#}{\n}  ���ਬ��, {0E}14.08.2022{#}:
call cocolor 0A
set /p data=
call cocolor 07

echo.
%cechox% {0E}  ���������� ������������ � ����������{#}{\n}
%cechox% {0E}  1) � ���� About ������ � ����� � ��� CodeSVN revision{#}{\n}
%cechox% {0E}  2) � ᢮��⢠ dll ����� � ����� � ��� CodeSVN revision{#}{\n}{\n}
%cechox%   �⮡� �� ���������, ������ {E0}0{#} � ��� Enter,{\n}
%cechox%   �⮡� ��������,     ������ {E0}1{#} � ��� Enter{\n}
%cechox%                       ��� ���� ��� {E0}Enter{#}:
call cocolor A0
set /p cont=
call cocolor 07

if not "%cont%"=="0" (
  if not "%cont%"=="1" (
    set cont=1
  )
)

:tbx
echo.& %cechox% {0E}  ���������� �������������� TOOLBAR{#}{\n}
%cechox%   �⮡� �� �������஢���, ������ {E0}0{#} � ��� Enter,{\n}
%cechox%   �⮡� �������஢���,    ������ {E0}1{#} � ��� Enter{\n}
%cechox%                           ��� ���� ��� {E0}Enter{#}:
call cocolor A0
set /p toolbarx=
call cocolor 07

if not "%toolbarx%"=="0" (
  if not "%toolbarx%"=="1" (
    set toolbarx=1
  )
)

echo.
%cechox% {0E}  ������ ����������{#}{\n}
%cechox% {0E}  1) ���४�� 梥� �뤥����� � ⥬� Solarized Light (�।������� DV){#}{\n}
%cechox% {0E}  2) ���⮢�� ⥬� One Dark Pro (�।������� Rinat){#}{\n}{\n}
%cechox%   �⮡� �� ������, ������ {E0}0{#} � ��� Enter,{\n}
%cechox%   �⮡� ������,    ������ {E0}1{#} � ��� Enter{\n}
%cechox%                    ��� ���� ��� {E0}Enter{#}:
call cocolor A0
set /p buns=
call cocolor 07

if not "%buns%"=="0" (
  if not "%buns%"=="1" (
    set buns=1
  )
)


set root=%~dp0
set src=%root%src\
set target=%root%build\%rev%\
set extras=%root%extras\
set debug=0
set debugstr1=
set debugstr2=
set param=

if not exist %src%. (
  echo.
  %cechox% {0C}  ������ ���� �����{#} {C0}src{#} {0C}� � ��� 䠩�� ��室�����{#}{\n}
  %cechox% {0C}  ����� �⮩ ����� ��� ��� �ਯ� �� �� �����{#}{\n}
  %cechox% {0C}  �४�頥� �믮������ �業���{#}{\n}
  pause>NUL
  exit
)

if not exist %extras%. (
  echo.
  %cechox% {0C}  ������ ���� �����{#} {C0}extras{#} {0C}� � ��� �������⥫�� �������{#}{\n}
  %cechox% {0C}  ����� �⮩ ����� ��� ��� �ਯ� �� �� �����{#}{\n}
  %cechox% {0C}  �४�頥� �믮������ �業���{#}{\n}
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

title BUILD AKELPAD: REFRESH BACKUPS
echo.& echo.  Start refreshing Backups...
start /wait make_res_bkp.cmd
%cechox% {0A}  BACKUPS REFRESHING IS COMPLETE{#}{\n}
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
call cocolor 02
echo. ����������������������������������������������������������������������������������������Ŀ
echo. ������������������������������������������������������������������������������������������
>nul timeout /t 15
exit
