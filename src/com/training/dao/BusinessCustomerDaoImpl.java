/**
 * 
 */
package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.BusinessCustomer;
import com.training.utils.ConnectionUtil;

/**
 *  
 *
 */
public class BusinessCustomerDaoImpl implements BusinessCustomerDao {

	ArrayList<BusinessCustomer> bcList;
	BusinessCustomer bc;

	public ArrayList<BusinessCustomer> getBusinessCustomer(String parameter1, String parameter2, String actionname)
			throws CommercialCustandAcctMaintenance {
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		Connection con = null;
		String query = null;
		BusinessCustomer bc = new BusinessCustomer();

		try {

			con = ConnectionUtil.getConnection();

			if (actionname.equalsIgnoreCase("SearchCustomer1")) {
				ps2 = con.prepareStatement("select BRANCH_ID from BRANCH where BRANCH_NAME=?");
				ps2.setString(1, parameter2);
				ResultSet rs2 = ps2.executeQuery();

				rs2.next();
				String bid = rs2.getString(1);

				rs2.close();

				query = "select * from NON_PERSONAL_PARTY where BUSINESS_NAME='" + parameter1 + "' and BRANCH_ID='"
						+ bid + "'";
			} else if (actionname.equalsIgnoreCase("SearchCustomer2")) {
				ps2 = con.prepareStatement("select BRANCH_ID from BRANCH where BRANCH_NAME=?");
				ps2.setString(1, parameter2);
				ResultSet rs2 = ps2.executeQuery();
				rs2.next();
				String bid = rs2.getString(1);
				rs2.close();
				query = "select * from NON_PERSONAL_PARTY where TRADING_NAME='" + parameter1 + "' and BRANCH_ID='" + bid
						+ "'";
			} else if (actionname.equalsIgnoreCase("SearchCustomer3")) {
				query = "select * from NON_PERSONAL_PARTY a join NON_PERSONAL_ACCOUNT b on a.ID=b.NP_ID where b.ACCOUNT_NUMBER='"
						+ parameter1 + "'";
			}

			ps1 = con.prepareStatement(query);
			ResultSet rs1 = ps1.executeQuery();

			bcList = new ArrayList<BusinessCustomer>();

			while (rs1.next() != false) {

				bc = new BusinessCustomer();
				bc.setBusinessName(rs1.getString(2));
				bc.setBusinessId(rs1.getLong(1));
				bc.setTradingName(rs1.getString(3));
				bc.setBusinessType(rs1.getString(4));
				bc.setBranchId(rs1.getString(5));

				bc.setIsStartupBusiness(rs1.getString(6));
				bc.setAnnualTurnover(rs1.getDouble(9));
				bc.setCapitalFund(rs1.getDouble(10));
				bc.setStatus(rs1.getString(11));
				bc.setFundingRequired(rs1.getString(13));
				bc.setNoOfEmployee(rs1.getLong(15));
				bc.setCountry(rs1.getString(16));
				bc.setEmail(rs1.getString(17));
				bc.setBranchName(parameter2);

				bcList.add(bc);
			}

			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps1);

			return bcList;

		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	public BusinessCustomer getBusinessDetails(long busid) throws CommercialCustandAcctMaintenance {
		PreparedStatement ps = null;
		Connection con = null;
		// logger.info("Business id is "+busid);
		BusinessCustomer bc = new BusinessCustomer();

		try {
			con = ConnectionUtil.getConnection();
			// logger.info("Business id is "+busid);
			// String query="select * from NON_PERSONAL_PARTY where ID=?";

			ps = con.prepareStatement("select * from NON_PERSONAL_PARTY where ID=?");
			ps.setLong(1, busid);
			ResultSet rs1 = ps.executeQuery();

			rs1.next();

			bc.setBusinessName(rs1.getString(2));
			bc.setBusinessId(rs1.getLong(1));
			bc.setTradingName(rs1.getString(3));
			bc.setBusinessType(rs1.getString(4));
			bc.setBranchId(rs1.getString(5));
			bc.setIsStartupBusiness(rs1.getString(6));
			bc.setAnnualTurnover(rs1.getDouble(9));
			bc.setCapitalFund(rs1.getDouble(10));
			bc.setStatus(rs1.getString(11));
			bc.setFundingRequired(rs1.getString(13));
			bc.setNoOfEmployee(rs1.getLong(15));
			bc.setCountry(rs1.getString(16));
			bc.setEmail(rs1.getString(17));

			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);

			return bc;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}
}
