��    (      \              �     �  +   �     �  #   �          *     9     O  _   j  �   �     y  '   �  Y  �       4   #  $   X     }  
   �     �     �     �     �     �  
   �  �   �  &   �     �  "   �       (        D     K     P     V  ,   e     �     �  D  �  /   �	  �  
  ?   �  N   �  ?   F  1   �  /   �     �  /     A   7  _   y  �   �     �  '   �  �  �     u  o   �  E   �     <     I  :   a     �     �     �     �     �  K  �  i   E  7   �  I   �     1  S   F     �     �     �  %   �  7   �        2   5  D  h  �   �   'b' - big-endian, 'h' - endianness depends on host (default), 'l' - little-endian, 'n' - endianness depends on network 16-byte binary string 16-byte string 36-byte binary string 36-byte hexadecimal string :ref:`uuid() <uuid-__call>` |br| :ref:`uuid.bin() <uuid-bin>` |br| :ref:`uuid.str() <uuid-str>` :ref:`uuid.fromstr() <uuid-fromstr>` |br| :ref:`uuid.frombin() <uuid-frombin>` |br| :ref:`uuid_object:bin() <uuid-object_bin>` |br| :ref:`uuid_object:str() <uuid-object_str>` :ref:`uuid.nil <uuid-nil>` :ref:`uuid_object:isnil() <uuid-isnil>` A "UUID" is a `Universally unique identifier`_. If an application requires that a value be unique only within a single computer or on a single database, then a simple counter is better than a UUID, because getting a UUID is time-consuming (it requires a syscall_). For clusters of computers, or widely distributed applications, UUIDs are better. A nil object Below is list of all ``uuid`` functions and members. Check if a UUID is an all-zero value Example Get a UUID Get a converted UUID Index Module `uuid` Name Overview Parameters The all-zero UUID value can be expressed as uuid.NULL, or as ``uuid.fromstr('00000000-0000-0000-0000-000000000000')``. The comparison with an all-zero value can also be expressed as ``uuid_with_type_cdata == uuid.NULL``. UUID converted from cdata input value. UUID in 16-byte binary string UUID in 36-byte hexadecimal string Use ``byte-order`` can be one of next flags: a UUID bool cdata converted UUID one of ``'l'``, ``'b'``, ``'h'`` or ``'n'``. return rtype tarantool> uuid = require('uuid')
---
...
tarantool> uuid(), uuid.bin(), uuid.str()
---
- 16ffedc8-cbae-4f93-a05e-349f3ab70baa
- !!binary FvG+Vy1MfUC6kIyeM81DYw==
- 67c999d2-5dce-4e58-be16-ac1bcb93160f
...
tarantool> uu = uuid()
---
...
tarantool> #uu:bin(), #uu:str(), type(uu), uu:isnil()
---
- 16
- 36
- cdata
- false
... true if the value is all zero, otherwise false. Project-Id-Version: Tarantool 1.10
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
 'b' - порядок от старшего к младшему, 'h' - порядок зависит от хоста (по умолчанию), 'l' - порядок от младшего к старшему, 'n' - порядок зависит от сети 16-байтная двоичная строка 16-байтная строка 36-байтная двоичная строка 36-байтная шестнадцатеричная строка :ref:`uuid() <uuid-__call>` |br| :ref:`uuid.bin() <uuid-bin>` |br| :ref:`uuid.str() <uuid-str>` :ref:`uuid.fromstr() <uuid-fromstr>` |br| :ref:`uuid.frombin() <uuid-frombin>` |br| :ref:`uuid_object:bin() <uuid-object_bin>` |br| :ref:`uuid_object:str() <uuid-object_str>` :ref:`uuid.nil <uuid-nil>` :ref:`uuid_object:isnil() <uuid-isnil>` UUID -- это Универсальный уникальный идентификатор (`Universally unique identifier`_). Если значение должно быть уникальным в пределах отдельного компьютера или одной базы данных, лучше использовать простой счетчик вместо UUID, поскольку получение UUID затратно по времени (требуется syscall_). Что же касается кластеров компьютеров или широко распространенных приложений, лучше использовать UUID. Объект nil Ниже приведен перечень всех функций и элементов модуля ``uuid``. Проверка, состоит ли UUID из одних нулей Пример Получение UUID Получение конвертированного UUID Указатель Модуль `uuid` Имя Общие сведения Параметры Значение UUID из одних нулей может быть выражено как uuid.NULL или ``uuid.fromstr('00000000-0000-0000-0000-000000000000')``. Сравнение со значением из одних нулей также может быть выражено как ``uuid_with_type_cdata == uuid.NULL``. UUID, сконвертированный из введенного значения формата cdata. UUID в 16-байтной двоичной строке UUID в 36-байтной шестнадцатеричной строке Назначение ``byte-order`` может быть одним из следующих флагов: UUID bool (логический) cdata. конвертированный UUID один из ``'l'``, ``'b'``, ``'h'`` или ``'n'``. возвращает тип возвращаемого значения tarantool> uuid = require('uuid')
---
...
tarantool> uuid(), uuid.bin(), uuid.str()
---
- 16ffedc8-cbae-4f93-a05e-349f3ab70baa
- !!binary FvG+Vy1MfUC6kIyeM81DYw==
- 67c999d2-5dce-4e58-be16-ac1bcb93160f
...
tarantool> uu = uuid()
---
...
tarantool> #uu:bin(), #uu:str(), type(uu), uu:isnil()
---
- 16
- 36
- cdata
- false
... true (правда), если значение состоит из одних нулей, в противном случае false (ложь). 