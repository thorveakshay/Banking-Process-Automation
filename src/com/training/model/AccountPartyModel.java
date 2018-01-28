package com.training.model;

public class AccountPartyModel {
	private Long id;
	private Long npid;
	private String title;
	private String fname;
	private String mname;
	private String lname;
	private String dob;
	private String relationship;
	private String email;
	private String hasAccount;
	private String isKeyParty;
	private PartyAddress currentAddress;
	private PartyAddress previousAddress;
	private PartyContact mobileContact;
	private PartyContact homeContact;
	private PartyContact officeContact;
	private long accountNo;
	private String branch;

	public AccountPartyModel() {

	}

	public AccountPartyModel(Long id, Long npid, String title, String fname, String mname, String lname, String dob,
			String relationship, String email, String hasAccount, String isKeyParty) {
		super();
		this.id = id;
		this.npid = npid;
		this.title = title;
		this.fname = fname;
		this.mname = mname;
		this.lname = lname;
		this.dob = dob;
		this.relationship = relationship;
		this.email = email;
		this.hasAccount = hasAccount;
		this.isKeyParty = isKeyParty;
	}

	public String getHasAccount() {
		return hasAccount;
	}

	public void setHasAccount(String hasAccount) {
		this.hasAccount = hasAccount;
	}

	public String getIsKeyParty() {
		return isKeyParty;
	}

	public void setIsKeyParty(String isKeyParty) {
		this.isKeyParty = isKeyParty;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getRelationship() {
		return relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

	public void setNpid(Long npid) {
		this.npid = npid;
	}

	public Long getNpid() {
		return npid;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setPreviousAddress(PartyAddress previousAddress) {
		this.previousAddress = previousAddress;
	}

	public PartyAddress getPreviousAddress() {
		return previousAddress;
	}

	public void setCurrentAddress(PartyAddress currentAddress) {
		this.currentAddress = currentAddress;
	}

	public PartyAddress getCurrentAddress() {
		return currentAddress;
	}

	public void setMobileContact(PartyContact mobileContact) {
		this.mobileContact = mobileContact;
	}

	public PartyContact getMobileContact() {
		return mobileContact;
	}

	public void setHomeContact(PartyContact homeContact) {
		this.homeContact = homeContact;
	}

	public PartyContact getHomeContact() {
		return homeContact;
	}

	public void setOfficeContact(PartyContact officeContact) {
		this.officeContact = officeContact;
	}

	public PartyContact getOfficeContact() {
		return officeContact;
	}

	public void setAccountNo(long accountNo) {
		this.accountNo = accountNo;
	}

	public long getAccountNo() {
		return accountNo;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getBranch() {
		return branch;
	}

}
