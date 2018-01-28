package com.training.services;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import com.training.controllers.LoginServlet;
import com.training.dao.PersonalPartyDao;
import com.training.dao.PersonalPartyDaoImpl;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Address;
import com.training.model.NonPersonalCustomer;
import com.training.model.PersonalParty;

public class PersonalPartyServices {
	PersonalPartyDaoImpl apd;
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	public PersonalParty searchPersonalParty(long acc_id) throws CommercialCustandAcctMaintenance {
		PersonalPartyDao apd = new PersonalPartyDaoImpl();
		PersonalParty ap = apd.searchParty(acc_id);
		return ap;

	}

	public boolean updatePersonalPartyRelationship(String rel, long id, long ticketId)
			throws CommercialCustandAcctMaintenance {
		boolean flag = false;
		PersonalPartyDao apd = new PersonalPartyDaoImpl();
		flag = apd.updatePartyRelationship(rel, id, ticketId);
		return flag;
	}

	public boolean updatePartyContactNumber(long pid, long contact, long ticketId, String contactType)
			throws CommercialCustandAcctMaintenance {
		boolean flag = false;
		PersonalPartyDao cd = new PersonalPartyDaoImpl();
		flag = cd.updatePartyNumber(pid, contact, ticketId, contactType);
		return flag;
	}

	public Address getPersonalPartyAddressService(Long id) throws CommercialCustandAcctMaintenance {
		PersonalPartyDao cd = new PersonalPartyDaoImpl();
		Address address = cd.getPpAddresss(id);
		return address;
	}

	public boolean updateAddressService(Address updatedAddress, long id, long ticketId)
			throws CommercialCustandAcctMaintenance {
		boolean flag = false;
		PersonalPartyDao cd = new PersonalPartyDaoImpl();
		logger.info("updated address===== in service " + updatedAddress.getCountry());
		flag = cd.updatePartyAddress(updatedAddress, id, ticketId);
		return flag;
	}

	public NonPersonalCustomer searchNonPersonalParty(Long ppId) throws CommercialCustandAcctMaintenance {
		PersonalPartyDao pdao = new PersonalPartyDaoImpl();
		NonPersonalCustomer npc = new NonPersonalCustomer();
		npc = pdao.getNonPersonalParty(ppId);
		return npc;
	}

}
