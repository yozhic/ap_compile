@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_readme.cmd                                        ::
@rem :: Location.....: .\                                                     ::
@rem :: Encoding.....: ANSI                                                   ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

>nul chcp 1251
cd %target%

for /f "delims=" %%A in ('ver') do set V=%%A

echo.������������� ����������>README.TXT
if "%extras%"=="0" (
  echo.AkelPad 4.10.0 %rev% [%data%] � ���������>>README.TXT
) else (
  echo.AkelPad 4.10.0 %rev% [%data%]>>README.TXT
  echo.� ��������� ^(�� ������ �� akelpad.sf.net^) � AkelUpdater>>README.TXT
)
echo.>>README.TXT
echo.3 ������:>>README.TXT
echo.32-bit; 64-bit; ���������������>>README.TXT
echo.>>README.TXT
echo.��������� ���������:>>README.TXT
echo.https://sourceforge.net/p/akelpad/codesvn/%rev:~1%/log/?path=>>README.TXT
echo.>>README.TXT
echo.����������� ����������:>>README.TXT
echo.1) �������������� �� %V%>>README.TXT
echo.2) �������������� ��� ������:>>README.TXT
echo.   Microsoft Visual C++ Toolkit 2003>>README.TXT
echo.   Windows Server 2003 R2 Platform SDK>>README.TXT
echo.   NSIS 2.51 ��� AkelUpdater>>README.TXT
echo.3) � ���� About ��������� ���������� � CodeSVN revision.>>README.TXT
echo.4) � �������� dll �������� ����������� � ����������� � CodeSVN revision.>>README.TXT
echo.>>README.TXT
exit