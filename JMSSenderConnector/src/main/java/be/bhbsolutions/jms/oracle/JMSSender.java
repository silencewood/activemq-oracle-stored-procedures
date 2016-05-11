package be.bhbsolutions.jms.oracle;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Arrays;
import java.util.Properties;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.Context;
import javax.naming.InitialContext;


/**
 * @author Hassen BENNOUR bennour.hassen@gmail.com
 * 
 */
public class JMSSender {
	private static final String insertTableSQL = "INSERT INTO LOGS_JMS (TEXT_LOG) VALUES (?) ";
	private static final String defaultConnection = "jdbc:default:connection:";

	/**
	 * 
	 * 11 mai 2016
	 * 
	 * @project JMSSenderConnector
	 * @author Hassen BENNOUR bennour.hassen@gmail.com
	 * 
	 * @param text
	 *            to send
	 * @param initialContextFactory
	 *            , value for java.naming.factory.initial
	 * @param providerUrl
	 *            , value for java.naming.provider.url
	 * @param jndiPrefix
	 *            , "topic" or "queue"
	 * @param destinationName
	 * @param user
	 *            for creating Connection, or null for anonymous user
	 * @param pwd
	 *            for creating Connection, or null for anonymous user
	 * @throws Exception
	 */
	public static void doSend(String text, String initialContextFactory,
			String providerUrl, String jndiPrefix, String destinationName,
			String user, String pwd) throws Exception {
		java.sql.Connection dbConnection = null;
		PreparedStatement statement = null;
		Connection writeDestConnection = null;
		try {
			dbConnection = DriverManager.getConnection(defaultConnection);
			statement = dbConnection.prepareStatement(insertTableSQL);
			Properties props = new Properties();
			props.put(Context.INITIAL_CONTEXT_FACTORY, initialContextFactory);
			props.setProperty(Context.PROVIDER_URL, providerUrl);
			props.put(jndiPrefix + "." + destinationName, destinationName);

			Class.forName(initialContextFactory);

			InitialContext ic = new InitialContext(props);
			ConnectionFactory cf1 = (ConnectionFactory) ic
					.lookup("ConnectionFactory");
			Destination writeDestination = (Destination) ic
					.lookup(destinationName);
			if (user != null && pwd != null) {
				writeDestConnection = cf1.createConnection(user, pwd);
			} else {
				writeDestConnection = cf1.createConnection();
			}
			Session writeDestSession = writeDestConnection.createSession(false,
					Session.AUTO_ACKNOWLEDGE);
			MessageProducer writeDestProducer = writeDestSession
					.createProducer(writeDestination);
			writeDestConnection.start();
			TextMessage resp = writeDestSession.createTextMessage(text);
			writeDestProducer.send(resp);
		} catch (Exception e) {
			write(e.toString(), statement, dbConnection);
			write(Arrays.toString(e.getStackTrace()), statement, dbConnection);
		} finally {
			if (writeDestConnection != null) {
				try {
					writeDestConnection.stop();
					writeDestConnection.close();
				} catch (Exception e) {
				}
				writeDestConnection = null;
			}
			if (statement != null) {
				try {
					statement.close();
				} catch (Exception e) {
				}
				statement = null;
			}
			if (dbConnection != null) {
				try {
					dbConnection.close();
				} catch (Exception e) {
				}
				dbConnection = null;
			}
		}
	}

	private static void write(String log, PreparedStatement statement,
			java.sql.Connection dbConnection) {
		try {
			System.out.println(log);
		} catch (Exception e2) {
		}
		try {
			if (dbConnection != null && !dbConnection.isClosed()
					&& statement != null && !statement.isClosed())
				statement.clearParameters();
			statement.setString(1, log);
			statement.executeUpdate();
			dbConnection.commit();
		} catch (Exception e1) {
		}
	}
}
