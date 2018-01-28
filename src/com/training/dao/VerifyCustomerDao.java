
package com.training.dao;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Account;
import com.training.utils.ConnectionUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.Random;

public class VerifyCustomerDao {

	public ArrayList<Account> get_account_list(Long busid) throws CommercialCustandAcctMaintenance {
		PreparedStatement ps1 = null;
		Connection con1 = null;
		boolean flag = false;

		ArrayList<Account> accList = new ArrayList<Account>();
		try {
			con1 = ConnectionUtil.getConnection();
			ps1 = con1
					.prepareStatement("select * from NON_PERSONAL_ACCOUNT where NP_ID=? AND LOWER(STATUS) = 'active'");
			Account acc;
			ps1.setLong(1, busid);

			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next() != false) {
				acc = new Account();

				acc.setId(rs1.getInt(1));
				acc.setAcctype(rs1.getString(3));
				acc.setAccno(rs1.getLong(4));
				acc.setStatus(rs1.getString(6));
				acc.setAcctitle(rs1.getString(8));

				accList.add(acc);

			}

			ps1.close();
			con1.close();
			return accList;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	public ArrayList<String> getQuestion(Long apid) throws CommercialCustandAcctMaintenance {
		PreparedStatement ps1 = null;
		Connection con1 = null;
		ArrayList<String> seqques;
		seqques = new ArrayList<String>();

		try {

			con1 = ConnectionUtil.getConnection();
			ps1 = con1.prepareStatement("select SECURITY_QUESTION from VERIFY_ACCOUNT_PARTY where ID=? order by ID");
			ps1.setLong(1, apid.longValue());
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				String seq_question = rs1.getString(1);
				seqques.add(seq_question);
			}
			ps1.close();
			con1.close();

			return seqques;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	public ArrayList<String> getAnswer(Long apid) throws CommercialCustandAcctMaintenance {
		PreparedStatement ps1 = null;
		Connection con1 = null;
		ArrayList<String> seqans;
		seqans = new ArrayList<String>();

		try {
			con1 = ConnectionUtil.getConnection();
			ps1 = con1.prepareStatement("select SECURITY_ANSWER from VERIFY_ACCOUNT_PARTY where ID=? order by ID");
			ps1.setLong(1, apid.longValue());
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				String seq_answer = rs1.getString(1);
				seqans.add(seq_answer);

			}
			ps1.close();
			con1.close();
			return seqans;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	public ArrayList<String> getSecurityQuestionAnswer(Long apid) throws CommercialCustandAcctMaintenance {
		PreparedStatement ps1 = null;
		Connection con1 = null;
		boolean flag = false;
		ArrayList<String> seqans;
		seqans = new ArrayList<String>();
		try {
			con1 = ConnectionUtil.getConnection();
			ps1 = con1.prepareStatement("select SECURITY_ANSWER from VERIFY_ACCOUNT_PARTY where ID=? order by ID");
			ps1.setLong(1, apid.longValue());
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				String seq_question_answer = rs1.getString(1);
				seqans.add(seq_question_answer);

			}
			ps1.close();
			con1.close();
			return seqans;

		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	public boolean verifyCustomer(String businessName, String branchName, String apName, int accpId)
			throws CommercialCustandAcctMaintenance {
		PreparedStatement ps1 = null;
		Connection con1 = null;
		boolean flag = false;
		try {
			con1 = ConnectionUtil.getConnection();
			ps1 = con1.prepareStatement("select BRANCH_ID from BRANCH where BRANCH_NAME=?");
			ps1.setString(1, branchName);
			ResultSet rs1 = ps1.executeQuery();
			rs1.next();
			String bid = rs1.getString(1);
			ConnectionUtil.closeConnection(con1);
			PreparedStatement ps2 = null;
			Connection con2 = null;
			con2 = ConnectionUtil.getConnection();
			ps2 = con2.prepareStatement("select * from PERSONAL_PARTY WHERE ID=?");
			ResultSet rs2 = ps2.executeQuery();
			if (rs2.next())
				flag = true;
			return flag;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}
}