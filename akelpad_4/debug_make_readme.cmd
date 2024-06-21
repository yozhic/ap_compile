@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_readme.cmd                                        ::
@rem :: Location.....: .\                                                     ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

>nul chcp 1251
cd %target%

echo.Неофициальная компиляция>README.TXT
echo.AkelPad 4.9.9 %rev% [%data%] с плагинами>>README.TXT
echo.Версия отладочная (DEBUG)>>README.TXT
echo.>>README.TXT
echo.2 набора:>>README.TXT
echo.32-bit и 64-bit>>README.TXT
echo.>>README.TXT
echo.Последние изменения:>>README.TXT
echo.https://sourceforge.net/p/akelpad/codesvn/%rev:~1%/log/?path=>>README.TXT
echo.>>README.TXT
echo.Особенности компиляции:>>README.TXT
echo.1) Скомпилировано при помощи:>>README.TXT
echo.   Microsoft Visual C++ Toolkit 2003>>README.TXT
echo.   Windows Server 2003 R2 Platform SDK>>README.TXT
echo.2) В окно About добавлена информация о CodeSVN revision.>>README.TXT
echo.3) В свойства dll добавлен комментарий с информацией о CodeSVN revision.>>README.TXT
echo.>>README.TXT
echo.Комментарии к отладочной версии:>>README.TXT
echo.1) В  отладочном  комплекте  отсутствует  комбинированный  набор  x86_x64.  Необходимости в нём нет,>>README.TXT
echo.   поскольку  его  файлы идентичны файлам раздельных наборов. При этом "x64\AkelPad.exe" раздельного>>README.TXT
echo.   идентичен "AkelPad64.exe" комбинированного.>>README.TXT
echo.2) В  отладочной  программе  необходимо  указать  путь к файлам *.pdb AkelPad и проблемных плагинов.>>README.TXT
echo.   Например, в WinDbg это делается в File-^>Symbol file path:>>README.TXT
echo.   C:\akelpad_4\pdb;CACHE*C:\akelpad_4\cache;SRV*http://msdl.microsoft.com/download/symbols>>README.TXT
echo.>>README.TXT
exit