package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import com.training.controllers.LoginServlet;
import com.training.model.Account;
import com.training.utils.ConnectionUtil;

public class AccountDaoImpl implements AccountDaoMainInterface {
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	public Account getAccount(String accno) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = null;
		Connection con = null;
		// logger.info("in account dao ==="+accno);
		Long ano = Long.parseLong(accno);

		Account acc = new Account();

		con = ConnectionUtil.getConnection();

		ps = con.prepareStatement(
				"select * from NON_PERSONAL_ACCOUNT where LOWER(STATUS) = 'active' AND ACCOUNT_NUMBER=" + ano);

		ResultSet rs = ps.executeQuery();
		acc.setId(-1);

		while (rs.next() != false) {
			// logger.info("heyy "+rs.getString(1));

			acc.setId(rs.getInt(1));
			acc.setAcctype(rs.getString(3));
			acc.setAccno(rs.getLong(4));
			acc.setStatus(rs.getString(6));
			acc.setAod(rs.getDate(7));
			acc.setAcctitle(rs.getString(8));
			acc.setAcd(rs.getDate(9));
			acc.setBranch(rs.getString(10));

		}

		ConnectionUtil.closeConnection(con);
		ConnectionUtil.closeStatement(ps);

		return acc;

	}

	public boolean ChangeAccountTitle(Account a) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = null;
		Connection con = null;
		Boolean var = false;
		logger.info("in account dao === new account title" + a.getAcctitle() + "account id " + a.getId() + "account no "
				+ a.getAccno());
		try {
			con = ConnectionUtil.getConnection();
			String updateStatement = "update  NON_PERSONAL_ACCOUNT set ACCOUNT_TITLE=? where ID=? and ACCOUNT_NUMBER=? ";
			// logger.info(a.getAcctitle() + "*" + a.getAccno() + "*"+ a.getId());
			ps = con.prepareStatement(updateStatement);
			ps.setString(1, a.getAcctitle());
			ps.setLong(2, a.getId());
			ps.setLong(3, a.getAccno());

			ps.executeUpdate();

			var = true;

		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
		}

		return var;

	}

	public boolean ChangeAccountTitleCloseTicket(Account a, long ticketId) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = null;
		Connection con = null;
		Boolean var = false;

		try {
			con = ConnectionUtil.getConnection();
			String updateStatement = "update  NON_PERSONAL_ACCOUNT set ACCOUNT_TITLE=? where ID=? and ACCOUNT_NUMBER=? ";
			/*
			 * logger.info(a.getAcctitle() + "*" + a.getAccno() + "*" + a.getId());
			 */
			ps = con.prepareStatement(updateStatement);
			ps.setString(1, a.getAcctitle());
			ps.setLong(2, a.getId());
			ps.setLong(3, a.getAccno());

			ps.executeUpdate();
			ps.close();
			con.close();
			con = ConnectionUtil.getConnection();

			updateStatement = "update HELPDESK_TICKET SET RESOLVED_DATE=sysdate,STATUS = 'RESOLVED', RESOLUTION_COMMENTS = 'Title changed successfully'  WHERE ID = ? ";
			ps = con.prepareStatement(updateStatement);
			ps.setLong(1, ticketId);
			ps.executeUpdate();
			var = true;
			// logger.info("ticket closed successfully ");

		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
		}

		return var;

	}

}
