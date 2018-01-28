/**
 * 
 */
package com.training.dao;

import java.util.ArrayList;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.BusinessCustomer;

/**
 *  
 *
 */
public interface BusinessCustomerDao {

	public ArrayList<BusinessCustomer> getBusinessCustomer(String parameter1, String parameter2, String actionname)
			throws CommercialCustandAcctMaintenance;

	public BusinessCustomer getBusinessDetails(long busid) throws CommercialCustandAcctMaintenance;

}
