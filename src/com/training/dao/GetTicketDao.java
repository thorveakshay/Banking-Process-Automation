package com.training.dao;

import java.util.ArrayList;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Employee;
import com.training.model.NonPersonalCustomer;
import com.training.model.PersonalParty;
import com.training.model.Ticket;

public interface GetTicketDao {

	public Ticket getTicketDao(long id) throws CommercialCustandAcctMaintenance;

	public NonPersonalCustomer getNonPersonalCustomer(long id) throws CommercialCustandAcctMaintenance;

	public PersonalParty getPersonalParty(long id) throws CommercialCustandAcctMaintenance;

	public Boolean assignTicket(Long tikid, Long empid, Long loggedUserId) throws CommercialCustandAcctMaintenance;

	public ArrayList<Employee> getEmployeelist() throws CommercialCustandAcctMaintenance;

	public Boolean reassignTicket(long tikid, Long empid, Long loggedUserId, Long prevEmp)
			throws CommercialCustandAcctMaintenance;

}
