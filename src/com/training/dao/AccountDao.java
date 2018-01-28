/**
 * 
 */
package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.training.controllers.LoginServlet;
import com.training.exception.AccountCreationException;
import com.training.model.Account;
import com.training.model.Product;
import com.training.utils.*;

/**
 *  
 *
 */
public class AccountDao implements AccountDaoInterface {
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	public boolean addAccount(Account acc, int np_id, String bname, int prod_id) throws AccountCreationException {

		boolean flag = false;
		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement psBranchName = null;
		String branchId = null;

		try {
			con = ConnectionUtil.getConnection();
			psBranchName = con.prepareStatement("select branch_id from branch where branch_name=?");
			psBranchName.setString(1, acc.getBranch());
			ResultSet rs = psBranchName.executeQuery();
			while (rs.next() != false) {
				branchId = rs.getString(1);
			}

			ps = con.prepareStatement(
					"insert into non_personal_account(id,np_id,account_type,account_open_date,status,account_title,branch,account_number,product_id) values(id_incrementor.nextval,?,?,sysdate,'inProgress',?,?,?,?)");
			ps.setInt(1, np_id);
			ps.setString(2, acc.getProductIntension());
			ps.setString(3, bname);
			ps.setString(4, branchId);
			ps.setLong(5, acc.getAccNumber());
			ps.setInt(6, prod_id);
			int i = ps.executeUpdate();
			if (i > 0)
				flag = true;
			else
				flag = false;
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");
		} catch (Exception e) {
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");
		}
		return flag;
	}

	public String getCountryOfRegistration(int businessId) throws AccountCreationException {
		String country = null;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select country_of_registration from non_personal_party where id=?");
			ps.setInt(1, businessId);
			ResultSet rs = ps.executeQuery();
			while (rs.next() != false) {
				country = rs.getString(1);

			}
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");
		} catch (Exception e) {
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");
		}
		return country;
	}

	public List<Product> getEligibleProducts(String account_type, String business_type)
			throws AccountCreationException {
		List<Product> prodList = new ArrayList<Product>();
		Connection con = null;
		PreparedStatement ps = null;
		boolean flag = false;
		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement(
					"select p.id,p.name from product p join product_customer pc on p.id=pc.pid where p.account_type=? and pc.business_type=?");
			ps.setString(1, account_type);
			ps.setString(2, business_type);
			ResultSet rs = ps.executeQuery();
			while (rs.next() != false) {
				Product product = new Product();
				product.setProductId(Integer.parseInt(rs.getString(1)));
				product.setProductName(rs.getString(2));
				prodList.add(product);
				flag = true;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new AccountCreationException("Sorry, currently there are no products available for you.");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new AccountCreationException("Sorry, currently there are no products available for you.");
		} catch (Exception e) {
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");
		}
		if (flag == true)
			return prodList;
		else
			return null;
	}

	public String findBranchCode(String branchName) throws AccountCreationException {
		Connection con = null;
		PreparedStatement ps = null;
		String branch_code = null;
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select branch_id from branch where branch_name=?");
			ps.setString(1, branchName);
			ResultSet rs = ps.executeQuery();
			rs.next();
			branch_code = (rs.getString(1));
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");

		} catch (SQLException e) {
			e.printStackTrace();
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");

		} catch (Exception e) {
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");
		}
		return branch_code;
	}

	public int getProductId(String prodName) throws AccountCreationException {
		Connection con = null;
		PreparedStatement ps = null;
		int prod_id = 0;

		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement("select id from product where name=?");
			ps.setString(1, prodName);
			ResultSet rs = ps.executeQuery();
			rs.next();
			prod_id = rs.getInt(1);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");
		} catch (Exception e) {
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");
		}
		return prod_id;
	}

	public boolean changeStatus(long acno) throws AccountCreationException {

		Connection con = null;
		PreparedStatement ps = null;
		boolean flag = false;
		try {
			con = ConnectionUtil.getConnection();
			logger.info(" in accopunt dao acc no ===" + acno);
			ps = con.prepareStatement(
					"update non_personal_account set status='Active',account_open_date=sysdate where account_number=?");

			ps.setLong(1, acno);

			int i = ps.executeUpdate();
			logger.info("value of i in account dao ===" + i);
			if (i > 0)
				flag = true;
			else
				flag = false;
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
			return flag;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new AccountCreationException(
					"Sorry, an internal error has occurred while changing the status of your account.Please try after sometime");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new AccountCreationException(
					"Sorry, an internal error has occurred while changing the status of your account.Please try after sometime");
		} catch (Exception e) {
			throw new AccountCreationException(
					"Sorry, an internal error has occurred while changing the status of your account.Please try after sometime");
		}

	}

	public boolean checkUniqueAccountNo(long acno) throws AccountCreationException {
		Connection con = null;
		PreparedStatement ps = null;
		boolean flag = false;
		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement("select account_number from non_personal_account where account_number=?");
			ps.setLong(1, acno);
			ResultSet rs = ps.executeQuery();
			if (rs.next() == false) {
				flag = true; // Unique account number
			} else
				flag = false; // not a unique
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");
		} catch (Exception e) {
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");
		}
		return flag;

	}

	// If Non UK customer already has accounts
	public int[] checkNoOfAccounts(int np_id) throws AccountCreationException {
		Connection con = null;
		PreparedStatement ps = null;
		int counts[] = { 0, 0 };
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select account_type from non_personal_account where np_id=?");
			ps.setInt(1, np_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next() != false) {
				if (rs.getString(1).equalsIgnoreCase("Current Account")) {
					counts[0]++; // Count for current account
				} else if (rs.getString(1).equalsIgnoreCase("Savings Account")) {
					counts[1]++; // Count for savings account
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");
		} catch (Exception e) {
			throw new AccountCreationException("Sorry, an internal error has occurred.Please try after sometime");
		}
		return counts;
	}
}
