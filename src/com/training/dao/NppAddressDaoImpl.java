
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

public class NppAddressDaoImpl implements NppAddressDao {

	public Contact showContactDao(long id, String type) throws ClassNotFoundException, SQLException {

		Connection con_contact = null;
		PreparedStatement ps_contact = null;
		Contact c = new Contact();
		con_contact = ConnectionUtil.getConnection();
		ps_contact = con_contact.prepareStatement("SELECT * FROM NP_CONTACTS WHERE CONTACT_TYPE=? AND NP_ID=?");
		ps_contact.setString(1, type);
		ps_contact.setLong(2, id);
		ResultSet rs_contact = ps_contact.executeQuery();

		rs_contact.next();

		c.setCountryCode(rs_contact.getInt(2));
		// logger.info("jfhl" + c.getCountryCode());

		c.setAreaCode(Integer.parseInt(rs_contact.getString(3)));
		c.setContactNumber(Integer.parseInt(rs_contact.getString(4)));
		c.setContactType(rs_contact.getString(5));

		return c;

	}

	public NonPersonalCustomer searchCustomer(long businessid) throws CommercialCustandAcctMaintenance {
		Connection con = null;
		PreparedStatement ps = null;
		NonPersonalCustomer npc = new NonPersonalCustomer();
		try {
			con = ConnectionUtil.getConnection();
			// selecting the details of particular customer
			ps = con.prepareStatement("SELECT * FROM NON_PERSONAL_PARTY WHERE ID=?");
			ps.setLong(1, businessid);

			ResultSet rs = ps.executeQuery();
			rs.next();
			npc.setBusinessName(rs.getString(2));
			npc.setTradingName(rs.getString(3));
			npc.setCountryOfRegistration(rs.getString(16));
			npc.setBusinessEmailAddress(rs.getString(17));
			/*
			 * List<Address> address_list=npc.getAl(); Address update_add; for(Address
			 * a:address_list){ type = a.getAddressType();
			 * if(type.equalsIgnoreCase("Permanent")){ Connection con_address = null;
			 * PreparedStatement ps_address = null;
			 * con_address=ConnectionUtil.getConnection(); ps_address=con_address.
			 * prepareStatement("SELECT * FROM NP_ADDRESS WHERE ADDRESS_TYPE=?");
			 * ps_address.setString(1,type); ResultSet rs_address=ps_address.executeQuery();
			 * while(rs_address.next()){ a.setBuildingNumber(rs.getInt(2));
			 * a.setBuildingName(rs.getString(3)); a.setStreetName(rs.getString(4));
			 * a.setCityName(rs.getString(5)); a.setTownName(rs.getString(6));
			 * a.setCountry(rs.getString(7)); a.setPostalCode(rs.getString(8)); return a; }
			 * 
			 * }
			 * 
			 * }
			 */
			rs.close();
			con.close();
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Query Exception has generated");
		}

		return npc;
	}

	public Address showAddressDao(long id, String type) throws CommercialCustandAcctMaintenance {

		Connection con_address = null;
		PreparedStatement ps_address = null;
		Address a = new Address();
		try {
			con_address = ConnectionUtil.getConnection();
			ps_address = con_address
					.prepareStatement("SELECT * FROM NP_ADDRESS WHERE ADDRESS_TYPE=? AND NP_PARTY_ID=?");
			ps_address.setString(1, type);
			ps_address.setLong(2, id);
			ResultSet rs_address = ps_address.executeQuery();

			while (rs_address.next()) {

				a.setBuildingNumber(rs_address.getString(2));
				a.setBuildingName(rs_address.getString(3));
				a.setStreetName(rs_address.getString(4));
				a.setCityName(rs_address.getString(5));
				a.setTownName(rs_address.getString(6));
				a.setCountry(rs_address.getString(7));
				a.setPostalCode(rs_address.getString(8));
			}
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Query Exception has generated");
		}
		return a;

	}

	public boolean updateAddress(Address a, long id, long ticketId) throws CommercialCustandAcctMaintenance {

		Connection con = null;
		PreparedStatement ps = null;
		try {
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
			// logger.info("country in dao "+a.getCountry());

			int i = ps.executeUpdate();

			// logger.info("vlue of ticketId on dao ==="+ticketId);

			PreparedStatement ps2 = null;
			ps2 = con.prepareStatement(
					"UPDATE HELPDESK_TICKET SET STATUS = 'RESOLVED', RESOLVED_DATE = sysdate, RESOLUTION_COMMENTS = 'NON PERSONAL PARTY ADDRESS UPDATED' WHERE ID = ?");

			ps2.setLong(1, ticketId);
			int j = ps2.executeUpdate();
			if (i > 0 && j > 0)
				return true;
			else
				return false;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Query Exception has generated");
		}

	}

}
