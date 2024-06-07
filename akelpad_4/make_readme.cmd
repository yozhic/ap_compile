@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_readme.cmd                                        ::
@rem :: Location.....: .\                                                     ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

>nul chcp 1251
cd %target%

echo.Неофициальная компиляция>README.TXT
echo.AkelPad 4.9.9 %rev% [%data%]>>README.TXT
echo.с плагинами (по списку на akelpad.sf.net) и AkelUpdater>>README.TXT
echo.>>README.TXT
echo.3 набора:>>README.TXT
echo.32-bit; 64-bit; комбинированный>>README.TXT
echo.>>README.TXT
echo.Скомпилировано при помощи:>>README.TXT
echo.Microsoft Visual C++ Toolkit 2003>>README.TXT
echo.Windows Server 2003 R2 Platform SDK>>README.TXT
echo.>>README.TXT
echo.Особенности:>>README.TXT
echo.1) В окно About добавлена информация о revision.>>README.TXT
echo.2) В свойства dll добавлен комментарий с информацией о revision.>>README.TXT
echo.>>README.TXT
echo.Последние изменения:>>README.TXT
echo.https://sourceforge.net/p/akelpad/codesvn/%rev:~1%/log/?path=>>README.TXT
echo.>>README.TXT
exit