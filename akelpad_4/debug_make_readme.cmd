@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@rem :: Script.......: make_readme.cmd                                        ::
@rem :: Location.....: .\                                                     ::
@rem :: Encoding.....: ANSI                                                   ::
@rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

>nul chcp 1251
cd %target%

for /f "delims=" %%A in ('ver') do set V=%%A

echo.������������� ����������>README.TXT
echo.AkelPad 4.10.0 %rev% [%data%] � ���������>>README.TXT
echo.������ ���������� (DEBUG)>>README.TXT
echo.>>README.TXT
echo.2 ������:>>README.TXT
echo.32-bit � 64-bit>>README.TXT
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
echo.����������� � ���������� ������:>>README.TXT
echo.-  �  ����������  ���������  �����������  ���������������  �����  x86_x64.  ������������� � �� ���,>>README.TXT
echo.   ���������  ���  ����� ��������� ������ ���������� �������. ��� ���� "x64\AkelPad.exe" �����������>>README.TXT
echo.   ��������� "AkelPad64.exe" ����������������.>>README.TXT
echo.>>README.TXT
echo.������� � ��������� WinDbg:>>README.TXT
echo.1)  ������������� WinDbg, ���� �� ����������:>>README.TXT
echo.    https://apps.microsoft.com/detail/9pgjgd53tn86>>README.TXT
echo.2)  � ����� ����� c:\ ������ ����� `akelpad_4`, ������ �� ����� `cache`, `pdb` � `src`.>>README.TXT
echo.3)  ��������� �������� ��� AkelPad �� ������:>>README.TXT
echo.    https://sourceforge.net/p/akelpad/codesvn/%rev:~1%/tarball?path=/trunk/akelpad_4>>README.TXT
echo.    � ����������� ���� ��� ������ `Resubmit Snapshot Request`,>>README.TXT
echo.    ������������� ����� � ����� `src`. ������ �.�. ���������:>>README.TXT
echo.    c:\akelpad_4\src\AkelPad.c>>README.TXT
echo.4)  �  �����  `pdb`  �������� �����  *.pdb �� ������� ����������� ������, � ������������ � ���������>>README.TXT
echo.    ���������� ���������. ������ �.�. ���������: c:\akelpad_4\pdb\AkelPad.pdb>>README.TXT
echo.5)  � ���������� WinDbg File-^>Settings-^>Debugging settings-^>Default symbol path ������:>>README.TXT
echo.    C:\akelpad_4\pdb;CACHE*C:\akelpad_4\cache;SRV*http://msdl.microsoft.com/download/symbols>>README.TXT
echo.    ��������� ���������.>>README.TXT
echo.6)  ���  F6,  ��������  AkelPad.exe  ��  ������  ���������. �� ������� Commands, � ��������� ������>>README.TXT
echo.    ������ ������������ `int 3`.>>README.TXT
echo.7)  ��� F5, ����������� �������.>>README.TXT
echo.8)  ��������� � ���� AkelPad, ������������� ���.>>README.TXT
echo.9)  ������������ � ���� WinDbg, � ���-������ ������ `!analyze -v`, ��� Enter,>>README.TXT
echo.    �������������� ����� �������� � ��������� ����.>>README.TXT
echo.    � ���-������ ������ `~*k`, ��� Enter,>>README.TXT
echo.    �������������� ����� �������� � ��������� ����.>>README.TXT
echo.    � ���-������ ������ `~*kv`, ��� Enter,>>README.TXT
echo.    �������������� ����� �������� � ��������� ����.>>README.TXT
echo.10) �������� ����� � �������� ������������.>>README.TXT
echo.>>README.TXT
exit