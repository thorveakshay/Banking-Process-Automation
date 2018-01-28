/**
 * 
 */
package com.training.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.training.model.BusinessCustomer;
import com.training.model.Ticket;

/**
 *  
 *
 */
public interface DisplayTicketDao {
	ArrayList<Ticket> ticketList = new ArrayList<Ticket>();

	public ArrayList<Ticket> getTickets(long id, String status) throws SQLException, ClassNotFoundException;

	public ArrayList<BusinessCustomer> getBusinessCustomer(ArrayList<Ticket> tik)
			throws ClassNotFoundException, SQLException;

	public boolean closeTicketDao(long tikId, String tikStatus) throws SQLException, ClassNotFoundException;;
}
