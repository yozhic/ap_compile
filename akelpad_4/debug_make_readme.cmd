@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_readme.cmd                                        ::
@rem :: Location.....: .\                                                     ::
@rem :: Encoding.....: ANSI                                                   ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

>nul chcp 1251
cd %target%

for /f "delims=" %%A in ('ver') do set V=%%A

echo.Неофициальная компиляция>README.TXT
echo.AkelPad 4.10.0 %rev% [%data%] с плагинами>>README.TXT
echo.Версия отладочная (DEBUG)>>README.TXT
echo.>>README.TXT
echo.2 набора:>>README.TXT
echo.32-bit и 64-bit>>README.TXT
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
echo.Комментарии к отладочной версии:>>README.TXT
echo.-  В  отладочном  комплекте  отсутствует  комбинированный  набор  x86_x64.  Необходимости в нём нет,>>README.TXT
echo.   поскольку  его  файлы идентичны файлам раздельных наборов. При этом "x64\AkelPad.exe" раздельного>>README.TXT
echo.   идентичен "AkelPad64.exe" комбинированного.>>README.TXT
echo.>>README.TXT
echo.Отладка в программе WinDbg:>>README.TXT
echo.1)  Устанавливаем WinDbg, если не установлен:>>README.TXT
echo.    https://apps.microsoft.com/detail/9pgjgd53tn86>>README.TXT
echo.2)  В корне диска c:\ создаём папку `akelpad_4`, внутри неё папки `cache`, `pdb` и `src`.>>README.TXT
echo.3)  Скачиваем исходный код AkelPad по ссылке:>>README.TXT
echo.    https://sourceforge.net/p/akelpad/codesvn/%rev:~1%/tarball?path=/trunk/akelpad_4>>README.TXT
echo.    в открывшемся окне жмём кнопку `Resubmit Snapshot Request`,>>README.TXT
echo.    распаковываем архив в папку `src`. Дерево д.б. следующим:>>README.TXT
echo.    c:\akelpad_4\src\AkelPad.c>>README.TXT
echo.4)  В  папку  `pdb`  копируем файлы  *.pdb из данного отладочного архива, в соответствии с битностью>>README.TXT
echo.    испытуемой программы. Дерево д.б. следующим: c:\akelpad_4\pdb\AkelPad.pdb>>README.TXT
echo.5)  В настройках WinDbg File-^>Settings-^>Debugging settings-^>Default symbol path вводим:>>README.TXT
echo.    C:\akelpad_4\pdb;CACHE*C:\akelpad_4\cache;SRV*http://msdl.microsoft.com/download/symbols>>README.TXT
echo.    сохраняем настройки.>>README.TXT
echo.6)  Жмём  F6,  выбираем  AkelPad.exe  из  списка  процессов. Во вкладке Commands, в последней строке>>README.TXT
echo.    должно отобразиться `int 3`.>>README.TXT
echo.7)  Жмём F5, запускается отладка.>>README.TXT
echo.8)  Переходим в окно AkelPad, воспроизводим баг.>>README.TXT
echo.9)  Возвращаемся в окно WinDbg, в ком-строке вводим `!analyze -v`, жмём Enter,>>README.TXT
echo.    сформированный отчёт копируем в текстовый файл.>>README.TXT
echo.    В ком-строке вводим `~*k`, жмём Enter,>>README.TXT
echo.    сформированный отчёт копируем в текстовый файл.>>README.TXT
echo.    В ком-строке вводим `~*kv`, жмём Enter,>>README.TXT
echo.    сформированный отчёт копируем в текстовый файл.>>README.TXT
echo.10) Высылаем файлы с отчётами разработчику.>>README.TXT
echo.>>README.TXT
exit