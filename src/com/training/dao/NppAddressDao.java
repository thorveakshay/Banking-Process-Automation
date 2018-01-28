
package com.training.dao;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Address;
import com.training.model.NonPersonalCustomer;

public interface NppAddressDao {

	public NonPersonalCustomer searchCustomer(long businessid) throws CommercialCustandAcctMaintenance;

	public Address showAddressDao(long id, String type) throws CommercialCustandAcctMaintenance;

	public boolean updateAddress(Address a, long id, long ticketId) throws CommercialCustandAcctMaintenance;

}