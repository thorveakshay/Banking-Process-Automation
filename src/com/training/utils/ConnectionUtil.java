/**
 * 
 */
package com.training.utils;

import static com.training.constants.CaoConstants.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *  
 *
 */
public class ConnectionUtil {

	// establish a connection. . . .
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Connection con = null;
		Class.forName(DRIVER_NAME);
		con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

		return con;

	}

	public static void closeConnection(Connection con) throws SQLException {
		if (con != null) {
			con.close();
		}
	}

	public static void closeStatement(PreparedStatement ps) throws SQLException {
		if (ps != null)
			ps.close();
	}

}
