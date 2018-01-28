package com.training.services;

import java.sql.SQLException;

import com.training.dao.NonPersonalPartyDao;
import com.training.dao.NppAddressDao;
import com.training.dao.NppAddressDaoImpl;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Address;
import com.training.model.NonPersonalCustomer;

public class ChangeCustomerAddressService {

	public NonPersonalCustomer searchBusinessCustomer(long businessid) throws CommercialCustandAcctMaintenance {

		NonPersonalCustomer npc;
		NppAddressDao npdao = new NppAddressDaoImpl();
		npc = npdao.searchCustomer(businessid);
		return npc;
	}

	public Address showAddressService(long npid, String address_type) throws CommercialCustandAcctMaintenance {

		Address a;
		NppAddressDao nad = new NppAddressDaoImpl();
		a = nad.showAddressDao(npid, address_type);
		return a;
	}

	public boolean updateAddressService(Address add, long id, long ticketId) throws CommercialCustandAcctMaintenance {
		boolean flag = false;
		NppAddressDao nad = new NppAddressDaoImpl();
		flag = nad.updateAddress(add, id, ticketId);
		return flag;
	}
}
