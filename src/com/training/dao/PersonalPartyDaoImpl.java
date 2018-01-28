package com.training.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import com.training.controllers.LoginServlet;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Account;
import com.training.model.Address;
import com.training.model.NonPersonalCustomer;
import com.training.model.PersonalParty;
import com.training.utils.ConnectionUtil;

public class PersonalPartyDaoImpl implements PersonalPartyDao {
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	// Search Personal Party
	public PersonalParty searchParty(long accId) throws CommercialCustandAcctMaintenance {

		Connection con = null;
		PreparedStatement ps = null;
		PersonalParty pc = new PersonalParty();
		try {
			con = ConnectionUtil.getConnection();
			// selecting the details of particular customer
			ps = con.prepareStatement("SELECT * FROM PERSONAL_PARTY WHERE ID=?");
			ps.setLong(1, accId);
			logger.info("party id is  " + accId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				pc.setPartyId(accId);
				pc.setRelationshipType(rs.getString(7));
				pc.setFirstName(rs.getString(4));
				pc.setSurName(rs.getString(6));
				pc.setEmailId(rs.getString(12));
			}

			rs.close();
			con.close();
			return pc;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Query Exception has generated");
		}

	}

	public boolean updatePartyRelationship(String rel, long id, long ticketId) throws CommercialCustandAcctMaintenance {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement ps = null;
		boolean flag = false;
		try {
			con = ConnectionUtil.getConnection();
			// selecting the details of particular customer
			ps = con.prepareStatement("UPDATE PERSONAL_PARTY SET RELATIONSHIP_TYPE=? WHERE ID=?");
			ps.setString(1, rel);
			ps.setLong(2, id);
			int i = ps.executeUpdate();

			// logger.info("vlue of ticketId on dao ==="+ticketId);

			PreparedStatement ps2 = null;
			ps2 = con.prepareStatement(
					"UPDATE HELPDESK_TICKET SET STATUS = 'RESOLVED', RESOLVED_DATE = sysdate, RESOLUTION_COMMENTS = 'PERSONAL PARTY RELATIONSHIP UPDATED' WHERE ID = ?");

			ps2.setLong(1, ticketId);
			int j = ps2.executeUpdate();
			con.close();
			if (i > 0 && j > 0) {
				return flag = true;
			}

			return flag;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}
	}

	public boolean updatePartyNumber(long pid, long contact, long ticketId, String contactType)
			throws CommercialCustandAcctMaintenance {
		Connection con = null;
		PreparedStatement ps = null;
		boolean flag = false;
		logger.info("party id in da" + pid);
		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement("UPDATE PARTY_CONTACTS SET CONTACT_NUMBER=? WHERE PARTY_ID=? AND CONTACT_TYPE=?");
			ps.setLong(1, contact);
			ps.setLong(2, pid);
			ps.setString(3, contactType);
			int i = ps.executeUpdate();
			// logger.info("contact type--- "+contactType);
			// logger.info("vlue of ticketId on dao ==="+ticketId);

			PreparedStatement ps2 = null;
			ps2 = con.prepareStatement(
					"UPDATE HELPDESK_TICKET SET STATUS = 'RESOLVED', RESOLVED_DATE = sysdate, RESOLUTION_COMMENTS = 'PERSONAL PARTY CONTACT UPDATED' WHERE ID = ?");

			ps2.setLong(1, ticketId);
			int j = ps2.executeUpdate();
			con.close();
			if (i > 0 && j > 0) {
				flag = true;
				return flag;
			}

			return flag;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	public Address getPpAddresss(long id) throws CommercialCustandAcctMaintenance {
		Connection con = null;
		PreparedStatement ps = null;
		boolean flag = false;
		Address add = new Address();
		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement("SELECT * FROM PARTY_ADDRESS WHERE PARTY_ID = ?");

			ps.setLong(1, id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				add.setHouseNumber(rs.getString(2));
				add.setHouseName(rs.getString(3));
				add.setBuildingNumber(rs.getString(4));
				add.setStreetName(rs.getString(5));
				add.setCityName(rs.getString(6));
				add.setTownName(rs.getString(7));
				add.setCountry(rs.getString(8));
				add.setPostalCode(rs.getString(9));
				add.setAddressType(rs.getString(10));
			}

			rs.close();
			con.close();
			return add;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Query Exception has generated");
		}

	}

	public boolean updatePartyAddress(Address updatedAddress, long id, long ticketId)
			throws CommercialCustandAcctMaintenance {
		Connection con = null;
		PreparedStatement ps = null;
		boolean flag = false;
		Address add = new Address();

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"UPDATE PARTY_ADDRESS SET HOUSE_NO=?,HOUSE_NAME=?,BUILDING_NO=?,STREET_NAME=?,CITY_NAME=?,TOWN_NAME=?,COUNTRY=?,POSTAL_CODE=? WHERE PARTY_ID=? AND ADDRESS_TYPE='Current'");
			ps.setString(1, updatedAddress.getHouseNumber());
			ps.setString(2, updatedAddress.getHouseName());
			ps.setString(3, updatedAddress.getBuildingNumber());
			ps.setString(4, updatedAddress.getStreetName());
			ps.setString(5, updatedAddress.getCityName());
			ps.setString(6, updatedAddress.getTownName());
			ps.setString(7, updatedAddress.getCountry());
			ps.setString(8, updatedAddress.getPostalCode());
			ps.setLong(9, id);
			int i = ps.executeUpdate();
			logger.info("value of " + i);
			Date date = new Date(0);
			// logger.info("vlue of ticketId on dao ==="+ticketId);
			java.sql.Date d = new java.sql.Date(new java.util.Date().getTime());

			PreparedStatement ps2 = null;
			ps2 = con.prepareStatement(
					"UPDATE HELPDESK_TICKET SET STATUS = 'RESOLVED', RESOLVED_DATE = sysdate WHERE ID = ?");

			ps2.setLong(1, ticketId);
			int j = ps2.executeUpdate();
			if (i > 0 && j > 0) {
				flag = true;
				con.close();
				return flag;
			}
			con.close();
			return false;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Query Exception has generated");
		}

	}

	public NonPersonalCustomer getNonPersonalParty(Long ppId) throws CommercialCustandAcctMaintenance {

		NonPersonalCustomer npc = new NonPersonalCustomer();
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"select NPC.BUSINESS_NAME from NON_PERSONAL_PARTY NPC JOIN PERSONAL_PARTY PP ON PP.NP_ID = NPC.ID WHERE PP.ID = ?");

			ps.setLong(1, ppId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				npc.setBusinessName(rs.getString(1));
			}
			ps.close();
			con.close();
			return npc;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new CommercialCustandAcctMaintenance("Class is not available");

		} catch (SQLException e) {

			e.printStackTrace();
			throw new CommercialCustandAcctMaintenance("Database error");
		}

	}

}
