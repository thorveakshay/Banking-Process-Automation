package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.training.controllers.LoginServlet;
import com.training.model.*;
import com.training.utils.ConnectionUtil;

public class UnresolvedTicketsDaoImpl implements UnresolvedTicketsDao {
	private static Logger logger = Logger.getLogger(LoginServlet.class);
	ArrayList<Ticket> ticketList = new ArrayList<Ticket>();

	public ArrayList<Ticket> getUnresolvedCATTickets(Long uid) throws SQLException, ClassNotFoundException {

		Ticket ticket;
		PreparedStatement ps = null;
		Connection con = null;
		con = ConnectionUtil.getConnection();
		try {
			ps = con.prepareStatement(
					"select HT.ID,HT.TITLE,HT.SUMMARY,HT.RAISED_ON_DATE,HT.NP_ID,HT.STATUS,HT.RESOLVED_DATE,HT.RESOLUTION_COMMENTS, HT.PRIORITY from HELPDESK_TICKET HT join TICKET_ASSIGNMENT TA on HT.ID=TA.TICKET_ID and HT.STATUS='ASSIGNED' and HT.TITLE='Change Account Title' and TA.ASSIGN_TO=? ");
			ps.setLong(1, uid);

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
				ticket.setPriorityId(rs.getString(9));
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

	public ArrayList<Ticket> getUnassignedTickets() throws SQLException, ClassNotFoundException {

		Ticket ticket;
		PreparedStatement ps = null;
		Connection con = null;
		con = ConnectionUtil.getConnection();
		try {
			ps = con.prepareStatement("select * from HELPDESK_TICKET where STATUS = 'UNASSIGNED'  order by ID");

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

	public ArrayList<Ticket> getUnresolvedTickets(Long uid) throws SQLException, ClassNotFoundException {

		Ticket ticket;
		PreparedStatement ps = null;
		Connection con = null;
		con = ConnectionUtil.getConnection();
		//
		// String query="select t.ID,t.TITLE from HELPDESK_TICKET t join
		// TICKET_ASSIGNMENT ta on t.ID=ta.TICKET_ID and EMPLOYEE_ID=100283;

		//
		String query = "";

		query = "select t.ID,t.TITLE,t.SUMMARY,t.RAISED_ON_DATE,t.NP_ID,t.STATUS,t.RESOLVED_DATE,t.RESOLUTION_COMMENTS,t.ADDITIONAL_DETAILS, t.PRIORITY from HELPDESK_TICKET t join TICKET_ASSIGNMENT ta on t.ID=ta.TICKET_ID  and t.status='ASSIGNED' and ta.ASSIGN_TO = ?";

		// logger.info("Query is : "+query);
		try {
			ps = con.prepareStatement(query);

			ps.setLong(1, uid);
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
				ticket.setPriorityId(rs.getString(10));

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

	public ArrayList<Ticket> getTicketsAssignedByAdmin(Long uid) throws ClassNotFoundException, SQLException {

		Ticket ticket;
		PreparedStatement ps = null;
		Connection con = null;
		con = ConnectionUtil.getConnection();
		//
		// String query="select t.ID,t.TITLE from HELPDESK_TICKET t join
		// TICKET_ASSIGNMENT ta on t.ID=ta.TICKET_ID and EMPLOYEE_ID=100283;

		//
		logger.info("i am at the begining and admin id is : " + uid);
		String query = "";
		query = "select t.ID,t.TITLE,t.SUMMARY,t.RAISED_ON_DATE,t.NP_ID,t.STATUS,t.RESOLVED_DATE,t.RESOLUTION_COMMENTS,t.ADDITIONAL_DETAILS, t.PRIORITY,ta.ASSIGN_TO,E.FIRST_NAME,E.LAST_NAME from HELPDESK_TICKET t join TICKET_ASSIGNMENT ta on t.ID=ta.TICKET_ID and t.status='ASSIGNED' and ta.ASSIGN_BY =? join EMPLOYEE E on ta.ASSIGN_TO=E.ID";

		// query="select
		// t.ID,t.TITLE,t.SUMMARY,t.RAISED_ON_DATE,t.NP_ID,t.STATUS,t.RESOLVED_DATE,t.RESOLUTION_COMMENTS,t.ADDITIONAL_DETAILS,
		// t.PRIORITY,ta.ASSIGN_TO from HELPDESK_TICKET t join TICKET_ASSIGNMENT ta on
		// t.ID=ta.TICKET_ID and t.status='ASSIGNED' and ta.ASSIGN_BY = ?";

		// logger.info("Query is : "+query);
		try {
			ps = con.prepareStatement(query);

			ps.setLong(1, uid);
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
				ticket.setPriorityId(rs.getString(10));

				ticket.setAssigned_to(rs.getLong(11));
				ticket.setAssignedToName(rs.getString(12) + " " + rs.getString(13));
				logger.info("assigned to employee name is " + ticket.getAssignedToName());
				ticketList.add(ticket);
			}

		} catch (SQLException s) {
			s.printStackTrace();
		} finally {
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
		}
		logger.info("i am at the end");

		return ticketList;
	}
}
