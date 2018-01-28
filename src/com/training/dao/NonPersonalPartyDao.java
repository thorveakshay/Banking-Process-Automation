package com.training.dao;

import java.sql.SQLException;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Address;
import com.training.model.Contact;
import com.training.model.NonPersonalCustomer;

public interface NonPersonalPartyDao {

	public Contact showContactDao(long id, String type) throws CommercialCustandAcctMaintenance;

	public boolean updateContactDao(Contact uc, long id, long ticketId, String contactType)
			throws CommercialCustandAcctMaintenance;

	public boolean updateAddress(Address a, long id) throws ClassNotFoundException, SQLException;

	public NonPersonalCustomer searchCustomer(long businessid) throws CommercialCustandAcctMaintenance;;

}
