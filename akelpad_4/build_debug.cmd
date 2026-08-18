@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: build_debug.cmd                                        ::
@rem :: Location.....: .\                                                     ::
@rem :: Encoding.....: 866 OEM Russian                                        ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
>nul chcp 866
title BUILD AKELPAD DEBUG: DECLARE VARIABLES

call reqcheck.cmd %~1

set root=%~dp0
set src=%root%src\

if not exist %src%. (
  echo.
  cecho {0C}  „®«¦­  ¡ëâì ¯ ¯ª {#} {C0}src{#} {0C}¨ ¢ ­¥© ä ©«ë ¨áå®¤­¨ª®¢{#}{\n}
  cecho {0C}  ‘¥©ç á íâ®© ¯ ¯ª¨ ­¥â ¨«¨ áªà¨¯â ¥ñ ­¥ ¢¨¤¨â{#}{\n}
  cecho {0C}  à¥ªà é ¥¬ ¢ë¯®«­¥­¨¥ áæ¥­ à¨ï{#}{\n}
  pause>NUL
  exit
)

cmdmax 0 0 160 80 160 80

cls
cecho {0B}
echo.
echo.   ßÛÞßÛÛÛ ßÛÞ ÛÛÛ ßÛÞßÛÛÛ ßÛÞß    ßÛÞßÛÛÛ ßÛÞßÛÛÛ ßÛÞßÛÛÛ        o       o                
echo.    ÛÞÜÛÛÛ  ÛÞÜÛÛß  ÛÞÜ     ÛÞ      ÛÞ ÛÛÛ  ÛÞÜÛÛÛ  ÛÞ ÛÛÛ         \_____/                 
echo.    ÛÞ ÛÛÛ  ÛÞ ÛÛÛ  ÛÞ ÜÛÛ  ÛÞ ÛÛÛ  ÛÞßßßß  ÛÞ ÛÛÛ  ÛÞ ÛÛÛ         /=O=O=\     _______     
echo.   ßßß ßßß ßßß ßßß ßßßßßßß ßßßßßßß ßßßß    ßßß ßßß ßßßßßßß        /   ^^   \   /\\\\\\\\    
echo.   ßÛÞßÛÛÛ ßÛÞßÛÛÛ ßÛÞßÛÛÛ ßÛÞ ÛÛÛ ßÛÞßÛÛÛ                        \  ÄÄÄ  /  /\   ___  \   
echo.    ÛÞ ÛÛÛ  ÛÞÜ     ÛÞÜÛÛß  ÛÞ ÛÛÛ  ÛÞ                             \_ V _/  /\   /\\\\  \  
echo.    ÛÞ ÛÛÛ  ÛÞ ÜÛÛ  ÛÞ ÛÛÛ  ÛÞ ÛÛÛ  ÛÞ ßÛÛ                           \  \__/\   /\ @_/  /  
echo.   ßßßßßßß ßßßßßßß ßßßßßßß ßßßßßßß ßßßßßßß                            \____\____\______/   
echo. ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo. ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
cecho {07}

if not "%1"=="" (
  set rev=%1
  if not "%2"=="" (
    set data=%2
    goto :check
  )
)

if not defined rev (
  if not exist .\.rev (
    setlocal enabledelayedexpansion
    echo.& cecho {0E}  ‚‚Ž„ˆŒ ŽŒ… …„€Š–ˆˆ{#}{\n}  ­ ¯à¨¬¥à, {0E}r4416{#}:
    cecho {0B}
    set /p rev=
    cecho {07}
    echo !rev!>.rev
    endlocal
  )
  set /p rev=<.rev
)

if not defined data (
  if not exist .\.data (
    (
      setlocal enabledelayedexpansion
      echo.& cecho {0E}  ‚‚Ž„ˆŒ „€’“ …„€Š–ˆˆ{#}{\n}  ­ ¯à¨¬¥à, {0E}%DATE%{#}:
      cecho {0B}
      set /p data=
      cecho {07}
      echo !data!>.data
      endlocal
    )
    set /p data=<.data
    goto :job
  )
  set /p data=<.data
  goto :check
)

:check
cecho {0B}
echo.
echo.  ŽŒ… …„€Š–ˆˆ: %rev%
echo.  „€’€  …„€Š–ˆˆ: %data%
cecho {07}

echo.
cecho {0E}  ‚áñ ¯à ¢¨«ì­®? à®¤®«¦ ¥¬?{#}{\n}
cecho   …á«¨ ­¥ ¯à ¢¨«ì­®, ¢¢®¤¨¬ {E0}0{#} ¨ ¦¬ñ¬ Enter,{\n}
cecho   ¥á«¨    ¯à ¢¨«ì­®, ¯à®áâ® ¦¬ñ¬ {E0}Enter{#}:
cecho {B0}
set /p err=
cecho {07}

if "%err%"=="0" goto :eof
if not "%err%"=="" goto :eof

:job
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

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: MAKE DIRECTORIES TREE
echo.&echo.
cecho {08}  ‘®§¤ ñ¬ ¯ ¯ª¨...{#}
start /min /wait debug_make_dirs.cmd
cecho {0B}{\t\t\t}ƒ®â®¢®.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: REFRESH BACKUPS
cecho {08}  ®¤£®â ¢«¨¢ ¥¬ à¥áãàáë...{#}
start /wait make_res_bkp.cmd
cecho {0B}{\t\t}ƒ®â®¢®.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: MAKE RESOURCES
cecho {08}  ¥¤ ªâ¨àã¥¬ à¥áãàáë...{#}
start /wait make_res.cmd
cecho {0B}{\t\t}ƒ®â®¢®.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: MAKE x86-x64 EXE
cecho {08}  ‘®§¤ ñ¬ ¯à®£à ¬¬ë...{#}
start /wait make_exe.cmd
cecho {0B}{\t\t\t}ƒ®â®¢®.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: MAKE x86 DLLS
cecho {08}  ‘®§¤ ñ¬ 32-¡¨â­ë¥ ¡¨¡«¨®â¥ª¨...{#}
start /wait make_dlls32.cmd
cecho {0B}{\t}ƒ®â®¢®.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: MAKE x64 DLLS
cecho {08}  ‘®§¤ ñ¬ 64-¡¨â­ë¥ ¡¨¡«¨®â¥ª¨...{#}
start /wait make_dlls64.cmd
cecho {0B}{\t}ƒ®â®¢®.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD DEBUG: CREATE README.TXT
cecho {08}  ‘®§¤ ñ¬ ReadMe.txt...{#}
start /min /wait debug_make_readme.cmd
cecho {0B}{\t\t\t}ƒ®â®¢®.{#}{\n}

for %%x in (rar.exe) do (set FOUND=%%~$PATH:x)
if defined FOUND (
  cecho {08}  ‘®§¤ ñ¬ rar...{#}
  cd build
  rar a -m5 -rr -inul %rev%d.rar %rev%d
  cecho {0B}{\t\t\t}ƒ®â®¢®.{#}{\n}
)
cecho {0B}{\n}  ‘ŽŠ€ ‡€‚…˜…€{#}{\n}
echo.
cecho {0B}
echo. ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo. ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
>nul timeout /t 15
exit
