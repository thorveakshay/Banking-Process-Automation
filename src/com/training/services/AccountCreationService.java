package com.training.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.log4j.Logger;

import com.training.controllers.LoginServlet;
import com.training.dao.AccountDao;
import com.training.dao.AccountDaoInterface;
import com.training.exception.AccountCreationException;
import com.training.model.Account;
import com.training.model.Product;

/**
 *  
 *
 */
public class AccountCreationService {
	private static Logger logger = Logger.getLogger(LoginServlet.class);
	AccountDaoInterface accDao = new AccountDao();

	static int countSavingAcc = 1;
	static int countCurrentAcc = 1;

	public boolean addAccount(Account acc, int np_id, String bname, int prod_id) throws AccountCreationException {
		return accDao.addAccount(acc, np_id, bname, prod_id);
	}

	/* This method is called by the customerFromUkOrNot method */
	public String getCountryOfRegistration(int businessId) throws AccountCreationException {
		return accDao.getCountryOfRegistration(businessId);

	}

	/* Finds whether the Customer is from UK or not */
	public boolean customerFromUkOrNot(int businessId) throws AccountCreationException {
		boolean flag = false;
		String getCountry = null;
		getCountry = accDao.getCountryOfRegistration(businessId);
		logger.info("Country=" + getCountry);
		if (getCountry.equalsIgnoreCase("united kingdom")) {
			flag = true;
		} else
			flag = false;
		return flag;
	}

	// checking no. of accounts added for Non UK customer
	public String checkNoOfAccounts(ArrayList<Account> accDisplayList, int np_id) throws AccountCreationException {
		int countSavings = 0;
		int countCurrent = 0;

		// Check for already assigned accounts in database
		int counts[] = accDao.checkNoOfAccounts(np_id);
		countCurrent = counts[0];
		countSavings = counts[1];

		for (Account acc : accDisplayList) {
			if (acc.getProductIntension().equalsIgnoreCase("Savings Account")) {
				countSavings++;
			} else if (acc.getProductIntension().equalsIgnoreCase("Current Account")) {
				countCurrent++;
			}
		}
		if (countSavings > 1 && countCurrent > 1) {
			return ("Sorry non UK customers cannot add more than one Savings/Current Account");

		} else if (countSavings > 1) {
			return ("Sorry non UK customers cannot add more than one Savings Account");
		} else if (countCurrent > 1) {
			return ("Sorry non UK customers cannot add more than one Current Account");
		} else
			return ("OK");
	}

	// To remove the productIntention accidently selected by the Customer
	public List<Account> removeIntention(List<Account> accList, String intension, int serialNum) {
		for (int i = 0; i < accList.size(); i++) {
			if (i == serialNum - 1) {
				accList.remove(i);
			}
		}
		return accList;
	}

	public String findBranchCode(String branchName) throws AccountCreationException {
		return (accDao.findBranchCode(branchName));
	}

	// Algorithm for generating unique account number
	public long generateAccountNo(int branch_code) {
		int bank_code = 12;
		long account_number = 0;
		String acno = "";
		long start = 10000000;
		long end = 99999999L;
		Random random = new Random();

		acno = acno + bank_code + branch_code;

		long range = (long) end - (long) start + 1;
		long fraction = (long) (range * random.nextDouble());
		long account_code = fraction + start;

		acno = acno + account_code;
		account_number = Long.parseLong(acno);

		return account_number;
	}

	public int checkUniqueness(long account_number) throws AccountCreationException {
		boolean flag = false;
		flag = accDao.checkUniqueAccountNo(account_number);
		if (flag == true) // unique account number
		{
			return 1;
		} else // not a unique account number
		{
			return 0;
		}

	}

	// To get the eligible product list...It is the PEM matrix !!!!!
	public List<Product> getEligibleProducts(String account_type, String business_type)
			throws AccountCreationException {
		return accDao.getEligibleProducts(account_type, business_type);

	}

	public int getProductId(String prodName) throws AccountCreationException {
		return (accDao.getProductId(prodName));

	}

	public boolean changeStatus(long acno) throws AccountCreationException {
		return (accDao.changeStatus(acno));
	}
}