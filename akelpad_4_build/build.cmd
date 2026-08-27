@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: €¢â®¬ â¨§ æ¨ï ª®¬¯¨«ïæ¨¨ AkelPad ¨§ ¨áå®¤­¨ª®¢         ::
@rem :: Location.....: .\                                                     ::
@rem :: Encoding.....: 866 OEM Russian                                        ::
@rem :: Version......: 5.2.4                                                  ::
@rem :: Compatible...: >= r4447                                               ::
@rem :: C.Date/M.Date: 17.08.2022 / 20.04.2026                                ::
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
  cecho {0C}  „®«¦­  ¡ëâì ¯ ¯ª {#} {C0}src{#} {0C}¨ ¢ ­¥© ä ©«ë ¨áå®¤­¨ª®¢{#}{\n}
  cecho {0C}  ‘¥©ç á íâ®© ¯ ¯ª¨ ­¥â ¨«¨ áªà¨¯â ¥ñ ­¥ ¢¨¤¨â{#}{\n}
  cecho {0C}  à¥ªà é ¥¬ ¢ë¯®«­¥­¨¥ áæ¥­ à¨ï{#}{\n}
  pause>NUL
  exit
)
if not exist "%extras%." set extras=0

cmdmax 0 0 160 80 160 80

cls
cecho {02}
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
cecho {07}

if "%extras%"=="0" (
  setlocal enabledelayedexpansion
  echo.
  cecho {0C}  Ž’‘“’‘’‚“…’ €Š€ ‘’ŽŽˆ• ‹€ƒˆŽ‚{#}{\n}
  cecho   —â®¡ë ¯à¥à¢ âì áªà¨¯â, ¢¢®¤¨¬ {E0}1{#} ¨ ¦¬ñ¬ Enter,{\n}
  cecho   çâ®¡ë ¯à®¤®«¦¨âì ¡¥§ ­¨å,  ¯à®áâ® ¦¬ñ¬ {E0}Enter{#}:
  cecho {C0}
  set /p break=
  cecho {07}
  if "!break!"=="1" goto :EOF
  endlocal
)

echo.
cecho {0E}  Ž’‹€„Š€ ‘ŽŽ—ŽƒŽ ‘Šˆ’€{#}{\n}
cecho {0E}  ‚ à¥¦¨¬¥ ®â« ¤ª¨ ¯®á«¥ á®§¤ ­¨ï ª ¦¤®£® ä ©« {#}{\n}
cecho {0E}  ¢ë¯®«­¥­¨¥ áæ¥­ à¨ï ¡ã¤¥â ®áâ ­ ¢«¨¢ âìáï ­  ¯ ã§ã{#}{\n}{\n}
cecho   —â®¡ë ¢ª«îç¨âì,    ¢¢®¤¨¬ {E0}1{#} ¨ ¦¬ñ¬ Enter,{\n}
cecho   çâ®¡ë ­¥ ¢ª«îç âì, ¢¢®¤¨¬ {E0}0{#} ¨ ¦¬ñ¬ Enter{\n}
cecho                      ¨«¨ ¯à®áâ® ¦¬ñ¬ {E0}Enter{#}:
cecho {A0}
set /p debugcmd=
cecho {07}

if not "%debugcmd%"=="1" (
  if not "%debugcmd%"=="0" (
    set debugcmd=0
  )
)

if not exist .\.rev (
  setlocal enabledelayedexpansion
  echo.& cecho {0E}  ‚‚Ž„ˆŒ ŽŒ… …„€Š–ˆˆ{#}{\n}  ­ ¯à¨¬¥à, {0E}r4416{#}:
  cecho {0A}
  set /p rev=
  cecho {07}
  echo !rev!>.rev
  endlocal
)
set /p rev=<.rev

if not exist .\.data (
  setlocal enabledelayedexpansion
  echo.& cecho {0E}  ‚‚Ž„ˆŒ „€’“ …„€Š–ˆˆ{#}{\n}  ­ ¯à¨¬¥à, {0E}%DATE%{#}:
  cecho {0A}
  set /p data=
  cecho {07}
  echo !data!>.data
  endlocal
)
set /p data=<.data

echo.
cecho {0E}  „Ž€‚‹…ˆ… ŠŽŒŒ…’€ˆ…‚ Ž ‘ŽŠ…{#}{\n}
cecho {0E}  1) ‚ ®ª­® About § ¯¨áì ® ­®¬¥à¥ ¨ ¤ â¥ CodeSVN revision{#}{\n}
cecho {0E}  2) ‚ á¢®©áâ¢  dll § ¯¨á¨ ® ­®¬¥à¥ ¨ ¤ â¥ CodeSVN revision{#}{\n}{\n}
cecho   —â®¡ë ­¥ ¤®¡ ¢«ïâì, ¢¢®¤¨¬ {E0}0{#} ¨ ¦¬ñ¬ Enter,{\n}
cecho   çâ®¡ë ¤®¡ ¢¨âì,     ¢¢®¤¨¬ {E0}1{#} ¨ ¦¬ñ¬ Enter{\n}
cecho                       ¨«¨ ¯à®áâ® ¦¬ñ¬ {E0}Enter{#}:
cecho {A0}
set /p cont=
cecho {07}

if not "%cont%"=="0" (
  if not "%cont%"=="1" (
    set cont=1
  )
)

:tbx
echo.& cecho {0E}  ‘ŽŠ€ „ŽŽ‹ˆ’…‹œŽ‰ TOOLBAR{#}{\n}
cecho   —â®¡ë ­¥ á®¡¨à âì, ¢¢®¤¨¬ {E0}0{#} ¨ ¦¬ñ¬ Enter,{\n}
cecho   çâ®¡ë á®¡à âì,     ¢¢®¤¨¬ {E0}1{#} ¨ ¦¬ñ¬ Enter{\n}
cecho                      ¨«¨ ¯à®áâ® ¦¬ñ¬ {E0}Enter{#}:
cecho {A0}
set /p toolbarx=
cecho {07}

if not "%toolbarx%"=="0" (
  if not "%toolbarx%"=="1" (
    set toolbarx=1
  )
)

echo.
cecho {0E}  „“ƒˆ… „ŽŽ‹…ˆŸ{#}{\n}
cecho {0E}  1) –¢¥â®¢ ï â¥¬  One Dark Pro (¯à¥¤«®¦¥­¨¥ Rinat){#}{\n}{\n}
cecho   —â®¡ë ­¥ ¤¥« âì, ¢¢®¤¨¬ {E0}0{#} ¨ ¦¬ñ¬ Enter,{\n}
cecho   çâ®¡ë á¤¥« âì,   ¢¢®¤¨¬ {E0}1{#} ¨ ¦¬ñ¬ Enter{\n}
cecho                    ¨«¨ ¯à®áâ® ¦¬ñ¬ {E0}Enter{#}:
cecho {A0}
set /p buns=
cecho {07}

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
echo.&echo.
cecho {08}  ‘®§¤ ñ¬ ¯ ¯ª¨...{#}
start /min /wait make_dirs.cmd
cecho {0A}{\t\t\t}ƒ®â®¢®.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: REFRESH BACKUPS
cecho {08}  ®¤£®â ¢«¨¢ ¥¬ à¥áãàáë...{#}
start /wait make_res_bkp.cmd
cecho {0A}{\t\t}ƒ®â®¢®.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE RESOURCES
cecho {08}  ¥¤ ªâ¨àã¥¬ à¥áãàáë...{#}
start /wait make_res.cmd
cecho {0A}{\t\t}ƒ®â®¢®.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE x86-x64 EXE
cecho {08}  ‘®§¤ ñ¬ ¯à®£à ¬¬ë...{#}
start /wait make_exe.cmd
cecho {0A}{\t\t\t}ƒ®â®¢®.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: COLLECT DOCS ^& INT-EXTRAS
cecho {08}  ‘®¡¨à ¥¬ ¢á¯®¬®£ â¥«ì­ë¥ ä ©«ë...{#}
start /wait make_docs.cmd
cecho {0A}{\t}ƒ®â®¢®.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE x86 DLLS
cecho {08}  ‘®§¤ ñ¬ 32-¡¨â­ë¥ ¡¨¡«¨®â¥ª¨...{#}
start /wait make_dlls32.cmd
cecho {0A}{\t}ƒ®â®¢®.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: MAKE x64 DLLS
cecho {08}  ‘®§¤ ñ¬ 64-¡¨â­ë¥ ¡¨¡«¨®â¥ª¨...{#}
start /wait make_dlls64.cmd
cecho {0A}{\t}ƒ®â®¢®.{#}{\n}
>nul timeout /t 1

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

if not "%extras%"=="0" (
  title BUILD AKELPAD: COLLECT EXTRAS
  cecho {08}  ‘®¡¨à ¥¬ áâ®à®­­¨¥ ä ©«ë...{#}
  start /wait make_extras.cmd
  cecho {0A}{\t\t}ƒ®â®¢®.{#}{\n}
  >nul timeout /t 1
)

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title BUILD AKELPAD: CREATE README.TXT
cecho {08}  ‘®§¤ ñ¬ ReadMe.txt...{#}
start /min /wait make_readme.cmd
cecho {0A}{\t\t\t}ƒ®â®¢®.{#}{\n}

for %%x in (tar.exe) do (set FOUND=%%~$PATH:x)
if defined FOUND (
  cd build
  if not exist %rev%.zip (
    cecho {08}  ‘®§¤ ñ¬ zip...{#}
    tar caf %rev%.zip %rev%
    cecho {0A}{\t\t\t}ƒ®â®¢®.{#}{\n}
  )
)
cecho {0A}{\n}  ‘ŽŠ€ ‡€‚…˜…€{#}{\n}
echo.
cecho {02}
echo. ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo. ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
>nul timeout /t 30
exit
