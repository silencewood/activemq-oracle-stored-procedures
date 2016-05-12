# activemq-oracle-stored-procedures
A set of stored procedures for publishing JMS messages to a ActiveMQ broker from an Oracle DB with Java installed.

0. copy the files JMSSenderConnector/binary/activemq-all-clean-5.10.0.jar & JMSSenderConnector/binary/JMSSenderConnector.jar somewhere in the file system of your oracle database, this folder is named here “JMSSenderConnectorLibsFolder”
1. edit the file JMSSenderConnector/sql/1-permissions.sql and replace the values for (eg ) and execute it as DBA.
2. edit the file JMSSenderConnector/sql/2-load-into-oracle.sql and replace the values for (eg ) and execute it as DBA.
3. execute the file JMSSenderConnector/sql/3-package.sql as DBA.

and that’s it!

Tested on Oracle 12c, java 1.6.0_71

try it like this :

DECLARE
timestart NUMBER;
BEGIN
timestart:=dbms_utility.get_time();
JMS_UTILS.SEND_TO_QUEUE_PR(‘heyyyyyyyyyy-’ || to_char(systimestamp, ‘HH24:mm:ss,FF3’));
dbms_output.put_line(‘duration:’ || (dbms_utility.get_time()-timestart));
END;

Please let me know if all things are ok et if there is a bug! bennour.hassen@gmail.com