��    ?                      Q     (   _  4   �  �   �  )   �     �  S  �  �   S  !   L  -   n  ]  �  g   �  �  b       �  1  G   �  �   A     �     �  
             1     :  �   A  %   �  o     �     H   x  >   �             B   �  �  �  �   �  �   {  X   #  �   |     y  )   �     �     �     �     �  �   �     �  �   �     E   n   R   �   �   \   W!  ;   �!  %   �!  '   "  D   >"  U   �"  0   �"  S   
#  +   ^#  N   �#  %   �#  3   �#     3$  �  :$  �   �%  J   u&  U   �&  8  '  )   O(     y(  S  �(  �   �.  !   �/  -    0  ]  .0  g   �1    �1     �5  �  6  G   �7  �   "8  J   9  K   S9  *   �9  =   �9     :     :  �  &:  [   �;  �   <  �  �<  �   �>  �   ?  X   )@  �   �@  W   YA  �  �A  t  KD  9  �E  �   �F  �  �G     �I  @   �I     �I     �I     �I  "   �I  �  J     �K  y  �K  !   (M  �   JM  �   	N  �   O  =   �O  c   �O  o   YP  �   �P  �   sQ  T   ,R  �   �R  J   S  _   MS  8   �S  B   �S     )T   "/tmp/tarantool_trace.txt" is a sample path to a file for saving the stack trace. "core" is the path to the core file, and "tarantool" is the path to the Tarantool executable, $ # !!! please never do this on a production system !!!
$ tarantoolctl enter my_app
unix/:/var/run/tarantool/my_app.control> require('ffi').cast('char *', 0)[0] = 48
/bin/tarantoolctl: unix/:/var/run/tarantool/my_app.control: Remote host closed connection $ coredumpctl -o filename.core info <pid> $ coredumpctl gdb <pid> $ coredumpctl info 21035
          PID: 21035 (tarantool)
          UID: 995 (tarantool)
          GID: 992 (tarantool)
       Signal: 6 (ABRT)
    Timestamp: Sat 2016-01-23 15:51:42 MSK (4h 36min ago)
 Command Line: tarantool my_app.lua <running>
   Executable: /usr/bin/tarantool
Control Group: /system.slice/system-tarantool.slice/tarantool@my_app.service
         Unit: tarantool@my_app.service
        Slice: system-tarantool.slice
      Boot ID: 7c686e2ef4dc4e3ea59122757e3067e2
   Machine ID: a4a878729c654c7093dc6693f6a8e5ee
     Hostname: localhost.localdomain
      Message: Process 21035 (tarantool) of user 995 dumped core.

               Stack trace of thread 21035:
               #0  0x00007f84993aa618 raise (libc.so.6)
               #1  0x00007f84993ac21a abort (libc.so.6)
               #2  0x0000560d0a9e9233 _ZL12sig_fatal_cbi (tarantool)
               #3  0x00007f849a211220 __restore_rt (libpthread.so.0)
               #4  0x0000560d0aaa5d9d lj_cconv_ct_ct (tarantool)
               #5  0x0000560d0aaa687f lj_cconv_ct_tv (tarantool)
               #6  0x0000560d0aaabe33 lj_cf_ffi_meta___newindex (tarantool)
               #7  0x0000560d0aaae2f7 lj_BC_FUNCC (tarantool)
               #8  0x0000560d0aa9aabd lua_pcall (tarantool)
               #9  0x0000560d0aa71400 lbox_call (tarantool)
               #10 0x0000560d0aa6ce36 lua_fiber_run_f (tarantool)
               #11 0x0000560d0a9e8d0c _ZL16fiber_cxx_invokePFiP13__va_list_tagES0_ (tarantool)
               #12 0x0000560d0aa7b255 fiber_loop (tarantool)
               #13 0x0000560d0ab38ed1 coro_init (tarantool)
               ... $ coredumpctl list /usr/bin/tarantool
MTIME                            PID   UID   GID SIG PRESENT EXE
Sat 2016-01-23 15:21:24 MSK   20681  1000  1000   6   /usr/bin/tarantool
Sat 2016-01-23 15:51:56 MSK   21035   995   992   6   /usr/bin/tarantool $ dnf debuginfo-install tarantool $ gdb -batch -ex "generate-core-file" -p $PID $ gdb -p <pid>
...
Missing separate debuginfos, use: dnf debuginfo-install
glibc-2.22.90-26.fc24.x86_64 krb5-libs-1.14-12.fc24.x86_64
libgcc-5.3.1-3.fc24.x86_64 libgomp-5.3.1-3.fc24.x86_64
libselinux-2.4-6.fc24.x86_64 libstdc++-5.3.1-3.fc24.x86_64
libyaml-0.1.6-7.fc23.x86_64 ncurses-libs-6.0-1.20150810.fc24.x86_64
openssl-libs-1.0.2e-3.fc24.x86_64 $ gdb -se "tarantool" -ex "bt full" -ex "thread apply all bt" --batch -c core> /tmp/tarantool_trace.txt $ journalctl -u tarantool@my_app -n 8
-- Logs begin at Fri 2016-01-08 12:21:53 MSK, end at Thu 2016-01-21 21:09:45 MSK. --
Jan 21 21:09:45 localhost.localdomain systemd[1]: tarantool@my_app.service: Unit entered failed state.
Jan 21 21:09:45 localhost.localdomain systemd[1]: tarantool@my_app.service: Failed with result 'exit-code'.
Jan 21 21:09:45 localhost.localdomain systemd[1]: tarantool@my_app.service: Service hold-off time over, scheduling restart.
Jan 21 21:09:45 localhost.localdomain systemd[1]: Stopped Tarantool Database Server.
Jan 21 21:09:45 localhost.localdomain systemd[1]: Starting Tarantool Database Server...
Jan 21 21:09:45 localhost.localdomain tarantoolctl[5910]: /usr/bin/tarantoolctl: Found my_app.lua in /etc/tarantool/instances.available
Jan 21 21:09:45 localhost.localdomain tarantoolctl[5910]: /usr/bin/tarantoolctl: Starting instance...
Jan 21 21:09:45 localhost.localdomain systemd[1]: Started Tarantool Database Server. $ kill -SIGABRT $PID $ systemctl status tarantool@my_app|grep PID
Main PID: 5885 (tarantool)
$ tarantoolctl enter my_app
/bin/tarantoolctl: Found my_app.lua in /etc/tarantool/instances.available
/bin/tarantoolctl: Connecting to /var/run/tarantool/my_app.control
/bin/tarantoolctl: connected to unix/:/var/run/tarantool/my_app.control
unix/:/var/run/tarantool/my_app.control> os.exit(-1)
/bin/tarantoolctl: unix/:/var/run/tarantool/my_app.control: Remote host closed connection $ systemctl status tarantool@my_app|grep PID
Main PID: 5914 (tarantool) Alternatively, if you know the process ID of the instance (here we refer to it as $PID), you can abort a Tarantool instance by running ``gdb`` debugger: Automatic instance restart Causes an immediate shutdown. Core dumps Daemon supervision Debugger Effect Ensure session limits are configured to enable core dumps, i.e. say ``ulimit -c unlimited``. Check  "man 5 core" for other reasons why a core dump may not be produced. Finally, let’s check the boot logs: It is highly recommended to install ``tarantool-debuginfo`` package to improve ``gdb`` experience, for example: Make sure that core dumps include stack trace information. If you use a binary Tarantool distribution, this is automatic. If you build Tarantool from source, you will not get detailed information if you pass ``-DCMAKE_BUILD_TYPE=Release`` to CMake. May cause a database checkpoint. See :ref:`box.snapshot <box-snapshot>`. May cause graceful shutdown (information will be saved first). May cause graceful shutdown. May cause log file rotation. See the :ref:`example <cfg_logging-logging_example>` in reference on Tarantool logging parameters. Now let’s make sure that ``systemd`` has restarted the instance: Occasionally, you may find that the trace file contains output without debug symbols – the lines will contain ”??” instead of names. If this happens, check the instructions on these Tarantool wiki pages: `How to debug core dump of stripped tarantool <https://github.com/tarantool/tarantool/wiki/How-to-debug-core-dump-of-stripped-tarantool>`_ and `How to debug core from different OS <https://github.com/tarantool/tarantool/wiki/How-to-debug-core-from-different-OS>`_. On ``systemd``-enabled platforms, ``coredumpctl`` automatically saves core dumps and stack traces in case of a crash. Here is a general "how to" for how to enable core dumps on a Unix system: On ``systemd``-enabled platforms, ``systemd`` automatically restarts all Tarantool instances in case of failure. To demonstrate it, let’s try to destroy an instance: On a ``systemd-enabled`` system, to see the latest crashes of the Tarantool daemon, say: Other signals will result in behavior defined by the operating system. Signals other than SIGKILL may be ignored, especially if Tarantool is executing a long-running procedure which prevents return to the event loop in the transaction processor thread. SIGHUP SIGINT (also known as keyboard interrupt) SIGKILL SIGTERM SIGUSR1 Server signals Set a directory for writing core dumps to, and make sure that the directory is writable. On Linux, the directory path is set in a kernel parameter configurable via ``/proc/sys/kernel/core_pattern``. Signal Since Tarantool stores tuples in memory, core files may be large. For investigation, you normally don't need the whole file, but only a "stack trace" or "backtrace". Stack traces Symbolic names are present in stack traces even if you don’t have ``tarantool-debuginfo`` package installed. Tarantool makes a core dump if it receives any of the following signals: SIGSEGV, SIGFPE, SIGABRT or SIGQUIT. This is automatic if Tarantool crashes. Tarantool processes these signals during the event loop in the transaction processor thread: To find out the process id of the instance ($PID), you can: To save a core dump into a file, say: To save a stack trace into a file, say: To see the stack trace and other useful information in console, say: To simulate a crash, you can execute an illegal command against a Tarantool instance: To start ``gdb`` debugger on the core dump, say: ``gdb`` also provides information about the debuginfo packages you need to install: find it with ``ps -A | grep tarantool``, or look it up in the instance's :ref:`box.info.pid <box_introspection-box_info>`, or manually sending a SIGABRT signal: say ``systemctl status tarantool@my_app|grep PID``. where: Project-Id-Version: Tarantool 1.10
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
 "/tmp/tarantool_trace.txt" -- это пример пути до файла, в который сохраняется трассировка стека. "core" -- это путь до файла с дампом памяти, и "tarantool" -- это путь до исполняемого файла Tarantool'а, $ # !!! пожалуйста, никогда не делайте этого на боевом сервере !!!
$ tarantoolctl enter my_app
unix/:/var/run/tarantool/my_app.control> require('ffi').cast('char *', 0)[0] = 48
/bin/tarantoolctl: unix/:/var/run/tarantool/my_app.control: Remote host closed connection $ coredumpctl -o filename.core info <pid> $ coredumpctl gdb <pid> $ coredumpctl info 21035
          PID: 21035 (tarantool)
          UID: 995 (tarantool)
          GID: 992 (tarantool)
       Signal: 6 (ABRT)
    Timestamp: Sat 2016-01-23 15:51:42 MSK (4h 36min ago)
 Command Line: tarantool my_app.lua <running>
   Executable: /usr/bin/tarantool
Control Group: /system.slice/system-tarantool.slice/tarantool@my_app.service
         Unit: tarantool@my_app.service
        Slice: system-tarantool.slice
      Boot ID: 7c686e2ef4dc4e3ea59122757e3067e2
   Machine ID: a4a878729c654c7093dc6693f6a8e5ee
     Hostname: localhost.localdomain
      Message: Process 21035 (tarantool) of user 995 dumped core.

               Stack trace of thread 21035:
               #0  0x00007f84993aa618 raise (libc.so.6)
               #1  0x00007f84993ac21a abort (libc.so.6)
               #2  0x0000560d0a9e9233 _ZL12sig_fatal_cbi (tarantool)
               #3  0x00007f849a211220 __restore_rt (libpthread.so.0)
               #4  0x0000560d0aaa5d9d lj_cconv_ct_ct (tarantool)
               #5  0x0000560d0aaa687f lj_cconv_ct_tv (tarantool)
               #6  0x0000560d0aaabe33 lj_cf_ffi_meta___newindex (tarantool)
               #7  0x0000560d0aaae2f7 lj_BC_FUNCC (tarantool)
               #8  0x0000560d0aa9aabd lua_pcall (tarantool)
               #9  0x0000560d0aa71400 lbox_call (tarantool)
               #10 0x0000560d0aa6ce36 lua_fiber_run_f (tarantool)
               #11 0x0000560d0a9e8d0c _ZL16fiber_cxx_invokePFiP13__va_list_tagES0_ (tarantool)
               #12 0x0000560d0aa7b255 fiber_loop (tarantool)
               #13 0x0000560d0ab38ed1 coro_init (tarantool)
               ... $ coredumpctl list /usr/bin/tarantool
MTIME                            PID   UID   GID SIG PRESENT EXE
Sat 2016-01-23 15:21:24 MSK   20681  1000  1000   6   /usr/bin/tarantool
Sat 2016-01-23 15:51:56 MSK   21035   995   992   6   /usr/bin/tarantool $ dnf debuginfo-install tarantool $ gdb -batch -ex "generate-core-file" -p $PID $ gdb -p <pid>
...
Missing separate debuginfos, use: dnf debuginfo-install
glibc-2.22.90-26.fc24.x86_64 krb5-libs-1.14-12.fc24.x86_64
libgcc-5.3.1-3.fc24.x86_64 libgomp-5.3.1-3.fc24.x86_64
libselinux-2.4-6.fc24.x86_64 libstdc++-5.3.1-3.fc24.x86_64
libyaml-0.1.6-7.fc23.x86_64 ncurses-libs-6.0-1.20150810.fc24.x86_64
openssl-libs-1.0.2e-3.fc24.x86_64 $ gdb -se "tarantool" -ex "bt full" -ex "thread apply all bt" --batch -c core> /tmp/tarantool_trace.txt $ journalctl -u tarantool@my_app -n 8
-- Записи начинаются в пятницу 08.01.2016 12:21:53 MSK, заканчиваются в четверг 21.01.2016 2016-01-21 21:09:45 MSK. --
Jan 21 21:09:45 localhost.localdomain systemd[1]: tarantool@my_app.service: Unit entered failed state.
Jan 21 21:09:45 localhost.localdomain systemd[1]: tarantool@my_app.service: Failed with result 'exit-code'.
Jan 21 21:09:45 localhost.localdomain systemd[1]: tarantool@my_app.service: Service hold-off time over, scheduling restart.
Jan 21 21:09:45 localhost.localdomain systemd[1]: Stopped Tarantool Database Server.
Jan 21 21:09:45 localhost.localdomain systemd[1]: Starting Tarantool Database Server...
Jan 21 21:09:45 localhost.localdomain tarantoolctl[5910]: /usr/bin/tarantoolctl: Found my_app.lua in /etc/tarantool/instances.available
Jan 21 21:09:45 localhost.localdomain tarantoolctl[5910]: /usr/bin/tarantoolctl: Starting instance...
Jan 21 21:09:45 localhost.localdomain systemd[1]: Started Tarantool Database Server. $ kill -SIGABRT $PID $ systemctl status tarantool@my_app|grep PID
Main PID: 5885 (tarantool)
$ tarantoolctl enter my_app
/bin/tarantoolctl: Found my_app.lua in /etc/tarantool/instances.available
/bin/tarantoolctl: Connecting to /var/run/tarantool/my_app.control
/bin/tarantoolctl: connected to unix/:/var/run/tarantool/my_app.control
unix/:/var/run/tarantool/my_app.control> os.exit(-1)
/bin/tarantoolctl: unix/:/var/run/tarantool/my_app.control: Remote host closed connection $ systemctl status tarantool@my_app|grep PID
Main PID: 5914 (tarantool) Есть другой способ: если вы знаете PID экземпляра ($PID в нашем примере),  можно остановить этот экземпляр, запустив отладчик ``gdb``: Автоматическая перезагрузка экземпляра Приводит к аварийному завершению работы. Создание дампов памяти Контроль за фоновыми программами Отладчик Эффект Убедитесь, что лимиты для сессии установлены таким образом, чтобы можно было создавать дампы памяти, -- выполните команду ``ulimit -c unlimited``.  Также проверьте "man 5 core" на другие причины, по которым дамп памяти  может не создаваться. И под конец проверим содержимое журнала загрузки: Мы очень рекомендуем установить пакет ``tarantool-debuginfo``, чтобы сделать отладку средствами ``gdb`` более эффективной. Например: Убедитесь, что дампы памяти включают трассировку стека. При использовании  бинарного дистрибутива Tarantool'а эта информация включается автоматически. При сборке Tarantool'а из исходников, если передать CMake флаг ``-DCMAKE_BUILD_TYPE=Release``, вы не получите подробной информации. Может привести к созданию снимка состояния базы данных, см. описание функции :ref:`box.snapshot <box-snapshot>`. Может привести к корректному завершению работы (с предварительным сохранением всех данных). Может привести к корректному завершению работы. Может привести к ротации журналов, см. :ref:`пример <cfg_logging-logging_example>` в справочнике по параметрам журналирования Tarantool'а. А теперь убедимся, что ``systemd`` перезапустила его: Иногда может оказаться, что файл с трассировкой стека не содержит отладочных символов -- в таких строках вместо имени будет стоять ”??”. Если это произошло, ознакомьтесь с инструкциями на этих двух wiki-страницах Tarantool'а: `How to debug core dump of stripped tarantool  <https://github.com/tarantool/tarantool/wiki/How-to-debug-core-dump-of- stripped-tarantool>`_ и `How to debug core from different OS <https://github.com/tarantool/tarantool/wiki/How-to-debug-core-from- different-OS>`_. На платформах, где доступна утилита ``systemd``, ``coredumpctl`` автоматически сохраняет дампы памяти и трассировку стека при аварийном завершении Tarantool-сервера. Вот как включить создание дампов памяти в Unix-системе: На платформах, где доступна утилита ``systemd``, ``systemd`` автоматически перезагружает все экземпляры Tarantool'а при сбое. Чтобы продемонстрировать это, отключим один из экземпляров: Чтобы посмотреть на последние сбои Tarantool-демона на платформах, где доступна утилита ``systemd``, выполните команду: Остальные сигналы приводят к заданному операционной системой поведению. Все сигналы, за исключением SIGKILL, можно игнорировать, особенно если Tarantool выполняет длительную процедуру и не может вернуться в событийный цикл в потоке обработки транзакций. SIGHUP SIGINT (или "прерывание от клавиатуры") SIGKILL SIGTERM SIGUSR1 Сигналы от сервера Создайте директорию для записи дампов памяти и убедитесь, что в эту директорию действительно можно производить запись. На Linux путь до директории задается в параметре ядра, который настраивается через ``/proc/sys/kernel/core_pattern``. Сигнал Так как Tarantool хранит кортежи в памяти, файлы с дампами памяти могут быть довольно большими. Чтобы найти проблему, обычно целый файл не нужен -- достаточно только "трассировки стека" или "обратной трассировки". Трассировка стека В трассировке стека присутствуют символические имена, даже если у вас не установлен пакет ``tarantool-debuginfo``. Tarantool создает дамп памяти при получении одного из следующих сигналов: SIGSEGV, SIGFPE, SIGABRT или SIGQUIT. При сбое Tarantool'а дамп создается автоматически. Во время событийного цикла в потоке обработки транзакций Tarantool обрабатывает следующие сигналы: Чтобы узнать PID экземпляра, можно: Чтобы сохранить дамп памяти в файл, выполните команду: Чтобы сохранить трассировку стека в файл, выполните команду: Чтобы получить трассировку стека и прочую полезную информацию в консоли, выполните команду: Для симуляции сбоя можно попытаться выполнить нелегальную команду на работающем экземпляре Tarantool'а: Для запуска отладчика ``gdb``, выполните команду: С помощью ``gdb`` можно узнать, какие еще ``debuginfo``-пакеты нужно установить: использовать команду ``ps -A | grep tarantool``, или посмотреть его с помощью :ref:`box.info.pid <box_introspection-box_info>`, или послав вручную сигнал SIGABRT: выполнить ``systemctl status tarantool@my_app|grep PID``. где: 