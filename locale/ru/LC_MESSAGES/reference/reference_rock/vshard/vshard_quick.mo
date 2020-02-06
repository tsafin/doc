��          �               �    �  Z  �  �   �  X   �  U   D  8   �     �     �  A   	  �   J	  /   �	  0   
  0   9
  .   j
  U   �
  &   �
  <     =   S  u   �  h     �  p  �  2  �      �  Z  �  B    �   Z  �   �  n   p  '   �  3     �   ;  �   �  R   �  O       L   P   Q   �   _   �   ?   O!  `   �!  T   �!  �   E"  �   	#  �  �#  �  L(   $ cd example/
$ make
tarantoolctl stop storage_1_a  # stop the first storage instance
Stopping instance storage_1_a...
tarantoolctl stop storage_1_b
<...>
rm -rf data/
tarantoolctl start storage_1_a # start the first storage instance
Starting instance storage_1_a...
Starting configuration of replica 8a274925-a26d-47fc-9e1b-af88ce939412
I am master
Taking on replicaset master role...
Run console at unix/:./data/storage_1_a.control
started
mkdir ./data/storage_1_a
<...>
tarantoolctl start router_1 # start the router
Starting instance router_1...
Starting router configuration
Calling box.cfg()...
<...>
Run console at unix/:./data/router_1.control
started
mkdir ./data/router_1
Waiting cluster to start
echo "vshard.router.bootstrap()" | tarantoolctl enter router_1
connected to unix/:./data/router_1.control
unix/:./data/router_1.control> vshard.router.bootstrap()
---
- true
...
unix/:./data/router_1.control>
tarantoolctl enter router_1 # enter the admin console
connected to unix/:./data/router_1.control
unix/:./data/router_1.control> $ make start
$ ps x|grep tarantool
46564   ??  Ss     0:00.34 tarantool storage_1_a.lua <running>
46566   ??  Ss     0:00.19 tarantool storage_1_b.lua <running>
46568   ??  Ss     0:00.35 tarantool storage_2_a.lua <running>
46570   ??  Ss     0:00.20 tarantool storage_2_b.lua <running>
46572   ??  Ss     0:00.25 tarantool router_1.lua <running> -- Get instance name
local MY_UUID = "de0ea826-e71d-4a82-bbf3-b04a6413e417"

-- Call a configuration provider
local cfg = require('localcfg')

-- Start the database with sharding
vshard = require('vshard')
vshard.storage.cfg(cfg, MY_UUID) All instances are managed using the ``tarantoolctl`` utility which comes with Tarantool. Change the directory to ``example/`` and use ``make`` to run the development cluster: For example, to start all instances, use ``make start``: Sample configuration Some ``tarantoolctl`` commands: The configuration of a simple sharded cluster can look like this: The full list of ``tarantoolctl`` commands for managing Tarantool instances is available in the :ref:`tarantoolctl reference <tarantoolctl>`. ``make clean`` – clean up all persistent data ``make logcat`` – show logs from all instances ``make start`` – start all Tarantool instances ``make stop`` – stop all Tarantool instances ``make`` – execute ``make stop``, ``make clean``, ``make start`` and ``make enter`` ``router_1`` – a ``router`` instance ``tarantoolctl enter router_1``  – enter the admin console ``tarantoolctl start router_1`` – start the router instance ``vshard.storage.cfg()`` automatically calls ``box.cfg()`` and configures the listen port and replication parameters. cfg.listen = 3300

-- Start the database with sharding
vshard = require('vshard')
vshard.router.cfg(cfg) local cfg = {
    memtx_memory = 100 * 1024 * 1024,
    replication_connect_quorum = 0,
    bucket_count = 10000,
    rebalancer_disbalance_threshold = 10,
    rebalancer_max_receiving = 100,
    sharding = {
        ['cbf06940-0790-498b-948d-042b62cf3d29'] = {
            replicas = {
                ['8a274925-a26d-47fc-9e1b-af88ce939412'] = {
                    uri = 'storage:storage@127.0.0.1:3301',
                    name = 'storage_1_a',
                    master = true
                },
                ['3de2e3e1-9ebe-4d0d-abb1-26d301b84633'] = {
                    uri = 'storage:storage@127.0.0.1:3302',
                    name = 'storage_1_b'
                }
            },
        },
        ['ac522f65-aa94-4134-9f64-51ee384f1a54'] = {
            replicas = {
                ['1e02ae8a-afc0-4e91-ba34-843a356b8ed7'] = {
                    uri = 'storage:storage@127.0.0.1:3303',
                    name = 'storage_2_a',
                    master = true
                },
                ['001688c3-66f8-4a31-8e19-036c17d489c2'] = {
                    uri = 'storage:storage@127.0.0.1:3304',
                    name = 'storage_2_b'
                }
            },
        },
    },
} unix/:./data/router_1.control> vshard.router.info()
---
- replicasets:
    ac522f65-aa94-4134-9f64-51ee384f1a54:
      replica: &0
        network_timeout: 0.5
        status: available
        uri: storage@127.0.0.1:3303
        uuid: 1e02ae8a-afc0-4e91-ba34-843a356b8ed7
      uuid: ac522f65-aa94-4134-9f64-51ee384f1a54
      master: *0
    cbf06940-0790-498b-948d-042b62cf3d29:
      replica: &1
        network_timeout: 0.5
        status: available
        uri: storage@127.0.0.1:3301
        uuid: 8a274925-a26d-47fc-9e1b-af88ce939412
      uuid: cbf06940-0790-498b-948d-042b62cf3d29
      master: *1
  bucket:
    unreachable: 0
    available_ro: 0
    unknown: 0
    available_rw: 3000
  status: 0
  alerts: []
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
 $ cd example/
$ make
tarantoolctl stop storage_1_a  # stop the first storage instance
Stopping instance storage_1_a...
tarantoolctl stop storage_1_b
<...>
rm -rf data/
tarantoolctl start storage_1_a # start the first storage instance
Starting instance storage_1_a...
Starting configuration of replica 8a274925-a26d-47fc-9e1b-af88ce939412
I am master
Taking on replicaset master role...
Run console at unix/:./data/storage_1_a.control
started
mkdir ./data/storage_1_a
<...>
tarantoolctl start router_1 # start the router
Starting instance router_1...
Starting router configuration
Calling box.cfg()...
<...>
Run console at unix/:./data/router_1.control
started
mkdir ./data/router_1
Waiting cluster to start
echo "vshard.router.bootstrap()" | tarantoolctl enter router_1
connected to unix/:./data/router_1.control
unix/:./data/router_1.control> vshard.router.bootstrap()
---
- true
...
unix/:./data/router_1.control>
tarantoolctl enter router_1 # enter the admin console
connected to unix/:./data/router_1.control
unix/:./data/router_1.control> $ make start
$ ps x|grep tarantool
46564   ??  Ss     0:00.34 tarantool storage_1_a.lua <running>
46566   ??  Ss     0:00.19 tarantool storage_1_b.lua <running>
46568   ??  Ss     0:00.35 tarantool storage_2_a.lua <running>
46570   ??  Ss     0:00.20 tarantool storage_2_b.lua <running>
46572   ??  Ss     0:00.25 tarantool router_1.lua <running> -- Получение имени экземпляра
local MY_UUID = "de0ea826-e71d-4a82-bbf3-b04a6413e417"

-- Вызов поставщика конфигурации
local cfg = require('localcfg')

-- Запуск базы данных с шардингом
vshard = require('vshard')
vshard.storage.cfg(cfg, MY_UUID) Управление всеми экземплярами осуществляется с помощью утилиты ``tarantoolctl``. Измените директорию ``example/`` и используйте команду ``make`` для запуска кластера: Например, для запуска всех экземпляров используйте ``make start``: Образец конфигурации Некоторые команды ``tarantoolctl``: Конфигурация простого сегментированного кластера может выглядеть следующим образом: Полный список команд ``tarantoolctl`` для управления экземплярами Tarantool'а можно найти в :ref:`справочнике по tarantoolctl <tarantoolctl>`. ``make clean`` – очистка всех персистентных данных ``make logcat`` – вывод журналов всех экземпляров ``make start`` – запуск всех экземпляров Tarantool'а ``make stop`` – остановка всех экземпляров Tarantool'а ``make`` – выполнить ``make stop``, ``make clean``, ``make start`` и ``make enter`` ``router_1`` – экземпляр роутера (``router``) ``tarantoolctl enter router_1``  – вход в административную консоль ``tarantoolctl start router_1`` – запуск экземпляра роутера ``vshard.storage.cfg()`` автоматически вызывает ``box.cfg()`` и настраивает порт для прослушивания и параметры репликации. cfg.listen = 3300

-- Запуск базы данных с шардингом
vshard = require('vshard')
vshard.router.cfg(cfg) local cfg = {
    memtx_memory = 100 * 1024 * 1024,
    replication_connect_quorum = 0,
    bucket_count = 10000,
    rebalancer_disbalance_threshold = 10,
    rebalancer_max_receiving = 100,
    sharding = {
        ['cbf06940-0790-498b-948d-042b62cf3d29'] = {
            replicas = {
                ['8a274925-a26d-47fc-9e1b-af88ce939412'] = {
                    uri = 'storage:storage@127.0.0.1:3301',
                    name = 'storage_1_a',
                    master = true
                },
                ['3de2e3e1-9ebe-4d0d-abb1-26d301b84633'] = {
                    uri = 'storage:storage@127.0.0.1:3302',
                    name = 'storage_1_b'
                }
            },
        },
        ['ac522f65-aa94-4134-9f64-51ee384f1a54'] = {
            replicas = {
                ['1e02ae8a-afc0-4e91-ba34-843a356b8ed7'] = {
                    uri = 'storage:storage@127.0.0.1:3303',
                    name = 'storage_2_a',
                    master = true
                },
                ['001688c3-66f8-4a31-8e19-036c17d489c2'] = {
                    uri = 'storage:storage@127.0.0.1:3304',
                    name = 'storage_2_b'
                }
            },
        },
    },
} unix/:./data/router_1.control> vshard.router.info()
---
- replicasets:
    ac522f65-aa94-4134-9f64-51ee384f1a54:
      replica: &0
        network_timeout: 0.5
        status: available
        uri: storage@127.0.0.1:3303
        uuid: 1e02ae8a-afc0-4e91-ba34-843a356b8ed7
      uuid: ac522f65-aa94-4134-9f64-51ee384f1a54
      master: *0
    cbf06940-0790-498b-948d-042b62cf3d29:
      replica: &1
        network_timeout: 0.5
        status: available
        uri: storage@127.0.0.1:3301
        uuid: 8a274925-a26d-47fc-9e1b-af88ce939412
      uuid: cbf06940-0790-498b-948d-042b62cf3d29
      master: *1
  bucket:
    unreachable: 0
    available_ro: 0
    unknown: 0
    available_rw: 3000
  status: 0
  alerts: []
... 