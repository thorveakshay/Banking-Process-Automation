package com.training.services;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.training.dao.ReportDao;
import com.training.dao.ReportDaoInterface;
import com.training.model.Branch;
import com.training.model.BusinessCustomer;

public class ReportService {

	// values=rs.getTypeOfAccountsCount(Long BusId);
	// values=rs.getTypeOfAccountsCount(String Month,int year);
	// values=rs.getTypeOfAccountsCount(int year);
	public BusinessCustomer getBusinessDetails(long busid) {
		ReportDaoInterface rd = new ReportDao();
		return rd.getBusinessDetails(busid);

	}

	public ArrayList<BusinessCustomer> getBusinessDetails() {
		ReportDaoInterface rd = new ReportDao();
		return rd.getBusinessDetails();

	}

	public ArrayList<Long> getTypeOfAccountsCount(Long BusId) throws ClassNotFoundException, SQLException {
		ReportDaoInterface rd = new ReportDao();
		ArrayList<Long> accountCount = new ArrayList<Long>();

		return rd.getTypeOfAccountsCount(BusId);
	}

	public ArrayList<Long> getTypeOfAccountsCount(int Month, int year, Long busid)
			throws ClassNotFoundException, SQLException {
		ReportDaoInterface rd = new ReportDao();
		ArrayList<Long> accountCount = new ArrayList<Long>();

		return rd.getTypeOfAccountsCount(Month, year, busid);
	}

	public ArrayList<Long> getTypeOfAccountsCount(int year, Long busid) throws ClassNotFoundException, SQLException {
		ReportDaoInterface rd = new ReportDao();
		ArrayList<Long> accountCount = new ArrayList<Long>();

		return rd.getTypeOfAccountsCount(year, busid);
	}

	public ArrayList<Long> getTypeOfAccountsCount() throws ClassNotFoundException, SQLException {
		ReportDaoInterface rd = new ReportDao();
		ArrayList<Long> accountCount = new ArrayList<Long>();

		return rd.getTypeOfAccountsCount();
	}

}
