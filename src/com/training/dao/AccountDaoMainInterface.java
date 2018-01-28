package com.training.dao;

import java.sql.SQLException;

import com.training.model.Account;

public interface AccountDaoMainInterface {

	public boolean ChangeAccountTitleCloseTicket(Account a, long ticketId) throws SQLException, ClassNotFoundException;

	public boolean ChangeAccountTitle(Account a) throws SQLException, ClassNotFoundException;

	public Account getAccount(String accno) throws ClassNotFoundException, SQLException;

}
