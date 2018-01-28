package com.training.model;

public class Business {

	private long id;

	private String businessName;
	private String businessType;
	private String tradingName;
	private long expAnnualTurnover;
	private long capitalFund;
	private String status;
	private long rmAssigned;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public String getBusinessType() {
		return businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}

	public String getTradingName() {
		return tradingName;
	}

	public void setTradingName(String tradingName) {
		this.tradingName = tradingName;
	}

	public long getExpAnnualTurnover() {
		return expAnnualTurnover;
	}

	public void setExpAnnualTurnover(long expAnnualTurnover) {
		this.expAnnualTurnover = expAnnualTurnover;
	}

	public long getCapitalFund() {
		return capitalFund;
	}

	public void setCapitalFund(long capitalFund) {
		this.capitalFund = capitalFund;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public long getRmAssigned() {
		return rmAssigned;
	}

	public void setRmAssigned(long rmAssigned) {
		this.rmAssigned = rmAssigned;
	}

}
