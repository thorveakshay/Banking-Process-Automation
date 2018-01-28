package com.training.model;

import java.util.Date;

/**
 * 
 */

public class PersonalParty {
	private long partyId;
	private long npId;
	private String title;
	private String firstName;
	private String middleName;
	private String surName;
	private String relationshipType;
	private String keyParty;
	private String isExistingCustomer;
	private long branchId;
	private long accountNumber;
	private String emailId;
	private Date dateOfBirth;

	public long getPartyId() {
		return partyId;
	}

	public void setPartyId(long partyId) {
		this.partyId = partyId;
	}

	public long getNpId() {
		return npId;
	}

	public void setNpId(long ppId) {
		this.npId = npId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getSurName() {
		return surName;
	}

	public void setSurName(String surName) {
		this.surName = surName;
	}

	public String getRelationshipType() {
		return relationshipType;
	}

	public void setRelationshipType(String relationshipType) {
		this.relationshipType = relationshipType;
	}

	public String getKeyParty() {
		return keyParty;
	}

	public void setKeyParty(String keyParty) {
		this.keyParty = keyParty;
	}

	public String getIsExistingCustomer() {
		return isExistingCustomer;
	}

	public void setIsExistingCustomer(String isExistingCustomer) {
		this.isExistingCustomer = isExistingCustomer;
	}

	public long getBranchId() {
		return branchId;
	}

	public void setBranchId(long branchId) {
		this.branchId = branchId;
	}

	public long getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(long accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public PersonalParty() {

	}

	public PersonalParty(long partyId, long npId, String title, String firstName, String middleName, String surName,
			String relationshipType, String keyParty, String isExistingCustomer, long branchId, long accountNumber,
			String emailId, Date dateOfBirth) {

		this.partyId = partyId;
		this.npId = npId;
		this.title = title;
		this.firstName = firstName;
		this.middleName = middleName;
		this.surName = surName;
		this.relationshipType = relationshipType;
		this.keyParty = keyParty;
		this.isExistingCustomer = isExistingCustomer;
		this.branchId = branchId;
		this.accountNumber = accountNumber;
		this.emailId = emailId;
		this.dateOfBirth = dateOfBirth;
	}

}
