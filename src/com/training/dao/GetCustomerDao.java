package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.training.model.Branch;
import com.training.model.BusinessCustomer;
import com.training.utils.ConnectionUtil;

public class GetCustomerDao {

	ArrayList<BusinessCustomer> bcList;
	BusinessCustomer bc;

	public ArrayList<BusinessCustomer> getBusinessCustomerForRm(String parameter1, String parameter2, String actionname,
			Long rmId) throws SQLException {
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		Connection con = null;
		String query = null;
		BusinessCustomer bc = new BusinessCustomer();

		boolean flag = false;
		boolean flag1 = false;
		// logger.info("in dao trading name === "+parameter1);
		try {
			con = ConnectionUtil.getConnection();

			if (actionname.equalsIgnoreCase("SearchCustomer1")) {
				ps2 = con.prepareStatement("select BRANCH_ID from BRANCH where BRANCH_NAME LIKE '" + parameter2 + "'");
				// ps2.setString(1, parameter2);
				ResultSet rs2 = ps2.executeQuery();

				rs2.next();
				String bid = rs2.getString(1);

				// logger.info("in getcustomer dao =="+bid);
				rs2.close();
				String p1 = "" + parameter1 + "%";
				// logger.info("in dao again ===" +p1);
				query = "select * from NON_PERSONAL_PARTY where LOWER(BUSINESS_NAME) like '" + p1.toLowerCase()
						+ "' and BRANCH_ID='" + bid + "' and RM_assigned=" + rmId;

				flag = true;

			} else if (actionname.equalsIgnoreCase("SearchCustomer2")) {
				ps2 = con.prepareStatement(
						"select BRANCH_ID, BRANCH_NAME from BRANCH where BRANCH_NAME='" + parameter1 + "'");
				// logger.info("value of paramneter 2"+parameter1);
				// ps2.setString(1, parameter1);
				ResultSet rs2 = ps2.executeQuery();
				rs2.next();
				String bid = rs2.getString(1);
				String busName = rs2.getString(2);
				// logger.info("in dao for trading name === "+bid);
				// logger.info("in dao for trading name === "+busName);
				rs2.close();
				String p2 = "" + parameter2 + "%";
				query = "select * from NON_PERSONAL_PARTY where LOWER(TRADING_NAME) LIKE '" + p2.toLowerCase()
						+ "' and BRANCH_ID='" + bid + "'and RM_assigned=" + rmId;
			} else if (actionname.equalsIgnoreCase("SearchCustomer3")) {

				// logger.info("value of paramneter 2"+parameter1);
				query = "select * from NON_PERSONAL_PARTY a join NON_PERSONAL_ACCOUNT b on a.ID=b.NP_ID join BRANCH c ON c.BRANCH_ID=b.BRANCH where b.ACCOUNT_NUMBER='"
						+ parameter1 + "' and a.RM_assigned=" + rmId;
				flag1 = true;
				// logger.info("value of flag ===="+flag);
				// logger.info("value of flag1 ===="+flag1);
			}

			ps1 = con.prepareStatement(query);

			ResultSet rs1 = ps1.executeQuery();

			bcList = new ArrayList<BusinessCustomer>();

			while (rs1.next() != false) {

				bc = new BusinessCustomer();
				bc.setBusinessId(rs1.getLong(1));
				bc.setBusinessName(rs1.getString(2));

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

				if (flag)
					bc.setBranchName(parameter2);
				if (flag == false)
					bc.setBranchName(parameter1);
				if (flag1 == true)
					bc.setBranchName(rs1.getString(37));
				// logger.info("Branch name in dao =======================
				// "+bc.getBranchName());
				bcList.add(bc);
			}
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} finally {
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps1);
		}

		return bcList;

	}

	public ArrayList<BusinessCustomer> getBusinessCustomer(String parameter1, String parameter2, String actionname)
			throws SQLException {
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		Connection con = null;
		String query = null;
		BusinessCustomer bc = new BusinessCustomer();

		boolean flag = false;
		boolean flag1 = false;
		// logger.info("in dao trading name === "+parameter1);
		try {
			con = ConnectionUtil.getConnection();

			if (actionname.equalsIgnoreCase("SearchCustomer1")) {
				ps2 = con.prepareStatement("select BRANCH_ID from BRANCH where BRANCH_NAME LIKE '" + parameter2 + "'");
				// ps2.setString(1, parameter2);
				ResultSet rs2 = ps2.executeQuery();

				rs2.next();
				String bid = rs2.getString(1);

				// logger.info("in getcustomer dao =="+bid);
				rs2.close();
				String p1 = "" + parameter1 + "%";
				// logger.info("in dao again ===" +p1);
				query = "select * from NON_PERSONAL_PARTY where LOWER(BUSINESS_NAME) like '" + p1.toLowerCase()
						+ "' and BRANCH_ID='" + bid + "'";

				flag = true;

			} else if (actionname.equalsIgnoreCase("SearchCustomer2")) {
				ps2 = con.prepareStatement(
						"select BRANCH_ID, BRANCH_NAME from BRANCH where BRANCH_NAME='" + parameter1 + "'");
				// logger.info("value of paramneter 2"+parameter1);
				// ps2.setString(1, parameter1);
				ResultSet rs2 = ps2.executeQuery();
				rs2.next();
				String bid = rs2.getString(1);
				String busName = rs2.getString(2);
				// logger.info("in dao for trading name === "+bid);
				// logger.info("in dao for trading name === "+busName);
				rs2.close();
				String p2 = "" + parameter2 + "%";
				query = "select * from NON_PERSONAL_PARTY where LOWER(TRADING_NAME) LIKE '" + p2.toLowerCase()
						+ "' and BRANCH_ID='" + bid + "'";
			} else if (actionname.equalsIgnoreCase("SearchCustomer3")) {

				// logger.info("value of paramneter 2"+parameter1);
				query = "select * from NON_PERSONAL_PARTY a join NON_PERSONAL_ACCOUNT b on a.ID=b.NP_ID join BRANCH c ON c.BRANCH_ID=b.BRANCH where b.ACCOUNT_NUMBER='"
						+ parameter1 + "' ";
				flag1 = true;
				// logger.info("value of flag ===="+flag);
				// logger.info("value of flag1 ===="+flag1);
			}

			ps1 = con.prepareStatement(query);

			ResultSet rs1 = ps1.executeQuery();

			bcList = new ArrayList<BusinessCustomer>();

			while (rs1.next() != false) {

				bc = new BusinessCustomer();
				bc.setBusinessId(rs1.getLong(1));
				bc.setBusinessName(rs1.getString(2));

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

				if (flag)
					bc.setBranchName(parameter2);
				if (flag == false)
					bc.setBranchName(parameter1);
				if (flag1 == true)
					bc.setBranchName(rs1.getString(37));
				// logger.info("Branch name in dao =======================
				// "+bc.getBranchName());
				bcList.add(bc);
			}
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} finally {
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps1);
		}

		return bcList;

	}

	public ArrayList<Branch> getBranch() throws ClassNotFoundException, SQLException {
		ArrayList<Branch> branchList = new ArrayList<Branch>();
		Branch b;
		PreparedStatement ps = null;
		// logger.info("in dao for branch===");
		Connection con = null;
		con = ConnectionUtil.getConnection();

		ps = con.prepareStatement("select * from BRANCH");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			b = new Branch();
			b.setBranch_id(rs.getString(1));
			b.setBranch_name(rs.getString(2));
			b.setBranch_address(rs.getString(3));
			// logger.info(" branch name ="+b.getBranch_name());
			branchList.add(b);
		}

		return branchList;

	}

	public Boolean checkAccNum(String parameter1) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		boolean flag = false;
		PreparedStatement ps1 = null;
		Connection con = null;
		con = ConnectionUtil.getConnection();
		ps1 = con.prepareStatement(
				"select * from NON_PERSONAL_PARTY a join NON_PERSONAL_ACCOUNT b on a.ID=b.NP_ID where b.ACCOUNT_NUMBER='"
						+ parameter1 + "'");

		int i = ps1.executeUpdate();

		if (i > 0) {
			flag = true;
		} else {
			flag = false;
		}

		return flag;
	}

}