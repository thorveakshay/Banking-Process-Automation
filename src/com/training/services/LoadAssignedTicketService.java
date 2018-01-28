package com.training.services;

import java.sql.SQLException;
import java.util.ArrayList;

import com.training.dao.UnresolvedTicketsDao;
import com.training.dao.UnresolvedTicketsDaoImpl;
import com.training.model.Ticket;

public class LoadAssignedTicketService {

	public ArrayList<Ticket> getUnassignedTickets() throws SQLException, ClassNotFoundException {
		UnresolvedTicketsDao urtDao = new UnresolvedTicketsDaoImpl();
		return urtDao.getUnassignedTickets();

	}

	public ArrayList<Ticket> getUnresolvedTickets(Long uid) throws SQLException, ClassNotFoundException {
		UnresolvedTicketsDao urtDao = new UnresolvedTicketsDaoImpl();
		return urtDao.getUnresolvedTickets(uid);

	}

	public ArrayList<Ticket> getUnresolvedCATTickets(Long uid) throws SQLException, ClassNotFoundException {
		UnresolvedTicketsDao urtDao = new UnresolvedTicketsDaoImpl();
		return urtDao.getUnresolvedCATTickets(uid);

	}

	public ArrayList<Ticket> getTicketsAssignedByAdmin(Long uid) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub

		UnresolvedTicketsDao urtDao = new UnresolvedTicketsDaoImpl();
		return urtDao.getTicketsAssignedByAdmin(uid);

	}
}
