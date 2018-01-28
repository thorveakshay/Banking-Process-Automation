package com.training.services;

import java.sql.SQLException;

import com.training.dao.AccountDaoImpl;
import com.training.dao.AccountDaoMainInterface;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Account;

public class ChangeAccountTitleService {

	public Account getAccount(String accno) throws CommercialCustandAcctMaintenance {
		// logger.info("in services");

		AccountDaoMainInterface adao = new AccountDaoImpl();
		Account acc = new Account();
		try {
			try {
				acc = adao.getAccount(accno);
			} catch (SQLException e) {
				throw new CommercialCustandAcctMaintenance("SQL exception in ChangeAccountTitle");
			}
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class not found exception in ChangeAccountTitle");
		}
		return acc;

	}

	public boolean ChangeAccountTitle(Account a) throws CommercialCustandAcctMaintenance {
		Boolean var;
		AccountDaoMainInterface adao = new AccountDaoImpl();

		try {
			try {
				var = adao.ChangeAccountTitle(a);
			} catch (SQLException e) {
				throw new CommercialCustandAcctMaintenance("SQL exception custom exception in ChangeAccountTitle");

			}
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class not found custom exception in ChangeAccountTitle");

		}

		return var;

	}

	public boolean ChangeAccountTitleCloseTicket(Account a, long ticketId) throws CommercialCustandAcctMaintenance {
		Boolean var;
		AccountDaoMainInterface adao = new AccountDaoImpl();

		try {
			try {
				var = adao.ChangeAccountTitleCloseTicket(a, ticketId);
			} catch (SQLException e) {
				throw new CommercialCustandAcctMaintenance("SQL exception custom exception in ChangeAccountTitle");

			}
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class not found custom exception in ChangeAccountTitle");

		}

		return var;

	}

}
