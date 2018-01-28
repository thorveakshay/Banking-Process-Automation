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

public class RelationshipMngrDaoImpl implements RelationshipMngrDao {

	/* SEARCH ADDRESS OF THE CUSTOMER */
	public Address getAddressDao(long accountNumber, String addType) throws CommercialCustandAcctMaintenance {

		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;

		Address add = new Address();
		try {
			con = ConnectionUtil.getConnection();
			// selecting the details of particular business customer
			ps = con.prepareStatement("SELECT NP_ID FROM NON_PERSONAL_ACCOUNT WHERE ACCOUNT_NUMBER=?");
			ps.setLong(1, accountNumber);
			ResultSet rs = ps.executeQuery();
			rs.next();
			long npId = rs.getLong(1);
			// logger.info("in dao "+npId);
			ps2 = con.prepareStatement(
					"SELECT * FROM  NP_ADDRESS NPA join NON_PERSONAL_PARTY NPP  on NPP.ID=NPA.NP_PARTY_ID WHERE NPP.ID=? AND  NPA.ADDRESS_TYPE=?");
			ps2.setLong(1, npId);
			ps2.setString(2, addType);
			ResultSet rs2 = ps2.executeQuery();
			rs2.next();
			add.setBuildingNumber(rs2.getString(2));
			add.setBuildingName(rs2.getString(3));
			add.setStreetName(rs2.getString(4));
			add.setCityName(rs2.getString(5));
			add.setTownName(rs2.getString(6));
			add.setCountry(rs2.getString(7));
			add.setPostalCode(rs2.getString(8));
			return add;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	/* SEARCH CUSTOMER */
	public NonPersonalCustomer getNonPersonalCustomerDao(long id) throws CommercialCustandAcctMaintenance {
		NonPersonalCustomer npc = new NonPersonalCustomer();

		Connection con = null;
		PreparedStatement ps = null;
		try {

			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"select * from NON_PERSONAL_PARTY NPP JOIN NON_PERSONAL_ACCOUNT NPA ON NPA.NP_ID = NPP.ID AND NPA.ACCOUNT_NUMBER = ?");
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				npc.setBusinessId(rs.getLong(1));
				npc.setBusinessName(rs.getString(2));
				npc.setTradingName(rs.getString(3));
				npc.setBusinessType(rs.getString(4));
				npc.setBankBranch(rs.getString(34));

			}

			ps.close();
			con.close();
			return npc;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	/* UPDATE ADDRESS OF THE CUSTOMER */
	public boolean updateAddressDao(Address updatedAddress, long npId, String addressType)
			throws CommercialCustandAcctMaintenance {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"update NP_ADDRESS set BUILDING_NO = ?,BUILDING_NAME = ?, STREET_NAME = ?,TOWN_NAME = ?,POSTAL_CODE = ?,CITY_NAME=?, COUNTRY=? WHERE NP_PARTY_ID = ? AND ADDRESS_TYPE=?");
			ps.setString(1, updatedAddress.getBuildingNumber());
			ps.setString(2, updatedAddress.getBuildingName());
			ps.setString(3, updatedAddress.getStreetName());
			ps.setString(4, updatedAddress.getTownName());
			ps.setString(5, updatedAddress.getPostalCode());
			ps.setString(6, updatedAddress.getCityName());
			ps.setString(7, updatedAddress.getCountry());
			ps.setLong(8, npId);
			ps.setString(9, addressType);

			int i = ps.executeUpdate();
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
			if (i > 0) {

				return true;
			} else {
				return false;
			}
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	/* SEARCH CONTACT NUMBER OF THE CUSTOMER */

	public Contact getContactDao(long id, String contactType) throws CommercialCustandAcctMaintenance {
		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;

		Contact contact = new Contact();
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("SELECT * FROM  NP_CONTACTS WHERE NP_ID=? AND CONTACT_TYPE=?");
			ps.setLong(1, id);
			ps.setString(2, contactType);
			ResultSet rs = ps.executeQuery();
			rs.next();
			// logger.info("hello in Dao "+rs.getString(1));
			contact.setCountryCode(rs.getInt(2));
			contact.setAreaCode(Integer.parseInt(rs.getString(3)));
			contact.setContactNumber(Long.parseLong(rs.getString(4)));
			return contact;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	public boolean updateContactDao(Contact updatedContact, long npId, String contactType)
			throws CommercialCustandAcctMaintenance {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"update NP_CONTACTS set COUNTRY_CODE=?,AREA_CODE=?,CONTACT_NUMBER=? WHERE NP_ID=? AND CONTACT_TYPE=?");
			ps.setInt(1, updatedContact.getCountryCode());
			ps.setString(2, Long.toString(updatedContact.getAreaCode()));
			ps.setString(3, Long.toString(updatedContact.getContactNumber()));
			ps.setLong(4, npId);
			ps.setString(5, contactType);
			int i = ps.executeUpdate();
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
			if (i > 0) {
				// logger.info("In Dao ");
				return true;
			} else {
				return false;
			}
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}
	}
}
