@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: debug_build.cmd                                        ::
@rem :: Location.....: .\                                                     ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
>nul chcp 866
title BUILD AKELPAD DEBUG: DECLARE VARIABLES
call cmdmax 0 0 160 80 160 80

cls
hscolor 11 0
echo.
echo.   ������� ��� ��� ������� ����    ������� ������� �������        o       o                
echo.    ������  ������  ���     ��      �� ���  ������  �� ���         \_____/                 
echo.    �� ���  �� ���  �� ���  �� ���  ������  �� ���  �� ���         /=O=O=\     _______     
echo.   ��� ��� ��� ��� ������� ������� ����    ��� ��� �������        /   ^   \   /\\\\\\\\    
echo.   ������� ������� ������� ��� ��� �������                        \ \___/ /  /\   ___  \   
echo.    �� ���  ���     ������  �� ���  ��                             \_ V _/  /\   /\\\\  \  
echo.    �� ���  �� ���  �� ���  �� ���  �� ���                           \  \__/\   /\ @_/  /  
echo.   ������� ������� ������� ������� �������                            \____\____\______/   
echo. ������������������������������������������������������������������������������������������
echo. ������������������������������������������������������������������������������������������
echo.
hscolor 7 0

if not "%1"=="" set rev=%1
if not "%2"=="" set data=%2

if "%rev%"=="" (
  echo.& %cechox% {0E}  ������ ����� ��������{#}{\n}  ���ਬ��, {0E}r4416{#}:
  hscolor 11 0
  set /p rev=
  hscolor 7 0
)

if "%data%"=="" (
  echo.& %cechox% {0E}  ������ ���� ��������{#}{\n}  ���ਬ��, {0E}14.08.2022{#}:
  hscolor 11 0
  set /p data=
  hscolor 7 0
)

:skip
hscolor 11 0
echo.
echo.  ����� ��������: %rev%
echo.  ����  ��������: %data%
hscolor 7 0

echo.
%cechox% {0E}  ��� �ࠢ��쭮? �த������?{#}{\n}
%cechox%   �᫨ �� �ࠢ��쭮, ������ {E0}0{#} � ��� Enter,{\n}
%cechox%   �᫨    �ࠢ��쭮, ���� ��� {E0}Enter{#}:
hscolor 0 11
set /p err=
hscolor 7 0

if "%err%"=="0" goto :eof
if not "%err%"=="" goto :eof

set root=%~dp0
set src=%root%src\
set target=%root%build\%rev%d\
set debugcmd=0
set toolbarx=0
set cont=1
set buns=0
set debug=1
set debugstr1= DEBUG
set debugstr2=DEBUG version. 
set param=/D
set pdb=%target%pdb

if not exist %src%. (
  echo.
  %cechox% {0C}  ������ ���� �����{#} {C0}src{#} {0C}� � ��� 䠩�� ��室�����{#}{\n}
  %cechox% {0C}  ����� �⮩ ����� ��� ��� �ਯ� �� �� �����{#}{\n}
  %cechox% {0C}  �४�頥� �믮������ �業���{#}{\n}
  pause>NUL
  exit
)

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: MAKE DIRECTORIES TREE
echo.& echo.  Start creating Directories Tree...
start /min /wait debug_make_dirs.cmd
%cechox% {0B}  DIRECTORIES TREE CREATION IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: REFRESH BACKUPS
echo.& echo.  Start refreshing Backups...
start /wait make_res_bkp.cmd
%cechox% {0B}  BACKUPS REFRESHING IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: MAKE RESOURCES
echo.& echo.  Start creating Resources...
start /wait make_res.cmd
%cechox% {0B}  RESOURCES CREATION IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: MAKE x86-x64 EXE
echo.& echo.  Start compiling Executables...
start /wait make_exe.cmd
%cechox% {0B}  EXECUTABLES COMPILATION IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: MAKE x86 DLLS
echo.& echo.  Start compiling x86 DLLS...
start /wait make_dlls32.cmd
%cechox% {0B}  x86 DLLS COMPILATION IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: MAKE x64 DLLS
echo.& echo.  Start compiling x64 DLLS...
start /wait make_dlls64.cmd
%cechox% {0B}  x64 DLLS COMPILATION IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: CREATE README.TXT
echo.& echo.  Start creating ReadMe.txt...
start /min /wait debug_make_readme.cmd
%cechox% {0B}  README.TXT IS CREATED{#}{\n}
%cechox% {0B}  BUILDING HAVE DONE{#}{\n}
echo.
hscolor 11 0
echo. ����������������������������������������������������������������������������������������Ŀ
echo. ������������������������������������������������������������������������������������������
>nul timeout /t 15
exit