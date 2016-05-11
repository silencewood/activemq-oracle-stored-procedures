
CALL SYS.DBMS_JAVA.GRANT_PERMISSION( '<ToChange-ORACLE_SCHEMA_USER>', 'SYS:java.lang.reflect.ReflectPermission', '*', '' );
CALL SYS.DBMS_JAVA.GRANT_PERMISSION( '<ToChange-ORACLE_SCHEMA_USER>', 'SYS:java.lang.RuntimePermission', '*', '' );
CALL SYS.DBMS_JAVA.GRANT_PERMISSION( '<ToChange-ORACLE_SCHEMA_USER>', 'SYS:oracle.aurora.security.JServerPermission', '*', '' );
CALL SYS.DBMS_JAVA.GRANT_PERMISSION( '<ToChange-ORACLE_SCHEMA_USER>', 'SYS:java.util.PropertyPermission', '*', 'read,write' );
CALL SYS.DBMS_JAVA.GRANT_PERMISSION( '<ToChange-ORACLE_SCHEMA_USER>', 'SYS:java.net.SocketPermission', '<ToChange-HOSTNAMEorIP>:<ToChange-PORT>', 'accept, connect, listen, resolve');
call SYS.DBMS_JAVA.GRANT_PERMISSION( '<ToChange-ORACLE_SCHEMA_USER>', 'SYS:java.util.PropertyPermission', 'java.net.preferIPv4Stack', 'write' );