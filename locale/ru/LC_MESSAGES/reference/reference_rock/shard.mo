��    J      l              �  "  �    �  u  `  &   �  "   �           4  	   A     K     Z     j     v  	   �     �  �  �  I   �  %  �  �   �    �  �   �  u  �  +   q  U   �  H   �  *   <  -   g  %   �     �     �  D   �  �   4  �   �     ^  �   m     P     e     z  �   �  �  C  >     {   ^     �     �  3     A   L  5   �  �   �  @   t     �   6  �!  R  �"  $   G$  h   l$  �   �$  C   �%  "  �%  �   �&  J   ~'  '   �'  "   �'  B   (  7   W(  �   �(  <   )  !   P)  �   r)  �   ;*  \  +  �  m-  ?   /     F/  L   a/     �/  �  �/  0  m1  �  �4  �  ,8  &   �;  "   �;  5   �;     1<     H<  O   [<     �<     �<  +   �<     =     =  �   =  e   ?  	  ~?  �  �A  �  3C  �  /E  )  �F  K   &J  �   rJ  �   K  L   �K  J   5L  A   �L  S   �L  :   M  �   QM  �   �M  �   �N     �O  �  �O  2   yQ  4   �Q      �Q  �   R    �R  i   V  �   qV  P   >W  9   �W  c   �W  �   -X  x   �X  �  @Y     �Z  �  e[    %]  m  =_  F   �a  �   �a  �  �b  a   fd  �  �d  �   }g  �   `h  E   �h  J   *i  x   ui  �   �i  �   sj  �   )k  +   �k  �   �k  
  �l  \  �m  �  Yp  ?   �q  6   2r  �   ir  Q   �r   $ mkdir ~/tarantool_sandbox_1
$ cd ~/tarantool_sandbox_1
$ rm -r *.snap
$ rm -r *.xlog
$ ~/tarantool-1.7/src/tarantool

tarantool> box.cfg{listen = 3301}
tarantool> box.schema.space.create('tester')
tarantool> box.space.tester:create_index('primary', {})
tarantool> box.schema.user.create('test_user', {password = 'pass'})
tarantool> box.schema.user.grant('test_user', 'read,write,execute', 'universe')
tarantool> cfg = {
         >   servers = {
         >       { uri = 'localhost:3301', zone = '1' },
         >   },
         >   login = 'test_user';
         >   password = 'pass';
         >   redundancy = 1;
         >   binary = 3301;
         > }
tarantool> shard = require('shard')
tarantool> shard.init(cfg)
tarantool> -- Now put something in ...
tarantool> shard.tester:insert{1,'Tuple #1'} $ mkdir ~/tarantool_sandbox_1
$ cd ~/tarantool_sandbox_1
$ rm -r *.snap
$ rm -r *.xlog
$ ~/tarantool-1.7/src/tarantool

tarantool> box.cfg{listen = 3301}
tarantool> box.schema.space.create('tester')
tarantool> box.space.tester:create_index('primary', {})
tarantool> box.schema.user.create('test_user', {password = 'pass'})
tarantool> box.schema.user.grant('test_user', 'read,write,execute', 'universe')
tarantool> console = require('console')
tarantool> cfg = {
         >   servers = {
         >     { uri = 'localhost:3301', zone = '1' },
         >     { uri = 'localhost:3302', zone = '2' },
         >   },
         >   login = 'test_user',
         >   password = 'pass',
         >   redundancy = 1,
         >   binary = 3301,
         > }
tarantool> shard = require('shard')
tarantool> shard.init(cfg)
tarantool> -- Now put something in ...
tarantool> shard.tester:insert{1,'Tuple #1'} $ mkdir ~/tarantool_sandbox_2
$ cd ~/tarantool_sandbox_2
$ rm -r *.snap
$ rm -r *.xlog
$ ~/tarantool-1.7/src/tarantool

tarantool> box.cfg{listen = 3302}
tarantool> box.schema.space.create('tester')
tarantool> box.space.tester:create_index('primary', {})
tarantool> box.schema.user.create('test_user', {password = 'pass'})
tarantool> box.schema.user.grant('test_user', 'read,write,execute', 'universe')
tarantool> console = require('console')
tarantool> cfg = {
         >   servers = {
         >     { uri = 'localhost:3301', zone = '1' };
         >     { uri = 'localhost:3302', zone = '2' };
         >   };
         >   login = 'test_user';
         >   password = 'pass';
         >   redundancy = 1;
         >   binary = 3302;
         > }
tarantool> shard = require('shard')
tarantool> shard.init(cfg)
tarantool> -- Now get something out ...
tarantool> shard.tester:select{1} $ sudo apt-get install tarantool-shard $ tarantoolctl rocks install shard **Consistent hash** **Instance** **Queue** **Redundancy** **Replica set** **Replica** **Replicated data** **Shard** **Zone** <...>
tarantool> shard.init(cfg)
2017-09-06 ... I> Sharding initialization started...
2017-09-06 ... I> establishing connection to cluster servers...
2017-09-06 ... I> connected to all servers
2017-09-06 ... I> started
2017-09-06 ... I> redundancy = 1
2017-09-06 ... I> Adding localhost:3301 to shard 1
2017-09-06 ... I> shards = 1
2017-09-06 ... I> Done
---
- true
...
tarantool> -- Now put something in ...
---
...
tarantool> shard.tester:insert{1,'Tuple #1'}
---
- - [1, 'Tuple #1']
... A ``shard.T:select{}`` request without a primary key will cause an error. A complete copy of the data. The `shard` module handles both sharding and replication. One shard can contain one or more replicated data copies. When a write occurs, the write is attempted on every replicated data copy in turn. The `shard` module does not use the built-in replication feature. A currently-running in-memory copy of the Tarantool server, sometimes called a "server instance". Usually each shard is associated with one instance, or, if both sharding and replicating are going on, each shard is associated with one replica set. A physical location where the nodes are closely connected, with the same security and backup and access points. The simplest example of a zone is a single computer with a single Tarantool-server instance. A shard's replicated data copies should be in different zones. A subset of the tuples in the database partitioned according to the value returned by the consistent hash function. Usually each shard is on a separate node, or a separate set of nodes (for example if redundancy = 3 then the shard will be on three nodes). A temporary list of recent update requests. Sometimes called "batching". Since updates to a sharded database can be slow, it may speed up throughput to send requests to a queue rather than wait for the update to finish on every node. The `shard` module has functions for adding requests to the queue, which it will process without further intervention. Queuing is optional. An instance which is part of a replica set. Every data-access function in the `box` module has an analogue in the `shard` module: Every queued data-access function has an analogue in the `shard` module: Example: `shard.init` syntax for one shard Example: `shard.init` syntax for three shards Example: shard, minimal configuration Example: shard, scaling out First some terminology: For details, see the `README <https://github.com/tarantool/shard>`_. For example, to insert in table T in a sharded database you simply say ``shard.T:insert{...}`` instead of ``box.space.T:insert{...}``. If you cut and paste the above, then the result, showing only the requests and responses for `shard.init` and `shard.tester`, should look approximately like this: Module `shard` Often a single shard is associated with a single instance; however, often the shard is replicated. When a shard is replicated, the multiple instances ("replicas"), which handle the shard's replicated data, are a "replica set". On Terminal #1, say: On Terminal #2, say: Possible errors: The Tarantool `shard` module has facilities for creating shards, as well as analogues for the data-manipulation functions of the box library (select, insert, replace, update, delete). The `shard` module distributes according to a hash algorithm, that is, it applies a hash function to a tuple's primary-key value in order to decide which shard the tuple belongs to. The hash function is `consistent <https://en.wikipedia.org/wiki/Consistent_hashing>`_ so that changing the number of servers will not affect results for many keys. The specific hash function that the `shard` module uses is :ref:`digest.guava <digest-guava>` in the :codeitalic:`digest` module. The `shard` module will conclude that there is only one shard. The `shard` package is distributed separately from the main `tarantool` package. To acquire it, do a separate installation: The most important function is: The number of instances is 3. The number of replicated data copies in each shard. The number of replicated data copies per shard (redundancy) is 3. The shard configuration is a table with these fields: The user must add an `operation_id`. For details of queued data-access functions, and of maintenance-related functions, see the `README <https://github.com/tarantool/shard>`_. Then, before using the module, say ``shard = require('shard')``. There are two shards, and each shard contains one replicated data copy. This requires two nodes. In real life the two nodes would be two computers, but for this illustration the requirement is merely: start two shells, which we'll call Terminal#1 and Terminal #2. There is only one shard, and that shard contains only one replicated data copy. So this isn't illustrating the features of either replication or sharding, it's only illustrating what the syntax is, and what the messages look like, that anyone could duplicate in a minute or two with the magic of cut-and-paste. This describes three shards. Each shard has two replicated data copies. Since the number of servers is 7, and the number of replicated data copies per shard is 2, and dividing 7 / 2 leaves a remainder of 1, one of the servers will not be used. This is not necessarily an error, because perhaps one of the servers in the list is not alive. This must be called for every shard. This shows that what was inserted by Terminal #1 can be selected by Terminal #2, via the `shard` module. What will appear on Terminal #1 is: a loop of error messages saying "Connection refused" and "server check failure". This is normal. It will go on until Terminal #2 process starts. What will appear on Terminal #2, at the end, should look like this: With sharding, the tuples of a tuple set are distributed to multiple nodes, with a Tarantool database server instance on each node. With this arrangement, each instance is handling only a subset of the total data, so larger loads can be handled by simply adding more computers to a network. `binary` (a port number that this host is listening on, on the current host, (distinguishable from the 'listen' port specified by `box.cfg`) `login` (the user name which applies for accessing via the `shard` module) `password` (the password for the login) `redundancy` (a number, minimum 1) `servers` (a list of URIs of nodes and the zones the nodes are in) install with `yum` or `apt`, for example on Ubuntu say: or download from GitHub `tarantool/shard` and use the Lua files as described in the `README <https://github.com/tarantool/shard>`_. redundancy should not be greater than the number of servers; shard.init(*shard-configuration*) shard[*space-name*].insert{...}
shard[*space-name*].replace{...}
shard[*space-name*].delete{...}
shard[*space-name*].select{...}
shard[*space-name*].update{...}
shard[*space-name*].auto_increment{...} shard[*space-name*].q_insert{...}
shard[*space-name*].q_replace{...}
shard[*space-name*].q_delete{...}
shard[*space-name*].q_select{...}
shard[*space-name*].q_update{...}
shard[*space-name*].q_auto_increment{...} tarantool> cfg = {
         >   servers = {
         >     { uri = 'host1:33131', zone = '1' },
         >     { uri = 'host2:33131', zone = '2' },
         >     { uri = 'host3:33131', zone = '3' },
         >     { uri = 'host4:33131', zone = '4' },
         >     { uri = 'host5:33131', zone = '5' },
         >     { uri = 'host6:33131', zone = '6' },
         >     { uri = 'host7:33131', zone = '7' }
         >   },
         >   login = 'test_user',
         >   password = 'pass',
         >   redundancy = '2',
         >   binary = 33131,
         > }
---
...
tarantool> shard.init(cfg)
---
... tarantool> cfg = {
         >   servers = {
         >     { uri = 'localhost:33131', zone = '1' },
         >     { uri = 'localhost:33132', zone = '2' },
         >     { uri = 'localhost:33133', zone = '3' }
         >   },
         >   login = 'test_user',
         >   password = 'pass',
         >   redundancy = '3',
         >   binary = 33131,
         > }
---
...
tarantool> shard.init(cfg)
---
... tarantool> shard.tester:select{1}
---
- - - [1, 'Tuple #1']
... the servers must be alive; two replicated data copies of the same shard should not be in the same zone. with Tarantool 1.7.4+, say: Project-Id-Version: Tarantool 1.10
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
 $ mkdir ~/tarantool_sandbox_1
$ cd ~/tarantool_sandbox_1
$ rm -r *.snap
$ rm -r *.xlog
$ ~/tarantool-1.7/src/tarantool

tarantool> box.cfg{listen = 3301}
tarantool> box.schema.space.create('tester')
tarantool> box.space.tester:create_index('primary', {})
tarantool> box.schema.user.create('test_user', {password = 'pass'})
tarantool> box.schema.user.grant('test_user', 'read,write,execute', 'universe')
tarantool> cfg = {
         >   servers = {
         >       { uri = 'localhost:3301', zone = '1' },
         >   },
         >   login = 'test_user';
         >   password = 'pass';
         >   redundancy = 1;
         >   binary = 3301;
         > }
tarantool> shard = require('shard')
tarantool> shard.init(cfg)
tarantool> -- Введите что-нибудь ...
tarantool> shard.tester:insert{1,'Tuple #1'} $ mkdir ~/tarantool_sandbox_1
$ cd ~/tarantool_sandbox_1
$ rm -r *.snap
$ rm -r *.xlog
$ ~/tarantool-1.7/src/tarantool

tarantool> box.cfg{listen = 3301}
tarantool> box.schema.space.create('tester')
tarantool> box.space.tester:create_index('primary', {})
tarantool> box.schema.user.create('test_user', {password = 'pass'})
tarantool> box.schema.user.grant('test_user', 'read,write,execute', 'universe')
tarantool> console = require('console')
tarantool> cfg = {
         >   servers = {
         >     { uri = 'localhost:3301', zone = '1' },
         >     { uri = 'localhost:3302', zone = '2' },
         >   },
         >   login = 'test_user',
         >   password = 'pass',
         >   redundancy = 1,
         >   binary = 3301,
         > }
tarantool> shard = require('shard')
tarantool> shard.init(cfg)
tarantool> -- Введите что-нибудь ...
tarantool> shard.tester:insert{1,'Tuple #1'} $ mkdir ~/tarantool_sandbox_2
$ cd ~/tarantool_sandbox_2
$ rm -r *.snap
$ rm -r *.xlog
$ ~/tarantool-1.7/src/tarantool

tarantool> box.cfg{listen = 3302}
tarantool> box.schema.space.create('tester')
tarantool> box.space.tester:create_index('primary', {})
tarantool> box.schema.user.create('test_user', {password = 'pass'})
tarantool> box.schema.user.grant('test_user', 'read,write,execute', 'universe')
tarantool> console = require('console')
tarantool> cfg = {
         >   servers = {
         >     { uri = 'localhost:3301', zone = '1' };
         >     { uri = 'localhost:3302', zone = '2' };
         >   };
         >   login = 'test_user';
         >   password = 'pass';
         >   redundancy = 1;
         >   binary = 3302;
         > }
tarantool> shard = require('shard')
tarantool> shard.init(cfg)
tarantool> -- Выведите что-нибудь ...
tarantool> shard.tester:select{1} $ sudo apt-get install tarantool-shard $ tarantoolctl rocks install shard **Консистентное хеширование** **Экземпляр** **Очередь** **Резервирование по принципу избыточности** **Набор реплик** **Реплика** **Реплицируемые данные** **Шард** **Зона** <...>
tarantool> shard.init(cfg)
2017-09-06 ... I> Sharding initialization started...
2017-09-06 ... I> establishing connection to cluster servers...
2017-09-06 ... I> connected to all servers
2017-09-06 ... I> started
2017-09-06 ... I> redundancy = 1
2017-09-06 ... I> Adding localhost:3301 to shard 1
2017-09-06 ... I> shards = 1
2017-09-06 ... I> Done
---
- true
...
tarantool> -- Введите что--нибудь...
---
...
tarantool> shard.tester:insert{1,'Tuple #1'}
---
- - [1, 'Tuple #1']
... Запрос ``shard.T:select{}`` без первичного ключа вызовет ошибку. Полная копия данных. Модуль `shard` обрабатывает как шардинг, так и репликацию. Один шард может содержать одну или несколько копий реплицируемых данных. Попытки записи производятся по очереди на каждую копию реплицируемых данных. Модуль `shard` не использует встроенную функцию репликации. Запущенная in-memory копия Tarantool-сервера иногда называется экземпляром сервера. Как правило, каждый шард ассоциирован с одним экземпляром, или же, если выполняется и шардинг, и репликация, каждый шард ассоциирован с одним набором реплик. Физическое местоположение, где узлы тесно связаны, с одинаковыми точками безопасности, резервного копирования и доступа. Простейшим примером зоны является один компьютер с одним экземпляром Tarantool-сервера. Копии реплицируемых данных на шарде должны находиться в разных зонах. Подмножество кортежей в базе данных, разделенное по значению, которое возвращает консистентная хеш-функция. Как правило, каждый шард находится на отдельном узле или отдельном наборе узлов (например, если резервирование = 3, то шард будет на трех узлах). Временный список последних запросов обновления. Иногда называется "пакетная обработка". Поскольку обновления в базу данных с шардингом могут быть замедлены, ускорить выполнение можно путем отправки запросов в очередь вместо ожидания окончания обновления на каждом узле. В модуле `shard` присутствуют функции для добавления запросов в очередь, которые будут затем обработаны без дополнительных действий. Использование очереди необязательно. Экземпляр, который входит в набор реплик. Каждой функции взаимодействия с данными модуля `box` соответствует функция в модуле `shard`: Каждой функции модуля `box` для взаимодействия с данными, поставленной в очередь, соответствует функция в модуле `shard`: Пример: синтаксис `shard.init` для одного шарда Пример: синтаксис `shard.init` для трех шардов Пример: шард, минимальная настройка Пример: шард, горизонтальное масштабирование Для начала введем терминологию: Для получения подробной информации см. файл `README <https://github.com/tarantool/shard>`_. Например, чтобы выполнить вставку в таблицу T в базе данных с шардингом, просто выполните команду ``shard.T:insert{...}`` вместо ``box.space.T:insert{...}``. Если вырезать и вставить вышеуказанное, то результат с запросами и ответами только для `shard.init` и `shard.tester` должен выглядеть примерно так: Модуль `shard` Часто отдельный шард ассоциирован с отдельным экземпляром. Однако, часто шард реплицируется. Когда шард реплицируется, множество экземпляров ("реплики"), которые обрабатывают реплицируемые данные шарда, составляют "набор реплик". В первом терминале введите: Во втором терминале введите: Возможные ошибки: Модуль Tarantool'а `shard` позволяет создавать шарды, а также аналоги функций по управлению данными из библиотеки box (select, insert, replace, update, delete). Модуль `shard` распределяет данные в соответствии с алгоритмом хеширования, то есть применяет хеш-функцию к значению первичного ключа кортежа, что определить к какому шарду относится кортеж. Хеш-функция является `консистентной <https://en.wikipedia.org/wiki/Consistent_hashing>`_, поэтому изменение количества серверов не повлияет на результат для множества ключей. Модуль `shard` использует специальную хеш-функцию :ref:`digest.guava <digest-guava>` из модуля :codeitalic:`digest`. Модуль `shard` делает вывод, что существует только один шард. Пакет `shard` распространяется отдельно от основного пакета `Tarantool`. Для работы с ним выполните установку отдельно: Самой необходимой функцией модуля является Количество экземпляров равно 3. Количество копий реплицируемых данных в каждом шарде. Количество копий реплицируемых данных на один шард (redundancy -- резервирование) равно 3. Настройка шарда представляет собой таблицу со следующими полями: Пользователь должен добавить `operation_id`. Чтобы получить дополнительную информацию о функциях для взаимодействия с данными, поставленными в очередь, и о функциях, предназначенных для обслуживания, см. файл `README <https://github.com/tarantool/shard>`_. Затем перед использованием модуля выполните команду ``shard = require('shard')``. Созданы два шарда, каждый из которых содержит одну копию реплицируемых данных. В реальной жизни два узла будут представлены двумя компьютерами, для примера же требуется использовать две оболочки, которые мы назовем "терминал №1" и "терминал №2". Создан только один шард, который содержит только одну копию реплицируемых данных. Таким образом, данный пример не иллюстрирует возможности репликации или шардинга, он показывает синтаксис и отображаемые сообщения, что каждый может повторить за пару минут лишь с помощью вырезания и вставки. Здесь описаны три шарда. Каждый шард содержит две копии реплицируемых данных. Поскольку количество серверов равно 7, количество копий реплицируемых данных на один шард равно 2, а деление 7 на 2 дает в остатке 1, -- один из серверов не будет использоваться. Это необязательно должно быть ошибкой, поскольку один из серверов может быть нерабочим. Ее следует вызывать для каждого шарда. Данный пример показывает, что введенная на терминале №1 информация может быть извлечена на терминале №2 с помощью модуля `shard`. На терминале №1 появится цикл сообщений с ошибками типа "Connection refused" (в подключении отказано) и "server check failure" (отказ проверки сервера). Это нормально. Сообщения будут появляться, пока не начнется процесс на терминале №2. В конце, на терминале №2 появится примерно следующее: Во время шардинга кортежи из набора кортежей распределяются по нескольким узлам, на каждом из которых есть экземпляр сервера базы данных Tarantool'а. При таком распределении каждый экземпляр обрабатывает только подмножество общих данных, поэтому появляется возможность обрабатывать данные при больших нагрузках путем простого добавления большего количества компьютеров в сеть. `binary` -- номер порта, на котором настроено прослушивание для текущего хоста (отличный от порта 'listen', который определяет `box.cfg`) `login` -- имя пользователя, которое используется для доступа по модулю `shard` `password` -- пароль для имени пользователя `redundancy` -- резервирование, число, минимум 1 `servers` -- серверы, т.е. список URI узлов и зон, в которых находятся узлы либо установите с помощью `yum` или `apt`, например, на Ubuntu выполните команду: либо скачайте из GitHub `tarantool/shard` и используйте Lua-файлы, как описано в файле `README <https://github.com/tarantool/shard>`_. значение параметра redundancy (резервирование) не должно быть больше количества серверов; shard.init(*настройка-шарда*) shard[*имя-спейса*].insert{...}
shard[*имя-спейса*].replace{...}
shard[*имя-спейса*].delete{...}
shard[*имя-спейса*].select{...}
shard[*имя-спейса*].update{...}
shard[*имя-спейса*].auto_increment{...} shard[*имя-спейса*].q_insert{...}
shard[*имя-спейса*].q_replace{...}
shard[*имя-спейса*].q_delete{...}
shard[*имя-спейса*].q_select{...}
shard[*имя-спейса*].q_update{...}
shard[*имя-спейса*].q_auto_increment{...} tarantool> cfg = {
         >   servers = {
         >     { uri = 'host1:33131', zone = '1' },
         >     { uri = 'host2:33131', zone = '2' },
         >     { uri = 'host3:33131', zone = '3' },
         >     { uri = 'host4:33131', zone = '4' },
         >     { uri = 'host5:33131', zone = '5' },
         >     { uri = 'host6:33131', zone = '6' },
         >     { uri = 'host7:33131', zone = '7' }
         >   },
         >   login = 'test_user',
         >   password = 'pass',
         >   redundancy = '2',
         >   binary = 33131,
         > }
---
...
tarantool> shard.init(cfg)
---
... tarantool> cfg = {
         >   servers = {
         >     { uri = 'localhost:33131', zone = '1' },
         >     { uri = 'localhost:33132', zone = '2' },
         >     { uri = 'localhost:33133', zone = '3' }
         >   },
         >   login = 'test_user',
         >   password = 'pass',
         >   redundancy = '3',
         >   binary = 33131,
         > }
---
...
tarantool> shard.init(cfg)
---
... tarantool> shard.tester:select{1}
---
- - - [1, 'Tuple #1']
... серверы должны быть рабочими; две копии реплицируемых данных одного шарда не должны находиться в одной зоне. либо на версии Tarantool'а 1.7.4+ выполните команду: 