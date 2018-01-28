/**
 * 
 */
package com.training.model;

import java.util.List;

/**
 *  
 *
 */
public class Employee {
	private long id;
	private String fName;
	private String lName;
	private String dateOfBirth;
	private String designation;
	private String status;
	private String dateOfJoin;
	private String dateOfLeaving;
	private String reasonOfLeaving;
	private String address;
	private long contactNumber;
	String branchName;
	private String emailId;
	private List<String> groups;

	// setters and getters

	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @return the branchId
	 */
	public String getBranchName() {
		return branchName;
	}

	/**
	 * @param branchId
	 *            the branchId to set
	 */
	public void setBranchName(String branch) {
		this.branchName = branch;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDateOfJoin() {
		return dateOfJoin;
	}

	public void setDateOfJoin(String dateOfJoin) {
		this.dateOfJoin = dateOfJoin;
	}

	public String getDateOfLeaving() {
		return dateOfLeaving;
	}

	public void setDateOfLeaving(String dateOfLeaving) {
		this.dateOfLeaving = dateOfLeaving;
	}

	public String getReasonOfLeaving() {
		return reasonOfLeaving;
	}

	public void setReasonOfLeaving(String reasonOfLeaving) {
		this.reasonOfLeaving = reasonOfLeaving;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Long getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(long contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	/**
	 * @return the groups
	 */
	public List<String> getGroups() {
		return groups;
	}

	/**
	 * @param groups
	 *            the groups to set
	 */
	public void setGroups(List<String> groups) {
		this.groups = groups;
	}

}
