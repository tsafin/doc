.. _engines-chapter:

********************************************************************************
Engines
********************************************************************************

In this chapter, we introduce the difference of storing data using memtx or vinyl
storage engines.

A storage engine is a set of very-low-level routines which actually store and
retrieve tuple values. Tarantool offers a choice of two storage engines:

* memtx (the in-memory storage engine) is the default and was the first to
  arrive.

* vinyl (the on-disk storage engine) is a working key-value engine and will
  especially appeal to users who like to see data go directly to disk, so that
  recovery time might be shorter and database size might be larger. On the other
  hand, vinyl lacks some functions and options that are available with memtx.
  Where that is the case, the relevant description in this manual will contain
  a note beginning with the words "Note re storage engine". See also a coverage
  for all :ref:`the differences between memtx and vinyl <index-comparison_diff>` further
  on this page.

To specify that the engine should be vinyl, add the clause ``engine = 'vinyl'``
when creating a space, for example:
``space = box.schema.space.create('name', {engine='vinyl'})``.

This chapter contains the following sections:

.. toctree::
   :maxdepth: 2
   :numbered: 0

   comparison
   vinyl
