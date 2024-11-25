@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_res_bkp.cmd                                       ::
@rem :: Location.....: .\                                                     ::
@rem :: Encoding.....: ANSI                                                   ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
title BUILD AKELPAD%debugstr1%: BACKUP HANDLING
cd %src%

set plugs=%src%AkelFiles\Plugs
set langs=%src%AkelFiles\Langs\Resources

if exist "%src%Edit.h.bak" (copy /v /y "%src%Edit.h.bak" "%src%Edit.h") else (copy /v /y "%src%Edit.h" "%src%Edit.h.bak")
echo.
if exist "%src%AkelAdmin\Resources\Version.rc.bak" (copy /v /y "%src%AkelAdmin\Resources\Version.rc.bak" "%src%AkelAdmin\Resources\Version.rc") else (copy /v /y "%src%AkelAdmin\Resources\Version.rc" "%src%AkelAdmin\Resources\Version.rc.bak")
if exist  "%src%AkelEdit\Resources\Version.rc.bak" (copy /v /y  "%src%AkelEdit\Resources\Version.rc.bak"  "%src%AkelEdit\Resources\Version.rc") else (copy /v /y  "%src%AkelEdit\Resources\Version.rc"  "%src%AkelEdit\Resources\Version.rc.bak")
echo.
if exist "%plugs%\Clipboard\Source\Resources\Version.rc.bak"      (copy /v /y "%plugs%\Clipboard\Source\Resources\Version.rc.bak"      "%plugs%\Clipboard\Source\Resources\Version.rc")      else (copy /v /y "%plugs%\Clipboard\Source\Resources\Version.rc" "%plugs%\Clipboard\Source\Resources\Version.rc.bak")
if exist "%plugs%\Coder\Source\Resources\Version.rc.bak"          (copy /v /y "%plugs%\Coder\Source\Resources\Version.rc.bak"          "%plugs%\Coder\Source\Resources\Version.rc")          else (copy /v /y "%plugs%\Coder\Source\Resources\Version.rc" "%plugs%\Coder\Source\Resources\Version.rc.bak")
if exist "%plugs%\ContextMenu\Source\Resources\Version.rc.bak"    (copy /v /y "%plugs%\ContextMenu\Source\Resources\Version.rc.bak"    "%plugs%\ContextMenu\Source\Resources\Version.rc")    else (copy /v /y "%plugs%\ContextMenu\Source\Resources\Version.rc" "%plugs%\ContextMenu\Source\Resources\Version.rc.bak")
if exist "%plugs%\Exit\Source\Resources\Version.rc.bak"           (copy /v /y "%plugs%\Exit\Source\Resources\Version.rc.bak"           "%plugs%\Exit\Source\Resources\Version.rc")           else (copy /v /y "%plugs%\Exit\Source\Resources\Version.rc" "%plugs%\Exit\Source\Resources\Version.rc.bak")
if exist "%plugs%\Explorer\Source\Resources\Version.rc.bak"       (copy /v /y "%plugs%\Explorer\Source\Resources\Version.rc.bak"       "%plugs%\Explorer\Source\Resources\Version.rc")       else (copy /v /y "%plugs%\Explorer\Source\Resources\Version.rc" "%plugs%\Explorer\Source\Resources\Version.rc.bak")
if exist "%plugs%\Fonts\Source\Resources\Version.rc.bak"          (copy /v /y "%plugs%\Fonts\Source\Resources\Version.rc.bak"          "%plugs%\Fonts\Source\Resources\Version.rc")          else (copy /v /y "%plugs%\Fonts\Source\Resources\Version.rc" "%plugs%\Fonts\Source\Resources\Version.rc.bak")
if exist "%plugs%\Format\Source\Resources\Version.rc.bak"         (copy /v /y "%plugs%\Format\Source\Resources\Version.rc.bak"         "%plugs%\Format\Source\Resources\Version.rc")         else (copy /v /y "%plugs%\Format\Source\Resources\Version.rc" "%plugs%\Format\Source\Resources\Version.rc.bak")
if exist "%plugs%\FullScreen\Source\Resources\Version.rc.bak"     (copy /v /y "%plugs%\FullScreen\Source\Resources\Version.rc.bak"     "%plugs%\FullScreen\Source\Resources\Version.rc")     else (copy /v /y "%plugs%\FullScreen\Source\Resources\Version.rc" "%plugs%\FullScreen\Source\Resources\Version.rc.bak")
if exist "%plugs%\HexSel\Source\Resources\Version.rc.bak"         (copy /v /y "%plugs%\HexSel\Source\Resources\Version.rc.bak"         "%plugs%\HexSel\Source\Resources\Version.rc")         else (copy /v /y "%plugs%\HexSel\Source\Resources\Version.rc" "%plugs%\HexSel\Source\Resources\Version.rc.bak")
if exist "%plugs%\Hotkeys\Source\Resources\Version.rc.bak"        (copy /v /y "%plugs%\Hotkeys\Source\Resources\Version.rc.bak"        "%plugs%\Hotkeys\Source\Resources\Version.rc")        else (copy /v /y "%plugs%\Hotkeys\Source\Resources\Version.rc" "%plugs%\Hotkeys\Source\Resources\Version.rc.bak")
if exist "%plugs%\LineBoard\Source\Resources\Version.rc.bak"      (copy /v /y "%plugs%\LineBoard\Source\Resources\Version.rc.bak"      "%plugs%\LineBoard\Source\Resources\Version.rc")      else (copy /v /y "%plugs%\LineBoard\Source\Resources\Version.rc" "%plugs%\LineBoard\Source\Resources\Version.rc.bak")
if exist "%plugs%\Log\Source\Resources\Version.rc.bak"            (copy /v /y "%plugs%\Log\Source\Resources\Version.rc.bak"            "%plugs%\Log\Source\Resources\Version.rc")            else (copy /v /y "%plugs%\Log\Source\Resources\Version.rc" "%plugs%\Log\Source\Resources\Version.rc.bak")
if exist "%plugs%\Macros\Source\Resources\Version.rc.bak"         (copy /v /y "%plugs%\Macros\Source\Resources\Version.rc.bak"         "%plugs%\Macros\Source\Resources\Version.rc")         else (copy /v /y "%plugs%\Macros\Source\Resources\Version.rc" "%plugs%\Macros\Source\Resources\Version.rc.bak")
if exist "%plugs%\MinimizeToTray\Source\Resources\Version.rc.bak" (copy /v /y "%plugs%\MinimizeToTray\Source\Resources\Version.rc.bak" "%plugs%\MinimizeToTray\Source\Resources\Version.rc") else (copy /v /y "%plugs%\MinimizeToTray\Source\Resources\Version.rc" "%plugs%\MinimizeToTray\Source\Resources\Version.rc.bak")
if exist "%plugs%\RecentFiles\Source\Resources\Version.rc.bak"    (copy /v /y "%plugs%\RecentFiles\Source\Resources\Version.rc.bak"    "%plugs%\RecentFiles\Source\Resources\Version.rc")    else (copy /v /y "%plugs%\RecentFiles\Source\Resources\Version.rc" "%plugs%\RecentFiles\Source\Resources\Version.rc.bak")
if exist "%plugs%\SaveFile\Source\Resources\Version.rc.bak"       (copy /v /y "%plugs%\SaveFile\Source\Resources\Version.rc.bak"       "%plugs%\SaveFile\Source\Resources\Version.rc")       else (copy /v /y "%plugs%\SaveFile\Source\Resources\Version.rc" "%plugs%\SaveFile\Source\Resources\Version.rc.bak")
if exist "%plugs%\Scripts\Source\Resources\Version.rc.bak"        (copy /v /y "%plugs%\Scripts\Source\Resources\Version.rc.bak"        "%plugs%\Scripts\Source\Resources\Version.rc")        else (copy /v /y "%plugs%\Scripts\Source\Resources\Version.rc" "%plugs%\Scripts\Source\Resources\Version.rc.bak")
if exist "%plugs%\Scroll\Source\Resources\Version.rc.bak"         (copy /v /y "%plugs%\Scroll\Source\Resources\Version.rc.bak"         "%plugs%\Scroll\Source\Resources\Version.rc")         else (copy /v /y "%plugs%\Scroll\Source\Resources\Version.rc" "%plugs%\Scroll\Source\Resources\Version.rc.bak")
if exist "%plugs%\Sessions\Source\Resources\Version.rc.bak"       (copy /v /y "%plugs%\Sessions\Source\Resources\Version.rc.bak"       "%plugs%\Sessions\Source\Resources\Version.rc")       else (copy /v /y "%plugs%\Sessions\Source\Resources\Version.rc" "%plugs%\Sessions\Source\Resources\Version.rc.bak")
if exist "%plugs%\Sounds\Source\Resources\Version.rc.bak"         (copy /v /y "%plugs%\Sounds\Source\Resources\Version.rc.bak"         "%plugs%\Sounds\Source\Resources\Version.rc")         else (copy /v /y "%plugs%\Sounds\Source\Resources\Version.rc" "%plugs%\Sounds\Source\Resources\Version.rc.bak")
if exist "%plugs%\SpecialChar\Source\Resources\Version.rc.bak"    (copy /v /y "%plugs%\SpecialChar\Source\Resources\Version.rc.bak"    "%plugs%\SpecialChar\Source\Resources\Version.rc")    else (copy /v /y "%plugs%\SpecialChar\Source\Resources\Version.rc" "%plugs%\SpecialChar\Source\Resources\Version.rc.bak")
if exist "%plugs%\Stats\Source\Resources\Version.rc.bak"          (copy /v /y "%plugs%\Stats\Source\Resources\Version.rc.bak"          "%plugs%\Stats\Source\Resources\Version.rc")          else (copy /v /y "%plugs%\Stats\Source\Resources\Version.rc" "%plugs%\Stats\Source\Resources\Version.rc.bak")
if exist "%plugs%\ToolBar\Source\Resources\Version.rc.bak"        (copy /v /y "%plugs%\ToolBar\Source\Resources\Version.rc.bak"        "%plugs%\ToolBar\Source\Resources\Version.rc")        else (copy /v /y "%plugs%\ToolBar\Source\Resources\Version.rc" "%plugs%\ToolBar\Source\Resources\Version.rc.bak")
echo.
if exist "%src%AkelFiles\Langs\Resources\Version.rc.bak" (copy /v /y "%src%AkelFiles\Langs\Resources\Version.rc.bak" "%src%AkelFiles\Langs\Resources\Version.rc") else (copy /v /y "%src%AkelFiles\Langs\Resources\Version.rc" "%src%AkelFiles\Langs\Resources\Version.rc.bak")
echo.
if exist "%langs%\Belorussian.rc.bak"           (copy /v /y "%langs%\Belorussian.rc.bak"           "%langs%\Belorussian.rc")           else (copy /v /y "%langs%\Belorussian.rc"           "%langs%\Belorussian.rc.bak")
if exist "%langs%\Brazilian.rc.bak"             (copy /v /y "%langs%\Brazilian.rc.bak"             "%langs%\Brazilian.rc")             else (copy /v /y "%langs%\Brazilian.rc"             "%langs%\Brazilian.rc.bak")
if exist "%langs%\Catalan.rc.bak"               (copy /v /y "%langs%\Catalan.rc.bak"               "%langs%\Catalan.rc")               else (copy /v /y "%langs%\Catalan.rc"               "%langs%\Catalan.rc.bak")
if exist "%langs%\Chinese (Simplified).rc.bak"  (copy /v /y "%langs%\Chinese (Simplified).rc.bak"  "%langs%\Chinese (Simplified).rc")  else (copy /v /y "%langs%\Chinese (Simplified).rc"  "%langs%\Chinese (Simplified).rc.bak")
if exist "%langs%\Chinese (Traditional).rc.bak" (copy /v /y "%langs%\Chinese (Traditional).rc.bak" "%langs%\Chinese (Traditional).rc") else (copy /v /y "%langs%\Chinese (Traditional).rc" "%langs%\Chinese (Traditional).rc.bak")
if exist "%langs%\Czech.rc.bak"                 (copy /v /y "%langs%\Czech.rc.bak"                 "%langs%\Czech.rc")                 else (copy /v /y "%langs%\Czech.rc"                 "%langs%\Czech.rc.bak")
if exist "%langs%\Dutch.rc.bak"                 (copy /v /y "%langs%\Dutch.rc.bak"                 "%langs%\Dutch.rc")                 else (copy /v /y "%langs%\Dutch.rc"                 "%langs%\Dutch.rc.bak")
if exist "%langs%\English.rc.bak"               (copy /v /y "%langs%\English.rc.bak"               "%langs%\English.rc")               else (copy /v /y "%langs%\English.rc"               "%langs%\English.rc.bak")
if exist "%langs%\Finnish.rc.bak"               (copy /v /y "%langs%\Finnish.rc.bak"               "%langs%\Finnish.rc")               else (copy /v /y "%langs%\Finnish.rc"               "%langs%\Finnish.rc.bak")
if exist "%langs%\French.rc.bak"                (copy /v /y "%langs%\French.rc.bak"                "%langs%\French.rc")                else (copy /v /y "%langs%\French.rc"                "%langs%\French.rc.bak")
if exist "%langs%\German.rc.bak"                (copy /v /y "%langs%\German.rc.bak"                "%langs%\German.rc")                else (copy /v /y "%langs%\German.rc"                "%langs%\German.rc.bak")
if exist "%langs%\Greek.rc.bak"                 (copy /v /y "%langs%\Greek.rc.bak"                 "%langs%\Greek.rc")                 else (copy /v /y "%langs%\Greek.rc"                 "%langs%\Greek.rc.bak")
if exist "%langs%\Hungarian.rc.bak"             (copy /v /y "%langs%\Hungarian.rc.bak"             "%langs%\Hungarian.rc")             else (copy /v /y "%langs%\Hungarian.rc"             "%langs%\Hungarian.rc.bak")
if exist "%langs%\Italian.rc.bak"               (copy /v /y "%langs%\Italian.rc.bak"               "%langs%\Italian.rc")               else (copy /v /y "%langs%\Italian.rc"               "%langs%\Italian.rc.bak")
if exist "%langs%\Japanese.rc.bak"              (copy /v /y "%langs%\Japanese.rc.bak"              "%langs%\Japanese.rc")              else (copy /v /y "%langs%\Japanese.rc"              "%langs%\Japanese.rc.bak")
if exist "%langs%\Korean.rc.bak"                (copy /v /y "%langs%\Korean.rc.bak"                "%langs%\Korean.rc")                else (copy /v /y "%langs%\Korean.rc"                "%langs%\Korean.rc.bak")
if exist "%langs%\Polish.rc.bak"                (copy /v /y "%langs%\Polish.rc.bak"                "%langs%\Polish.rc")                else (copy /v /y "%langs%\Polish.rc"                "%langs%\Polish.rc.bak")
if exist "%langs%\Romanian.rc.bak"              (copy /v /y "%langs%\Romanian.rc.bak"              "%langs%\Romanian.rc")              else (copy /v /y "%langs%\Romanian.rc"              "%langs%\Romanian.rc.bak")
if exist "%langs%\Russian.rc.bak"               (copy /v /y "%langs%\Russian.rc.bak"               "%langs%\Russian.rc")               else (copy /v /y "%langs%\Russian.rc"               "%langs%\Russian.rc.bak")
if exist "%langs%\Slovak.rc.bak"                (copy /v /y "%langs%\Slovak.rc.bak"                "%langs%\Slovak.rc")                else (copy /v /y "%langs%\Slovak.rc"                "%langs%\Slovak.rc.bak")
if exist "%langs%\Spanish.rc.bak"               (copy /v /y "%langs%\Spanish.rc.bak"               "%langs%\Spanish.rc")               else (copy /v /y "%langs%\Spanish.rc"               "%langs%\Spanish.rc.bak")
if exist "%langs%\Ukrainian.rc.bak"             (copy /v /y "%langs%\Ukrainian.rc.bak"             "%langs%\Ukrainian.rc")             else (copy /v /y "%langs%\Ukrainian.rc"             "%langs%\Ukrainian.rc.bak")
if exist "%langs%\Uzbek.rc.bak"                 (copy /v /y "%langs%\Uzbek.rc.bak"                 "%langs%\Uzbek.rc")                 else (copy /v /y "%langs%\Uzbek.rc"                 "%langs%\Uzbek.rc.bak")
echo.
if exist "%plugs%\Coder\Source\Coder.h.bak" (copy /v /y "%plugs%\Coder\Source\Coder.h.bak" "%plugs%\Coder\Source\Coder.h") else (copy /v /y "%plugs%\Coder\Source\Coder.h" "%plugs%\Coder\Source\Coder.h.bak")
if exist "%plugs%\Coder\Source\Coder.c.bak" (copy /v /y "%plugs%\Coder\Source\Coder.c.bak" "%plugs%\Coder\Source\Coder.c") else (copy /v /y "%plugs%\Coder\Source\Coder.c" "%plugs%\Coder\Source\Coder.c.bak")

echo.& echo.
if "%debug%"=="0" (
  %cechox% {0A}BACKUPS REFRESHED{#}{\n}
) else (
  %cechox% {0B}BACKUPS REFRESHED{#}{\n}
)

if %debugcmd%==0 (>nul timeout /t 2) else ("%cechox%" {08} & pause & "%cechox%" {#})

exit