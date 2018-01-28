package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Address;
import com.training.model.Contact;
import com.training.model.NonPersonalCustomer;
import com.training.utils.ConnectionUtil;

public class NonPersonalPartyDaoImpl implements NonPersonalPartyDao {

	public NonPersonalPartyDaoImpl() {

	}

	public boolean updateAddress(Address a, long id) throws ClassNotFoundException, SQLException {

		Connection con = null;
		PreparedStatement ps = null;
		con = ConnectionUtil.getConnection();
		ps = con.prepareStatement(
				"update NP_ADDRESS set BUILDING_NO = ?,BUILDING_NAME = ?, STREET_NAME = ?,CITY_NAME = ?, TOWN_NAME = ?, COUNTRY = ?, POSTAL_CODE = ? WHERE ADDRESS_TYPE = ? AND NP_PARTY_ID = ?");

		ps.setString(1, a.getBuildingNumber());
		ps.setString(2, a.getBuildingName());
		ps.setString(3, a.getStreetName());
		ps.setString(4, a.getCityName());
		ps.setString(5, a.getTownName());
		ps.setString(6, a.getCountry());
		ps.setString(7, a.getPostalCode());
		ps.setString(8, a.getAddressType());
		ps.setLong(9, id);

		int i = ps.executeUpdate();

		if (i > 0)
			return true;
		else
			return false;

	}

	/*
	 * public boolean changeContactNumber(long id, long contactno) throws
	 * ClassNotFoundException, SQLException {
	 * 
	 * Connection con = null; PreparedStatement ps = null; boolean flag = false; con
	 * = DatabaseUtil.getConnection();
	 * 
	 * ps = con
	 * .prepareStatement("UPDATE CONTACTS SET CONTACT_NUMBER=? WHERE NPP_ID=?");
	 * ps.setLong(1, contactno); ps.setLong(2, id); int i = ps.executeUpdate(); if
	 * (i > 0) { flag = true; return flag; } return flag; }
	 */

	public NonPersonalCustomer searchCustomer(long businessid) throws CommercialCustandAcctMaintenance {
		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		NonPersonalCustomer npc = new NonPersonalCustomer();
		try {
			con = ConnectionUtil.getConnection();
			// selecting the details of particular customer
			ps = con.prepareStatement("SELECT * FROM NON_PERSONAL_PARTY WHERE ID=?");
			ps.setLong(1, businessid);
			/*
			 * logger.info("In Contact Dao"); logger.info(businessid);
			 */

			ResultSet rs = ps.executeQuery();
			rs.next();
			npc.setBusinessName(rs.getString(2));
			npc.setTradingName(rs.getString(3));
			npc.setCountryOfRegistration(rs.getString(16));
			npc.setBusinessEmailAddress(rs.getString(17));
			rs.close();

			con.close();
			return npc;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available.");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated.");
		}

	}

	public boolean updateContactDao(Contact uc, long id, long ticketId, String contactType)
			throws CommercialCustandAcctMaintenance {

		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = ConnectionUtil.getConnection();
			// logger.info("contact type=="+contactType);
			ps = con.prepareStatement(
					"update NP_CONTACTS set COUNTRY_CODE = ?,AREA_CODE = ?,CONTACT_NUMBER = ? WHERE CONTACT_TYPE = ? AND NP_ID = ?");

			ps.setInt(1, uc.getCountryCode());
			ps.setInt(2, uc.getAreaCode());
			ps.setLong(3, uc.getContactNumber());
			ps.setString(4, contactType);
			ps.setLong(5, id);

			int i = ps.executeUpdate();
			// logger.info("vlue of ticketId on dao ==="+ticketId);

			PreparedStatement ps2 = null;
			ps2 = con.prepareStatement(
					"UPDATE HELPDESK_TICKET SET STATUS = 'RESOLVED', RESOLVED_DATE = sysdate, RESOLUTION_COMMENTS = 'NON PERSONAL PARTY CONTACT UPDATED' WHERE ID = ?");

			ps2.setLong(1, ticketId);
			int j = ps2.executeUpdate();
			// logger.info("value of i "+i);
			// logger.info("value of j "+j);
			if (i > 0 && j > 0)
				return true;
			else
				return false;

		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	public Contact showContactDao(long id, String type) throws CommercialCustandAcctMaintenance {

		Connection con_contact = null;
		PreparedStatement ps_contact = null;
		Contact c = new Contact();
		try {
			con_contact = ConnectionUtil.getConnection();
			ps_contact = con_contact.prepareStatement("SELECT * FROM NP_CONTACTS WHERE CONTACT_TYPE=? AND NP_ID=?");
			ps_contact.setString(1, type);
			ps_contact.setLong(2, id);
			ResultSet rs_contact = ps_contact.executeQuery();

			// logger.info("In Contact Dao");
			// logger.info("ID IS " + id + " type is " + type);
			while (rs_contact.next()) {
				c.setCountryCode(rs_contact.getInt(2));
				// logger.info("hello "+rs_contact.getString(2));
				c.setAreaCode(Integer.parseInt(rs_contact.getString(3)));
				c.setContactNumber(Long.parseLong(rs_contact.getString(4)));
				c.setContactType(rs_contact.getString(5));
			}
			return c;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

}
