��    (      \              �  �   �  %  �  x   �     #     ;     J     Y     g     u     �     �     �     �     �  P   �  �   %  3   �     �  �   �  $   �  b   �  D   +	  V   p	  ;  �	            6   )  o   `     �  A   �  K        k  k  }  %   �  g     �   w  }         �  K   �  �  �  �   �  %  �  x   �           8     G     V     d     r     �     �     �     �     �  �   �    R  �   W  !   �  P    D   a  �   �  �   S  �   �  Q  �       *     s   G  �   �     �  w   �  �   $   "   �   u  �   ]   N#  �   �#  �   z$  �   w%      u&  K   �&   $ :codebold:`tarantool example.lua`
:codeblue:`(TDB)`  :codegreen:`Tarantool debugger v.0.0.3. Type h for help`
example.lua
:codeblue:`(TDB)`  :codegreen:`[example.lua]`
:codeblue:`(TDB)`  :codenormal:`3: i = 1`
:codeblue:`(TDB)>` $ :codebold:`tarantool example.lua`
:codeblue:`(TDB)`  :codegreen:`Tarantool debugger v.0.0.3. Type h for help`
example.lua
:codeblue:`(TDB)`  :codegreen:`[example.lua]`
:codeblue:`(TDB)`  :codenormal:`3: i = 1`
:codeblue:`(TDB)>` n
:codeblue:`(TDB)`  :codenormal:`4: j = 'a' .. i`
:codeblue:`(TDB)>` n
:codeblue:`(TDB)`  :codenormal:`5: print('end of program')`
:codeblue:`(TDB)>` e
:codeblue:`(TDB)`  :codegreen:`Eval mode ON`
:codeblue:`(TDB)>` j
j       a1
:codeblue:`(TDB)>` -e
:codeblue:`(TDB)`  :codegreen:`Eval mode OFF`
:codeblue:`(TDB)>` q $ git clone --recursive https://github.com/Sulverus/tdb
$ cd tdb
$ make
$ sudo make install prefix=/usr/share/tarantool/ $ tarantool example.lua :codebold:`-e` :codebold:`bt` :codebold:`c` :codebold:`e` :codebold:`f` :codebold:`globals` :codebold:`h` :codebold:`locals` :codebold:`n` :codebold:`q` Another debugger example can be found `here <https://github.com/sulverus/tdb>`_. Backtrace -- show the stack (in red), with program/function names and line numbers of whatever has been invoked to reach the current line. Continue till next breakpoint or till program ends. Debugger Commands Debugger prompts are blue, debugger hints and information are green, and the current line -- line 3 of example.lua -- is the default color. Now enter six debugger commands: Display a list of debugger commands. Display names and values of variables, for example the control variables of a Lua "for" statement. Display names of variables or functions which are defined as global. Display the fiber id, the program name, and the percentage of memory used, as a table. Enter evaluation mode. When the program is in evaluation mode, one can execute certain Lua statements that would be valid in the context. This is particularly useful for displaying the values of the program's variables. Other debugger commands will not work until one exits evaluation mode by typing :codebold:`-e`. Example Session Exit evaluation mode. Go to the next line, skipping over any function calls. It is not supplied as part of the Tarantool repository; it must be installed separately. Here is the usual way: Module `tdb` Now start Tarantool, using example.lua as the initialization file Put the following program in a default directory and call it "example.lua": Quit immediately. The Tarantool Debugger (abbreviation = ``tdb``) can be used with any Lua program. The operational features include: setting breakpoints, examining variables, going forward one line at a time, backtracing, and showing information about fibers. The display features include: using different colors for different situations, including line numbers, and adding hints. The screen should now look like this: To initiate ``tdb`` within a Lua program and set a breakpoint, edit the program to include these lines: To start the debugging session, execute the Lua program. Execution will stop at the breakpoint, and it will be possible to enter debugging commands. n  -- go to next line
n  -- go to next line
e  -- enter evaluation mode
j  -- display j
-e -- exit evaluation mode
q  -- quit tdb = require('tdb')
tdb.start() tdb = require('tdb')
tdb.start()
i = 1
j = 'a' .. i
print('end of program') Project-Id-Version: Tarantool 1.10
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2020-02-06 15:02+0000
PO-Revision-Date: 2019-12-06 16:16+0300
Last-Translator: 
Language: ru
Language-Team: 
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
 $ :codebold:`tarantool example.lua`
:codeblue:`(TDB)`  :codegreen:`Tarantool debugger v.0.0.3. Type h for help`
example.lua
:codeblue:`(TDB)`  :codegreen:`[example.lua]`
:codeblue:`(TDB)`  :codenormal:`3: i = 1`
:codeblue:`(TDB)>` $ :codebold:`tarantool example.lua`
:codeblue:`(TDB)`  :codegreen:`Tarantool debugger v.0.0.3. Type h for help`
example.lua
:codeblue:`(TDB)`  :codegreen:`[example.lua]`
:codeblue:`(TDB)`  :codenormal:`3: i = 1`
:codeblue:`(TDB)>` n
:codeblue:`(TDB)`  :codenormal:`4: j = 'a' .. i`
:codeblue:`(TDB)>` n
:codeblue:`(TDB)`  :codenormal:`5: print('end of program')`
:codeblue:`(TDB)>` e
:codeblue:`(TDB)`  :codegreen:`Eval mode ON`
:codeblue:`(TDB)>` j
j       a1
:codeblue:`(TDB)>` -e
:codeblue:`(TDB)`  :codegreen:`Eval mode OFF`
:codeblue:`(TDB)>` q $ git clone --recursive https://github.com/Sulverus/tdb
$ cd tdb
$ make
$ sudo make install prefix=/usr/share/tarantool/ $ tarantool example.lua :codebold:`-e` :codebold:`bt` :codebold:`c` :codebold:`e` :codebold:`f` :codebold:`globals` :codebold:`h` :codebold:`locals` :codebold:`n` :codebold:`q` Другой пример работы отладчика можно найти `здесь <https://github.com/sulverus/tdb>`_. Обратная трассировка -- отображение стека (красным) с именами программы/функции и номерами строк, выполнение которых привело к текущей строке. Продолжение выполнения до следующей точки прерывания или до окончания программы. Команды отладчика Запросы отладчика выделены синим, подсказки и информация -- зеленым, а текущая строка -- 3 строка программы example.lua -- цветом, который используется по умолчанию. Введите 6 команд отладчика: Отображение списка команд отладчика. Отображение имен и значений переменных, например, переменных для управления Lua-оператором "for". Отображение имен переменных или функций, которые являются глобальными. Отображение идентификатора файбера, имени программы и процентного соотношения использованной памяти в виде таблицы. Вход в режим вычисления. Когда программа находится в режиме вычисления, можно выполнять определенные запросы, которые будут действовать с точки зрения контекста. Это особенно полезно для отображения значений переменных программы. Другие команды отладчика не будут работать, пока не выйти из режима оценки, набрав: :codebold:`-e`. Пример сессии Выход из режима оценка. Переход на следующую строку с пропуском любых вызовов функций. Модуль не поставляется в репозитории Tarantool'а, его следует устанавливать отдельно. Это обычно делается следующим образом: Модуль `tdb` Запустите Tarantool, используя example.lua в качестве файла инициализации. Сохраните следующую программу в директории по умолчанию и назовите ее "example.lua": Немедленный выход. Отладчик Tarantool'а (сокращенно ``tdb``) можно использовать с любой Lua-программой. Рабочие функции: определение точек прерывания, исследование переменных, перебор строк по одной, обратная трассировка и отображение информации о файберах. Функции вывода: использование различных цветов в разных ситуациях, включая номера строк, и добавление подсказок. Теперь вывод на экране выглядит следующим образом: Чтобы запустить ``tdb`` в рамках Lua-программы и определить точку прерывания, включите в программу следующие строки: Чтобы начать сессию отладки, выполните Lua-программу: выполнение остановится на точке прерывания, и можно будет вводить команды отладчика. n  -- переход на следующую строку
n  -- переход на следующую строку
e  -- вход в режим оценки
j  -- отображение j
-e -- выход из режима оценки
q  -- выход tdb = require('tdb')
tdb.start() tdb = require('tdb')
tdb.start()
i = 1
j = 'a' .. i
print('end of program') 