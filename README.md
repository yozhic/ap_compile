# Compiling complete AkelPad package

Самостоятельная компиляция AkelPad с плагинами из [исходного кода](https://sourceforge.net/p/akelpad/codesvn/HEAD/tree/).  

Совместимость: $`\geq`$ [CodeSVN revision 4443](https://sourceforge.net/p/akelpad/codesvn/4443/). Набор для компиляции версий $`\leq`$ r4443 см. в [`_arc_`](https://github.com/yozhic/ap_compile/tree/main/_arc_).  

Требования: Microsoft Visual C++ Toolkit 2003; Windows Server 2003 R2 Platform SDK; утилиты из папки [`tools`](https://github.com/yozhic/ap_compile/tree/main/akelpad_4/tools) _(путь к утилитам указываем в PATH)_.  

Папку `akelpad_4` копируем в корень `c:\` (или в другое место — желательно чтобы путь был без пробелов).  
Содержимое из `akelpad_4` исходников копируем в [`akelpad_4\src`](https://github.com/yozhic/ap_compile/tree/main/akelpad_4/src) , т.о. конечная структура должна быть следующей:  

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

Файл `AkelUpdater.exe` и файлы плагинов от других разработчиков размещаем в [`extras`](https://github.com/yozhic/ap_compile/tree/main/akelpad_4/extras).  

Для компиляции обычной версии запускаем [`build.cmd`](https://github.com/yozhic/ap_compile/blob/main/akelpad_4/build.cmd) .  
Для компиляции отладочной версии запускаем [`debug_build.cmd`](https://github.com/yozhic/ap_compile/blob/main/akelpad_4/debug_build.cmd) .  
