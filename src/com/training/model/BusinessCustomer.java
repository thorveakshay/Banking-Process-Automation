package com.training.model;

public class BusinessCustomer {

	private int id;
	private String accountNo;
	private String address;
	private String businessName;
	private long businessId;
	private String tradingName;
	private String businessType;
	private String branchId;
	private String isStartupBusiness;
	private double annualTurnover;
	private double capitalFund;
	private String status;
	private String fundingRequired;
	private long noOfEmployee;
	private String country;
	private String email;
	private String branchName;

	/**
	 * @param businessName
	 * @param businessId
	 * @param tradingName
	 * @param businessType
	 * @param branchId
	 * @param isStartupBusiness
	 * @param annualTurnover
	 * @param capitalFund
	 * @param status
	 * @param fundingRequired
	 * @param noOfEmployee
	 * @param country
	 * @param email
	 */
	public BusinessCustomer(String businessName, long businessId, String tradingName, String businessType,
			String branchId, String isStartupBusiness, double annualTurnover, double capitalFund, String status,
			String fundingRequired, long noOfEmployee, String country, String email, String branchName) {

		this.businessName = businessName;
		this.businessId = businessId;
		this.tradingName = tradingName;
		this.businessType = businessType;
		this.branchId = branchId;
		this.isStartupBusiness = isStartupBusiness;
		this.annualTurnover = annualTurnover;
		this.capitalFund = capitalFund;
		this.status = status;
		this.fundingRequired = fundingRequired;
		this.noOfEmployee = noOfEmployee;
		this.country = country;
		this.email = email;
		this.branchName = branchName;
	}

	public BusinessCustomer() {

	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the accountNo
	 */
	public String getAccountNo() {
		return accountNo;
	}

	/**
	 * @param accountNo
	 *            the accountNo to set
	 */
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address
	 *            the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the businessName
	 */
	public String getBusinessName() {
		return businessName;
	}

	/**
	 * @param businessName
	 *            the businessName to set
	 */
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	/**
	 * @return the businessId
	 */
	public long getBusinessId() {
		return businessId;
	}

	/**
	 * @param businessId
	 *            the businessId to set
	 */
	public void setBusinessId(long businessId) {
		this.businessId = businessId;
	}

	/**
	 * @return the tradingName
	 */
	public String getTradingName() {
		return tradingName;
	}

	/**
	 * @param tradingName
	 *            the tradingName to set
	 */
	public void setTradingName(String tradingName) {
		this.tradingName = tradingName;
	}

	/**
	 * @return the businessType
	 */
	public String getBusinessType() {
		return businessType;
	}

	/**
	 * @param businessType
	 *            the businessType to set
	 */
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
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
	 * @return the isStartupBusiness
	 */
	public String getIsStartupBusiness() {
		return isStartupBusiness;
	}

	/**
	 * @param isStartupBusiness
	 *            the isStartupBusiness to set
	 */
	public void setIsStartupBusiness(String isStartupBusiness) {
		this.isStartupBusiness = isStartupBusiness;
	}

	/**
	 * @return the annualTurnover
	 */
	public double getAnnualTurnover() {
		return annualTurnover;
	}

	/**
	 * @param annualTurnover
	 *            the annualTurnover to set
	 */
	public void setAnnualTurnover(double annualTurnover) {
		this.annualTurnover = annualTurnover;
	}

	/**
	 * @return the capitalFund
	 */
	public double getCapitalFund() {
		return capitalFund;
	}

	/**
	 * @param capitalFund
	 *            the capitalFund to set
	 */
	public void setCapitalFund(double capitalFund) {
		this.capitalFund = capitalFund;
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
	 * @return the fundingRequired
	 */
	public String getFundingRequired() {
		return fundingRequired;
	}

	/**
	 * @param fundingRequired
	 *            the fundingRequired to set
	 */
	public void setFundingRequired(String fundingRequired) {
		this.fundingRequired = fundingRequired;
	}

	/**
	 * @return the noOfEmployee
	 */
	public long getNoOfEmployee() {
		return noOfEmployee;
	}

	/**
	 * @param noOfEmployee
	 *            the noOfEmployee to set
	 */
	public void setNoOfEmployee(long noOfEmployee) {
		this.noOfEmployee = noOfEmployee;
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
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
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

}
