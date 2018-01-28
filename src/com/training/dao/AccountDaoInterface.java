/**
 * 
 */
package com.training.dao;

import java.util.List;

import com.training.exception.AccountCreationException;
import com.training.model.Account;
import com.training.model.Product;

/**
 *  
 *
 */
public interface AccountDaoInterface {

	public boolean addAccount(Account acc, int np_id, String bname, int prod_id) throws AccountCreationException;

	public String getCountryOfRegistration(int businessId) throws AccountCreationException;

	public List<Product> getEligibleProducts(String account_type, String business_type) throws AccountCreationException;

	public String findBranchCode(String branchName) throws AccountCreationException;

	public int getProductId(String prodName) throws AccountCreationException;

	public boolean changeStatus(long acno) throws AccountCreationException;

	public boolean checkUniqueAccountNo(long acno) throws AccountCreationException;

	public int[] checkNoOfAccounts(int np_id) throws AccountCreationException;

}
