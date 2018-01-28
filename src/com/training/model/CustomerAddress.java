/**
 * 
 */
package com.training.model;

/**
 *  
 *
 */
public class CustomerAddress {

	private String buildingNo;
	private String buildingName;
	private String streetName;
	private String cityName;
	private String townName;
	private String country;
	private String postalCode;

	/**
	 * @param buildingNo
	 * @param buildingName
	 * @param streetName
	 * @param cityName
	 * @param townName
	 * @param country
	 */
	public CustomerAddress(String buildingNo, String buildingName, String streetName, String cityName, String townName,
			String country) {
		super();
		this.buildingNo = buildingNo;
		this.buildingName = buildingName;
		this.streetName = streetName;
		this.cityName = cityName;
		this.townName = townName;
		this.country = country;
	}

	public CustomerAddress() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the buildingNo
	 */
	public String getBuildingNo() {
		return buildingNo;
	}

	/**
	 * @param buildingNo
	 *            the buildingNo to set
	 */
	public void setBuildingNo(String buildingNo) {
		this.buildingNo = buildingNo;
	}

	/**
	 * @return the buildingName
	 */
	public String getBuildingName() {
		return buildingName;
	}

	/**
	 * @param buildingName
	 *            the buildingName to set
	 */
	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}

	/**
	 * @return the streetName
	 */
	public String getStreetName() {
		return streetName;
	}

	/**
	 * @param streetName
	 *            the streetName to set
	 */
	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	/**
	 * @return the cityName
	 */
	public String getCityName() {
		return cityName;
	}

	/**
	 * @param cityName
	 *            the cityName to set
	 */
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	/**
	 * @return the townName
	 */
	public String getTownName() {
		return townName;
	}

	/**
	 * @param townName
	 *            the townName to set
	 */
	public void setTownName(String townName) {
		this.townName = townName;
	}

	/**
	 * @return the country
	 */
	public String getCountry() {
		return country;
	}

	/**
	 * @param country
	 *            the country to set
	 */
	public void setCountry(String country) {
		this.country = country;
	}

	/**
	 * @return the postalCode
	 */
	public String getPostalCode() {
		return postalCode;
	}

	/**
	 * @param postalCode
	 *            the postalCode to set
	 */
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

}
