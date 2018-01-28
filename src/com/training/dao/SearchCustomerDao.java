/**
 * 
 */
package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.training.exception.SearchCustomerException;
import com.training.model.Account;
import com.training.model.BusinessCustomer;
import com.training.utils.ConnectionUtil;

/**
 *  
 *
 */

// Search by Business Name and Branch Name

public class SearchCustomerDao implements SearchCustomerDaoInterface {

	ArrayList<BusinessCustomer> customers;

	// Retrieve all branch names into the combo box
	public ArrayList<String> retrieveBranches() throws SearchCustomerException {
		ArrayList<String> branches = new ArrayList<String>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String branchName = null;

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select distinct branch_name from branch order by branch_name");
			rs = ps.executeQuery();
			while (rs.next()) {
				branchName = rs.getString(1);
				branches.add(branchName);

			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new SearchCustomerException("Sorry, an internal error has occured. Please try after sometime");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new SearchCustomerException("Sorry, an internal error has occured. Please try after sometime");
		} catch (Exception e) {
			throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {
				throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");
			} catch (Exception e) {
				throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");
			}

		}
		return branches;

	}

	// Search by business name
	public ArrayList<BusinessCustomer> searchByBusiness(String businessName, String branch)
			throws SearchCustomerException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// for removing spaces if any
		businessName = businessName.trim();
		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement(
					"select id,business_name,trading_name,branch_name,business_type,email_address from NON_PERSONAL_PARTY np join BRANCH b on np.branch_id=b.branch_id where lower(np.business_name)=? and b.branch_name=?");
			ps.setString(1, businessName.toLowerCase());
			ps.setString(2, branch);
			rs = ps.executeQuery();

			customers = new ArrayList<BusinessCustomer>();

			while (rs.next() != false) {
				BusinessCustomer customer = new BusinessCustomer();
				customer.setId(rs.getInt(1));
				customer.setBusinessName(rs.getString(2));
				customer.setTradingName(rs.getString(3));
				customer.setBranchName(rs.getString(4));
				customer.setBusinessType(rs.getString(5));
				customer.setEmail(rs.getString(6));
				customers.add(customer);
			}
		} catch (ClassNotFoundException e) {
			throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");

		} catch (SQLException e) {
			throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");

		} catch (Exception e) {
			throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {
				throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");

			} catch (Exception e) {
				throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");
			}
		}
		return customers;
	}

	// search by trading name
	public ArrayList<BusinessCustomer> searchByTrading(String tradingName, String branch)
			throws SearchCustomerException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// for removing spaces if any
		tradingName = tradingName.trim();

		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement(
					"select id,business_name,trading_name,branch_name,business_type,email_address from NON_PERSONAL_PARTY np join BRANCH b on np.branch_id=b.branch_id where lower(np.trading_name)=? and b.branch_name=?");
			ps.setString(1, tradingName.toLowerCase());
			ps.setString(2, branch);
			rs = ps.executeQuery();

			customers = new ArrayList<BusinessCustomer>();

			while (rs.next() != false) {
				BusinessCustomer customer = new BusinessCustomer();
				customer.setId(rs.getInt(1));
				customer.setBusinessName(rs.getString(2));
				customer.setTradingName(rs.getString(3));
				customer.setBranchName(rs.getString(4));
				customer.setBusinessType(rs.getString(5));
				customer.setEmail(rs.getString(6));
				customers.add(customer);
			}

			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
		} catch (ClassNotFoundException e) {
			throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");

		} catch (SQLException e) {
			throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");
		} catch (Exception e) {
			throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");
		}
		return customers;
	}

	// search by account number
	public ArrayList<BusinessCustomer> searchByAccountNo(String accountNo) throws SearchCustomerException {
		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement psBranch = null;
		ResultSet rs = null;
		ResultSet rsBranch = null;

		// for removing spaces if any
		accountNo = accountNo.trim();
		long acno = Long.parseLong(accountNo);

		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement(
					"select np.id,np.business_name,np.trading_name,branch_id,np.business_type,np.email_address from NON_PERSONAL_PARTY np join NON_PERSONAL_ACCOUNT na on np.id=na.np_id where na.account_number=?");
			ps.setLong(1, acno);
			rs = ps.executeQuery();

			customers = new ArrayList<BusinessCustomer>();

			while (rs.next() != false) {
				BusinessCustomer customer = new BusinessCustomer();
				customer.setId(rs.getInt(1));
				customer.setBusinessName(rs.getString(2));

				customer.setTradingName(rs.getString(3));

				// for printing branch name
				String branch_id = rs.getString(4);

				psBranch = con.prepareStatement("select branch_name from branch where branch_id=?");
				psBranch.setString(1, branch_id);
				rsBranch = psBranch.executeQuery();
				while (rsBranch.next()) {
					customer.setBranchName(rsBranch.getString(1));
				}

				customer.setBusinessType(rs.getString(5));
				customer.setEmail(rs.getString(6));
				customers.add(customer);
			}

			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
		} catch (ClassNotFoundException e) {
			throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");
		} catch (SQLException e) {
			throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");
		} catch (Exception e) {
			throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");
		}
		return customers;
	}

	public BusinessCustomer retrieveDetails(int id) throws SearchCustomerException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		BusinessCustomer customer = new BusinessCustomer();
		String buildingNo = null;
		String buildingName = null;
		String streetName = null;
		String cityName = null;
		String townName = null;
		String country = null;
		String postalCode = null;
		String address = null;

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"select np.id,np.business_name,np.trading_name,np.business_type,na.building_no,na.building_name,na.street_name,na.city_name,na.town_name,na.country,na.postal_code,np.email_address from NON_PERSONAL_PARTY np join NP_ADDRESS na on np.id=na.np_party_id where np.id=? and address_type='Business Address'");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			rs.next();

			customer.setId(rs.getInt(1));
			customer.setBusinessName(rs.getString(2));
			customer.setTradingName(rs.getString(3));
			customer.setBusinessType(rs.getString(4));

			// get address
			buildingNo = rs.getString(5);
			buildingName = rs.getString(6);
			streetName = rs.getString(7);
			cityName = rs.getString(8);
			townName = rs.getString(9);
			country = rs.getString(10);
			postalCode = rs.getString(11);
			address = buildingNo + " " + buildingName + " " + streetName + " " + cityName + " " + townName + " "
					+ country + " " + postalCode;

			customer.setAddress(address);
			customer.setEmail(rs.getString(12));

		} catch (ClassNotFoundException e) {
			throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");
		} catch (SQLException e) {
			throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");
		} catch (Exception e) {
			throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");
		}

		return customer;
	}

	public Account retrieveAccountDetailsDao(long accId) throws SearchCustomerException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Account account;
		try {
			account = new Account();
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"select NPA.ID,NPA.ACCOUNT_NUMBER,NPA.BRANCH,NPA.STATUS,NPA.ACCOUNT_TYPE,P.NAME,NPA.ACCOUNT_TITLE FROM NON_PERSONAL_ACCOUNT NPA JOIN PRODUCT P ON NPA.PRODUCT_ID=P.ID WHERE LOWER(NPA.STATUS)='inprogress' AND NPA.ID=?");
			ps.setLong(1, accId);
			rs = ps.executeQuery();
			while (rs.next()) {
				account.setId(rs.getLong(1));
				account.setAccNumber(rs.getLong(2));
				account.setAccountTitle(rs.getString(7));
				account.setBranch(rs.getString(3));
				account.setStatus(rs.getString(4));
				account.setProductIntension(rs.getString(5));
				account.setProductName(rs.getString(6));

			}

		} catch (ClassNotFoundException e) {
			throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");
		} catch (SQLException e) {
			throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");
		}
		return account;
	}

	public ArrayList<Account> getAccountInProgress(BusinessCustomer bcust) throws SearchCustomerException {
		ArrayList<Account> accList = new ArrayList<Account>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Account account;
		long id = bcust.getId();
		try {
			account = new Account();
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"select NPA.ID, NPA.ACCOUNT_NUMBER, NPA.ACCOUNT_TITLE, NPA.BRANCH,NPA.STATUS,NPA.ACCOUNT_TYPE,P.NAME   FROM NON_PERSONAL_PARTY NPP JOIN NON_PERSONAL_ACCOUNT NPA on NPA.NP_ID = NPP.ID JOIN PRODUCT P ON P.ID=NPA.PRODUCT_ID where NPA.NP_ID = ? and LOWER(NPA.STATUS)='inprogress'");

			ps.setLong(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				account = new Account();
				account.setId(rs.getLong(1));
				account.setAccNumber(rs.getLong(2));
				account.setAccountTitle(rs.getString(3));
				account.setBranch(rs.getString(4));
				account.setStatus(rs.getString(5));
				account.setProductIntension(rs.getString(6));
				account.setProductName(rs.getString(7));

				accList.add(account);
			}

		} catch (ClassNotFoundException e) {
			throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");
		} catch (SQLException e) {
			throw new SearchCustomerException("Sorry, an internal error occured. Please try after sometime");
		}
		return accList;
	}

}
