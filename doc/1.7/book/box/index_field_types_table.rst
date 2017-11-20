.. _index_field_types_table:

.. container:: table

    .. rst-class:: left-align-column-1
    .. rst-class:: left-align-column-2
    .. rst-class:: left-align-column-3
    .. rst-class:: left-align-column-4
    .. rst-class:: top-align-column-1

    +----------------------------+----------------------------------+---------------------------------------+-------------------+
    | Indexed field type         | MsgPack data type |br|           | Index type                            | Examples          |
    |                            | (and possible values)            |                                       |                   |
    +============================+==================================+=======================================+===================+
    | **unsigned**               | **integer**                      | memtx TREE, BITSET or HASH            | 123456            |
    | (may also be called ‘uint’ | (integer between 0 and           | indexes, |br|                         |                   |
    | or ‘num’, but ‘num’ is     | 18446744073709551615, i.e.       | vinyl TREE indexes                    |                   |
    | deprecated)                | about 18 quintillion)            |                                       |                   |
    +----------------------------+----------------------------------+---------------------------------------+-------------------+
    | **integer**                | **integer**                      | memtx TREE or HASH indexes, |br|      | -2^63 |br|        |
    | (may also be called ‘int’) | (integer between                 | vinyl TREE indexes                    |                   |
    |                            | -9223372036854775808 and         |                                       |                   |
    |                            | 18446744073709551615)            |                                       |                   |
    +----------------------------+----------------------------------+---------------------------------------+-------------------+
    | **number**                 | **integer**                      | memtx TREE or HASH indexes, |br|      | 1.234 |br|        |
    |                            | (integer between                 | vinyl TREE indexes                    | -44 |br|          |
    |                            | -9223372036854775808 and         |                                       | 1.447e+44         |
    |                            | 18446744073709551615)            |                                       |                   |
    |                            |                                  |                                       |                   |
    |                            | **double**                       |                                       |                   |
    |                            | (single-precision floating       |                                       |                   |
    |                            | point number or double-precision |                                       |                   |
    |                            | floating point number)           |                                       |                   |
    +----------------------------+----------------------------------+---------------------------------------+-------------------+
    | **string**                 | **string**                       | memtx TREE or HASH indexes |br|       | 'A B C' |br|      |
    | (may also be called ‘str’) | (any set of octets,              | vinyl TREE indexes                    | '\\65 \\66 \\67'  |
    |                            | up to the maximum length)        |                                       |                   |
    +----------------------------+----------------------------------+---------------------------------------+-------------------+
    | **boolean**                | **bool**                         | memtx TREE or HASH indexes, |br|      | false |br|        |
    |                            | (true or false)                  | vinyl TREE indexes                    | true              |
    +----------------------------+----------------------------------+---------------------------------------+-------------------+
    | **array**                  | **array**                        | memtx RTREE indexes                   | {10, 11} |br|     |
    |                            | (list of integers between        |                                       | {3, 5, 9, 10}     |
    |                            | -9223372036854775808 and         |                                       |                   |
    |                            | 9223372036854775807,             |                                       |                   |
    |                            | representing points in a         |                                       |                   |
    |                            | geometric figure)                |                                       |                   |
    +----------------------------+----------------------------------+---------------------------------------+-------------------+
    | **scalar**                 | **bool**                         | memtx TREE or HASH indexes, |br|      | true |br|         |
    |                            | (true or false)                  | vinyl TREE indexes                    | -1 |br|           |
    |                            |                                  |                                       | 1.234 |br|        |
    |                            | **integer**                      |                                       | '' |br|           |
    |                            | (integer between                 |                                       | 'ру'              |
    |                            | -9223372036854775808 and         |                                       |                   |
    |                            | 18446744073709551615)            |                                       |                   |
    |                            |                                  |                                       |                   |
    |                            | **double**                       |                                       |                   |
    |                            | (single-precision floating       |                                       |                   |
    |                            | point number or double-precision |                                       |                   |
    |                            | floating point number)           |                                       |                   |
    |                            |                                  |                                       |                   |
    |                            | **string** (any set of octets)   |                                       |                   |
    |                            |                                  |                                       |                   |
    |                            | Note: When there is a mix of     |                                       |                   |
    |                            | types, the key order is:         |                                       |                   |
    |                            | booleans, then integers,         |                                       |                   |
    |                            | then strings.                    |                                       |                   |
    +----------------------------+----------------------------------+---------------------------------------+-------------------+

