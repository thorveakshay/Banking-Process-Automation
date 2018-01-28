package com.training.model;

import java.sql.Date;
import java.util.List;

public class Product {
	private long Id;
	private String name;
	private Date valid_from;
	private int productId;
	private String productName;
	private String description;
	private String validFrom;
	private String businessType;
	private String productDescription;
	private String accountType;
	private String status;
	private String business;
	private List<AdditionalProduct> additionalProduct;
	private List<BusinessType> businessTypeList;

	/**
	 * @return the id
	 */
	public long getId() {
		return Id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(long id) {
		Id = id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the valid_from
	 */
	public Date getValid_from() {
		return valid_from;
	}

	/**
	 * @param validFrom
	 *            the valid_from to set
	 */
	public void setValid_from(Date validFrom) {
		valid_from = validFrom;
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
	 * @return the productDescription
	 */
	public String getProductDescription() {
		return productDescription;
	}

	/**
	 * @param productDescription
	 *            the productDescription to set
	 */
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	/**
	 * @return the productId
	 */
	public int getProductId() {
		return productId;
	}

	/**
	 * @param productId
	 *            the productId to set
	 */
	public void setProductId(int productId) {
		this.productId = productId;
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

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the validFrom
	 */
	public String getValidFrom() {
		return validFrom;
	}

	/**
	 * @param validFrom
	 *            the validFrom to set
	 */
	public void setValidFrom(String validFrom) {
		this.validFrom = validFrom;
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
	 * @return the business
	 */
	public String getBusiness() {
		return business;
	}

	/**
	 * @param business
	 *            the business to set
	 */
	public void setBusiness(String business) {
		this.business = business;
	}

	/**
	 * @return the additionalProduct
	 */
	public List<AdditionalProduct> getAdditionalProduct() {
		return additionalProduct;
	}

	/**
	 * @param additionalProduct
	 *            the additionalProduct to set
	 */
	public void setAdditionalProduct(List<AdditionalProduct> additionalProduct) {
		this.additionalProduct = additionalProduct;
	}

	/**
	 * @return the businessType
	 */
	public List<BusinessType> getBusinessTypeList() {
		return businessTypeList;
	}

	/**
	 * @param businessType
	 *            the businessType to set
	 */
	public void setBusinessTypeList(List<BusinessType> businessType) {
		this.businessTypeList = businessType;
	}

}
