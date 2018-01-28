/**
 * 
 */
package com.training.services;

import com.training.dao.LoginDao;
import com.training.dao.LoginDaoInterface;
import com.training.exception.LoginException;

/**
 *  
 *
 */
public class LoginService {

	LoginDaoInterface ldao = new LoginDao();

	public boolean authenticateUser(int user, String Password) throws LoginException {

		return ldao.authenticateUser(user, Password);

	}

	public String checkDesignation(int user) throws LoginException {

		return ldao.checkDesignation(user);

	}

	public String getUserName(int user) throws LoginException {

		return ldao.getUserName(user);
	}

	LoginDaoInterface login = new LoginDao();

	public boolean getLoginDetails(int username, String password) {
		return ldao.getLoginDetails(username, password);
	}
}
