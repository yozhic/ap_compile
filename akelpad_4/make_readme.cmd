@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_readme.cmd                                        ::
@rem :: Location.....: .\                                                     ::
@rem :: Encoding.....: ANSI                                                   ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

>nul chcp 1251
cd %target%

for /f "delims=" %%A in ('ver') do set V=%%A

echo.Неофициальная компиляция>README.TXT
if "%extras%"=="0" (
  echo.AkelPad 4.10.0 %rev% [%data%] с плагинами>>README.TXT
) else (
  echo.AkelPad 4.10.0 %rev% [%data%]>>README.TXT
  echo.с плагинами ^(по списку на akelpad.sf.net^) и AkelUpdater>>README.TXT
)
echo.>>README.TXT
echo.3 набора:>>README.TXT
echo.32-bit; 64-bit; комбинированный>>README.TXT
echo.>>README.TXT
echo.Последние изменения:>>README.TXT
echo.https://sourceforge.net/p/akelpad/codesvn/%rev:~1%/log/?path=>>README.TXT
echo.>>README.TXT
echo.Особенности компиляции:>>README.TXT
echo.1) Скомпилировано на %V%>>README.TXT
echo.2) Скомпилировано при помощи:>>README.TXT
echo.   Microsoft Visual C++ Toolkit 2003>>README.TXT
echo.   Windows Server 2003 R2 Platform SDK>>README.TXT
echo.   NSIS 2.51 для AkelUpdater>>README.TXT
echo.3) В окно About добавлена информация о CodeSVN revision.>>README.TXT
echo.4) В свойства dll добавлен комментарий с информацией о CodeSVN revision.>>README.TXT
echo.>>README.TXT
exit