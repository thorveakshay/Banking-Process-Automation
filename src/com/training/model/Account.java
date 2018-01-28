/**
 * 
 */
package com.training.model;

import java.util.Date;

/**
 *  
 *
 */
public class Account {
	private long accNumber;
	private String branch;
	private String productIntension;
	private String productName;
	private String accountTitle;
	private String status;
	private long id;
	private String acctype;
	private long accno;
	private Date aod;
	private Date acd;
	private String acctitle;

	/**
	 * @return the acctype
	 */
	public String getAcctype() {
		return acctype;
	}

	/**
	 * @param acctype
	 *            the acctype to set
	 */
	public void setAcctype(String acctype) {
		this.acctype = acctype;
	}

	/**
	 * @return the accno
	 */
	public long getAccno() {
		return accno;
	}

	/**
	 * @param accno
	 *            the accno to set
	 */
	public void setAccno(long accno) {
		this.accno = accno;
	}

	/**
	 * @return the aod
	 */
	public Date getAod() {
		return aod;
	}

	/**
	 * @param aod
	 *            the aod to set
	 */
	public void setAod(Date aod) {
		this.aod = aod;
	}

	/**
	 * @return the acd
	 */
	public Date getAcd() {
		return acd;
	}

	/**
	 * @param acd
	 *            the acd to set
	 */
	public void setAcd(Date acd) {
		this.acd = acd;
	}

	/**
	 * @return the acctitle
	 */
	public String getAcctitle() {
		return acctitle;
	}

	/**
	 * @param acctitle
	 *            the acctitle to set
	 */
	public void setAcctitle(String acctitle) {
		this.acctitle = acctitle;
	}

	public Account(long accNumber, String branch, String productIntension, String productName) {
		super();
		this.accNumber = accNumber;
		this.branch = branch;
		this.productIntension = productIntension;
		this.productName = productName;
	}

	public Account() {

	}

	public Account(long accNumber, String branch, String productIntension, String productName, String accountTitle,
			String status, long id) {
		super();
		this.accNumber = accNumber;
		this.branch = branch;
		this.productIntension = productIntension;
		this.productName = productName;
		this.accountTitle = accountTitle;
		this.status = status;
		this.id = id;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setAccountTitle(String accountTitle) {
		this.accountTitle = accountTitle;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAccountTitle() {
		return accountTitle;
	}

	public String getStatus() {
		return status;
	}

	/**
	 * @param accNumber
	 * @param branch
	 * @param productIntension
	 */
	public Account(long accNumber, String branch, String productIntension) {
		super();
		this.accNumber = accNumber;
		this.branch = branch;
		this.productIntension = productIntension;
	}

	/**
	 * @return the accNumber
	 */
	public long getAccNumber() {
		return accNumber;
	}

	/**
	 * @param accNumber
	 *            the accNumber to set
	 */
	public void setAccNumber(long accNumber) {
		this.accNumber = accNumber;
	}

	/**
	 * @return the branch
	 */
	public String getBranch() {
		return branch;
	}

	/**
	 * @param branch
	 *            the branch to set
	 */
	public void setBranch(String branch) {
		this.branch = branch;
	}

	/**
	 * @return the productIntension
	 */
	public String getProductIntension() {
		return productIntension;
	}

	/**
	 * @param productIntension
	 *            the productIntension to set
	 */
	public void setProductIntension(String productIntension) {
		this.productIntension = productIntension;
	}

	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}

	/**
	 * @param productName
	 *            the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}

}
