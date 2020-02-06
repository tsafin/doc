��    A      $              ,     -  *   :      e  $   �  &   �  $   �  &   �  $     .   C  $   r  7   �  -   �  /   �  b   -     �     �     �     �     �  
   �  /   �       Q     U   ^  1   �  A   �  B   (     k     �  �   �  &   	  �   4	     �	  t   �	  %   >
     d
  <   l
  ;   �
  �   �
  6   i  8   �  <   �            6   #  d   Z  `   �  `      `   �  c   �  `   F  j   �  \     <   o     �     �     �     �       4   $  6   Y  -   �  .   �     �  �  �     �  *   �      �  $   �  &   !  $   H  &   m  $   �  .   �  $   �  c     g   q  _   �  �   9     �  @        H     ^     e     �  N   �     �  �   �  �   �  e   ^  �   �  �   E  B   �  2     �   >  K   �  '  E     m  �   �  I   H     �  �   �  �   \  �   �  c   �  ]   ,   �   �      !     &!  [   5!  d   �!  `   �!  `   W"  `   �"  c   #  `   }#  j   �#  \   I$  i   �$  G   %     X%  )   t%  I   �%  (   �%  Y   &  [   k&  X   �&  Z    '  +   {'   **Example:** :ref:`string.endswith() <string-endswith>` :ref:`string.hex() <string-hex>` :ref:`string.ljust() <string-ljust>` :ref:`string.lstrip() <string-lstrip>` :ref:`string.rjust() <string-rjust>` :ref:`string.rstrip() <string-rstrip>` :ref:`string.split() <string-split>` :ref:`string.startswith() <string-startswith>` :ref:`string.strip() <string-strip>` Below is a list of all additional ``string`` functions. Check if a string ends with a given substring Check if a string starts with a given substring In this section we only discuss the additional functions that the Tarantool developers have added. Index Left-justify a string Module `string` Name Overview Parameters Remove spaces on the left and right of a string Return Return True if ``input-string`` ends with ``end-string``, otherwise return False. Return True if ``input-string`` starts with ``start-string``, otherwise return False. Return the hexadecimal value of the input string. Return the string left-justified in a string of length ``width``. Return the string right-justified in a string of length ``width``. Right-justify a string Rtype Split ``input-string`` into one or more output strings in a table. The places to split are the places where ``split-string`` occurs. Split a string into a table of strings The :code:`string` module has everything in the `standard Lua string library <https://www.lua.org/pil/20.html>`_, and some Tarantool extensions. Use ``start-pos`` and ``end-pos`` may be negative, meaning the position should be calculated from the end of the string. a single character, default = 1 space boolean hexadecimal, 2 hex-digit characters for each input character left-justified string (unchanged if width <= string length) maximum number of delimiters to process counting from the beginning of the input string. Result will contain max + 1 parts maximum. position: where to end looking within ``input-string`` position: where to start looking within ``input-string`` right-justified string (unchanged if width <= string length) string table table of strings that were split from ``input-string`` tarantool> string = require('string')
---
...
tarantool> string.endswith('Baa', 'aa')
---
- true
... tarantool> string = require('string')
---
...
tarantool> string.hex('ABC ')
---
- '41424320'
... tarantool> string = require('string')
---
...
tarantool> string.ljust(' A', 5)
---
- ' A   '
... tarantool> string = require('string')
---
...
tarantool> string.lstrip(' ABC ')
---
- 'ABC '
... tarantool> string = require('string')
---
...
tarantool> string.rjust('', 5, 'X')
---
- 'XXXXX'
... tarantool> string = require('string')
---
...
tarantool> string.rstrip(' ABC ')
---
- ' ABC'
... tarantool> string = require('string')
---
...
tarantool> string.startswith(' A', 'A', 2, 5)
---
- true
... tarantool> string = require('string')
---
...
tarantool> string.strip(' ABC ')
---
- ABC
... the string to find within ``input-string``. Default = space. the string to left-justify the string to look for the string to process the string to right-justify the string to split the string where ``end-string`` should be looked for the string where ``start-string`` should be looked for the width of the string after left-justifying the width of the string after right-justifying true or false Project-Id-Version: Tarantool 1.10
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
 **Пример:** :ref:`string.endswith() <string-endswith>` :ref:`string.hex() <string-hex>` :ref:`string.ljust() <string-ljust>` :ref:`string.lstrip() <string-lstrip>` :ref:`string.rjust() <string-rjust>` :ref:`string.rstrip() <string-rstrip>` :ref:`string.split() <string-split>` :ref:`string.startswith() <string-startswith>` :ref:`string.strip() <string-strip>` Ниже приведен перечень всех функций библиотеки ``string``. Проверка, заканчивается ли строка на заданную подстроку Проверка, начинается ли строка с заданной подстроки В данном разделе мы рассматриваем только дополнительные функции, добавленные разработчиками Tarantool'а. Указатель Выравнивание строки по левому полю Модуль `string` Имя Общие сведения Параметры Удаление пробелов слева и справа от строки Возвращается Возврат true (правда), если ``input-string`` заканчивается на ``end-string``, в противном случае, возврат false (ложь). Возврат true (правда), если ``input-string`` начинается со ``start-string``, в противном случае, возврат false (ложь). Возврат шестнадцатеричного значения введенной строки. Возврат строки, выровненной по левому краю, шириной, указанной в ``width``. Возврат строки, выровненной по правому краю, шириной, указанной в ``width``. Выравнивание строки по правому полю Тип возвращаемого значения Разделение ``input-string`` на одну или более выводимых строк в таблице. Места разделения указаны в ``split-string``. Разделение строки на таблицу со строками Модуль :code:`string` включает в себя всё из `стандартной библиотеки для работы со строками в Lua <https://www.lua.org/pil/20.html>`_, а также некоторые расширения специально для Tarantool'а. Назначение Значения ``start-pos`` и ``end-pos`` могут быть отрицательными, что означает, что положение вычисляется с конца строки. отдельный символ, по умолчанию = 1 пробел boolean (логический) шестнадцатеричное число, два символа шестнадцатеричных цифр для каждого введенного символа выровненная по левому краю строка (не изменяется, если ширина <= длине строки) максимальное количество символов-разделителей от начала обрабатываемой строки. Результат содержит не более max + 1 частей. положение: где заканчивать искать в пределах ``input-string`` положение: где начинать искать в пределах ``input-string`` выровненная по правому краю строка (не изменяется, если ширина <= длине строки) строка таблица таблица строк, которые были разделены из ``input-string`` tarantool> string = require('string')
---
...
tarantool> string.endswith('Baa', 'aa')
---
- true
... tarantool> string = require('string')
---
...
tarantool> string.hex('ABC ')
---
- '41424320'
... tarantool> string = require('string')
---
...
tarantool> string.ljust(' A', 5)
---
- ' A   '
... tarantool> string = require('string')
---
...
tarantool> string.lstrip(' ABC ')
---
- 'ABC '
... tarantool> string = require('string')
---
...
tarantool> string.rjust('', 5, 'X')
---
- 'XXXXX'
... tarantool> string = require('string')
---
...
tarantool> string.rstrip(' ABC ')
---
- ' ABC'
... tarantool> string = require('string')
---
...
tarantool> string.startswith(' A', 'A', 2, 5)
---
- true
... tarantool> string = require('string')
---
...
tarantool> string.strip(' ABC ')
---
- ABC
... искомая строка в пределах ``input-string``. По умолчанию = пробел. строка для выравнивания по левому краю искомая строка обрабатываемая строка строка для выравнивания по правому краю строка для разделения строка, где производится поиск данных из ``end-string`` строка, где производится поиск данных из ``start-string`` ширина строки после выравнивания по левому краю ширина строки после выравнивания по правому краю true (правда) или false (ложь) 