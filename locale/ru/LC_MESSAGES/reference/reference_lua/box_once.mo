��          t               �   �   �      �  �  �  
   j  h   u  �   �  
   �     �  )   �  4    �  B  �  �     {	  i  �	     �  �       �     ,  (   ;  T   d  4  �   Execute a function, provided it has not been executed before. A passed value is checked to see whether the function has already been executed. If it has been executed before, nothing happens. If it has not been executed before, the function is invoked. Function `box.once` If an error occurs inside ``box.once()`` when initializing a database, you can re-execute the failed ``box.once()`` block without stopping the database. The solution is to delete the ``once`` object from the system space :ref:`_schema <box_space-schema>`. Say ``box.space._schema:select{}``, find your ``once`` object there and delete it. For example, re-executing a block with ``key='hello'`` : Parameters See an example of using ``box.once()`` while :ref:`bootstrapping a replica set <replication-bootstrap>`. When ``box.once()`` is used for initialization, it may be useful to wait until the database is in an appropriate state (read-only or read-write). In that case, see the functions in the :ref:`box.ctl submodule <box_ctl>`. a function a value that will be checked arguments that must be passed to function tarantool> box.space._schema:select{}
---
- - ['cluster', 'b4e15788-d962-4442-892e-d6c1dd5d13f2']
  - ['max_id', 512]
  - ['oncebye']
  - ['oncehello']
  - ['version', 1, 7, 2]
...

tarantool> box.space._schema:delete('oncehello')
---
- ['oncehello']
...

tarantool> box.once('hello', function() end)
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
 Выполнение функции при условии, что она раньше не выполнялась. Передаваемое значение проверяется на предмет того, выполнялась ли функция. Если она выполнялась, ничего не происходит. В противном случае вызывается функция. Функция `box.once` Если в ``box.once()`` возникает ошибка во время инициализации базы данных, можно повторно запустить невыполненный блок ``box.once()``, не останавливая базу данных. Для этого удалите объект ``once`` из системного спейса :ref:`_schema <box_space-schema>`. Введите команду ``box.space._schema:select{}``, найдите объект ``once`` и удалите его. Например, повторное выполнение блока ``key='hello'`` : Параметры См. пример использования ``box.once()`` во время :ref:`настройки набора реплик <replication-bootstrap>`. Когда ``box.once()`` используется для инициализации, следует подождать, пока база данных не будет в нужном состоянии (только для чтения или для чтения и записи). Для этого см. функции во :ref:`вложенном модуле box.ctl <box_ctl>`. функция значение для проверки аргументы, которые следует передать в функцию tarantool> box.space._schema:select{}
---
- - ['cluster', 'b4e15788-d962-4442-892e-d6c1dd5d13f2']
  - ['max_id', 512]
  - ['oncebye']
  - ['oncehello']
  - ['version', 1, 7, 2]
...

tarantool> box.space._schema:delete('oncehello')
---
- ['oncehello']
...

tarantool> box.once('hello', function() end)
---
... 