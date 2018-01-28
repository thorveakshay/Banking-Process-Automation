package com.training.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.training.model.Branch;
import com.training.model.BusinessCustomer;

public interface ReportDaoInterface {

	public ArrayList<Long> getTypeOfAccountsCount() throws ClassNotFoundException, SQLException;

	public ArrayList<Long> getTypeOfAccountsCount(Long busId) throws ClassNotFoundException, SQLException;

	public ArrayList<Long> getTypeOfAccountsCount(int Month, int year, Long busid)
			throws ClassNotFoundException, SQLException;

	public ArrayList<Long> getTypeOfAccountsCount(int year, Long busid) throws ClassNotFoundException, SQLException;

	public BusinessCustomer getBusinessDetails(long busid);

	public ArrayList<BusinessCustomer> getBusinessDetails();
}
