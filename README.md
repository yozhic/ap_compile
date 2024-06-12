# AkelPad compiling

Самостоятельная компиляция AkelPad.  

Требования: Microsoft Visual C++ Toolkit 2003, Windows Server 2003 R2 Platform SDK, утилиты из папки [tools](https://github.com/yozhic/ap_compile/tree/main/akelpad_4/tools).  

Папку `akelpad_4` копируем в корень `c:\` (или в другое место, но желательно чтобы путь был без пробелов).  
Содержимое из `akelpad_4` исходников копируем в `akelpad_4\src` , т.о. конечная структура должна быть следующей:  

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

Для компиляции обычной версии запускаем `build.cmd`.  
Для компиляции отладочной версии запускаем `debug_build.cmd`.  
