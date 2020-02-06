��          D               l   �  m        |  )  �   �  �  )  >  �           �   0   Luafun, also known as the Lua Functional Library, takes advantage of the features of LuaJIT to help users create complex functions. Inside the module are "sequence processors" such as ``map``, ``filter``, ``reduce``, ``zip`` -- they take a user-written function as an argument and run it against every element in a sequence, which can be faster or more convenient than a user-written loop. Inside the module are "generators" such as ``range``, ``tabulate``, and ``rands`` -- they return a bounded or boundless series of values. Within the module are "reducers", "filters", "composers" ... or, in short, all the important features found in languages like Standard ML, Haskell, or Erlang. Module `fun` The full documentation is `On the luafun section of github`_. However, the first chapter can be skipped because installation is already done, it's inside Tarantool. All that is needed is the usual ``require`` request. After that, all the operations described in the Lua fun manual will work, provided they are preceded by the name returned by the ``require`` request. For example: tarantool> fun = require('fun')
---
...
tarantool> for _k, a in fun.range(3) do
         >   print(a)
         > end
1
2
3
---
... Project-Id-Version: Tarantool 1.10
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
 Luafun, также известная как библиотека для функционального программирования в Lua, пользуется преимуществами LuaJIT, чтобы помочь пользователям создавать сложные функции. Модуль включает в себя "последовательные процессоры", такие как ``map``, ``filter``, ``reduce``, ``zip`` -- они берут написанную пользователем функцию в качестве аргумента и применяют ее к каждому элементу в последовательности, что может работать быстрее или более удобно, чем написанный пользователем цикл. Модуль включает в себя "генераторы", такие как ``range``, ``tabulate`` и ``rands`` -- они возвращают ограниченный или неограниченный ряд значений. Модуль включает в себя "преобразователи", "фильтры", "компоновщики" ... или, коротко говоря, все важные функции из таких языков, как Standard ML, Haskell или Erlang. Модуль `fun` Вся документация находится по ссылке `On the luafun section of github`_. Однако, первую главу можно пропустить, поскольку установка уже выполнена в пределах Tarantool'а. Единственное, что нужно сделать, -- выполнить обычный запрос ``require``. После этого сработают все операции, описанные в руководстве по работе с библиотекой для функционального программирования в Lua,  при условии, что перед ними указывается имя, возвращенное запросом ``require``. Например: tarantool> fun = require('fun')
---
...
tarantool> for _k, a in fun.range(3) do
         >   print(a)
         > end
1
2
3
---
... 