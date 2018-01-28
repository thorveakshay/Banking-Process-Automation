/**
 * 
 */
package com.training.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

import com.training.utils.ConnectionUtil;

/**
 *  
 *
 */
public class CloseAccountDaoImpl implements CloseAccountDao {

	public boolean closeAccount(String acc, String accid)
			throws NullPointerException, SQLException, ClassNotFoundException, ParseException {

		PreparedStatement ps = null;
		Connection con = null;
		Boolean var = false;

		Date date = new Date(0);

		java.sql.Date d = new java.sql.Date(new java.util.Date().getTime());

		con = ConnectionUtil.getConnection();

		String updateStatement = "update  NON_PERSONAL_ACCOUNT set STATUS = ?, ACCOUNT_CLOSE_DATE = ?  where ACCOUNT_NUMBER = ? and ID=?";

		ps = con.prepareStatement(updateStatement);
		ps.setString(1, "INACTIVE");
		ps.setDate(2, d);

		ps.setString(3, acc);

		ps.setString(4, accid);

		ps.executeUpdate();
		var = true;

		return var;

	}

}
