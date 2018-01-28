/**
 * 
 */
package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.AccountView;
import com.training.model.BusinessCustomer;
import com.training.model.NonPersonalCustomer;
import com.training.utils.ConnectionUtil;

/**
 *  
 *
 */
public class ViewAccountDetailDaoImpl implements ViewAccountDetailDao {

	public AccountView getAccountDetail(long accno) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = null;
		Connection con = null;

		AccountView av = new AccountView();

		try {

			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select * from NON_PERSONAL_ACCOUNT where ACCOUNT_NUMBER=" + accno);

			ResultSet rs = ps.executeQuery();

			while (rs.next() != false) {
				av.setAccountId(rs.getLong(1));
				av.setBusinessCustomerId(rs.getLong(2));
				av.setAccountType(rs.getString(3));
				av.setAccountNumber(rs.getLong(4));
				av.setProductId(rs.getLong(5));
				av.setStatus(rs.getString(6));
				av.setAccountOpenDate(rs.getDate(7));
				av.setAccountTitle(rs.getString(8));
				av.setBranchId(rs.getString(10));
			}

		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} finally {
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
		}
		return av;
	}

	public BusinessCustomer getBusinessCustomer(long accNum) throws CommercialCustandAcctMaintenance {
		BusinessCustomer bcust = new BusinessCustomer();
		Connection con = null;
		PreparedStatement ps = null;
		try {

			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"select NPP.BUSINESS_NAME from NON_PERSONAL_ACCOUNT NPA JOIN NON_PERSONAL_PARTY NPP ON NPP.ID = NPA.NP_ID WHERE NPA.ACCOUNT_NUMBER = ?");

			ps.setLong(1, accNum);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bcust.setBusinessName(rs.getString(1));
			}
			ps.close();
			con.close();
			return bcust;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new CommercialCustandAcctMaintenance("Class is not available");

		} catch (SQLException e) {

			e.printStackTrace();
			throw new CommercialCustandAcctMaintenance("Database error");
		}

	}
}
