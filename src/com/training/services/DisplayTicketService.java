package com.training.services;

import java.sql.SQLException;
import java.util.ArrayList;

import com.training.dao.DisplayTicketDao;
import com.training.dao.DisplayTicketDaoImpl;
import com.training.model.BusinessCustomer;
import com.training.model.Ticket;

public class DisplayTicketService {
	DisplayTicketDao dDao;

	public ArrayList<Ticket> getTickets(long id, String status) throws SQLException, ClassNotFoundException {
		dDao = new DisplayTicketDaoImpl();
		return dDao.getTickets(id, status);
	}

	public ArrayList<BusinessCustomer> getBusinessCustomer(ArrayList<Ticket> tickets)
			throws ClassNotFoundException, SQLException {
		dDao = new DisplayTicketDaoImpl();
		return dDao.getBusinessCustomer(tickets);
	}

	public boolean closeTicket(long tikId, String tikStatus) throws SQLException, ClassNotFoundException {

		dDao = new DisplayTicketDaoImpl();
		boolean flag = dDao.closeTicketDao(tikId, tikStatus);
		return flag;
	}

}
