@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_res.cmd                                           ::
@rem :: Location.....: .\                                                     ::
@rem :: Encoding.....: 866 OEM Russian                                        ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
cd %root%
if %toolbarx%==0 (
  echo.& cecho {06}TOOLBAREXTRA CREATION IS CANCELED{#}{\n}
  goto :skip1
)
title BUILD AKELPAD: CREATE TOOLBAREXTRA SOURCE
echo. & echo Create ToolBarExtra.c ...

pushd src\AkelFiles\Plugs\ToolBar\Source\
type ToolBar.c > ToolBarExtra.c
>nul timeout /t 1

call jrepl "pv->pPluginName=\qToolBar\q" "pv->pPluginName=\qToolBarExtra\q" /f "ToolBar.c" /o - /xseq
if errorlevel 2 call :issue

cd Resources\
echo Create ToolBarExtra.rc ...
type ToolBar.rc > ToolBarExtra.rc
>nul timeout /t 1

call jrepl "\q00.ico\q[\s\S]+\q38.ico\q" "\q38.ico\q" /f "ToolBar.rc" /o - /m /xseq
if errorlevel 2 call :issue

echo.& cecho {0A}TOOLBAREXTRA SOURCE CREATION IS COMPLETE{#}{\n}
>nul timeout /t 1
popd

:skip1
if "%cont%"=="0" (
  echo.& cecho {06}RESOURCE EDITING IS CANCELED{#}{\n}
  goto :skip3
)

title BUILD AKELPAD%debugstr1%: EDIT ABOUT INFO
echo.& echo Edit About window Info...
call jrepl "AkelPad 4\.10\.0 \(x(86|64)\)" "$& [%rev%]%debugstr1%" /f "%~dp0src\Edit.h" /o - /xseq
if errorlevel 2 call :issue

if "%debug%"=="0" (
  echo.& cecho {0A}ABOUT INFO EDITING IS COMPLETE{#}{\n}
) else (
  echo.& cecho {0B}ABOUT INFO EDITING IS COMPLETE{#}{\n}
)

title BUILD AKELPAD%debugstr1%: EDIT VERSION.RC
echo.& echo Edit .\src\AkelAdmin\Resources\Version.rc
call jrepl "^( +)VALUE \qFileDescription\q" "$1VALUE \qComments\q, \q%debugstr2%CodeSVN revision %rev:~1% [%data%]\\0\q\r\n$&" /f "%~dp0src\AkelAdmin\Resources\Version.rc" /o - /xseq /m
if errorlevel 2 call :issue

echo Edit .\src\AkelEdit\Resources\Version.rc
call jrepl "^( +)VALUE \qFileDescription\q" "$1VALUE \qComments\q, \q%debugstr2%CodeSVN revision %rev:~1% [%data%]\\0\q\r\n$&" /f "%~dp0src\AkelEdit\Resources\Version.rc" /o - /xseq /m
if errorlevel 1 pause

echo Edit .\src\AkelFiles\Langs\Resources\version.h
call jrepl "text editor" "text editor. R%rev:~1% Dev Preview." /f "%~dp0src\AkelFiles\Langs\Resources\version.h" /o - /l
if errorlevel 2 call :issue

echo.

for /r "%~dp0src\AkelFiles\Plugs" %%f in (Version.rc) do (
  if exist %%f (
    echo Edit %%f
    call jrepl "^( +)VALUE \qFileDescription\q" "$1VALUE \qComments\q, \q%debugstr2%CodeSVN revision %rev:~1% [%data%]\\0\q\r\n$&" /f "%%f" /o - /xseq /m
    if errorlevel 2 call :issue
  )
)

echo.& echo Edit .\src\AkelFiles\Langs\Resources\Version.rc
call jrepl "^( +)VALUE \qFileDescription\q" "$1VALUE \qComments\q, \q%debugstr2%CodeSVN revision %rev:~1% [%data%]\\0\q\r\n$&" /f "%~dp0src\AkelFiles\Langs\Resources\Version.rc" /o - /xseq /m
if errorlevel 2 call :issue

echo.

if "%debug%"=="0" (
  cecho {0A}ALL VERSION.RC EDITING IS COMPLETE{#}{\n}
) else (
  cecho {0B}ALL VERSION.RC EDITING IS COMPLETE{#}{\n}
)

:skip3
if "%buns%"=="0" (
  echo.& cecho {06}EXTRA ADDITIONS IS CANCELED{#}{\n}
  goto :skip4
)

title BUILD AKELPAD: ADD ONEDARKPRO THEME
echo.& echo Add One Dark Pro Theme...
rem ˆáâ®ç­¨ª: ¯à¥¤«®¦¨« Rinat https://akelpad.sourceforge.net/forum/viewtopic.php?p=36161#p36161

set JS="\/\/Solarized Light variable theme"

set JR="\x2f\x2fONEDARKPRO variable theme\r\n#define TXT_ONEDARKPRO_VARTHEME_BASIC \\\r\nL\qSTR #98C379\\r\\\r\nCOMM #5C6370\\r\\\r\nVAR #C678DD\\r\\\r\nDEL1 #E6C07B\\r\\\r\nDEL2 #56B6C2\\r\\\r\nTYPE #61AEEE\\r\\\r\nOP #C678DD\\r\\\r\nTAG #E06C75\\r\\\r\nATTR #D19A66\\r\\\r\nIF #C678DD\\r\\\r\nAREA #BE5046\\r\\\r\nNUM #E6C07B\\r\q\r\n\r\n$&"
call jrepl %JS% %JR% /f "%~dp0src\AkelFiles\Plugs\Coder\Source\Coder.h" /o - /xseq /m
if errorlevel 2 call :issue

set JR="#define TXT_ONEDARKPRO_VARTHEME_HIGHLIGHT \\\r\nL\qHighLight_FontStyle 0\\r\\\r\nHighLight_FontSize 0\\r\\\r\nHighLight_FaceName \\\q\\\q\\r\\\r\nHighLight_BasicTextColor #ABB2BF\\r\\\r\nHighLight_BasicBkColor #282C34\\r\\\r\nHighLight_SelTextColor #ABB2BF\\r\\\r\nHighLight_SelBkColor #4B595C\\r\\\r\nHighLight_LineTextColor #ABB2BF\\r\\\r\nHighLight_LineBkColor #30333D\\r\\\r\nHighLight_LineBorderColor #404754\\r\\\r\nHighLight_AltTextColor #ABB2BF\\r\\\r\nHighLight_AltBkColor #2C313C\\r\\\r\nHighLight_AltBorderColor #323842\\r\\\r\nHighLight_ColumnColor #7F878B\\r\\\r\nHighLight_MarkerColor #467984\\r\\\r\nHighLight_CaretColor #FFD155\\r\\\r\nHighLight_UrlColor #66C6FF\\r\\\r\nHighLight_ActiveUrlColor #A8DEFF\\r\\\r\nHighLight_VisitUrlColor #A8DEFF\\r\\\r\nHighLight_BkImageFile \\\q\\\q\\r\\\r\nHighLight_BkImageAlpha 128\\r\\\r\nHighLight_AutoMarkFlags 1\\r\\\r\nHighLight_AutoMarkFontStyle 0\\r\\\r\nHighLight_AutoMarkTextColor #ABB2BF\\r\\\r\nHighLight_AutoMarkBkColor #963A46\\r\q\r\n\r\n$&"
call jrepl %JS% %JR% /f "%~dp0src\AkelFiles\Plugs\Coder\Source\Coder.h" /o - /xseq /m
if errorlevel 2 call :issue

set JR="#define TXT_ONEDARKPRO_VARTHEME_CODEFOLD \\\r\nL\qCodeFold_PanelFirstBkColor #2E373A\\r\\\r\nCodeFold_PanelSecondBkColor #2E373A\\r\\\r\nCodeFold_PanelNormalFoldColor #106678\\r\\\r\nCodeFold_PanelActiveFoldColor #A1C2C9\\r\\\r\nCodeFold_PanelNormalNodeOpenBkColor #2E373A\\r\\\r\nCodeFold_PanelNormalNodeCloseBkColor #106678\\r\\\r\nCodeFold_PanelActiveNodeOpenBkColor #2E373A\\r\\\r\nCodeFold_PanelActiveNodeCloseBkColor #A1C2C9\\r\\\r\nCodeFold_PanelNormalNodeOpenSignColor #106678\\r\\\r\nCodeFold_PanelNormalNodeCloseSignColor #76A7B1\\r\\\r\nCodeFold_PanelActiveNodeOpenSignColor #A1C2C9\\r\\\r\nCodeFold_PanelActiveNodeCloseSignColor #2E373A\\r\\\r\nCodeFold_ListTextColor #ABB2BF\\r\\\r\nCodeFold_ListBkColor #282C34\\r\\\r\nCodeFold_TagMarkFlags 0\\r\\\r\nCodeFold_TagMarkFontStyle 1\\r\\\r\nCodeFold_TagMarkTextColor #ABB2BF\\r\\\r\nCodeFold_TagMarkBkColor #4A505E\\r\q\r\n\r\n$&"
call jrepl %JS% %JR% /f "%~dp0src\AkelFiles\Plugs\Coder\Source\Coder.h" /o - /xseq /m
if errorlevel 2 call :issue

set JR="#define TXT_ONEDARKPRO_VARTHEME_AUTOCOMPLETE \\\r\nL\qAutoComplete_ListFontStyle 0\\r\\\r\nAutoComplete_ListFontSize 0\\r\\\r\nAutoComplete_ListFaceName \\\q\\\q\\r\\\r\nAutoComplete_ListLineGap 0\\r\\\r\nAutoComplete_ListBlockIcon \\\q\\\q\\r\\\r\nAutoComplete_ListBlockIconMargins 0;1\\r\\\r\nAutoComplete_ListHlBaseIcon \\\q\\\q\\r\\\r\nAutoComplete_ListHlBaseIconMargins 0;1\\r\\\r\nAutoComplete_ListDocWordIcon \\\q\\\q\\r\\\r\nAutoComplete_ListDocWordIconMargins 0;1\\r\\\r\nAutoComplete_ListBasicTextColor #ABB2BF\\r\\\r\nAutoComplete_ListBasicBkColor #282C34\\r\\\r\nAutoComplete_ListSelTextColor #ABB2BF\\r\\\r\nAutoComplete_ListSelBkColor #4B595C\\r\\\r\nAutoComplete_Indent \\\q  \\\q\\r\q\r\n\r\n$&"
call jrepl %JS% %JR% /f "%~dp0src\AkelFiles\Plugs\Coder\Source\Coder.h" /o - /xseq /m
if errorlevel 2 call :issue

set JR="#define TXT_ONEDARKPRO_VARTHEME_LINEBOARD \\\r\nL\qLineBoard_TextColor #ABB2BF\\r\\\r\nLineBoard_BkColor #4B595C\\r\\\r\nLineBoard_BorderColor #4B595C\\r\\\r\nLineBoard_BookmarkTextColor #ABB2BF\\r\\\r\nLineBoard_BookmarkBkColor #30333D\\r\\\r\nLineBoard_BookmarkBorderColor #404754\\r\\\r\nLineBoard_LineUnsavedColor #FFB13E\\r\\\r\nLineBoard_LineSavedColor #AEDB5B\\r\\\r\nLineBoard_RulerScaleColor #ABB2BF\\r\\\r\nLineBoard_RulerCaretColor #FF3515\\r\q\r\n\r\n$&"
call jrepl %JS% %JR% /f "%~dp0src\AkelFiles\Plugs\Coder\Source\Coder.h" /o - /xseq /m
if errorlevel 2 call :issue

set JR="#define TXT_ONEDARKPRO_VARTHEME_SPECIALCHAR \\\r\nL\qSpecialChar_BasicFontStyle 0\\r\\\r\nSpecialChar_BasicTextColor #4E595E\\r\\\r\nSpecialChar_BasicBkColor 0\\r\\\r\nSpecialChar_SelFontStyle 0\\r\\\r\nSpecialChar_SelTextColor #737C80\\r\\\r\nSpecialChar_SelBkColor 0\\r\q\r\n\r\n$&"
call jrepl %JS% %JR% /f "%~dp0src\AkelFiles\Plugs\Coder\Source\Coder.h" /o - /xseq /m
if errorlevel 2 call :issue

set JR="#define TXT_ONEDARKPRO_VARTHEME_SESSIONS \\\r\nL\qSessions_ListTextColor #ABB2BF\\r\\\r\nSessions_ListBkColor #282C34\\r\q\r\n\r\n$&"
call jrepl %JS% %JR% /f "%~dp0src\AkelFiles\Plugs\Coder\Source\Coder.h" /o - /xseq /m
if errorlevel 2 call :issue

set JR="#define TXT_ONEDARKPRO_VARTHEME (TXT_ONEDARKPRO_VARTHEME_BASIC TXT_ONEDARKPRO_VARTHEME_HIGHLIGHT TXT_ONEDARKPRO_VARTHEME_CODEFOLD TXT_ONEDARKPRO_VARTHEME_AUTOCOMPLETE TXT_ONEDARKPRO_VARTHEME_LINEBOARD TXT_ONEDARKPRO_VARTHEME_SPECIALCHAR TXT_ONEDARKPRO_VARTHEME_SESSIONS)\r\n\r\n$&"
call jrepl %JS% %JR% /f "%~dp0src\AkelFiles\Plugs\Coder\Source\Coder.h" /o - /xseq /m
if errorlevel 2 call :issue

set JS="^( +)(\{L\qObsidian\q, TXT_OBSIDIAN_VARTHEME\},)"
set JR="$1$2\r\n$1{L\qOne Dark Pro\q, TXT_ONEDARKPRO_VARTHEME},"
call jrepl %JS% %JR% /f "%~dp0src\AkelFiles\Plugs\Coder\Source\Coder.c" /o - /xseq /m
if errorlevel 2 call :issue

echo.& cecho {0A}ONEDARKPRO THEME ADDITION IS COMPLETE{#}{\n}


:skip4

if %debugcmd%==0 (>nul timeout /t 3) else (cecho {08} & pause & cecho {#})

exit

:issue
cecho {0C}ERRORLEVEL ^> 1{#}{\n}
pause
