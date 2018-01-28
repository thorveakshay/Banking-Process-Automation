/**
 * 
 */
package com.training.dao;

import com.training.exception.LoginException;

/**
 *  
 *
 */
public interface LoginDaoInterface {

	public String checkDesignation(int user) throws LoginException;

	public boolean authenticateUser(int user, String Password) throws LoginException;

	public String getUserName(int user) throws LoginException;

	public boolean getLoginDetails(int username, String password);

}
