package com.training.services;

import com.training.controllers.LoginServlet;
import com.training.dao.AccountPartyDAO;
import com.training.dao.AccountPartyDAOImpl;
import com.training.dao.AccountPartyLispDao;
import com.training.dao.GetCustomerDao;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.AccParty;
import com.training.model.AccountParty;
import com.training.model.Branch;
import com.training.model.BusinessCustomer;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;

public class AccountPartyListService {
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	public ArrayList<Branch> getBranchList() throws CommercialCustandAcctMaintenance {
		AccountPartyDAO apd = new AccountPartyDAOImpl();

		return apd.getBranchList();

	}

	public ArrayList<BusinessCustomer> getBusinessCustomer(String parameter1, String parameter2, String actionname)
			throws CommercialCustandAcctMaintenance {
		logger.info("hie in service");
		GetCustomerDao bDao = new GetCustomerDao();
		BusinessCustomer bc = new BusinessCustomer();
		ArrayList<BusinessCustomer> bcList;
		try {
			bcList = bDao.getBusinessCustomer(parameter1, parameter2, actionname);
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("SQL  exception in AccountPartyList");
		}
		return bcList;
	}

	public ArrayList<AccParty> getAccountPartyList(long busId) throws CommercialCustandAcctMaintenance {
		AccountPartyLispDao apDao = new AccountPartyLispDao();
		ArrayList<AccParty> temp;
		try {
			temp = apDao.getAccountPartyList(busId);
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("SQL exception in AccountPartyList");
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class not found exception in AccountPartyList");
		}
		logger.info((new StringBuilder("size in service class ")).append(temp.size()).toString());
		return temp;
	}

}