--To change :
--<USER_SCHEMA>: schema to load into java classes
--<USER/PWD> : user & password for this schema
--<JMSSenderConnectorLibsFolder> :  physical path to directory where jar's are.

call dbms_java.LOADJAVA('<JMSSenderConnectorLibsFolder>/activemq-all-clean-5.10.0.jar -v -u <USER/PWD> -resolver "((* <USER_SCHEMA>) (* PUBLIC) (* -))" -resolve -genmissing -verbose  -grant <USER_SCHEMA>');
call dbms_java.LOADJAVA('<JMSSenderConnectorLibsFolder>/JMSSenderConnector.jar -v -u <USER/PWD> -resolver "((* <USER_SCHEMA>) (* PUBLIC) (* -))" -resolve -verbose  -grant <USER_SCHEMA>');