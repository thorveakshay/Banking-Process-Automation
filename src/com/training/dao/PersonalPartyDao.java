package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Account;
import com.training.model.Address;
import com.training.model.NonPersonalCustomer;
import com.training.model.PersonalParty;
import com.training.utils.ConnectionUtil;

public interface PersonalPartyDao {

	public PersonalParty searchParty(long accId) throws CommercialCustandAcctMaintenance;

	public boolean updatePartyRelationship(String rel, long id, long ticketId) throws CommercialCustandAcctMaintenance;

	public boolean updatePartyNumber(long pid, long contact, long ticketId, String contactType)
			throws CommercialCustandAcctMaintenance;

	public Address getPpAddresss(long id) throws CommercialCustandAcctMaintenance;

	public boolean updatePartyAddress(Address updatedAddress, long id, long ticketId)
			throws CommercialCustandAcctMaintenance;

	public NonPersonalCustomer getNonPersonalParty(Long ppId) throws CommercialCustandAcctMaintenance;

}
