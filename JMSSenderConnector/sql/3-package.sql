CREATE OR REPLACE PACKAGE JMS_UTILS
AS
  PROCEDURE SEND_TO_QUEUE_PR(
      logs_txt VARCHAR2);

END JMS_UTILS;
/
CREATE OR REPLACE PACKAGE BODY JMS_UTILS
AS
PROCEDURE SEND_TO_QUEUE_PR(
    logs_txt VARCHAR2)
AS
  LANGUAGE JAVA NAME 'be.bhbsolutions.jms.oracle.JMSSender.doSend(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)';

END JMS_UTILS;
/



  CREATE TABLE "LOGS_JMS" 
   (	"TEXT_LOG" VARCHAR2(4000 BYTE), 
	"TIME_LOG" TIMESTAMP (6) DEFAULT systimestamp
   ) ;

   COMMENT ON COLUMN "LOGS_JMS"."TEXT_LOG" IS 'Log content of JMS Connector';
   COMMENT ON COLUMN "LOGS_JMS"."TIME_LOG" IS 'creation date';