@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: €¢â®¬ â¨§ æ¨ï ª®¬¯¨«ïæ¨¨ AkelPad ¨§ ¨áå®¤­¨ª®¢         ::
@rem :: Location.....: .\                                                     ::
@rem :: Encoding.....: 866 OEM Russian                                        ::
@rem :: Version......: 5.2.2                                                  ::
@rem :: Compatible...: >= r4447                                               ::
@rem :: C.Date/M.Date: 17.08.2022 / 25.06.2024                                ::
@rem :: Requirements.: cecho.exe   2.0 by Thomas Polaert  on codeproject.com  ::
@rem ::                cmdmax.exe  2.0 by Antoni Sawicki  on github.com       ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
>nul chcp 866
title BUILD AKELPAD: DECLARE VARIABLES

call reqcheck.cmd %~1

set root=%~dp0
set src=%root%src\
set extras=%root%extras\

if not exist "%src%." (
  echo.
  "%cechox%" {0C}  „®«¦­  ¡ëâì ¯ ¯ª {#} {C0}src{#} {0C}¨ ¢ ­¥© ä ©«ë ¨áå®¤­¨ª®¢{#}{\n}
  "%cechox%" {0C}  ‘¥©ç á íâ®© ¯ ¯ª¨ ­¥â ¨«¨ áªà¨¯â ¥ñ ­¥ ¢¨¤¨â{#}{\n}
  "%cechox%" {0C}  à¥ªà é ¥¬ ¢ë¯®«­¥­¨¥ áæ¥­ à¨ï{#}{\n}
  pause>NUL
  exit
)
if not exist "%extras%." set extras=0

call cmdmax 0 0 160 80 160 80

cls
"%cechox%" {02}
echo.
echo.  ÜÜÜÜÜÜÜÜÜ   ÜÜÜÜ   ÜÜÜÜ   ÜÜÜÜÜÜÜÜÜÜ  ÜÜÜÜ         ÜÜÜÜÜÜÜÜÜÜ    ÜÜÜÜÜÜÜÜÜ   ÜÜÜÜÜÜÜÜÜÜ  
echo. ÛÛÛ²ÚÄ ÛÛÛ²¿ ÛÛÛ²³  ÛÛÛ²³ ÛÛÛ²ÚÄ ÛÛÛ²³ ÛÛÛ²³°°°°°°° ÛÛÛ²ÚÄ ÛÛÛ²¿ ÛÛÛ²ÚÄ ÛÛÛ²¿ ÛÛÛ²ÚÄ ÛÛÛ²¿
echo. ÛÛÛ²³ÜÜÛÛÛÛ³ ÛÛÛÛÜÜÜÛÛßÚÙ ÛÛÛÛÜÜ  ÄÄÄÙ ÛÛÛ²³±±±±±±± ÛÛÛÛÜÜÜÛÛßÚÙ ÛÛÛ²³ÜÜÛÛÛÛ³ ÛÛÛ²³  ÛÛÛÛ³
echo. ÛÛÛ²ÃÄ ÛÛÛÛ³ ÛÛÛ²ÚÄ ÛÛÛÜ¿ ÛÛÛ²ÚÄÙÜÜÜÜ  ÛÛÛ²³² ÜÜÜÜ  ÛÛÛ²ÚÄÄÄÄÙ ± ÛÛÛ²ÃÄ ÛÛÛÛ³ ÛÛÛ²³  ÛÛÛ²³
echo. ²ÛÛ²³  ²ÛÛ²³ ²ÛÛ²³  ²ÛÛ²³ ßÛÛÛÜÜÜÛÛÛ²³ ßÛÛÛÜÜÜÛÛÛ²³ ²ÛÛÛ³ßßßßßßß ²ÛÛ²³  ²ÛÛ²³ ²ÛÛÛÜÜÜÛ²ÚÄÙ
echo.  ÄÄÄÙ   ÄÄÄÙ  ÄÄÄÙ   ÄÄÄÙ    ÄÄÄÄÄÄÄÄÙ    ÄÄÄÄÄÄÄÄÙ  ÄÄÄÙ         ÄÄÄÙ   ÄÄÄÙ  ÄÄÄÄÄÄÄÄÙ  
echo. ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo. ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
"%cechox%" {07}

if "%extras%"=="0" (
  setlocal enabledelayedexpansion
  echo.
  "%cechox%" {0C}  Ž’‘“’‘’‚“…’ €Š€ ‘’ŽŽˆ• ‹€ƒˆŽ‚{#}{\n}
  "%cechox%"   —â®¡ë ¯à¥à¢ âì áªà¨¯â, ¢¢®¤¨¬ {E0}1{#} ¨ ¦¬ñ¬ Enter,{\n}
  "%cechox%"   çâ®¡ë ¯à®¤®«¦¨âì ¡¥§ ­¨å,  ¯à®áâ® ¦¬ñ¬ {E0}Enter{#}:
  "%cechox%" {C0}
  set /p break=
  "%cechox%" {07}
  if "!break!"=="1" goto :EOF
  endlocal
)

echo.
"%cechox%" {0E}  Ž’‹€„Š€ ‘Šˆ’€ ŠŽŒˆ‹Ÿ–ˆˆ{#}{\n}
"%cechox%" {0E}  ‚ à¥¦¨¬¥ ®â« ¤ª¨ ¯®á«¥ ª®¬¯¨«ïæ¨¨ ª ¦¤®£® ä ©« {#}{\n}
"%cechox%" {0E}  ¢ë¯®«­¥­¨¥ áæ¥­ à¨ï ¡ã¤¥â ®áâ ­ ¢«¨¢ âìáï ­  ¯ ã§ã{#}{\n}{\n}
"%cechox%"   —â®¡ë ¢ª«îç¨âì,    ¢¢®¤¨¬ {E0}1{#} ¨ ¦¬ñ¬ Enter,{\n}
"%cechox%"   çâ®¡ë ­¥ ¢ª«îç âì, ¢¢®¤¨¬ {E0}0{#} ¨ ¦¬ñ¬ Enter{\n}
"%cechox%"                      ¨«¨ ¯à®áâ® ¦¬ñ¬ {E0}Enter{#}:
"%cechox%" {A0}
set /p debugcmd=
"%cechox%" {07}

if not "%debugcmd%"=="1" (
  if not "%debugcmd%"=="0" (
    set debugcmd=0
  )
)

echo.& "%cechox%" {0E}  ‚‚Ž„ˆŒ ŽŒ… …„€Š–ˆˆ{#}{\n}  ­ ¯à¨¬¥à, {0E}r4416{#}:
"%cechox%" {0A}
set /p rev=
"%cechox%" {07}

echo.& "%cechox%" {0E}  ‚‚Ž„ˆŒ „€’“ …„€Š–ˆˆ{#}{\n}  ­ ¯à¨¬¥à, {0E}%DATE%{#}:
"%cechox%" {0A}
set /p data=
"%cechox%" {07}

echo.
"%cechox%" {0E}  „Ž€‚‹…ˆ… ŠŽŒŒ…’€ˆ…‚ Ž ŠŽŒˆ‹Ÿ–ˆˆ{#}{\n}
"%cechox%" {0E}  1) ‚ ®ª­® About § ¯¨áì ® ­®¬¥à¥ ¨ ¤ â¥ CodeSVN revision{#}{\n}
"%cechox%" {0E}  2) ‚ á¢®©áâ¢  dll § ¯¨á¨ ® ­®¬¥à¥ ¨ ¤ â¥ CodeSVN revision{#}{\n}{\n}
"%cechox%"   —â®¡ë ­¥ ¤®¡ ¢«ïâì, ¢¢®¤¨¬ {E0}0{#} ¨ ¦¬ñ¬ Enter,{\n}
"%cechox%"   çâ®¡ë ¤®¡ ¢¨âì,     ¢¢®¤¨¬ {E0}1{#} ¨ ¦¬ñ¬ Enter{\n}
"%cechox%"                       ¨«¨ ¯à®áâ® ¦¬ñ¬ {E0}Enter{#}:
"%cechox%" {A0}
set /p cont=
"%cechox%" {07}

if not "%cont%"=="0" (
  if not "%cont%"=="1" (
    set cont=1
  )
)

:tbx
echo.& "%cechox%" {0E}  ŠŽŒˆ‹Ÿ–ˆŸ „ŽŽ‹ˆ’…‹œŽ‰ TOOLBAR{#}{\n}
"%cechox%"   —â®¡ë ­¥ ª®¬¯¨«¨à®¢ âì, ¢¢®¤¨¬ {E0}0{#} ¨ ¦¬ñ¬ Enter,{\n}
"%cechox%"   çâ®¡ë ª®¬¯¨«¨à®¢ âì,    ¢¢®¤¨¬ {E0}1{#} ¨ ¦¬ñ¬ Enter{\n}
"%cechox%"                           ¨«¨ ¯à®áâ® ¦¬ñ¬ {E0}Enter{#}:
"%cechox%" {A0}
set /p toolbarx=
"%cechox%" {07}

if not "%toolbarx%"=="0" (
  if not "%toolbarx%"=="1" (
    set toolbarx=1
  )
)

echo.
"%cechox%" {0E}  „“ƒˆ… „ŽŽ‹…ˆŸ{#}{\n}
"%cechox%" {0E}  1) –¢¥â®¢ ï â¥¬  One Dark Pro (¯à¥¤«®¦¥­¨¥ Rinat){#}{\n}{\n}
"%cechox%"   —â®¡ë ­¥ ¤¥« âì, ¢¢®¤¨¬ {E0}0{#} ¨ ¦¬ñ¬ Enter,{\n}
"%cechox%"   çâ®¡ë ¤¥« âì,    ¢¢®¤¨¬ {E0}1{#} ¨ ¦¬ñ¬ Enter{\n}
"%cechox%"                    ¨«¨ ¯à®áâ® ¦¬ñ¬ {E0}Enter{#}:
"%cechox%" {A0}
set /p buns=
"%cechox%" {07}

if not "%buns%"=="0" (
  if not "%buns%"=="1" (
    set buns=1
  )
)

set target=%root%build\%rev%\
set debug=0
set debugstr1=
set debugstr2=
set param=


rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE DIRECTORIES TREE
echo.& echo.  Start creating Directories Tree...
start /min /wait make_dirs.cmd
"%cechox%" {0A}  DIRECTORIES TREE CREATION IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: REFRESH BACKUPS
echo.& echo.  Start refreshing Backups...
start /wait make_res_bkp.cmd
"%cechox%" {0A}  BACKUPS REFRESHING IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE RESOURCES
echo.& echo.  Start creating Resources...
start /wait make_res.cmd
"%cechox%" {0A}  RESOURCES CREATION IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE x86-x64 EXE
echo.& echo.  Start compiling Executables...
start /wait make_exe.cmd
"%cechox%" {0A}  EXECUTABLES COMPILATION IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: COLLECT DOCS ^& INT-EXTRAS
echo.& echo.  Start collecting Docs ^& int-Extras...
start /wait make_docs.cmd
"%cechox%" {0A}  DOCS {\u0026} INT-EXTRAS COLLECTING IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE x86 DLLS
echo.& echo.  Start compiling x86 DLLS...
start /wait make_dlls32.cmd
"%cechox%" {0A}  x86 DLLS COMPILATION IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE x64 DLLS
echo.& echo.  Start compiling x64 DLLS...
start /wait make_dlls64.cmd
"%cechox%" {0A}  x64 DLLS COMPILATION IS COMPLETE{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

if not "%extras%"=="0" (
  title BUILD AKELPAD: COLLECT EXTRAS
  echo.& echo.  Start collecting Extras...
  start /wait make_extras.cmd
  "%cechox%" {0A}  EXTRAS COLLECTING IS COMPLETE{#}{\n}
  >nul timeout /t 1
)

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: CREATE README.TXT
echo.& echo.  Start creating ReadMe.txt...
start /min /wait make_readme.cmd
"%cechox%" {0A}  README.TXT IS CREATED{#}{\n}
"%cechox%" {0A}  BUILDING HAVE DONE{#}{\n}
echo.
"%cechox%" {02}
echo. ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo. ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
>nul timeout /t 15
exit
