package com.training.model;

public class Contact {
	private int countryCode;
	private int areaCode;
	private long contactNumber;
	private String contactType;

	public Contact(int countryCode, int areaCode, long contactNumber) {
		super();
		this.countryCode = countryCode;
		this.areaCode = areaCode;
		this.contactNumber = contactNumber;
	}

	public Contact() {
		// TODO Auto-generated constructor stub
	}

	public int getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(int countryCode) {
		this.countryCode = countryCode;
	}

	public int getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(int areaCode) {
		this.areaCode = areaCode;
	}

	public long getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(long contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getContactType() {
		return contactType;
	}

	public void setContactType(String contactType) {
		this.contactType = contactType;
	}

}
