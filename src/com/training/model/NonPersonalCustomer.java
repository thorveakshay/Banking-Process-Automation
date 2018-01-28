/**
 * 
 */
package com.training.model;

import java.util.ArrayList;
import java.util.List;

/**
 *  
 *
 */
public class NonPersonalCustomer {
	private long businessId;

	private long nonPersonalCustomerID;
	private String businessName;
	private String tradingName;
	private String businessType;
	private String isStartUpBusiness;
	private String dateEstablished;
	private String dateOfRegistration;
	private double expectedAnnualTurnover;
	private double totalBusinessCapital;
	private String businessStatus;
	private long numberOfEmployees;
	private String tellMoreAboutYourBusiness;
	private String requireFunding;
	private String countryOfRegistration;
	private String additionalDetails;
	private String presentAddresses;
	private String permanentAddresses;
	private String correspondenceAddresses;
	private String idProof;
	private String addressProof;
	private String industrySector;
	private String mainActivity;
	private String preciseActivity;
	private double fundAmount;
	private String franchiseDetails;
	private String goods;
	private String groupFranchise;
	private String addtionalDetails;
	private String bankBranch;
	private String emailId;
	private String businessEmailAddress;

	private List<Contact> cl = new ArrayList<Contact>();
	private List<Proof> pl = new ArrayList<Proof>();
	private List<Address> al = new ArrayList<Address>();

	public NonPersonalCustomer(long nonPersonalCustomerID, String businessName, String tradingName, String businessType,
			String isStartUpBusiness, String dateEstablished, String dateOfRegistration, double expectedAnnualTurnover,
			double totalBusinessCapital, String businessStatus, long numberOfEmployees,
			String tellMoreAboutYourBusiness, String requireFunding, String countryOfRegistration,
			String additionalDetails, String presentAddresses, String permanentAddresses,
			String correspondenceAddresses, String idProof, String addressProof, String industrySector,
			String mainActivity, String preciseActivity, double fundAmount, String franchiseDetails, String goods,
			String groupFranchise, String addtionalDetails, String bankBranch, String emailId, List<Contact> cl,
			List<Proof> pl, List<Address> al) {
		super();
		this.nonPersonalCustomerID = nonPersonalCustomerID;
		this.businessName = businessName;
		this.tradingName = tradingName;
		this.businessType = businessType;
		this.isStartUpBusiness = isStartUpBusiness;
		this.dateEstablished = dateEstablished;
		this.dateOfRegistration = dateOfRegistration;
		this.expectedAnnualTurnover = expectedAnnualTurnover;
		this.totalBusinessCapital = totalBusinessCapital;
		this.businessStatus = businessStatus;
		this.numberOfEmployees = numberOfEmployees;
		this.tellMoreAboutYourBusiness = tellMoreAboutYourBusiness;
		this.requireFunding = requireFunding;
		this.countryOfRegistration = countryOfRegistration;
		this.additionalDetails = additionalDetails;
		this.presentAddresses = presentAddresses;
		this.permanentAddresses = permanentAddresses;
		this.correspondenceAddresses = correspondenceAddresses;
		this.idProof = idProof;
		this.addressProof = addressProof;
		this.industrySector = industrySector;
		this.mainActivity = mainActivity;
		this.preciseActivity = preciseActivity;
		this.fundAmount = fundAmount;
		this.franchiseDetails = franchiseDetails;
		this.goods = goods;
		this.groupFranchise = groupFranchise;
		this.addtionalDetails = addtionalDetails;
		this.bankBranch = bankBranch;
		this.emailId = emailId;
		this.cl = cl;
		this.pl = pl;
		this.al = al;
	}

	public NonPersonalCustomer() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param nonPersonalCustomerID;
	 * @param businessName
	 * @param tradingName
	 * @param businessType
	 * @param isStartUpBusiness
	 * @param dateEstablished
	 * @param dateOfRegistration
	 * @param expectedAnnualTurnover2
	 * @param totalBusinessCapital2
	 * @param businessStatus
	 * @param tellMoreAboutYourBusiness
	 * @param countryOfRegistration
	 */

	public void addContact(Contact contact) {
		cl.add(contact);
	}

	/**
	 * @return the businessEmailAddress
	 */
	public String getBusinessEmailAddress() {
		return businessEmailAddress;
	}

	/**
	 * @param businessEmailAddress
	 *            the businessEmailAddress to set
	 */
	public void setBusinessEmailAddress(String businessEmailAddress) {
		this.businessEmailAddress = businessEmailAddress;
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

	public void addAddress(Address address) {
		al.add(address);
	}

	public void addProof(Proof proof) {
		pl.add(proof);
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getBusinessName() {
		return businessName;
	}

	public List<Contact> getCl() {
		return cl;
	}

	public void setCl(List<Contact> cl) {
		this.cl = cl;
	}

	public List<Proof> getPl() {
		return pl;
	}

	public void setPl(List<Proof> pl) {
		this.pl = pl;
	}

	public List<Address> getAl() {
		return al;
	}

	public void setAl(List<Address> al) {
		this.al = al;
	}

	public String getBankBranch() {
		return bankBranch;
	}

	public void setBankBranch(String bankBranch) {
		this.bankBranch = bankBranch;
	}

	public String getAddtionalDetails() {
		return addtionalDetails;
	}

	public void setAddtionalDetails(String addtionalDetails) {
		this.addtionalDetails = addtionalDetails;
	}

	public String getGroupFranchise() {
		return groupFranchise;
	}

	public void setGroupFranchise(String groupFranchise) {
		this.groupFranchise = groupFranchise;
	}

	public String getGoods() {
		return goods;
	}

	public void setGoods(String goods) {
		this.goods = goods;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public String getTradingName() {
		return tradingName;
	}

	public void setTradingName(String tradingName) {
		this.tradingName = tradingName;
	}

	public String getBusinessType() {
		return businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}

	public String getIsStartUpBusiness() {
		return isStartUpBusiness;
	}

	public void setIsStartUpBusiness(String isStartUpBusiness) {
		this.isStartUpBusiness = isStartUpBusiness;
	}

	public String getDateEstablished() {
		return dateEstablished;
	}

	public void setDateEstablished(String dateEstablished) {
		this.dateEstablished = dateEstablished;
	}

	public String getDateOfRegistration() {
		return dateOfRegistration;
	}

	public void setDateOfRegistration(String dateOfRegistration) {
		this.dateOfRegistration = dateOfRegistration;
	}

	public double getExpectedAnnualTurnover() {
		return expectedAnnualTurnover;
	}

	public void setExpectedAnnualTurnover(double expectedAnnualTurnover) {
		this.expectedAnnualTurnover = expectedAnnualTurnover;
	}

	public long getNumberOfEmployees() {
		return numberOfEmployees;
	}

	public void setNumberOfEmployees(long numberOfEmployees) {
		this.numberOfEmployees = numberOfEmployees;
	}

	public double getTotalBusinessCapital() {
		return totalBusinessCapital;
	}

	public void setTotalBusinessCapital(double totalBusinessCapital) {
		this.totalBusinessCapital = totalBusinessCapital;
	}

	public String getBusinessStatus() {
		return businessStatus;
	}

	public void setBusinessStatus(String businessStatus) {
		this.businessStatus = businessStatus;
	}

	public String getTellMoreAboutYourBusiness() {
		return tellMoreAboutYourBusiness;
	}

	public void setTellMoreAboutYourBusiness(String tellMoreAboutYourBusiness) {
		this.tellMoreAboutYourBusiness = tellMoreAboutYourBusiness;
	}

	public String getRequireFunding() {
		return requireFunding;
	}

	public void setRequireFunding(String requireFunding) {
		this.requireFunding = requireFunding;
	}

	public String getCountryOfRegistration() {
		return countryOfRegistration;
	}

	public void setCountryOfRegistration(String countryOfRegistration) {
		this.countryOfRegistration = countryOfRegistration;
	}

	public String getAdditionalDetails() {
		return additionalDetails;
	}

	public void setAdditionalDetails(String additionalDetails) {
		this.additionalDetails = additionalDetails;
	}

	public String getPresentAddresses() {
		return presentAddresses;
	}

	public void setPresentAddresses(String presentAddresses) {
		this.presentAddresses = presentAddresses;
	}

	public String getPermanentAddresses() {
		return permanentAddresses;
	}

	public void setPermanentAddresses(String permanentAddresses) {
		this.permanentAddresses = permanentAddresses;
	}

	public String getCorrespondenceAddresses() {
		return correspondenceAddresses;
	}

	public void setCorrespondenceAddresses(String correspondenceAddresses) {
		this.correspondenceAddresses = correspondenceAddresses;
	}

	public String getIdProof() {
		return idProof;
	}

	public void setIdProof(String idProof) {
		this.idProof = idProof;
	}

	public String getAddressProof() {
		return addressProof;
	}

	public void setAddressProof(String addressProof) {
		this.addressProof = addressProof;
	}

	public String getIndustrySector() {
		return industrySector;
	}

	public void setIndustrySector(String industrySector) {
		this.industrySector = industrySector;
	}

	public String getMainActivity() {
		return mainActivity;
	}

	public void setMainActivity(String mainActivity) {
		this.mainActivity = mainActivity;
	}

	public String getPreciseActivity() {
		return preciseActivity;
	}

	public void setPreciseActivity(String preciseActivity) {
		this.preciseActivity = preciseActivity;
	}

	public double getFundAmount() {
		return fundAmount;
	}

	public void setFundAmount(double fundAmount) {
		this.fundAmount = fundAmount;
	}

	public String getFranchiseDetails() {
		return franchiseDetails;
	}

	public void setFranchiseDetails(String franchiseDetails) {
		this.franchiseDetails = franchiseDetails;
	}

	public long getNonPersonalCustomerID() {
		return nonPersonalCustomerID;
	}

	public void setNonPersonalCustomerID(long nonPersonalCustomerID) {
		this.nonPersonalCustomerID = nonPersonalCustomerID;
	}

}
