/**
 * 
 */
package com.training.model;

/**
 *  
 *
 */
public class ReportData {

	private int count;
	private String country;

	/**
	 * @param count
	 * @param country
	 */
	public ReportData(int count, String country) {
		super();
		this.count = count;
		this.country = country;
	}

	/**
	 * @return the count
	 */
	public int getCount() {
		return count;
	}

	/**
	 * @param count
	 *            the count to set
	 */
	public void setCount(int count) {
		this.count = count;
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

}
