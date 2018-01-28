package com.training.model;

public class AccParty {

	private int apId;
	private String apName;
	private String firstName;
	private String surname;
	private String middleName;
	private String relType;
	private String isKeyParty;
	private String relationshipType;
	private long npId;

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getRelType() {
		return relType;
	}

	public void setRelType(String relType) {
		this.relType = relType;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public long getNpId() {
		return npId;
	}

	public void setNpId(long npId) {
		this.npId = npId;
	}

	public int getApId() {
		return apId;
	}

	public void setApId(int apId) {
		this.apId = apId;
	}

	public String getApName() {
		return apName;
	}

	public void setApName(String apName) {
		this.apName = apName;
	}

	public String getIsKeyParty() {
		return isKeyParty;
	}

	public void setIsKeyParty(String isKeyParty) {
		this.isKeyParty = isKeyParty;
	}

	public String getRelationshipType() {
		return relationshipType;
	}

	public void setRelationshipType(String relationshipType) {
		this.relationshipType = relationshipType;
	}

}