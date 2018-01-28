package com.training.services;

import java.sql.SQLException;

import javax.swing.text.StyledEditorKit.BoldAction;

import com.training.dao.RelationshipMngrDao;
import com.training.dao.RelationshipMngrDaoImpl;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Address;
import com.training.model.Contact;
import com.training.model.NonPersonalCustomer;

public class RelationshipMngrService {

	public Address getAddressService(long accountNumber, String addType) throws CommercialCustandAcctMaintenance {
		RelationshipMngrDao rmd = new RelationshipMngrDaoImpl();
		Address address;
		address = rmd.getAddressDao(accountNumber, addType);
		return address;
	}

	public NonPersonalCustomer getNonPersonalCustomerService(long accountNumber)
			throws CommercialCustandAcctMaintenance {
		RelationshipMngrDao rmd = new RelationshipMngrDaoImpl();
		NonPersonalCustomer npc;
		npc = rmd.getNonPersonalCustomerDao(accountNumber);
		return npc;
	}

	public boolean updateAddressService(Address updatedAddress, long npId, String addressType)
			throws CommercialCustandAcctMaintenance {
		RelationshipMngrDao rmd = new RelationshipMngrDaoImpl();
		boolean flag = false;
		flag = rmd.updateAddressDao(updatedAddress, npId, addressType);
		return flag;
	}

	public Contact getContactService(long id, String contactType) throws CommercialCustandAcctMaintenance {
		RelationshipMngrDao rmd = new RelationshipMngrDaoImpl();
		Contact contact;
		contact = rmd.getContactDao(id, contactType);
		return contact;
	}

	public boolean updateContactService(Contact updatedContact, long npId, String contactType)
			throws CommercialCustandAcctMaintenance {
		RelationshipMngrDao rmd = new RelationshipMngrDaoImpl();
		boolean flag = false;
		flag = rmd.updateContactDao(updatedContact, npId, contactType);
		return flag;
	}
}
