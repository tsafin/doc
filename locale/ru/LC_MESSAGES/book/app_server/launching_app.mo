��    ,      |              �  �   �  /   �     
  m   +  d   �  n   �  %   m    �  n   �
  �      s   �  �   R  �   >     �  <   �  �   $  �   �     �     �     �  �   �  C   J  �   �  �   '  ;   �  1   �  �     G   �  ?   A  �   �  2   ,  )  _  �  �  7   6  G   n     �     �  [   �  F   C     �  }   �  $     �  A  �  �    y  /   �  S  �  �     d   �  n   $   %   �     �   �   �$  /  ~%  �   �&  �  f'     �(     �)  d   *  �   r*  Z  j+  0   �,  !   �,     -  �   /-  x   .  �   �.  �   u/  Z   J0  A   �0  h  �0  �   P2  p   �2  '  Q3  {   y4    �4  �  7  O   �9  �   :     �:  5   �:  [   �:  w   R;     �;    �;  8   �<  �  %=   #!/usr/bin/env tarantool
-- Configure database
box.cfg {
   listen = 3301
}
box.once("bootstrap", function()
   box.schema.space.create('tweedledum')
   box.space.tweedledum:create_index('primary',
       { type = 'TREE', parts = {1, 'unsigned'}})
end) #!/usr/bin/env tarantool
print('Hello, world!') $ # create a temporary container and
$ # launch Tarantool with our application
$ docker run --rm -t -i \
             -v `pwd`/myapp.lua:/opt/tarantool/myapp.lua \
             -v /data/dir/on/host:/var/lib/tarantool \
             tarantool/tarantool:1 tarantool /opt/tarantool/myapp.lua $ # create a temporary container and run it in interactive mode
$ docker run --rm -t -i tarantool/tarantool:1 $ ps -ef | grep "tarantool"
  PID SID     TIME  CMD
42178   0  0:00.72 tarantool myapp.lua <running> $ ps | grep "tarantool"
  PID TTY           TIME CMD
41608 ttys001       0:00.47 tarantool myapp.lua <running> $ tarantool myapp.lua
Hello, world!
$ $ tarantool myapp.lua
Hello, world!
2017-08-11 16:07:14.250 [41436] main/101/myapp.lua C> version 2.1.0-429-g4e5231702
2017-08-11 16:07:14.250 [41436] main/101/myapp.lua C> log level 5
2017-08-11 16:07:14.251 [41436] main/101/myapp.lua I> mapping 1073741824 bytes for tuple arena...
2017-08-11 16:07:14.255 [41436] main/101/myapp.lua I> recovery start
2017-08-11 16:07:14.255 [41436] main/101/myapp.lua I> recovering from `./00000000000000000000.snap'
2017-08-11 16:07:14.271 [41436] main/101/myapp.lua I> recover from `./00000000000000000000.xlog'
2017-08-11 16:07:14.271 [41436] main/101/myapp.lua I> done `./00000000000000000000.xlog'
2017-08-11 16:07:14.272 [41436] main/102/hot_standby I> recover from `./00000000000000000000.xlog'
2017-08-11 16:07:14.274 [41436] iproto/102/iproto I> binary: started
2017-08-11 16:07:14.275 [41436] iproto/102/iproto I> binary: bound to [::]:3301
2017-08-11 16:07:14.275 [41436] main/101/myapp.lua I> done `./00000000000000000000.xlog'
2017-08-11 16:07:14.278 [41436] main/101/myapp.lua I> ready to accept requests :ref:`background <cfg_basic-background>` = ``true`` that actually tells Tarantool to work as a daemon service, :ref:`log <cfg_logging-log>` = ``'dir-name'`` that tells the Tarantool daemon where to store its log file (other log settings are available in Tarantool :ref:`log <log-module>` module), and :ref:`pid_file <cfg_basic-pid_file>` = ``'file-name'`` that tells the Tarantool daemon where to store its pid file. But the Tarantool instance will stop if we close the current terminal window. To detach Tarantool and our application from the terminal window, we can launch it in the **daemon mode**. To do so, we add some parameters to ``box.cfg{}``: By convention, the directory for Tarantool application code inside a container is ``/opt/tarantool``, and the directory for data is ``/var/lib/tarantool``. For example: Here two resources on the host get mounted in the container: If we run Tarantool from a :ref:`binary package <getting_started-using_binary>` or from a :ref:`source build <building_from_source>`, we can launch our application: If you're new to Lua, we recommend going over the interactive Tarantool tutorial before proceeding with this chapter. To launch the tutorial, say ``tutorial()`` in Tarantool console: Launching a binary program Launching an application Launching in Docker Let's create and launch our first Lua application for Tarantool. Here's a simplest Lua application, the good old "Hello, world!": Now let's discuss how we can launch our application with Tarantool. Now let’s turn this script into a **server application**. We use :ref:`box.cfg <box_introspection-box_cfg>` from Tarantool’s built-in Lua module to: Now that we have discussed how to create and launch a Lua application for Tarantool, let's dive deeper into programming practices. Now we launch our application in the same manner as before: Tarantool data directory (``/data/dir/on/host``). Tarantool executes our script, gets detached from the current shell session (you won't see it with ``ps | grep "tarantool"``) and continues working in the background as a daemon attached to the global session (with SID = 0): Tarantool starts, executes our script in the **script mode** and exits. The simplest way is to pass the filename to Tarantool at start: This time, Tarantool executes our script and keeps working as a server, accepting TCP requests on port 3301. We can see Tarantool in the current session’s process list: To run Tarantool with our application, we can say: Using Tarantool as an application server, you can write your own applications. Tarantool’s native language for writing applications is `Lua <http://www.lua.org/about.html>`_, so a typical application would be a file that contains your Lua script. But you can also write applications in C or C++. We also add some simple database logic, using :ref:`space.create() <box_schema-space_create>` and :ref:`create_index() <box_space-create_index>` to create a space with a primary index. We use the function :ref:`box.once() <box-once>` to make sure that our logic will be executed only once when the database is initialized for the first time, so we don't try to create an existing space or index on each invocation of the script: We launch our application in the same manner as before: We save it in a file. Let it be ``myapp.lua`` in the current directory. as a daemon service. as a server application, or box.cfg {
   listen = 3301,
   background = true,
   log = '1.log',
   pid_file = '1.pid'
} configure Tarantool as a server that accepts requests over a TCP port. in the script mode, launch the database (a database has a persistent on-disk state, which needs to be restored after we start an application) and our application file (myapp.lua) and tarantool> tutorial()
---
- |
 Tutorial -- Screen #1 -- Hello, Moon
 ====================================

 Welcome to the Tarantool tutorial.
 It will introduce you to Tarantool’s Lua application server
 and database server, which is what’s running what you’re seeing.
 This is INTERACTIVE -- you’re expected to enter requests
 based on the suggestions or examples in the screen’s text.
 <...> Project-Id-Version: Tarantool 1.10
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2020-02-06 15:02+0000
PO-Revision-Date: 2019-12-20 21:24+0300
Last-Translator: 
Language: ru
Language-Team: 
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
 #!/usr/bin/env tarantool
-- настроить базу данных
box.cfg {
   listen = 3301
}
box.once("bootstrap", function()
   box.schema.space.create('tweedledum')
   box.space.tweedledum:create_index('primary',
       { type = 'TREE', parts = {1, 'unsigned'}})
end) #!/usr/bin/env tarantool
print('Hello, world!') $ # создать временный контейнер и
$ # запустить Tarantool с нашим приложением
$ docker run --rm -t -i \
             -v `pwd`/myapp.lua:/opt/tarantool/myapp.lua \
             -v /data/dir/on/host:/var/lib/tarantool \
             tarantool/tarantool:1 tarantool /opt/tarantool/myapp.lua $ # создать временный контейнер и запустить его в интерактивном режиме
$ docker run --rm -t -i tarantool/tarantool:1 $ ps -ef | grep "tarantool"
  PID SID     TIME  CMD
42178   0  0:00.72 tarantool myapp.lua <running> $ ps | grep "tarantool"
  PID TTY           TIME CMD
41608 ttys001       0:00.47 tarantool myapp.lua <running> $ tarantool myapp.lua
Hello, world!
$ $ tarantool myapp.lua
Hello, world!
2017-08-11 16:07:14.250 [41436] main/101/myapp.lua C> version 2.1.0-429-g4e5231702
2017-08-11 16:07:14.250 [41436] main/101/myapp.lua C> log level 5
2017-08-11 16:07:14.251 [41436] main/101/myapp.lua I> mapping 1073741824 bytes for tuple arena...
2017-08-11 16:07:14.255 [41436] main/101/myapp.lua I> recovery start
2017-08-11 16:07:14.255 [41436] main/101/myapp.lua I> recovering from `./00000000000000000000.snap'
2017-08-11 16:07:14.271 [41436] main/101/myapp.lua I> recover from `./00000000000000000000.xlog'
2017-08-11 16:07:14.271 [41436] main/101/myapp.lua I> done `./00000000000000000000.xlog'
2017-08-11 16:07:14.272 [41436] main/102/hot_standby I> recover from `./00000000000000000000.xlog'
2017-08-11 16:07:14.274 [41436] iproto/102/iproto I> binary: started
2017-08-11 16:07:14.275 [41436] iproto/102/iproto I> binary: bound to [::]:3301
2017-08-11 16:07:14.275 [41436] main/101/myapp.lua I> done `./00000000000000000000.xlog'
2017-08-11 16:07:14.278 [41436] main/101/myapp.lua I> ready to accept requests :ref:`background <cfg_basic-background>` = ``true``, который собственно заставит Tarantool работать в качестве демона, :ref:`log <cfg_logging-log>` = ``'dir-name'``, который укажет, где демон Tarantool'а будет сохранять файл журнала (другие настройки журнала находятся в модуле Tarantool'а :ref:`log <log-module>` module), а также :ref:`pid_file <cfg_basic-pid_file>` = ``'file-name'``, который укажет, где демон Tarantool'а будет сохранять файл журнала pid-файл. Однако экземпляр Tarantool'а завершит работу, если мы закроем окно командной строки. Чтобы отделить Tarantool и приложение от окна командной строки, можно запустить **режим демона**. Для этого добавим некоторые параметры в ``box.cfg{}``: Традиционно в контейнере директория ``/opt/tarantool`` используется для кода приложения  Tarantool'а, а директория ``/var/lib/tarantool`` используется для данных. Например: Здесь два ресурса подключаются к серверу в контейнере: При запуске Tarantool'а из :ref:`бинарного пакета <getting_started-using_binary>` или :ref:`сборке из исходников <building_from_source>`, можно запустить наше приложение: Если вы только осваиваете Lua, рекомендуем выполнить практическое задание по Tarantool'у до работы с данной главой. Для запуска практического задания, выполните команду ``tutorial()`` в консоли Tarantool'а: Запуск бинарной программы Запуск приложения Запуск в Docker Создадим и запустим первое приложение на языке Lua для Tarantool'а -- самое простое приложение, старую добрую программу "Hello, world!": Теперь рассмотрим, как можно запустить наше приложение с Tarantool'ом. Теперь превратим этот скрипт в **серверное приложение**. Используем :ref:`box.cfg <box_introspection-box_cfg>` из встроенного в Tarantool Lua-модуля, чтобы: Рассмотрев создание и запуск Lua-приложения для Tarantool'а, перейдем к углубленному изложению методик программирования. Далее запустим наше приложение, как делали ранее: каталог данных Tarantool'а (``/data/dir/on/host``). Tarantool выполняет наш скрипт, отделяется от текущей сессии (он не отображается при вводе ``ps | grep "tarantool"``) и продолжает работать в фоновом режиме в качестве демона, прикрепленного к общей сессии (с SID = 0): Tarantool запускается, выполняет наш скрипт в **режиме скрипта** и завершает работу. Самый простой способ -- передать имя файла в Tarantool при запуске: На этот раз Tarantool выполняет скрипт и продолжает работать в качестве сервера, принимая TCP-запросы на порт 3301. Можно увидеть Tarantool в списке процессов текущей сессии: Чтобы запустить Tarantool с нашим приложением, можно выполнить команду: Используя Tarantool в качестве сервера приложений, вы можете написать собственные приложения. Собственный язык Tarantool’а для приложений -- `Lua <http://www.lua.org/about.html>`_, поэтому типовое приложение представляет собой файл, который содержит Lua-скрипт. Однако вы также можете писать приложения на C или C++. Также добавим простую логику для базы данных, используя :ref:`space.create() <box_schema-space_create>` и :ref:`create_index() <box_space-create_index>` для создания спейса с первичным индексом. Используем функцию :ref:`box.once() <box-once>`, чтобы обеспечить единовременное выполнение логики после первоначальной инициализации базы данных, поскольку мы не хотим создавать уже существующий спейс или индекс при каждом обращении к скрипту: Запустим наше приложение, как делали ранее: Сохраним приложение в файле. Пусть это будет ``myapp.lua`` в текущей директории. как демон службы. как серверное приложение или box.cfg {
   listen = 3301,
   background = true,
   log = '1.log',
   pid_file = '1.pid'
} настроить Tarantool как сервер, который принимает запросы по TCP-порту. в режиме скрипта, запустить базу данных (данные в базе находятся в персистентном состоянии на диске, которое следует восстановить после запуска приложения) и наш файл с приложением (myapp.lua) и tarantool> tutorial()
---
- |
 Tutorial -- Screen #1 -- Hello, Moon
 ====================================

 Welcome to the Tarantool tutorial.
 It will introduce you to Tarantool’s Lua application server
 and database server, which is what’s running what you’re seeing.
 This is INTERACTIVE -- you’re expected to enter requests
 based on the suggestions or examples in the screen’s text.
 <...> 