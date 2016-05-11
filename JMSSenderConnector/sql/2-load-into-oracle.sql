--To change :
--<USER_SCHEMA>: schema to load into java classes
--<USER/PWD> : user & password for this schema
--<PATH_TO_DIRECTORY> :  physical path to directory where jar's are.

call dbms_java.LOADJAVA('<PATH_TO_DIRECTORY>/activemq-all-clean-5.10.0.jar -v -u <USER/PWD> -resolver "((* <USER_SCHEMA>) (* PUBLIC) (* -))" -resolve -genmissing -verbose  -grant <USER_SCHEMA>');
call dbms_java.LOADJAVA('<PATH_TO_DIRECTORY>/JMSSenderConnector.jar -v -u <USER/PWD> -resolver "((* <USER_SCHEMA>) (* PUBLIC) (* -))" -resolve -verbose  -grant <USER_SCHEMA>');