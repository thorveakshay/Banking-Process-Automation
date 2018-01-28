/**
 * 
 */
package com.training.dao;

import java.util.ArrayList;

import com.training.exception.AssignRelationshipManagerException;
import com.training.model.Branch;
import com.training.model.RelationshipManager;

/**
 *  
 *
 */
public interface AssignRelationshipManagerDaoInterface {

	public ArrayList<RelationshipManager> getDetails(String branch) throws AssignRelationshipManagerException;

	public ArrayList<Branch> getBranchDetails(int npId) throws AssignRelationshipManagerException;

	public String getRelationshipManager(int bcustid) throws AssignRelationshipManagerException;

	public boolean setRelationshipManager(int bcustid, int relmgrid) throws AssignRelationshipManagerException;

	public int getRelationshipManagerId(int bcustid) throws AssignRelationshipManagerException;

	public String getRelationshipManagerName(int rmid) throws AssignRelationshipManagerException;

	public ArrayList<Branch> getAllBranchDetails() throws AssignRelationshipManagerException;
}
