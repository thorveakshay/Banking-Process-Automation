package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.training.controllers.LoginServlet;
import com.training.model.BusinessCustomer;
import com.training.model.Ticket;
import com.training.utils.ConnectionUtil;

public class DisplayTicketDaoImpl implements DisplayTicketDao {
	private static Logger logger = Logger.getLogger(LoginServlet.class);
	ArrayList<Ticket> ticketList = new ArrayList<Ticket>();
	ArrayList<BusinessCustomer> bList = new ArrayList<BusinessCustomer>();

	public ArrayList<Ticket> getTickets(long id, String status) throws SQLException, ClassNotFoundException {
		logger.info("display servlet fun");
		Ticket ticket;
		PreparedStatement ps = null;
		Connection con = null;
		con = ConnectionUtil.getConnection();
		try {
			ps = con.prepareStatement("select * from HELPDESK_TICKET where STATUS=? order by ID ASC");
			ps.setString(1, status);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ticket = new Ticket();
				ticket.setId(rs.getLong(1));
				ticket.setTitle(rs.getString(2));
				ticket.setSummary(rs.getString(3));
				ticket.setRaisedOnDate(rs.getDate(4));
				ticket.setNpId(rs.getLong(5));
				ticket.setStatus(rs.getString(6));
				ticket.setResolvedDate(rs.getDate(7));
				ticket.setResolutionComments(rs.getString(8));
				ticket.setAdditionalDetails(rs.getString(9));
				ticket.setPriorityId(rs.getString(11));

				ticketList.add(ticket);
			}

		} catch (SQLException s) {
			s.printStackTrace();
		} finally {
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
		}
		return ticketList;
	}

	public ArrayList<BusinessCustomer> getBusinessCustomer(ArrayList<Ticket> tik)
			throws ClassNotFoundException, SQLException {
		BusinessCustomer bcust;
		for (Ticket t : tik) {

			PreparedStatement ps = null;
			Connection con = null;
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"select NPP.ID, NPP.BUSINESS_NAME from NON_PERSONAL_PARTY NPP WHERE NPP.ID=(select NP_ID from HELPDESK_TICKET HTT where HTT.ID=?)");
			ps.setLong(1, t.getId());
			ResultSet rs = ps.executeQuery();

			rs.next();
			bcust = new BusinessCustomer();
			bcust.setBusinessId(rs.getLong(1));
			bcust.setBusinessName(rs.getString(2));
			bList.add(bcust);

			ps.close();
			rs.close();
			con.close();
		}
		return bList;
	}

	/* change status of ticket to close */
	public boolean closeTicketDao(long tikId, String tikStatus) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = null;
		Connection con = null;
		con = ConnectionUtil.getConnection();
		ps = con.prepareStatement("UPDATE HELPDESK_TICKET SET STATUS='CLOSE' where ID=? AND STATUS=?");
		ps.setLong(1, tikId);
		ps.setString(2, tikStatus);
		int i = ps.executeUpdate();
		if (i > 0) {
			logger.info("Ticket status Closed successfully");
			return true;
		} else {
			return false;
		}

	} // function ends
}
