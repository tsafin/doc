��    
      l               �   9   �   e   �   P   ]     �  �   �  Q   g  n   �  8   (  J   a  �  �  O   O  �   �  �   f  '       >  �   \  �    	  K   �	  x   �	   Delete the replica's record from the following locations: If any of a replica's .xlog/.snap/.run files are corrupted or deleted, you can "re-seed" the replica: Remember that this procedure works only if the master’s WAL files are present. Reseeding a replica Restart the replica with the same instance file to contact the master again. The replica will then catch up with the master by retrieving all the master’s tuples. See section :ref:`Removing instances <replication-remove_instances>` for details. Stop the replica and destroy all local database files (the ones with extensions .xlog/.snap/.run/.inprogress). the ``box.space._cluster`` tuple on the master instance. the ``replication`` parameter at all running instances in the replica set. Project-Id-Version: Tarantool 1.10
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
 Удалите запись о реплике из следующих мест: Если один из файлов формата .xlog/.snap/.run на реплике поврежден или удален, можно "перезагрузить" реплику данными: Следует отметить, что эта процедура сработает только в том случае, если на мастере есть WAL-файлы. Перезагрузка реплики Перезапустите реплику с тем же файлом экземпляра для повторного подключения к мастеру. Реплика синхронизируется с мастером после получения всех кортежей. Для получения подробной информации см. Раздел :ref:`Удаление экземпляров <replication-remove_instances>`. Остановите реплику и удалите все локальные файлы базы данных (с расширениями .xlog/.snap/.run/.inprogress). кортеж ``box.space._cluster`` на мастер-экземпляре. параметр ``replication`` на всех работающих экземплярах в наборе реплик. 