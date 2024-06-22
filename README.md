# Compiling complete AkelPad package

Самостоятельная компиляция AkelPad с плагинами из [исходного кода](https://sourceforge.net/p/akelpad/codesvn/HEAD/tree/).  

**Совместимость**:  

- $`\geq`$ [CodeSVN revision 4443](https://sourceforge.net/p/akelpad/codesvn/4443/)  
- набор для компиляции версий $`\leq`$ r4443 см. в [`_arc_`](./_arc_)  

**Требования**:  

- Microsoft Visual C++ Toolkit 2003 (в `c:\Program Files\`)  
- Windows Server 2003 R2 Platform SDK (в `c:\Program Files\`)  
- утилиты в папке [`tools`](./akelpad_4/tools)  
- `AkelPad` с плагином `Scripts.dll` (путь можно указать параметром при запуске `build.cmd`)  

Папку `akelpad_4` копируем в корень `c:\` (или в другое место — желательно чтобы путь был без пробелов).  
Содержимое из `akelpad_4` исходников копируем в [`akelpad_4\src`](./akelpad_4/src) , т.о. конечная структура должна быть следующей:  

```
akelpad_4\
  ├─ extras\
  └─ src\
       ├─ AkelAdmin\
       ├─ AkelEdit\
       ├─ AkelFiles\
       ├─ LibraryTest\
       ├─ RegExpTest\
       └─ ...
```

Файл `AkelUpdater.exe` и файлы плагинов от других разработчиков размещаем в [`extras`](./akelpad_4/extras).  

Для компиляции обычной версии запускаем [`build.cmd`](./akelpad_4/build.cmd)  
Для компиляции отладочной версии запускаем [`build_debug.cmd`](./akelpad_4/build_debug.cmd)  
