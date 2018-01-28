/**
 * 
 */
package com.training.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.training.exception.SearchCustomerException;
import com.training.model.Account;
import com.training.model.BusinessCustomer;

/**
 *  
 *
 */
public interface SearchCustomerDaoInterface {

	public ArrayList<String> retrieveBranches() throws SearchCustomerException;

	public ArrayList<BusinessCustomer> searchByBusiness(String businessName, String branch)
			throws SearchCustomerException;

	public ArrayList<BusinessCustomer> searchByTrading(String tradingName, String branch)
			throws SearchCustomerException;

	public ArrayList<BusinessCustomer> searchByAccountNo(String accountNo) throws SearchCustomerException;

	public BusinessCustomer retrieveDetails(int id) throws SearchCustomerException;

	public Account retrieveAccountDetailsDao(long accId) throws SearchCustomerException;

	public ArrayList<Account> getAccountInProgress(BusinessCustomer bcust) throws SearchCustomerException;

}
