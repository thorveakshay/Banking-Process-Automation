package com.training.services;

import com.training.dao.GetCustomerDao;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Branch;
import com.training.model.BusinessCustomer;

import java.io.PrintStream;
import java.sql.SQLException;
import java.util.ArrayList;

public class GetCustomersService {

	public ArrayList<BusinessCustomer> getBusinessCustomer(String parameter1, String parameter2, String actionname)
			throws SQLException {
		// logger.info("hi in service in getCustomer service");
		ArrayList<BusinessCustomer> bcList;
		GetCustomerDao bDao = new GetCustomerDao();

		bcList = bDao.getBusinessCustomer(parameter1, parameter2, actionname);
		return bcList;
	}

	public ArrayList<BusinessCustomer> getBusinessCustomerForRm(String parameter1, String parameter2, String actionname,
			Long rmId) throws SQLException {
		// logger.info("hi in service in getCustomer service");
		ArrayList<BusinessCustomer> bcList;
		GetCustomerDao bDao = new GetCustomerDao();

		bcList = bDao.getBusinessCustomerForRm(parameter1, parameter2, actionname, rmId);
		return bcList;
	}

	public ArrayList<Branch> getBranchListService() throws ClassNotFoundException, SQLException {
		GetCustomerDao bDao = new GetCustomerDao();
		ArrayList<Branch> bList = new ArrayList<Branch>();
		// logger.info("in serve for branch list");
		try {
			bList = bDao.getBranch();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return bList;
	}

	public Boolean checkAccountNumber(String parameter1) throws SQLException, ClassNotFoundException {

		GetCustomerDao canDao = new GetCustomerDao();
		Boolean flag = false;
		flag = canDao.checkAccNum(parameter1);
		return flag;
	}

}