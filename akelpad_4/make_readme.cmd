@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_readme.cmd                                        ::
@rem :: Location.....: .\                                                     ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

>nul chcp 1251
cd %target%

echo.������������� ����������>README.TXT
echo.AkelPad 4.9.9 %rev% [%data%]>>README.TXT
echo.� ��������� (�� ������ �� akelpad.sf.net) � AkelUpdater>>README.TXT
echo.>>README.TXT
echo.3 ������:>>README.TXT
echo.32-bit; 64-bit; ���������������>>README.TXT
echo.>>README.TXT
echo.�������������� ��� ������:>>README.TXT
echo.Microsoft Visual C++ Toolkit 2003>>README.TXT
echo.Windows Server 2003 R2 Platform SDK>>README.TXT
echo.>>README.TXT
echo.�����������:>>README.TXT
echo.1) � ���� About ��������� ���������� � revision.>>README.TXT
echo.2) � �������� dll �������� ����������� � ����������� � revision.>>README.TXT
echo.>>README.TXT
echo.��������� ���������:>>README.TXT
echo.https://sourceforge.net/p/akelpad/codesvn/%rev:~1%/log/?path=>>README.TXT
echo.>>README.TXT
exit