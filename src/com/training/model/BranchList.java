/**
 * 
 */
package com.training.model;

import java.util.ArrayList;

/**
 *  
 *
 */
public class BranchList {
	private ArrayList<Branch> branchList = new ArrayList<Branch>();

	/**
	 * @param branchList
	 */
	public BranchList(ArrayList<Branch> branchList) {
		super();
		this.branchList = branchList;
	}

	/**
	 * @return the branchList
	 */
	public ArrayList<Branch> getBranchList() {
		return branchList;
	}

	/**
	 * @param branchList
	 *            the branchList to set
	 */
	public void setBranchList(ArrayList<Branch> branchList) {
		this.branchList = branchList;
	}

}
