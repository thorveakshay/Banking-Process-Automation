/**
 * 
 */
package com.training.services;

import java.util.ArrayList;
import java.util.List;

import com.training.dao.BusinessCustomerDao;
import com.training.dao.BusinessCustomerDaoImpl;
import com.training.dao.SearchCustomerDao;
import com.training.dao.SearchCustomerDaoInterface;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.exception.SearchCustomerException;
import com.training.model.Account;
import com.training.model.BusinessCustomer;

/**
 *  
 *
 */
public class SearchCustomerService {

	private SearchCustomerDaoInterface scdao = new SearchCustomerDao();
	List<BusinessCustomer> searchList;
	List<String> branches;

	// Retrieve branch names
	public ArrayList<String> retrieveBranches() throws SearchCustomerException {
		return ((ArrayList<String>) scdao.retrieveBranches());
	}

	// Search by Business Name and Branch Name
	public ArrayList<BusinessCustomer> searchByBusiness(String businessName, String branch)
			throws SearchCustomerException {
		return (ArrayList<BusinessCustomer>) scdao.searchByBusiness(businessName, branch);
	}

	// Search by Trading Name and Branch Name
	public ArrayList<BusinessCustomer> searchByTrading(String tradingName, String branch)
			throws SearchCustomerException {
		return (ArrayList<BusinessCustomer>) scdao.searchByTrading(tradingName, branch);
	}

	// Search by Account number
	public ArrayList<BusinessCustomer> searchByAccountNo(String accountNo) throws SearchCustomerException {
		return (ArrayList<BusinessCustomer>) scdao.searchByAccountNo(accountNo);
	}

	public BusinessCustomer retrieveDetails(int id) throws SearchCustomerException {
		return (scdao.retrieveDetails(id));
	}

	public Account retrieveAccountDetails(long accId) throws SearchCustomerException {
		return (scdao.retrieveAccountDetailsDao(accId));

	}

	public ArrayList<Account> getAccountInProgress(BusinessCustomer bcust) throws SearchCustomerException {
		ArrayList<Account> accList = new ArrayList<Account>();

		accList = scdao.getAccountInProgress(bcust);
		return accList;
	}

	// start with module c
	ArrayList<BusinessCustomer> bcList = new ArrayList<BusinessCustomer>();

	public ArrayList<BusinessCustomer> getBusinessCustomer(String parameter1, String parameter2, String actionname)
			throws CommercialCustandAcctMaintenance {
		BusinessCustomerDao bDao = new BusinessCustomerDaoImpl();
		BusinessCustomer bc = new BusinessCustomer();
		bcList = bDao.getBusinessCustomer(parameter1, parameter2, actionname);
		return bcList;
	}

	public BusinessCustomer getBusinessDetails(long busid) throws CommercialCustandAcctMaintenance {
		BusinessCustomerDao bDao = new BusinessCustomerDaoImpl();
		BusinessCustomer bc = new BusinessCustomer();
		bc = bDao.getBusinessDetails(busid);
		return bc;

	}

}
