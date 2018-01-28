package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Account;
import com.training.model.Business;
import com.training.model.Product;
import com.training.utils.ConnectionUtil;

public class SwitchProductDaoImpl implements SwitchProductDao {

	ArrayList<Product> proList = new ArrayList<Product>();

	public Account getAccount(String accno) throws CommercialCustandAcctMaintenance {
		PreparedStatement ps = null;
		Connection con = null;
		// logger.info("in dao acc no 1 "+accno);
		Long ano = Long.parseLong(accno);

		Account acc = new Account();
		try {

			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement("select * from NON_PERSONAL_ACCOUNT where ACCOUNT_NUMBER=" + ano);

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
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	public Product getProductDao(String accno) throws CommercialCustandAcctMaintenance {
		Long ano = Long.parseLong(accno);
		// logger.info("in dao class ===== "+ano);
		Product pro = new Product();
		PreparedStatement ps = null;
		Connection con = null;
		Boolean var = false;
		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement(
					"SELECT P.ID, P.NAME, P.VALID_FROM,P.STATUS, PC.BUSINESS_TYPE,P.DESCRIPTION, P.ACCOUNT_TYPE FROM PRODUCT P JOIN PRODUCT_CUSTOMER PC ON P.ID = PC.PID JOIN NON_PERSONAL_ACCOUNT NPA ON P.ID = NPA.PRODUCT_ID WHERE NPA.ACCOUNT_NUMBER = "
							+ ano);
			ResultSet rs = ps.executeQuery();
			// logger.info("in dao again ===== ");
			while (rs.next()) {
				pro.setId(rs.getLong(1));
				pro.setName(rs.getString(2));
				pro.setValid_from(rs.getDate(3));
				pro.setStatus(rs.getString(4));
				pro.setBusinessType(rs.getString(5));
				pro.setProductDescription(rs.getString(6));
				pro.setAccountType(rs.getString(7));

				// logger.info("in dao ==== 2 " +pro.getName());
			}
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
			return pro;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	public Business getBusinessDao(String acc) throws CommercialCustandAcctMaintenance {
		Business business = new Business();
		Long ano = Long.parseLong(acc);
		// logger.info("in dao class ===== 4 "+ano);
		Product pro = new Product();
		PreparedStatement ps = null;
		Connection con = null;
		Boolean var = false;
		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement(
					"SELECT NPP.ID, NPP.BUSINESS_NAME, NPP.TRADING_NAME,NPP.BUSINESS_TYPE, NPP.EXPECTED_ANNUAL_TURNOVER,NPP.CAPITAL_FUND, NPP.STATUS FROM NON_PERSONAL_PARTY NPP JOIN NON_PERSONAL_ACCOUNT  NPA ON NPP.ID = NPA.NP_ID WHERE NPA.ACCOUNT_NUMBER ="
							+ ano);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				business.setId(rs.getLong(1));
				business.setBusinessName(rs.getString(2));
				business.setTradingName(rs.getString(3));
				business.setBusinessType(rs.getString(4));
				business.setExpAnnualTurnover(rs.getLong(5));
				business.setCapitalFund(rs.getLong(6));
				business.setStatus(rs.getString(7));

				// logger.info("in dao for business ===== ");
			}
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
			return business;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	public Boolean switchProduct(Long accid, Long busid, String acctype, Long ano, Long newProductID)
			throws CommercialCustandAcctMaintenance {
		PreparedStatement ps = null;
		Connection con = null;
		ArrayList<Product> pro = new ArrayList<Product>();
		Boolean flag = false;

		try {
			con = ConnectionUtil.getConnection();
			String updateStatement = "update  NON_PERSONAL_ACCOUNT set PRODUCT_ID=? where  NP_ID=? and ACCOUNT_TYPE=? and ACCOUNT_NUMBER=? and ID=?";

			ps = con.prepareStatement(updateStatement);
			ps.setLong(1, newProductID);
			ps.setLong(2, busid);
			ps.setString(3, acctype);
			ps.setLong(4, ano);
			ps.setLong(5, accid);

			int i = ps.executeUpdate();
			if (i > 0) {
				flag = true;
			}

			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
			return flag;

		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	public ArrayList<Product> getListProduct(String accno, long bid, String accType)
			throws CommercialCustandAcctMaintenance {

		Long ano = Long.parseLong(accno);
		// logger.info("in dao class ===== "+ano);
		Product pro;
		PreparedStatement ps = null;
		Connection con = null;
		Boolean var = false;
		try {
			// logger.info("busid=="+bid+"bustype"+accType);
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement(
					"SELECT P.ID, P.NAME, P.VALID_FROM, P.STATUS, PC.BUSINESS_TYPE, P.DESCRIPTION, P.ACCOUNT_TYPE from PRODUCT P JOIN PRODUCT_CUSTOMER PC on PC.PID=P.ID and ACCOUNT_TYPE=? and LOWER(P.STATUS)='active' and PC.BUSINESS_TYPE in (select BUSINESS_TYPE from NON_PERSONAL_PARTY where ID=?)");

			// SELECT P.ID, P.NAME, P.VALID_FROM, P.STATUS, PC.BUSINESS_TYPE, P.DESCRIPTION,
			// P.ACCOUNT_TYPE FROM PRODUCT P JOIN PRODUCT_CUSTOMER PC ON P.ID = PC.PID WHERE
			// AND P.ACCOUNT_TYPE =? AND PC.BUSINESS_TYPE IN (SELECT BUSINESS_TYPE FROM
			// NON_PERSONAL_PARTY WHERE ID = ?)");

			ps.setString(1, accType);
			ps.setLong(2, bid);
			ResultSet rs = ps.executeQuery();
			// logger.info("in dao for arraylist of products ===== ");

			while (rs.next()) {

				pro = new Product();
				pro.setId(rs.getLong(1));
				pro.setName(rs.getString(2));
				pro.setValid_from(rs.getDate(3));
				pro.setStatus(rs.getString(4));
				pro.setBusinessType(rs.getString(5));
				pro.setProductDescription(rs.getString(6));
				pro.setAccountType(rs.getString(7));

				proList.add(pro);

				// logger.info("in dao for arraylist of products ===== "+ pro.getName());
			}
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
			return proList;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

}