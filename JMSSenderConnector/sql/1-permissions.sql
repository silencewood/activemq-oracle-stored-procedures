--To change :
--<USER_SCHEMA>: schema to load into java classes
--<JMSSenderConnectorLibsFolder> :  physical path to directory where jar's are.
--<HOSTNAMEorIP> : host name or IP
--<PORT> : used port for TCP or openwire

CALL SYS.DBMS_JAVA.GRANT_PERMISSION( '<USER_SCHEMA>', 'SYS:java.lang.reflect.ReflectPermission', '*', '' );
CALL SYS.DBMS_JAVA.GRANT_PERMISSION( '<USER_SCHEMA>', 'SYS:java.lang.RuntimePermission', '*', '' );
CALL SYS.DBMS_JAVA.GRANT_PERMISSION( '<USER_SCHEMA>', 'SYS:oracle.aurora.security.JServerPermission', '*', '' );
CALL SYS.DBMS_JAVA.GRANT_PERMISSION( '<USER_SCHEMA>', 'SYS:java.util.PropertyPermission', '*', 'read,write' );
CALL SYS.DBMS_JAVA.GRANT_PERMISSION( '<USER_SCHEMA>', 'SYS:java.net.SocketPermission', '<HOSTNAMEorIP>:<PORT>', 'accept, connect, listen, resolve');
CALL SYS.DBMS_JAVA.GRANT_PERMISSION( '<USER_SCHEMA>', 'java.io.FilePermission', '<JMSSenderConnectorLibsFolder>/-', 'read,write,delete');
call SYS.DBMS_JAVA.GRANT_PERMISSION( '<USER_SCHEMA>', 'SYS:java.util.PropertyPermission', 'java.net.preferIPv4Stack', 'write' );