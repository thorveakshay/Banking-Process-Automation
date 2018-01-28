package com.training.services;

import java.sql.SQLException;

import com.training.dao.*;
import com.training.dao.NonPersonalPartyDaoImpl.*;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Contact;
import com.training.model.NonPersonalCustomer;
import com.training.model.PersonalParty;

public class ChangeCustomerContactService {

	/*
	 * public boolean changeContact(long npid,long newctnt) throws
	 * ClassNotFoundException, SQLException{ boolean flag=false; NonPersonalPartyDao
	 * cd= new NonPersonalPartyDaoImpl(); flag=cd.changeContactNumber(npid,newctnt);
	 * return flag; }
	 */

	public NonPersonalCustomer searchBusinessCustomer(long id) throws CommercialCustandAcctMaintenance {
		NonPersonalPartyDao cd = new NonPersonalPartyDaoImpl();
		NonPersonalCustomer npcx = cd.searchCustomer(id);
		return npcx;
	}

	public Contact showContactService(long npid, String contact_type) throws CommercialCustandAcctMaintenance {
		Contact c;
		NonPersonalPartyDao nad = new NonPersonalPartyDaoImpl();
		c = nad.showContactDao(npid, contact_type);
		return c;
	}

	public boolean updateContactService(Contact updatedContact, long id, long ticketId, String contactType)
			throws CommercialCustandAcctMaintenance {
		boolean flag = false;
		NonPersonalPartyDao nad = new NonPersonalPartyDaoImpl();
		flag = nad.updateContactDao(updatedContact, id, ticketId, contactType);
		return flag;

	}
}
