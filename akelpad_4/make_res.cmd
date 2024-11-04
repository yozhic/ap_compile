@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_res.cmd                                           ::
@rem :: Location.....: .\                                                     ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
cd %root%
if %toolbarx%==0 (
  echo.& %cechox% {06} ToolBarExtra creation is canceled{#}{\n}
  goto :skip1
)
title BUILD AKELPAD: CREATE TOOLBAREXTRA SOURCE
echo. & echo Create ToolBarExtra.c ...

pushd src\AkelFiles\Plugs\ToolBar\Source\
type ToolBar.c > ToolBarExtra.c
>nul timeout /t 1

"%AKELPAD%" /NewInstance /MainClass("BuildAkelPad4") /Show(0) /OpenFile("%~dp0src\AkelFiles\Plugs\ToolBar\Source\ToolBarExtra.c") ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'pv-^>pPluginName="ToolBar";','pv-^>pPluginName="ToolBarExtra";',0x200001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.Command(4105); AkelPad.Command(4324); AkelPad.SendMessage(AkelPad.GetMainWnd(),1238,8,0);`) ^
          /Quit

cd Resources\
echo Make ToolBarExtra.rc ...
type ToolBar.rc > ToolBarExtra.rc
>nul timeout /t 1

"%AKELPAD%" /NewInstance /MainClass("BuildAkelPad4") /Show(0) /OpenFile("%~dp0src\AkelFiles\Plugs\ToolBar\Source\Resources\ToolBarExtra.rc") ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,"(?m)^IDI_ICON_(0[1-9]|[12][0-9]|3[0-8])\\x20+ICON\\x20+DISCARDABLE\\x20+\\x22(0[1-9]|[12][0-9]|3[0-8])\\.ico\\x22\\n",'',0x280001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'"00.ico"','"38.ico"',0x200001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.Command(4105); AkelPad.Command(4324); AkelPad.SendMessage(AkelPad.GetMainWnd(),1238,8,0);`) ^
          /Quit

echo.& %cechox% {0A}TOOLBAREXTRA SOURCE CREATION IS COMPLETE{#}{\n}
>nul timeout /t 1
popd

:skip1
if "%cont%"=="0" (
  echo.& %cechox% {06} Resource editing is canceled{#}{\n}
  goto :skip3
)

title BUILD AKELPAD%debugstr1%: EDIT ABOUT INFO
echo.& echo Edit About window Info...
"%AKELPAD%" /NewInstance /MainClass("BuildAkelPad4") /Show(0) /OpenFile("%~dp0src\Edit.h") ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'AkelPad 4.10.0 (x64)','AkelPad 4.10.0 (x64) [%rev%]%debugstr1%',0x200001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'AkelPad 4.10.0 (x86)','AkelPad 4.10.0 (x86) [%rev%]%debugstr1%',0x200001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.Command(4105); AkelPad.Command(4324); AkelPad.SendMessage(AkelPad.GetMainWnd(),1238,8,0);`) ^
          /Quit
if "%debug%"=="0" (
  %cechox% {0A}ABOUT INFO EDITING IS COMPLETE{#}{\n}
) else (
  %cechox% {0B}ABOUT INFO EDITING IS COMPLETE{#}{\n}
)

title BUILD AKELPAD%debugstr1%: EDIT VERSION.RC
echo.& echo Edit .\src\AkelAdmin\Resources\Version.rc
"%AKELPAD%" /NewInstance /MainClass("BuildAkelPad4") /Show(0) /OpenFile("%~dp0src\AkelAdmin\Resources\Version.rc") ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'(?m)^^(\\x20+)VALUE "FileDescription"','\\1VALUE "Comments", "%debugstr2%CodeSVN revision %rev:~1% [%data%]\\\\0"\\n\\0',0x280001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.Command(4105); AkelPad.Command(4324); AkelPad.SendMessage(AkelPad.GetMainWnd(),1238,8,0);`) ^
          /Quit

echo Edit .\src\AkelEdit\Resources\Version.rc
"%AKELPAD%" /NewInstance /MainClass("BuildAkelPad4") /Show(0) /OpenFile("%~dp0src\AkelEdit\Resources\Version.rc") ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'(?m)^^(\\x20+)VALUE "FileDescription"','\\1VALUE "Comments", "%debugstr2%CodeSVN revision %rev:~1% [%data%]\\\\0"\\n\\0',0x280001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.Command(4105); AkelPad.Command(4324); AkelPad.SendMessage(AkelPad.GetMainWnd(),1238,8,0);`) ^
          /Quit

echo Edit .\src\AkelFiles\Langs\Resources\version.h
"%AKELPAD%" /NewInstance /MainClass("BuildAkelPad4") /Show(0) /OpenFile("%~dp0src\AkelFiles\Langs\Resources\version.h") ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'text editor','text editor. R%rev:~1% Dev Preview.',0x200001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.Command(4105); AkelPad.Command(4324); AkelPad.SendMessage(AkelPad.GetMainWnd(),1238,8,0);`) ^
          /Quit
echo.

for /r "%~dp0src\AkelFiles\Plugs" %%f in (Version.rc) do if exist %%f echo Edit %%f & "%AKELPAD%" /NewInstance /MainClass("BuildAkelPad4") /Show(0) /OpenFile("%%f") /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'(?m)^^(\\x20+)VALUE "FileDescription"','\\1VALUE "Comments", "%debugstr2%CodeSVN revision %rev:~1% [%data%]\\\\0"\\n\\0',0x280001,0x1); AkelPad.Command(4105); AkelPad.Command(4324); AkelPad.SendMessage(AkelPad.GetMainWnd(),1238,8,0);`) /Quit

if "%debug%"=="1" goto :skip2

echo.& echo Edit .\src\AkelFiles\Langs\Resources\Version.rc
"%AKELPAD%" /NewInstance /MainClass("BuildAkelPad4") /Show(0) /OpenFile("%~dp0src\AkelFiles\Langs\Resources\Version.rc") ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'(?m)^^(\\x20+)VALUE "FileDescription"','\\1VALUE "Comments", "CodeSVN revision %rev:~1% [%data%]\\\\0"\\n\\0',0x280001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.Command(4105); AkelPad.Command(4324); AkelPad.SendMessage(AkelPad.GetMainWnd(),1238,8,0);`) ^
          /Quit
echo.

for /r "%~dp0src\AkelFiles\Langs\Resources" %%f in (*.rc) do if exist %%f echo Edit %%f & "%AKELPAD%" /NewInstance /MainClass("BuildAkelPad4") /Show(0) /OpenFile("%%f") /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'2006-2017','2006-2024',0x200001,0x1); AkelPad.Command(4105); AkelPad.Command(4324); AkelPad.SendMessage(AkelPad.GetMainWnd(),1238,8,0);`) /Quit

:skip2
echo.
if "%debug%"=="0" (
  %cechox% {0A}ALL VERSION.RC EDITING IS COMPLETE{#}{\n}
) else (
  %cechox% {0B}ALL VERSION.RC EDITING IS COMPLETE{#}{\n}
)

:skip3
if "%buns%"=="0" (
  echo.& %cechox% {06} Extra additions is canceled{#}{\n}
  goto :skip4
)

title BUILD AKELPAD: CORRECT SOLARIZED LIGHT THEME
echo.& echo Correct selection colors in Solarized Light Theme...
rem :: Источник: предложение DV https://akelpad.sourceforge.net/forum/viewtopic.php?p=31774#p31774
"%AKELPAD%" /NewInstance /MainClass("BuildAkelPad4") /Show(0) /OpenFile("%~dp0src\AkelFiles\Plugs\Coder\Source\Coder.h") ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'HighLight_SelTextColor #586E75\\r\\','HighLight_SelTextColor #FDF6E3\\r\\',0x200001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'HighLight_SelBkColor #FFFFFF\\r\\','HighLight_SelBkColor #586E75\\r\\',0x200001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.Command(4105); AkelPad.Command(4324); AkelPad.SendMessage(AkelPad.GetMainWnd(),1238,8,0);`) ^
          /Quit
%cechox% {0A}SOLARIZED LIGHT THEME CORRECTION IS COMPLETE{#}{\n}

title BUILD AKELPAD: ADD ONEDARKPRO THEME
echo.& echo Add One Dark Pro Theme...
rem :: Источник: предложение Rinat https://akelpad.sourceforge.net/forum/viewtopic.php?p=36161#p36161
"%AKELPAD%" /NewInstance /MainClass("BuildAkelPad4") /Show(0) /OpenFile("%~dp0src\AkelFiles\Plugs\Coder\Source\Coder.h") ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'//Solarized Light variable theme', ^
          '//ONEDARKPRO variable theme\\n#define TXT_ONEDARKPRO_VARTHEME_BASIC \\\\\\nL"STR #98C379\\\\r\\\\\\nCOMM #5C6370\\\\r\\\\\\nVAR #C678DD\\\\r\\\\\\nDEL1 #E6C07B\\\\r\\\\\\nDEL2 #56B6C2\\\\r\\\\\\nTYPE #61AEEE\\\\r\\\\\\nOP #C678DD\\\\r\\\\\\nTAG #E06C75\\\\r\\\\\\nATTR #D19A66\\\\r\\\\\\nIF #C678DD\\\\r\\\\\\nAREA #BE5046\\\\r\\\\\\nNUM #E6C07B\\\\r"\\n\\n//Solarized Light variable theme', 0xA00001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'//Solarized Light variable theme', ^
          '#define TXT_ONEDARKPRO_VARTHEME_HIGHLIGHT \\\\\\nL"HighLight_FontStyle 0\\\\r\\\\\\nHighLight_FontSize 0\\\\r\\\\\\nHighLight_FaceName \\\\"\\\\"\\\\r\\\\\\nHighLight_BasicTextColor #ABB2BF\\\\r\\\\\\nHighLight_BasicBkColor #282C34\\\\r\\\\\\nHighLight_SelTextColor #ABB2BF\\\\r\\\\\\nHighLight_SelBkColor #4B595C\\\\r\\\\\\nHighLight_LineTextColor #ABB2BF\\\\r\\\\\\nHighLight_LineBkColor #30333D\\\\r\\\\\\nHighLight_LineBorderColor #404754\\\\r\\\\\\nHighLight_AltTextColor #ABB2BF\\\\r\\\\\\nHighLight_AltBkColor #2C313C\\\\r\\\\\\nHighLight_AltBorderColor #323842\\\\r\\\\\\nHighLight_ColumnColor #7F878B\\\\r\\\\\\nHighLight_MarkerColor #467984\\\\r\\\\\\nHighLight_CaretColor #FFD155\\\\r\\\\\\nHighLight_UrlColor #66C6FF\\\\r\\\\\\nHighLight_ActiveUrlColor #A8DEFF\\\\r\\\\\\nHighLight_VisitUrlColor #A8DEFF\\\\r\\\\\\nHighLight_BkImageFile \\\\"\\\\"\\\\r\\\\\\nHighLight_BkImageAlpha 128\\\\r\\\\\\nHighLight_AutoMarkFlags 1\\\\r\\\\\\nHighLight_AutoMarkFontStyle 0\\\\r\\\\\\nHighLight_AutoMarkTextColor #ABB2BF\\\\r\\\\\\nHighLight_AutoMarkBkColor #963A46\\\\r"\\n\\n//Solarized Light variable theme', 0xA00001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'//Solarized Light variable theme', ^
          '#define TXT_ONEDARKPRO_VARTHEME_CODEFOLD \\\\\\nL"CodeFold_PanelFirstBkColor #2E373A\\\\r\\\\\\nCodeFold_PanelSecondBkColor #2E373A\\\\r\\\\\\nCodeFold_PanelNormalFoldColor #106678\\\\r\\\\\\nCodeFold_PanelActiveFoldColor #A1C2C9\\\\r\\\\\\nCodeFold_PanelNormalNodeOpenBkColor #2E373A\\\\r\\\\\\nCodeFold_PanelNormalNodeCloseBkColor #106678\\\\r\\\\\\nCodeFold_PanelActiveNodeOpenBkColor #2E373A\\\\r\\\\\\nCodeFold_PanelActiveNodeCloseBkColor #A1C2C9\\\\r\\\\\\nCodeFold_PanelNormalNodeOpenSignColor #106678\\\\r\\\\\\nCodeFold_PanelNormalNodeCloseSignColor #76A7B1\\\\r\\\\\\nCodeFold_PanelActiveNodeOpenSignColor #A1C2C9\\\\r\\\\\\nCodeFold_PanelActiveNodeCloseSignColor #2E373A\\\\r\\\\\\nCodeFold_ListTextColor #ABB2BF\\\\r\\\\\\nCodeFold_ListBkColor #282C34\\\\r\\\\\\nCodeFold_TagMarkFlags 0\\\\r\\\\\\nCodeFold_TagMarkFontStyle 1\\\\r\\\\\\nCodeFold_TagMarkTextColor #ABB2BF\\\\r\\\\\\nCodeFold_TagMarkBkColor #4A505E\\\\r"\\n\\n//Solarized Light variable theme', 0xA00001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'//Solarized Light variable theme', ^
          '#define TXT_ONEDARKPRO_VARTHEME_AUTOCOMPLETE \\\\\\nL"AutoComplete_ListFontStyle 0\\\\r\\\\\\nAutoComplete_ListFontSize 0\\\\r\\\\\\nAutoComplete_ListFaceName \\\\"\\\\"\\\\r\\\\\\nAutoComplete_ListLineGap 0\\\\r\\\\\\nAutoComplete_ListBlockIcon \\\\"\\\\"\\\\r\\\\\\nAutoComplete_ListBlockIconMargins 0;1\\\\r\\\\\\nAutoComplete_ListHlBaseIcon \\\\"\\\\"\\\\r\\\\\\nAutoComplete_ListHlBaseIconMargins 0;1\\\\r\\\\\\nAutoComplete_ListDocWordIcon \\\\"\\\\"\\\\r\\\\\\nAutoComplete_ListDocWordIconMargins 0;1\\\\r\\\\\\nAutoComplete_ListBasicTextColor #ABB2BF\\\\r\\\\\\nAutoComplete_ListBasicBkColor #282C34\\\\r\\\\\\nAutoComplete_ListSelTextColor #ABB2BF\\\\r\\\\\\nAutoComplete_ListSelBkColor #4B595C\\\\r\\\\\\nAutoComplete_Indent \\\\"  \\\\"\\\\r"\\n\\n//Solarized Light variable theme', 0xA00001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'//Solarized Light variable theme', ^
          '#define TXT_ONEDARKPRO_VARTHEME_LINEBOARD \\\\\\nL"LineBoard_TextColor #ABB2BF\\\\r\\\\\\nLineBoard_BkColor #4B595C\\\\r\\\\\\nLineBoard_BorderColor #4B595C\\\\r\\\\\\nLineBoard_BookmarkTextColor #ABB2BF\\\\r\\\\\\nLineBoard_BookmarkBkColor #30333D\\\\r\\\\\\nLineBoard_BookmarkBorderColor #404754\\\\r\\\\\\nLineBoard_LineUnsavedColor #FFB13E\\\\r\\\\\\nLineBoard_LineSavedColor #AEDB5B\\\\r\\\\\\nLineBoard_RulerScaleColor #ABB2BF\\\\r\\\\\\nLineBoard_RulerCaretColor #FF3515\\\\r"\\n\\n//Solarized Light variable theme', 0xA00001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'//Solarized Light variable theme', ^
          '#define TXT_ONEDARKPRO_VARTHEME_SPECIALCHAR \\\\\\nL"SpecialChar_BasicFontStyle 0\\\\r\\\\\\nSpecialChar_BasicTextColor #4E595E\\\\r\\\\\\nSpecialChar_BasicBkColor 0\\\\r\\\\\\nSpecialChar_SelFontStyle 0\\\\r\\\\\\nSpecialChar_SelTextColor #737C80\\\\r\\\\\\nSpecialChar_SelBkColor 0\\\\r"\\n\\n//Solarized Light variable theme', 0xA00001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'//Solarized Light variable theme', ^
          '#define TXT_ONEDARKPRO_VARTHEME_SESSIONS \\\\\\nL"Sessions_ListTextColor #ABB2BF\\\\r\\\\\\nSessions_ListBkColor #282C34\\\\r"\\n\\n//Solarized Light variable theme', 0xA00001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'//Solarized Light variable theme', ^
          '#define TXT_ONEDARKPRO_VARTHEME (TXT_ONEDARKPRO_VARTHEME_BASIC TXT_ONEDARKPRO_VARTHEME_HIGHLIGHT TXT_ONEDARKPRO_VARTHEME_CODEFOLD TXT_ONEDARKPRO_VARTHEME_AUTOCOMPLETE TXT_ONEDARKPRO_VARTHEME_LINEBOARD TXT_ONEDARKPRO_VARTHEME_SPECIALCHAR TXT_ONEDARKPRO_VARTHEME_SESSIONS)\\n\\n//Solarized Light variable theme', 0xA00001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.Command(4105); AkelPad.Command(4324); AkelPad.SendMessage(AkelPad.GetMainWnd(),1238,8,0);`) ^
          /Quit
"%AKELPAD%" /NewInstance /MainClass("BuildAkelPad4") /Show(0) /OpenFile("%~dp0src\AkelFiles\Plugs\Coder\Source\Coder.c") ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.TextReplace(0,'\^( +)(\\{L"Obsidian", TXT_OBSIDIAN_VARTHEME\\},)','\\1\\2\\n\\1{L"One Dark Pro", TXT_ONEDARKPRO_VARTHEME},',0x280001,0x1);`) ^
          /Call('Scripts::Main',4,'EvalCmd.js',`AkelPad.Command(4105); AkelPad.Command(4324); AkelPad.SendMessage(AkelPad.GetMainWnd(),1238,8,0);`) ^
          /Quit
%cechox% {0A}ONEDARKPRO THEME ADDITION IS COMPLETE{#}{\n}


:skip4

if %debugcmd%==0 (>nul timeout /t 3) else ("%cechox%" {08} & pause & "%cechox%" {#})

exit