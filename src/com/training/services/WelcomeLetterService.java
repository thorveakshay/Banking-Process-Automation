/**
 * 
 */
package com.training.services;

import com.training.dao.WelcomeLetterDao;
import com.training.dao.WelcomeLetterInterface;
import com.training.exception.AssignRelationshipManagerException;
import com.training.model.CustomerAddress;

/**
 *  
 *
 */
public class WelcomeLetterService {
	private WelcomeLetterInterface wldao = new WelcomeLetterDao();

	// call to a function get address of the business customer

	public CustomerAddress getAddress(int bcustid) throws AssignRelationshipManagerException {
		return wldao.getAddress(bcustid);
	}

}
