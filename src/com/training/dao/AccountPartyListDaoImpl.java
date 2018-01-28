/**
 * 
 */
package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.training.model.AccountParty;
import com.training.model.BusinessCustomer;
import com.training.utils.ConnectionUtil;

/**
 *  
 *
 */
public class AccountPartyListDaoImpl implements AccountPartyListDao {

	public ArrayList<AccountParty> getAccountPartyList(String branchName, String businessName)
			throws ClassNotFoundException, SQLException {
		// logger.info("apdao");
		// logger.info("branch name in db is "+branchName);
		PreparedStatement ps1 = null;
		Connection con1 = null;
		ArrayList<AccountParty> accp = new ArrayList<AccountParty>();

		con1 = ConnectionUtil.getConnection();
		ps1 = con1.prepareStatement("select BRANCH_ID from BRANCH where BRANCH_NAME=?");

		ps1.setString(1, branchName);

		ResultSet rs1 = ps1.executeQuery();
		rs1.next();
		String bid = rs1.getString(1);

		// logger.info("branch id ib db is "+bid);
		ConnectionUtil.closeConnection(con1);

		PreparedStatement ps2 = null;
		Connection con2 = null;

		con2 = ConnectionUtil.getConnection();
		ps2 = con2.prepareStatement(
				"select pp.FIRST_NAME ,pp.SURNAME from PERSONAL_PARTY pp inner join NON_PERSONAL_PARTY npp on npp.BUSINESS_NAME=? AND npp.BRANCH_ID=? AND pp.NP_ID=npp.ID");

		ps2.setString(1, businessName);
		ps2.setString(2, bid);

		ResultSet rs2 = ps2.executeQuery();

		BusinessCustomer bc = new BusinessCustomer();

		while (rs2.next() != false) {
			AccountParty ap = new AccountParty();
			ap.setFname(rs2.getString(1) + " " + rs2.getString(2));
			accp.add(ap);
		}

		ConnectionUtil.closeConnection(con2);
		ConnectionUtil.closeStatement(ps2);
		return accp;

	}

}
