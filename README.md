A set of stored procedures for publishing JMS messages to a ActiveMQ broker from an Oracle DB with Java installed.

copy the files activemq-all-clean-5.10.0.jar & JMSSenderConnector.jar somewhere in the file system of your oracle database, this folder is named here “JMSSenderConnectorLibsFolder”
edit the file JMSSenderConnector/sql/1-permissions.sql and replace the values for (eg ) and execute it as DBA.
edit the file JMSSenderConnector/sql/2-load-into-oracle.sql and replace the values for (eg ) and execute it as DBA.
execute the file JMSSenderConnector/sql/3-package.sql as DBA.
and that’s it!

Client Tested on Oracle 12c, java 1.6.0_71 with activemq-all-5.10.0.jar for java 6. note that i created a new file activemq-all-clean-5.10.0.jar from activemq-all-5.10.0.jar . this new file was created due to a bug on oracle 12c when we try to backup the database, we got an error when copying some classes of levelDB see above. i created this new file in which i removed all unused classes causing the problem.

ORA-39126: Worker unexpected fatal error in WORKER.GATHER_PARSE_ITEMS [JAVA_CLASS:"org/apache/activemq/leveldb/LevelDBClient$$anonfun$replay_from$1$$anonfun$apply$mcV$sp$4$$anonfun$apply$14"] ORA-06502: PL/SQL: numeric or value error: character string buffer too small

Version used of ActivMQ Server : Apache-activemq-5.13.1

try it like this :

DECLARE   
    timestart NUMBER;   
BEGIN   
    timestart:=dbms_utility.get_time();    
    JMS_UTILS.SEND_TO_QUEUE_PR('heyyyyyyyyyy-' || TO_CHAR(systimestamp, 'HH24:mm:ss,FF3'),    'org.apache.activemq.jndi.ActiveMQInitialContextFactory','tcp://localhost:61616', 'topic','myTopicTest', 'activemqUser' , 'activemqPwd');    
    dbms_output.put_line(‘duration:’ || (dbms_utility.get_time()-timestart));    
END;  

Please let me know if all things are ok and if there is a bug! bennour.hassen@gmail.com
