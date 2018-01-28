package com.training.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Account;
import com.training.model.Ticket;
import com.training.utils.ConnectionUtil;

public class TicketDaoImpl implements TicketDao {

	Ticket t;

	public Long createTicket(Ticket t) throws CommercialCustandAcctMaintenance {

		Long tikid = null;

		// logger.info("insert fun");
		PreparedStatement ps = null;
		Connection con = null;
		Boolean flag = false;
		try {

			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select max(ID) from  HELPDESK_TICKET");
			ResultSet rs = ps.executeQuery();
			rs.next();
			tikid = rs.getLong(1);
			rs.close();
			ps.close();
			con.close();
			tikid = tikid + 1;

			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"insert into HELPDESK_TICKET(ID,TITLE,SUMMARY,RAISED_ON_DATE,NP_ID,STATUS,P_ID, PRIORITY, RAISED_BY) VALUES(?,?,?,sysdate,?,?,?,?,?)");
			Date d = new Date(0);
			ps.setLong(1, tikid);

			ps.setString(2, t.getTitle());
			ps.setString(3, t.getSummary());
			ps.setLong(4, t.getNpId());
			ps.setString(5, "UNASSIGNED");
			ps.setLong(6, t.getPid());
			ps.setString(7, t.getPriorityId());
			ps.setLong(8, t.getRaised_by());
			int i = ps.executeUpdate();
			ps.close();
			con.close();

			if (i > 0) {

				return tikid;

			} else
				flag = false;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}
		return tikid;
	}

	public Ticket getTicket(long accId, long busid) throws CommercialCustandAcctMaintenance {

		PreparedStatement ps = null;
		Connection con = null;
		Boolean flag = false;
		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement("select * from HELPDESK_TICKET where P_ID=? and NP_ID=?");
			ps.setLong(1, accId);
			ps.setLong(2, busid);
			ResultSet rs = ps.executeQuery();

			Ticket t = new Ticket();
			while (rs.next()) {
				t.setId(rs.getLong(1));
				t.setTitle(rs.getString(2));
				t.setSummary(rs.getString(3));
				t.setRaisedOnDate(rs.getDate(4));
				t.setNpId(rs.getLong(5));
				t.setStatus(rs.getString(6));
				t.setPriorityId(rs.getString(11));
			}

			return t;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	public boolean updateTicket(long tktid, String status) throws CommercialCustandAcctMaintenance {
		PreparedStatement ps = null;
		Connection con = null;
		Boolean var = false;

		try {
			con = ConnectionUtil.getConnection();
			String updateStatement = "update  HELPDESK_TICKET set STATUS=? where ID=?";
			// logger.info(t.getStatus()+"*"+t.getId());
			ps = con.prepareStatement(updateStatement);
			ps.setString(1, status);
			ps.setLong(2, tktid);
			ps.executeUpdate();
			var = true;
			con.close();
			ps.close();
			return var;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}
}
