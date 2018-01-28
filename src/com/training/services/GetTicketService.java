package com.training.services;

import java.sql.SQLException;
import java.util.ArrayList;

import com.training.dao.GetTicketDao;
import com.training.dao.GetTicketDaoImpl;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Employee;
import com.training.model.NonPersonalCustomer;
import com.training.model.PersonalParty;
import com.training.model.Ticket;

public class GetTicketService {

	public Boolean assignTicket(Long tikid, Long empid, Long loggedUserId) throws CommercialCustandAcctMaintenance {

		GetTicketDao gtd = new GetTicketDaoImpl();

		return gtd.assignTicket(tikid, empid, loggedUserId);

	}

	public Ticket getTicketService(long id) throws CommercialCustandAcctMaintenance

	{
		Ticket tik;
		GetTicketDao gtd = new GetTicketDaoImpl();
		tik = gtd.getTicketDao(id);

		return tik;
	}

	public PersonalParty getPersonalPartyService(long id) throws CommercialCustandAcctMaintenance {
		GetTicketDao gtd = new GetTicketDaoImpl();
		PersonalParty pp = gtd.getPersonalParty(id);
		return pp;

	}

	public NonPersonalCustomer getNonPersonalCustomerService(long id) throws CommercialCustandAcctMaintenance {
		GetTicketDao gtd = new GetTicketDaoImpl();

		NonPersonalCustomer npc = gtd.getNonPersonalCustomer(id);

		return npc;
	}

	public ArrayList<Employee> getEmployeelist() throws CommercialCustandAcctMaintenance {
		GetTicketDao gtd = new GetTicketDaoImpl();
		return gtd.getEmployeelist();

	}

	public Boolean reassignTicket(long tikid, Long empid, Long loggedUserId, Long prevEmp)
			throws CommercialCustandAcctMaintenance {
		GetTicketDao gtd = new GetTicketDaoImpl();

		return gtd.reassignTicket(tikid, empid, loggedUserId, prevEmp);
	}

}
