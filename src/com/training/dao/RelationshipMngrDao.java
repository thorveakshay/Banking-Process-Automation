package com.training.dao;

import java.sql.SQLException;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Address;
import com.training.model.Contact;
import com.training.model.NonPersonalCustomer;

public interface RelationshipMngrDao {
	public Address getAddressDao(long accountNumber, String addType) throws CommercialCustandAcctMaintenance;

	public NonPersonalCustomer getNonPersonalCustomerDao(long id) throws CommercialCustandAcctMaintenance;

	public boolean updateAddressDao(Address updatedAddress, long npId, String addressType)
			throws CommercialCustandAcctMaintenance;

	public Contact getContactDao(long id, String contactType) throws CommercialCustandAcctMaintenance;

	public boolean updateContactDao(Contact updatedContact, long npId, String contactType)
			throws CommercialCustandAcctMaintenance;
}
