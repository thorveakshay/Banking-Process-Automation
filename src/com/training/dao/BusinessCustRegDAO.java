package com.training.dao;

import java.sql.SQLException;
import java.util.List;

import com.training.exception.BusinessCustRegException;
import com.training.model.NonPersonalCustomer;

public interface BusinessCustRegDAO {
	public boolean registerAllDetails(NonPersonalCustomer nonPersonalCustomer) throws BusinessCustRegException;

	public List<NonPersonalCustomer> searchBusinessCustomer(String parameter1, String parameter2, String actionname)
			throws BusinessCustRegException;

	public NonPersonalCustomer viewBusinessCustomer(long npcId) throws BusinessCustRegException;

	public boolean deleteBusinessCustomer(long id) throws BusinessCustRegException;

	public boolean updateBusinessCustomer(NonPersonalCustomer nonPersonalCustomer) throws BusinessCustRegException;

}
