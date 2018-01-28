/**
 * 
 */
package com.training.dao;

import com.training.exception.AssignRelationshipManagerException;
import com.training.model.CustomerAddress;

/**
 *  
 *
 */
public interface WelcomeLetterInterface {
	public CustomerAddress getAddress(int bcustid) throws AssignRelationshipManagerException;
}
