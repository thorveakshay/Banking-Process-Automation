package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.training.model.BusinessCustomer;
import com.training.utils.ConnectionUtil;

public class ReportDao implements ReportDaoInterface {

	// select ROUND (RATIO_TO_REPORT (COUNT (*)) OVER () * 100, 2) ||
	// '%',(select B1.BRANCH_NAME from BRANCH B1 where
	// b1.BRANCH_ID=B.BRANCH_ID)as "BRANCH NAME",B.BRANCH_ID from
	// NON_PERSONAL_PARTY NP join BRANCH B on NP.BRANCH_ID=B.BRANCH_ID group by
	// B.BRANCH_ID;
	public ArrayList<Long> getTypeOfAccountsCount(Long BusId) throws ClassNotFoundException, SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		List<Long> accountCount = new ArrayList<Long>();
		int i = 0;

		long temp = 0;
		String busId = null;

		busId = "NP_ID=" + BusId;

		// String query = "select * from (select count(*) as TOTAL_ACCOUNTS from
		// NON_PERSONAL_ACCOUNT) join (select count(*) as SAVINGS_ACCOUNTS from
		// NON_PERSONAL_ACCOUNT where ACCOUNT_TYPE='Savings Account') on 2=2 join
		// (select count(*) CURRENT_ACCOUNTS from NON_PERSONAL_ACCOUNT WHERE
		// ACCOUNT_TYPE='Current Account') on 1=1 join (select count(*) CURRENT_ACTIVE
		// from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and
		// LOWER(STATUS)='active') on 1=1 join (select count(*) CURRENT_INACTIVE from
		// NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and
		// LOWER(STATUS)='inactive') on 1=1 join (select count(*) CURRENT_INPROGRESS
		// from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and
		// LOWER(STATUS)='inprogress') on 1=1 join (select count(*) SAVINGS_ACTIVE from
		// NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and
		// LOWER(STATUS)='active') on 1=1 join (select count(*) SAVINGS_INACTIVE from
		// NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and
		// LOWER(STATUS)='inactive') on 1=1 join (select count(*) SAVINGS_INPROGRESS
		// from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and
		// LOWER(STATUS)='inprogress') on 1=1 ";
		String query = "select * from (select count(*) as TOTAL_ACCOUNTS from NON_PERSONAL_ACCOUNT where " + busId
				+ " )join (select count(*) as SAVINGS_ACCOUNTS from NON_PERSONAL_ACCOUNT where ACCOUNT_TYPE='Savings Account'and "
				+ busId
				+ " ) on 2=2 join (select count(*) CURRENT_ACCOUNTS from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account'and "
				+ busId
				+ ") on 1=1 join (select count(*) CURRENT_ACTIVE from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and LOWER(STATUS)='active'and "
				+ busId
				+ ") on 1=1 join (select count(*) CURRENT_INACTIVE from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and LOWER(STATUS)='inactive'and "
				+ busId
				+ ") on 1=1 join (select count(*) CURRENT_INPROGRESS from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and LOWER(STATUS)='inprogress'and "
				+ busId
				+ ") on 1=1 join (select count(*) SAVINGS_ACTIVE from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and LOWER(STATUS)='active'and "
				+ busId
				+ ") on 1=1 join (select count(*) SAVINGS_INACTIVE from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and LOWER(STATUS)='inactive'and ACCOUNT_OPEN_DATE >='"
				+ busId
				+ "') on 1=1 join (select count(*) SAVINGS_INPROGRESS from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and LOWER(STATUS)='inprogress'and "
				+ busId + ") on 1=1";

		con = ConnectionUtil.getConnection();
		// String query = "select * from (select count(*) as TOTAL_ACCOUNTS from
		// NON_PERSONAL_ACCOUNT) join (select count(*) as SAVINGS_ACCOUNTS from
		// NON_PERSONAL_ACCOUNT where ACCOUNT_TYPE='Savings Account') on 2=2 join
		// (select count(*) CURRENT_ACCOUNTS from NON_PERSONAL_ACCOUNT WHERE
		// ACCOUNT_TYPE='Current Account') on 1=1 join (select count(*) CURRENT_ACTIVE
		// from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and
		// LOWER(STATUS)='active') on 1=1 join (select count(*) CURRENT_INACTIVE from
		// NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and
		// LOWER(STATUS)='inactive') on 1=1 join (select count(*) CURRENT_INPROGRESS
		// from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and
		// LOWER(STATUS)='inprogress') on 1=1 join (select count(*) SAVINGS_ACTIVE from
		// NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and
		// LOWER(STATUS)='active') on 1=1 join (select count(*) SAVINGS_INACTIVE from
		// NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and
		// LOWER(STATUS)='inactive') on 1=1 join (select count(*) SAVINGS_INPROGRESS
		// from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and
		// LOWER(STATUS)='inprogress') on 1=1 ";
		ps = con.prepareStatement(query);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			for (i = 0; i < 9; i++) {
				temp = rs.getLong(i + 1);

				accountCount.add(temp);
			}
		}
		ps.close();
		rs.close();
		con.close();

		return (ArrayList<Long>) accountCount;
	}

	public ArrayList<Long> getTypeOfAccountsCount(int Month, int year, Long busid)
			throws ClassNotFoundException, SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		List<Long> accountCount = new ArrayList<Long>();
		int i = 0;

		long temp = 0;
		con = ConnectionUtil.getConnection();
		// String date="01-"+Month+"-"+year;
		String date = null;

		if (busid == null)
			date = "(to_char(ACCOUNT_OPEN_DATE, 'mm' ))=" + Month + " and (to_char(ACCOUNT_OPEN_DATE, 'yyyy' ))="
					+ year;
		else
			date = "(to_char(ACCOUNT_OPEN_DATE, 'mm' ))=" + Month + " and (to_char(ACCOUNT_OPEN_DATE, 'yyyy' ))=" + year
					+ " and NP_ID=" + busid;

		// String query = "select * from (select count(*) as TOTAL_ACCOUNTS from
		// NON_PERSONAL_ACCOUNT) join (select count(*) as SAVINGS_ACCOUNTS from
		// NON_PERSONAL_ACCOUNT where ACCOUNT_TYPE='Savings Account') on 2=2 join
		// (select count(*) CURRENT_ACCOUNTS from NON_PERSONAL_ACCOUNT WHERE
		// ACCOUNT_TYPE='Current Account') on 1=1 join (select count(*) CURRENT_ACTIVE
		// from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and
		// LOWER(STATUS)='active') on 1=1 join (select count(*) CURRENT_INACTIVE from
		// NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and
		// LOWER(STATUS)='inactive') on 1=1 join (select count(*) CURRENT_INPROGRESS
		// from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and
		// LOWER(STATUS)='inprogress') on 1=1 join (select count(*) SAVINGS_ACTIVE from
		// NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and
		// LOWER(STATUS)='active') on 1=1 join (select count(*) SAVINGS_INACTIVE from
		// NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and
		// LOWER(STATUS)='inactive') on 1=1 join (select count(*) SAVINGS_INPROGRESS
		// from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and
		// LOWER(STATUS)='inprogress') on 1=1 ";
		String query = "select * from (select count(*) as TOTAL_ACCOUNTS from NON_PERSONAL_ACCOUNT where " + date
				+ " )join (select count(*) as SAVINGS_ACCOUNTS from NON_PERSONAL_ACCOUNT where ACCOUNT_TYPE='Savings Account'and "
				+ date
				+ " ) on 2=2 join (select count(*) CURRENT_ACCOUNTS from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account'and "
				+ date
				+ ") on 1=1 join (select count(*) CURRENT_ACTIVE from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and LOWER(STATUS)='active'and "
				+ date
				+ ") on 1=1 join (select count(*) CURRENT_INACTIVE from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and LOWER(STATUS)='inactive'and "
				+ date
				+ ") on 1=1 join (select count(*) CURRENT_INPROGRESS from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and LOWER(STATUS)='inprogress'and "
				+ date
				+ ") on 1=1 join (select count(*) SAVINGS_ACTIVE from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and LOWER(STATUS)='active'and "
				+ date
				+ ") on 1=1 join (select count(*) SAVINGS_INACTIVE from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and LOWER(STATUS)='inactive'and "
				+ date
				+ ") on 1=1 join (select count(*) SAVINGS_INPROGRESS from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and LOWER(STATUS)='inprogress'and "
				+ date + ") on 1=1";
		System.out.println("query is " + query);

		ps = con.prepareStatement(query);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			for (i = 0; i < 9; i++) {
				temp = rs.getLong(i + 1);

				accountCount.add(temp);
			}
		}
		ps.close();
		rs.close();
		con.close();

		return (ArrayList<Long>) accountCount;
	}

	public ArrayList<BusinessCustomer> getBusinessDetails() {
		PreparedStatement ps = null;
		ArrayList<BusinessCustomer> bclist = new ArrayList<BusinessCustomer>();

		Connection con = null;
		// System.out.println("Business id is "+busid);
		BusinessCustomer bc = new BusinessCustomer();

		try {
			con = ConnectionUtil.getConnection();
			// System.out.println("Business id is "+busid);
			// String query="select * from NON_PERSONAL_PARTY where ID=?";

			ps = con.prepareStatement("select * from NON_PERSONAL_PARTY ");

			ResultSet rs1 = ps.executeQuery();

			while (rs1.next()) {
				bc = new BusinessCustomer();
				bc.setBusinessName(rs1.getString(2));
				bc.setId(rs1.getInt(1));
				bc.setTradingName(rs1.getString(3));
				bc.setBusinessType(rs1.getString(4));

				bclist.add(bc);

			}

			ps.close();
			rs1.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();

			// TODO: handle exception
		}
		return bclist;

	}

	public BusinessCustomer getBusinessDetails(long busid) {
		PreparedStatement ps = null;
		Connection con = null;
		// System.out.println("Business id is "+busid);
		BusinessCustomer bc = new BusinessCustomer();

		try {
			con = ConnectionUtil.getConnection();
			// System.out.println("Business id is "+busid);
			// String query="select * from NON_PERSONAL_PARTY where ID=?";

			ps = con.prepareStatement("select * from NON_PERSONAL_PARTY where ID=?");
			ps.setLong(1, busid);
			ResultSet rs1 = ps.executeQuery();

			rs1.next();

			bc.setBusinessName(rs1.getString(2));
			bc.setId(rs1.getInt(1));
			bc.setTradingName(rs1.getString(3));
			bc.setBusinessType(rs1.getString(4));

			ps.close();
			rs1.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();

			// TODO: handle exception
		}
		return bc;

	}

	public ArrayList<Long> getTypeOfAccountsCount(int year, Long busid) throws ClassNotFoundException, SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		List<Long> accountCount = new ArrayList<Long>();
		int i = 0;

		long temp = 0;
		con = ConnectionUtil.getConnection();
		String date = null;

		if (busid == null)
			date = "  (to_char(ACCOUNT_OPEN_DATE, 'yyyy' ))=" + year;
		else
			date = " (to_char(ACCOUNT_OPEN_DATE, 'yyyy' ))=" + year + " and NP_ID=" + busid;

		// String query = "select * from (select count(*) as TOTAL_ACCOUNTS from
		// NON_PERSONAL_ACCOUNT) join (select count(*) as SAVINGS_ACCOUNTS from
		// NON_PERSONAL_ACCOUNT where ACCOUNT_TYPE='Savings Account') on 2=2 join
		// (select count(*) CURRENT_ACCOUNTS from NON_PERSONAL_ACCOUNT WHERE
		// ACCOUNT_TYPE='Current Account') on 1=1 join (select count(*) CURRENT_ACTIVE
		// from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and
		// LOWER(STATUS)='active') on 1=1 join (select count(*) CURRENT_INACTIVE from
		// NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and
		// LOWER(STATUS)='inactive') on 1=1 join (select count(*) CURRENT_INPROGRESS
		// from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and
		// LOWER(STATUS)='inprogress') on 1=1 join (select count(*) SAVINGS_ACTIVE from
		// NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and
		// LOWER(STATUS)='active') on 1=1 join (select count(*) SAVINGS_INACTIVE from
		// NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and
		// LOWER(STATUS)='inactive') on 1=1 join (select count(*) SAVINGS_INPROGRESS
		// from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and
		// LOWER(STATUS)='inprogress') on 1=1 ";
		String query = "select * from (select count(*) as TOTAL_ACCOUNTS from NON_PERSONAL_ACCOUNT where " + date
				+ " )join (select count(*) as SAVINGS_ACCOUNTS from NON_PERSONAL_ACCOUNT where ACCOUNT_TYPE='Savings Account'and "
				+ date
				+ " ) on 2=2 join (select count(*) CURRENT_ACCOUNTS from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account'and "
				+ date
				+ ") on 1=1 join (select count(*) CURRENT_ACTIVE from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and LOWER(STATUS)='active'and "
				+ date
				+ ") on 1=1 join (select count(*) CURRENT_INACTIVE from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and LOWER(STATUS)='inactive'and "
				+ date
				+ ") on 1=1 join (select count(*) CURRENT_INPROGRESS from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and LOWER(STATUS)='inprogress'and "
				+ date
				+ ") on 1=1 join (select count(*) SAVINGS_ACTIVE from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and LOWER(STATUS)='active'and "
				+ date
				+ ") on 1=1 join (select count(*) SAVINGS_INACTIVE from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and LOWER(STATUS)='inactive'and "
				+ date
				+ ") on 1=1 join (select count(*) SAVINGS_INPROGRESS from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and LOWER(STATUS)='inprogress'and "
				+ date + ") on 1=1";
		System.out.println("new Query is : " + query);
		// String query = "select * from (select count(*) as TOTAL_ACCOUNTS from
		// NON_PERSONAL_ACCOUNT) join (select count(*) as SAVINGS_ACCOUNTS from
		// NON_PERSONAL_ACCOUNT where ACCOUNT_TYPE='Savings Account') on 2=2 join
		// (select count(*) CURRENT_ACCOUNTS from NON_PERSONAL_ACCOUNT WHERE
		// ACCOUNT_TYPE='Current Account') on 1=1 join (select count(*) CURRENT_ACTIVE
		// from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and
		// LOWER(STATUS)='active') on 1=1 join (select count(*) CURRENT_INACTIVE from
		// NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and
		// LOWER(STATUS)='inactive') on 1=1 join (select count(*) CURRENT_INPROGRESS
		// from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and
		// LOWER(STATUS)='inprogress') on 1=1 join (select count(*) SAVINGS_ACTIVE from
		// NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and
		// LOWER(STATUS)='active') on 1=1 join (select count(*) SAVINGS_INACTIVE from
		// NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and
		// LOWER(STATUS)='inactive') on 1=1 join (select count(*) SAVINGS_INPROGRESS
		// from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and
		// LOWER(STATUS)='inprogress') on 1=1 ";
		ps = con.prepareStatement(query);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			for (i = 0; i < 9; i++) {
				temp = rs.getLong(i + 1);

				accountCount.add(temp);
			}
		}

		return (ArrayList<Long>) accountCount;
	}

	public ArrayList<Long> getTypeOfAccountsCount() throws ClassNotFoundException, SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		List<Long> accountCount = new ArrayList<Long>();
		int i = 0;

		long temp = 0;
		con = ConnectionUtil.getConnection();
		String query = "select * from (select count(*) as TOTAL_ACCOUNTS from NON_PERSONAL_ACCOUNT) join (select count(*) as SAVINGS_ACCOUNTS from NON_PERSONAL_ACCOUNT where ACCOUNT_TYPE='Savings Account') on 2=2 join (select count(*) CURRENT_ACCOUNTS from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account') on 1=1 join (select count(*) CURRENT_ACTIVE from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and LOWER(STATUS)='active') on 1=1 join (select count(*) CURRENT_INACTIVE from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and LOWER(STATUS)='inactive') on 1=1 join (select count(*) CURRENT_INPROGRESS from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Current Account' and LOWER(STATUS)='inprogress') on 1=1 join (select count(*) SAVINGS_ACTIVE from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and LOWER(STATUS)='active') on 1=1 join (select count(*) SAVINGS_INACTIVE from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and LOWER(STATUS)='inactive') on 1=1 join (select count(*) SAVINGS_INPROGRESS from NON_PERSONAL_ACCOUNT WHERE ACCOUNT_TYPE='Savings Account' and LOWER(STATUS)='inprogress') on 1=1 ";
		ps = con.prepareStatement(query);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			for (i = 0; i < 9; i++) {
				temp = rs.getLong(i + 1);

				accountCount.add(temp);
			}
		}

		return (ArrayList<Long>) accountCount;
	}

}
