/**
 * 
 */
package com.training.model;

import java.util.Date;

/**
 *  
 *
 */
public class AccountView {
	private long accountId;
	private long businessCustomerId;
	private String accountType;
	private long accountNumber;
	private long productId;
	private String status;
	private Date accountOpenDate;
	private String accountTitle;
	private String branchId;

	/**
	 * @param accountId
	 * @param businessCustomerId
	 * @param accountType
	 * @param accountNumber
	 * @param productId
	 * @param status
	 * @param accountOpenDate
	 * @param accountTitle
	 * @param branchId
	 */
	public AccountView(long accountId, long businessCustomerId, String accountType, long accountNumber, long productId,
			String status, Date accountOpenDate, String accountTitle, String branchId) {

		this.accountId = accountId;
		this.businessCustomerId = businessCustomerId;
		this.accountType = accountType;
		this.accountNumber = accountNumber;
		this.productId = productId;
		this.status = status;
		this.accountOpenDate = accountOpenDate;
		this.accountTitle = accountTitle;
		this.branchId = branchId;
	}

	/**
	 * @return the accountId
	 */
	public long getAccountId() {
		return accountId;
	}

	/**
	 * @param accountId
	 *            the accountId to set
	 */
	public void setAccountId(long accountId) {
		this.accountId = accountId;
	}

	/**
	 * @return the businessCustomerId
	 */
	public long getBusinessCustomerId() {
		return businessCustomerId;
	}

	/**
	 * @param businessCustomerId
	 *            the businessCustomerId to set
	 */
	public void setBusinessCustomerId(long businessCustomerId) {
		this.businessCustomerId = businessCustomerId;
	}

	/**
	 * @return the accountType
	 */
	public String getAccountType() {
		return accountType;
	}

	/**
	 * @param accountType
	 *            the accountType to set
	 */
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	/**
	 * @return the accountNumber
	 */
	public long getAccountNumber() {
		return accountNumber;
	}

	/**
	 * @param accountNumber
	 *            the accountNumber to set
	 */
	public void setAccountNumber(long accountNumber) {
		this.accountNumber = accountNumber;
	}

	/**
	 * @return the productId
	 */
	public long getProductId() {
		return productId;
	}

	/**
	 * @param productId
	 *            the productId to set
	 */
	public void setProductId(long productId) {
		this.productId = productId;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status
	 *            the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * @return the accountOpenDate
	 */
	public Date getAccountOpenDate() {
		return accountOpenDate;
	}

	/**
	 * @param accountOpenDate
	 *            the accountOpenDate to set
	 */
	public void setAccountOpenDate(Date accountOpenDate) {
		this.accountOpenDate = accountOpenDate;
	}

	/**
	 * @return the accountTitle
	 */
	public String getAccountTitle() {
		return accountTitle;
	}

	/**
	 * @param accountTitle
	 *            the accountTitle to set
	 */
	public void setAccountTitle(String accountTitle) {
		this.accountTitle = accountTitle;
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

	public AccountView() {

	}

}
