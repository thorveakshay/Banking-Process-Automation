/**
 * 
 */
package com.training.dao;

import java.sql.SQLException;
import java.text.ParseException;

/**
 *  
 *
 */
public interface CloseAccountDao {

	public boolean closeAccount(String acc, String accid)
			throws NullPointerException, SQLException, ClassNotFoundException, ParseException;

}
