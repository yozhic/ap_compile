@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_readme.cmd                                        ::
@rem :: Location.....: .\                                                     ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

>nul chcp 1251
cd %target%

echo.������������� ����������>README.TXT
echo.AkelPad 4.9.9 %rev% [%data%] � ���������>>README.TXT
echo.������ ���������� (DEBUG)>>README.TXT
echo.>>README.TXT
echo.2 ������:>>README.TXT
echo.32-bit � 64-bit>>README.TXT
echo.>>README.TXT
echo.��������� ���������:>>README.TXT
echo.https://sourceforge.net/p/akelpad/codesvn/%rev:~1%/log/?path=>>README.TXT
echo.>>README.TXT
echo.����������� ����������:>>README.TXT
echo.1) �������������� ��� ������:>>README.TXT
echo.   Microsoft Visual C++ Toolkit 2003>>README.TXT
echo.   Windows Server 2003 R2 Platform SDK>>README.TXT
echo.2) � ���� About ��������� ���������� � CodeSVN revision.>>README.TXT
echo.3) � �������� dll �������� ����������� � ����������� � CodeSVN revision.>>README.TXT
echo.>>README.TXT
echo.����������� � ���������� ������:>>README.TXT
echo.1) �  ����������  ���������  �����������  ���������������  �����  x86_x64.  ������������� � �� ���,>>README.TXT
echo.   ���������  ���  ����� ��������� ������ ���������� �������. ��� ���� "x64\AkelPad.exe" �����������>>README.TXT
echo.   ��������� "AkelPad64.exe" ����������������.>>README.TXT
echo.2) �  ����������  ���������  ����������  �������  ���� � ������ *.pdb AkelPad � ���������� ��������.>>README.TXT
echo.   ��������, � WinDbg ��� �������� � File-^>Symbol file path:>>README.TXT
echo.   C:\akelpad_4\pdb;CACHE*C:\akelpad_4\cache;SRV*http://msdl.microsoft.com/download/symbols>>README.TXT
echo.>>README.TXT
exit