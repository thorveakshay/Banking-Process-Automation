/**
 * 
 */
package com.training.model;

/**
 *  
 *
 */

public class Branch {
	private String branchId;
	private String branchName;
	private String branchAddress;

	private String percentage;
	private String branch_id;
	private String branch_name;
	private String branch_address;

	/**
	 * 
	 */

	public Branch() {

	}

	/**
	 * @param branchId
	 * @param branchName
	 * @param branchAddress
	 */
	public Branch(String branchId, String branchName, String branchAddress) {
		super();
		this.branchId = branchId;
		this.branchName = branchName;
		this.branchAddress = branchAddress;
	}

	public Branch(String string) {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the branchId
	 */
	public String getBranchId() {
		return branchId;
	}

	/**
	 * @param branchId
	 *            the branchId to set
	 */
	public void setBranchId(String branchId) {
		this.branchId = branchId;
	}

	/**
	 * @return the branchName
	 */
	public String getBranchName() {
		return branchName;
	}

	/**
	 * @param branchName
	 *            the branchName to set
	 */
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	/**
	 * @return the branchAddress
	 */
	public String getBranchAddress() {
		return branchAddress;
	}

	/**
	 * @param branchAddress
	 *            the branchAddress to set
	 */
	public void setBranchAddress(String branchAddress) {
		this.branchAddress = branchAddress;
	}

	public String getPercentage() {
		return percentage;
	}

	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}

	public String getBranch_id() {
		return branch_id;
	}

	public void setBranch_id(String branchId) {
		branch_id = branchId;
	}

	public String getBranch_name() {
		return branch_name;
	}

	public void setBranch_name(String branchName) {
		branch_name = branchName;
	}

	public String getBranch_address() {
		return branch_address;
	}

	public void setBranch_address(String branchAddress) {
		branch_address = branchAddress;
	}
}
