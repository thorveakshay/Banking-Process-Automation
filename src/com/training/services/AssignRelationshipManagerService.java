/**
 * 
 */
package com.training.services;

import java.util.ArrayList;

import com.training.dao.AssignRelationshipManagerDao;
import com.training.dao.AssignRelationshipManagerDaoInterface;
import com.training.exception.AssignRelationshipManagerException;
import com.training.model.Branch;
import com.training.model.RelationshipManager;

/**
 *  
 *
 */

public class AssignRelationshipManagerService {

	private AssignRelationshipManagerDaoInterface assignRMDao = new AssignRelationshipManagerDao();

	// call to a function get details of relationship manager from branch name

	public ArrayList<RelationshipManager> getDetails(String branch) throws AssignRelationshipManagerException {
		return assignRMDao.getDetails(branch);
	}

	// call to a function get details of branch

	public ArrayList<Branch> getBranchDetails(int npId) throws AssignRelationshipManagerException {
		return assignRMDao.getBranchDetails(npId);
	}

	// call to a function get details of relationship manager from business id

	public String getRelationshipManager(int bcustid) throws AssignRelationshipManagerException {
		return assignRMDao.getRelationshipManager(bcustid);
	}

	// call to a function set relationship manager from business id, relationship
	// manager id

	public boolean setRelationshipManager(int bcustid, int relmgrid) throws AssignRelationshipManagerException {
		return assignRMDao.setRelationshipManager(bcustid, relmgrid);
	}

	// call to a function get Relationship Manager Id from business id

	public int getRelationshipManagerId(int bcustid) throws AssignRelationshipManagerException {
		return assignRMDao.getRelationshipManagerId(bcustid);
	}

	// call to a function get Relationship Manager name from Relationship Manager id

	public String getRelationshipManagerName(int rmid) throws AssignRelationshipManagerException {
		return assignRMDao.getRelationshipManagerName(rmid);
	}

	public ArrayList<Branch> getAllBranchDetails() throws AssignRelationshipManagerException {
		return assignRMDao.getAllBranchDetails();
	}
}
