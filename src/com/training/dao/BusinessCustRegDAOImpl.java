package com.training.dao;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.log4j.Logger;

import com.training.controllers.LoginServlet;
import com.training.exception.BusinessCustRegException;
import com.training.exception.EmployeeManagementException;
import com.training.model.Address;
import com.training.model.Contact;
import com.training.model.NonPersonalCustomer;
import com.training.model.Proof;
import com.training.model.ReportData;
import com.training.model.ReportHelpdeskData;
import com.training.utils.ConnectionUtil;

public class BusinessCustRegDAOImpl implements BusinessCustRegDAO {
	private static Logger logger = Logger.getLogger(LoginServlet.class);
	List<NonPersonalCustomer> npcList;
	NonPersonalCustomer npc;
	boolean flag;
	List<Contact> contactList;
	List<Address> addressList;
	List<Proof> proofList;

	@Override
	public boolean registerAllDetails(NonPersonalCustomer nonPersonalCustomer) throws BusinessCustRegException {
		String branchId = null;
		PreparedStatement ps = null;
		Connection con = null;

		try {
			con = ConnectionUtil.getConnection();

			// Entries in Table Non_Peronal_Customer
			ps = con.prepareStatement("select BRANCH_ID from BRANCH where BRANCH_NAME=?");
			ps.setString(1, nonPersonalCustomer.getBankBranch());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				branchId = rs.getString(1);
			}

			ps = con.prepareStatement(
					"insert into NON_PERSONAL_PARTY values(ID.nextval,?,?,?,?,?,to_date(?,'yyyy/mm/dd'),to_date(?,'yyyy/mm/dd'),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

			logger.info("Bsiness name coming in DAO class is:" + nonPersonalCustomer.getBusinessName());
			ps.setString(1, nonPersonalCustomer.getBusinessName());
			ps.setString(2, nonPersonalCustomer.getTradingName());
			ps.setString(3, nonPersonalCustomer.getBusinessType());
			ps.setString(4, branchId);
			ps.setString(5, nonPersonalCustomer.getIsStartUpBusiness());
			ps.setString(6, nonPersonalCustomer.getDateEstablished());
			ps.setString(7, nonPersonalCustomer.getDateOfRegistration());
			ps.setDouble(8, nonPersonalCustomer.getExpectedAnnualTurnover());
			ps.setDouble(9, nonPersonalCustomer.getTotalBusinessCapital());
			ps.setString(10, nonPersonalCustomer.getBusinessStatus());
			ps.setString(11, nonPersonalCustomer.getTellMoreAboutYourBusiness());
			ps.setString(12, nonPersonalCustomer.getRequireFunding());
			ps.setDouble(13, nonPersonalCustomer.getFundAmount());
			ps.setLong(14, nonPersonalCustomer.getNumberOfEmployees());
			ps.setString(15, nonPersonalCustomer.getCountryOfRegistration());
			ps.setString(16, nonPersonalCustomer.getEmailId());
			ps.setInt(17, 0);
			ps.setString(18, nonPersonalCustomer.getIndustrySector());
			ps.setString(19, nonPersonalCustomer.getMainActivity());
			ps.setString(20, nonPersonalCustomer.getPreciseActivity());
			ps.setString(21, nonPersonalCustomer.getGoods());
			ps.setString(22, nonPersonalCustomer.getGroupFranchise());
			ps.setString(23, nonPersonalCustomer.getFranchiseDetails());
			int j = ps.executeUpdate();

			if (j > 0) {
				flag = true;
			} else {
				flag = false;
			}

			// Insert values in contact table

			contactList = nonPersonalCustomer.getCl();

			for (Contact contact : contactList) {
				ps = con.prepareStatement("insert into NP_CONTACTS values (ID.currval,?,?,?,?)");
				ps.setLong(1, contact.getCountryCode());
				ps.setLong(2, contact.getAreaCode());
				ps.setLong(3, contact.getContactNumber());
				ps.setString(4, contact.getContactType());

				j = ps.executeUpdate();

				if (j > 0) {
					flag = true;
				} else {
					flag = false;
				}
			}

			// Insert values in address table

			addressList = nonPersonalCustomer.getAl();

			for (Address address : addressList) {
				ps = con.prepareStatement("insert into NP_ADDRESS values (ID.currval,?,?,?,?,?,?,?,?)");
				ps.setString(1, address.getBuildingNumber());
				ps.setString(2, address.getBuildingName());
				ps.setString(3, address.getStreetName());
				ps.setString(4, address.getCityName());
				ps.setString(5, address.getTownName());
				ps.setString(6, address.getCountry());
				ps.setString(7, address.getPostalCode());
				ps.setString(8, address.getAddressType());

				j = ps.executeUpdate();

				if (j > 0) {
					flag = true;
					logger.info("ENTERED THE ADDRESSES IN THE DATABASE");
				} else {
					flag = false;
				}
			}

			// Insert values in proof table

			proofList = nonPersonalCustomer.getPl();

			for (Proof proof : proofList) {
				ps = con.prepareStatement("insert into NP_PROOF values (ID.currval,?,?,?,?,?)");
				ps.setString(1, proof.getDocumentType());
				ps.setString(2, proof.getDocument());
				ps.setString(3, proof.getSubmittedDate());
				ps.setString(4, "Valid");
				ByteArrayInputStream bas = new ByteArrayInputStream(proof.getDocumentProof());
				ps.setBinaryStream(5, bas, proof.getDocumentProof().length);

				j = ps.executeUpdate();

				if (j > 0) {
					flag = true;
					logger.info("ENTERED THE PROOF " + proof.getDocumentType() + "IN THE DATABASE");
				} else {
					flag = false;
				}
			}

			// Inserting Cust Id into NPC Object
			long id = 0;

			ps = con.prepareStatement("select ID.currval from NON_PERSONAL_PARTY");
			ResultSet rs1 = ps.executeQuery();
			while (rs1.next()) {
				id = rs1.getLong(1);
			}
			nonPersonalCustomer.setNonPersonalCustomerID(id);

			ps = con.prepareStatement("insert into registrationdate values (ID.currval,sysdate)");
			ps.executeUpdate();
			flag = true;

		} catch (SQLException e) {
			throw new BusinessCustRegException("Error has Occurred");

		} catch (ClassNotFoundException e) {
			throw new BusinessCustRegException("Error has Occurred");
		}

		/*
		 * try { ps = con.
		 * prepareStatement("insert into registrationdate values (ID.currval,systemdate)"
		 * ); ps.executeUpdate(); flag=true; } catch (SQLException e) {
		 * e.printStackTrace(); throw new
		 * BusinessCustRegException("Unable to register a customer"); }
		 */
		finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {
				throw new BusinessCustRegException("Error has Occurred");
			}

		}

		return flag;
	}

	@Override
	public boolean deleteBusinessCustomer(long id) throws BusinessCustRegException {

		PreparedStatement ps = null;
		Connection con = null;

		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement("delete from NP_CONTACTS where NP_ID=?");
			ps.setLong(1, id);
			int j = ps.executeUpdate();

			ps = con.prepareStatement("delete from NP_ADDRESS where NP_PARTY_ID=?");
			ps.setLong(1, id);
			j = ps.executeUpdate();

			ps = con.prepareStatement("delete from NP_PROOF where PARTY_ID=?");
			ps.setLong(1, id);
			j = ps.executeUpdate();

			ps = con.prepareStatement("delete from NON_PERSONAL_PARTY where ID=?");
			ps.setLong(1, id);
			j = ps.executeUpdate();

			if (j > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (ClassNotFoundException e) {
			throw new BusinessCustRegException("Error has Occurred");
		} catch (SQLException e) {
			throw new BusinessCustRegException("Error has Occurred");
		}

		return flag;

	}

	@Override
	public List<NonPersonalCustomer> searchBusinessCustomer(String parameter1, String parameter2, String actionname)
			throws BusinessCustRegException {

		PreparedStatement ps1 = null;

		Connection con = null;
		String query = null;

		try {

			con = ConnectionUtil.getConnection();
			if (actionname.equalsIgnoreCase("SearchCustomer1")) {
				query = "select * from NON_PERSONAL_PARTY a left join BRANCH b on a.BRANCH_ID=b.BRANCH_ID where LOWER(a.BUSINESS_NAME) LIKE '%"
						+ parameter1.toLowerCase() + "%' and b.BRANCH_NAME='" + parameter2 + "'";
				ps1 = con.prepareStatement(query);
				ResultSet rs1 = ps1.executeQuery();

				npcList = new ArrayList<NonPersonalCustomer>();

				while (rs1.next()) {
					npc = new NonPersonalCustomer();
					npc.setNonPersonalCustomerID(rs1.getLong(1));
					npc.setBusinessName(rs1.getString(2));
					npc.setTradingName(rs1.getString(3));
					npc.setBusinessType(rs1.getString(4));
					// npc.setIsStartUpBusiness(rs1.getString(5));
					npc.setIsStartUpBusiness(rs1.getString(6));
					if (rs1.getString(7) != null) {
						npc.setDateEstablished(rs1.getDate(7).toString());
					}
					if (rs1.getString(8) != null) {
						npc.setDateOfRegistration(rs1.getDate(8).toString());
					}

					npc.setExpectedAnnualTurnover(rs1.getDouble(9));
					npc.setTotalBusinessCapital(rs1.getDouble(10));
					npc.setBusinessStatus(rs1.getString(11));
					npc.setTellMoreAboutYourBusiness(rs1.getString(12));
					npc.setRequireFunding(rs1.getString(13));
					npc.setFundAmount(rs1.getDouble(14));
					npc.setNumberOfEmployees(rs1.getLong(15));
					npc.setCountryOfRegistration(rs1.getString(16));
					npc.setEmailId(rs1.getString(17));
					npc.setGoods(rs1.getString(22));
					npc.setIndustrySector(rs1.getString(19));
					npc.setMainActivity(rs1.getString(20));
					npc.setPreciseActivity(rs1.getString(21));

					// logger.info(rs1.getDouble(22));

					npc.setGroupFranchise(rs1.getString(23));
					npc.setFranchiseDetails(rs1.getString(24));

					npc.setBankBranch(rs1.getString(26));

					npcList.add(npc);
				}

			} else if (actionname.equalsIgnoreCase("SearchCustomer2")) {

				query = "select * from NON_PERSONAL_PARTY a left join BRANCH b on a.BRANCH_ID=b.BRANCH_ID where LOWER(a.TRADING_NAME) LIKE '%"
						+ parameter1.toLowerCase() + "%' and b.BRANCH_NAME='" + parameter2 + "'";
				ps1 = con.prepareStatement(query);
				ResultSet rs1 = ps1.executeQuery();

				npcList = new ArrayList<NonPersonalCustomer>();

				while (rs1.next()) {
					npc = new NonPersonalCustomer();
					npc.setNonPersonalCustomerID(rs1.getLong(1));
					npc.setBusinessName(rs1.getString(2));
					npc.setTradingName(rs1.getString(3));
					npc.setBusinessType(rs1.getString(4));
					// npc.setIsStartUpBusiness(rs1.getString(5));
					npc.setIsStartUpBusiness(rs1.getString(6));
					if (rs1.getString(7) != null) {
						npc.setDateEstablished(rs1.getDate(7).toString());
					}
					if (rs1.getString(8) != null) {
						npc.setDateOfRegistration(rs1.getDate(8).toString());
					}

					npc.setExpectedAnnualTurnover(rs1.getDouble(9));
					npc.setTotalBusinessCapital(rs1.getDouble(10));
					npc.setBusinessStatus(rs1.getString(11));
					npc.setTellMoreAboutYourBusiness(rs1.getString(12));
					npc.setRequireFunding(rs1.getString(13));
					npc.setFundAmount(rs1.getDouble(14));
					npc.setNumberOfEmployees(rs1.getLong(15));
					npc.setCountryOfRegistration(rs1.getString(16));
					npc.setEmailId(rs1.getString(17));
					npc.setGoods(rs1.getString(22));
					npc.setIndustrySector(rs1.getString(19));
					npc.setMainActivity(rs1.getString(20));
					npc.setPreciseActivity(rs1.getString(21));

					// logger.info(rs1.getDouble(22));

					npc.setGroupFranchise(rs1.getString(23));
					npc.setFranchiseDetails(rs1.getString(24));

					npc.setBankBranch(rs1.getString(26));

					npcList.add(npc);
				}
			}

			else if (actionname.equalsIgnoreCase("SearchCustomer3")) {
				long account_number = Long.parseLong(parameter1);
				long npc_id = 0;
				ps1 = con.prepareStatement("select NP_ID from NON_PERSONAL_ACCOUNT where ACCOUNT_NUMBER=?");
				ps1.setLong(1, account_number);
				ResultSet rs1 = ps1.executeQuery();
				while (rs1.next()) {
					npc_id = rs1.getLong(1);
				}
				logger.info("in dao new" + npc_id);
				rs1 = null;
				ps1 = null;
				ps1 = con.prepareStatement("select * from NON_PERSONAL_PARTY b where b.ID=?");
				ps1.setLong(1, npc_id);
				rs1 = ps1.executeQuery();
				npcList = new ArrayList<NonPersonalCustomer>();

				while (rs1.next()) {
					npc = new NonPersonalCustomer();
					npc.setNonPersonalCustomerID(rs1.getLong(1));
					npc.setBusinessName(rs1.getString(2));
					npc.setTradingName(rs1.getString(3));
					npc.setBusinessType(rs1.getString(4));
					// npc.setIsStartUpBusiness(rs1.getString(5));
					npc.setIsStartUpBusiness(rs1.getString(6));
					if (rs1.getString(7) != null) {
						npc.setDateEstablished(rs1.getDate(7).toString());
					}
					if (rs1.getString(8) != null) {
						npc.setDateOfRegistration(rs1.getDate(8).toString());
					}

					npc.setExpectedAnnualTurnover(rs1.getDouble(9));
					npc.setTotalBusinessCapital(rs1.getDouble(10));
					npc.setBusinessStatus(rs1.getString(11));
					npc.setTellMoreAboutYourBusiness(rs1.getString(12));
					npc.setRequireFunding(rs1.getString(13));
					npc.setFundAmount(rs1.getDouble(14));
					npc.setNumberOfEmployees(rs1.getLong(15));
					npc.setCountryOfRegistration(rs1.getString(16));
					npc.setEmailId(rs1.getString(17));
					npc.setGoods(rs1.getString(22));
					npc.setIndustrySector(rs1.getString(19));
					npc.setMainActivity(rs1.getString(20));
					npc.setPreciseActivity(rs1.getString(21));

					// logger.info(rs1.getDouble(22));

					npc.setGroupFranchise(rs1.getString(23));
					npc.setFranchiseDetails(rs1.getString(24));

					npcList.add(npc);
				}

			}

		} catch (ClassNotFoundException e) {
			throw new BusinessCustRegException("Error has Occurred");
		} catch (SQLException e) {
			throw new BusinessCustRegException("Error has Occurred");
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps1);
			} catch (SQLException e) {
				throw new BusinessCustRegException("Error has Occurred");

			}

		}
		return npcList;

	}

	@Override
	public boolean updateBusinessCustomer(NonPersonalCustomer nonPersonalCustomer) throws BusinessCustRegException {

		String branchId = null;
		PreparedStatement ps = null;
		Connection con = null;
		long npc_id = nonPersonalCustomer.getNonPersonalCustomerID();

		try {
			con = ConnectionUtil.getConnection();

			// logger.info(nonPersonalCustomer.getBankBranch());

			// Entries in Table Non_Peronal_Customer
			ps = con.prepareStatement("select BRANCH_ID from BRANCH where BRANCH_NAME=?");
			ps.setString(1, nonPersonalCustomer.getBankBranch());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				branchId = rs.getString(1);
			}
			ps = null;
			logger.info("established date" + nonPersonalCustomer.getDateEstablished());
			logger.info("registration date" + nonPersonalCustomer.getDateOfRegistration());
			ps = con.prepareStatement("update NON_PERSONAL_PARTY a set BUSINESS_NAME=?,TRADING_NAME=?,"
					+ "BUSINESS_TYPE=?,BRANCH_ID=?,IS_STARTUP_BUSINESS=?,DATE_ESTABLISHED=to_date(?,'yyyy/mm/dd'),"
					+ "DATE_OF_REGISTRATION=to_date(?,'yyyy/mm/dd'),EXPECTED_ANNUAL_TURNOVER=?,CAPITAL_FUND=?,"
					+ "STATUS=?,ABOUT_BUSINESS=?,FUNDING_REQUIRED=?,FUND_AMOUNT=?,NO_OF_EMPLOYEES=?,"
					+ "COUNTRY_OF_REGISTRATION=?,EMAIL_ADDRESS=?,RM_ASSIGNED=?,INDUSTRY_SECTOR=?,"
					+ "MAIN_ACTIVITY=?,PRECISE_ACTIVITY=?,IMPORT_EXPORT_GOODS=?,PART_GROUP_FRANCHISE=?,"
					+ "GROUP_FRANCHISE_DETAILS=? WHERE a.ID=?");
			String s = "";
			ps.setString(1, nonPersonalCustomer.getBusinessName());
			ps.setString(2, nonPersonalCustomer.getTradingName());
			ps.setString(3, nonPersonalCustomer.getBusinessType());
			ps.setString(4, branchId);
			ps.setString(5, nonPersonalCustomer.getIsStartUpBusiness());
			if (nonPersonalCustomer.getDateEstablished() != null) {
				ps.setString(6, nonPersonalCustomer.getDateEstablished());
			} else {
				ps.setString(6, s);
			}
			logger.info(nonPersonalCustomer.getDateEstablished());
			if (nonPersonalCustomer.getDateOfRegistration() != null) {
				ps.setString(7, nonPersonalCustomer.getDateOfRegistration());
			} else {
				ps.setString(7, s);
			}
			ps.setDouble(8, nonPersonalCustomer.getExpectedAnnualTurnover());
			ps.setDouble(9, nonPersonalCustomer.getTotalBusinessCapital());
			ps.setString(10, nonPersonalCustomer.getBusinessStatus());
			ps.setString(11, nonPersonalCustomer.getTellMoreAboutYourBusiness());
			ps.setString(12, nonPersonalCustomer.getRequireFunding());
			ps.setDouble(13, nonPersonalCustomer.getFundAmount());
			ps.setLong(14, nonPersonalCustomer.getNumberOfEmployees());
			ps.setString(15, nonPersonalCustomer.getCountryOfRegistration());
			ps.setString(16, nonPersonalCustomer.getEmailId());
			ps.setInt(17, 0);
			ps.setString(18, nonPersonalCustomer.getIndustrySector());
			ps.setString(19, nonPersonalCustomer.getMainActivity());
			ps.setString(20, nonPersonalCustomer.getPreciseActivity());
			ps.setString(21, nonPersonalCustomer.getGoods());
			ps.setString(22, nonPersonalCustomer.getGroupFranchise());
			ps.setString(23, nonPersonalCustomer.getFranchiseDetails());
			ps.setLong(24, nonPersonalCustomer.getNonPersonalCustomerID());
			int j = ps.executeUpdate();

			if (j > 0) {
				flag = true;
			} else {
				flag = false;
			}

			// Insert values in contact table

			contactList = nonPersonalCustomer.getCl();

			for (Contact contact : contactList) {
				ps = con.prepareStatement(
						"UPDATE NP_CONTACTS SET COUNTRY_CODE=?,AREA_CODE=?,CONTACT_NUMBER=? WHERE NP_ID=? AND CONTACT_TYPE=?");
				ps.setLong(1, contact.getCountryCode());
				ps.setLong(2, contact.getAreaCode());
				ps.setLong(3, contact.getContactNumber());
				ps.setLong(4, npc_id);
				ps.setString(5, contact.getContactType());
				j = ps.executeUpdate();

			}
			if (j > 0) {
				flag = true;
				logger.info("np_contacts query done");
			} else {
				flag = false;
			}
			// Insert values in address table

			addressList = nonPersonalCustomer.getAl();

			for (Address address : addressList) {

				ps = con.prepareStatement(
						"UPDATE NP_ADDRESS SET BUILDING_NO=?,BUILDING_NAME=?,STREET_NAME=?,CITY_NAME=?,TOWN_NAME=?,COUNTRY=?,POSTAL_CODE=? WHERE NP_PARTY_ID=? and ADDRESS_TYPE=?");
				ps.setString(1, address.getBuildingNumber());
				ps.setString(2, address.getBuildingName());
				ps.setString(3, address.getStreetName());
				ps.setString(4, address.getCityName());
				ps.setString(5, address.getTownName());
				ps.setString(6, address.getCountry());
				ps.setString(7, address.getPostalCode());
				ps.setLong(8, npc_id);
				ps.setString(9, address.getAddressType());
				j = ps.executeUpdate();

			}
			if (j > 0) {
				flag = true;
			} else {
				flag = false;
			}
			// Insert values in proof table

			proofList = nonPersonalCustomer.getPl();

			for (Proof proof : proofList) {
				ps = con.prepareStatement(
						"UPDATE NP_PROOF SET DOCUMENT=?,SUBMITTED_DATE=?,STATUS=?, DOCUMENTCONTENT=? WHERE PARTY_ID=? and DOCUMENT_TYPE=?");
				ps.setString(1, proof.getDocument());
				ps.setString(2, proof.getSubmittedDate());
				ps.setString(3, "Valid");
				ByteArrayInputStream bas = new ByteArrayInputStream(proof.getDocumentProof());
				ps.setBinaryStream(4, bas, proof.getDocumentProof().length);

				ps.setLong(5, npc_id);
				ps.setString(6, proof.getDocumentType());

				j = ps.executeUpdate();

				if (j > 0) {
					flag = true;
				} else {
					flag = false;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessCustRegException("Error has Occurred");
		} catch (ClassNotFoundException e) {
			throw new BusinessCustRegException("Error has Occurred");
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
			} catch (SQLException e) {
				throw new BusinessCustRegException("Error has Occurred");
			}

		}
		return flag;
	}

	@Override
	public NonPersonalCustomer viewBusinessCustomer(long npcId) throws BusinessCustRegException {

		PreparedStatement ps = null;
		Connection con = null;
		NonPersonalCustomer npc = new NonPersonalCustomer();
		Contact contact;
		Address address;
		Proof proof;
		addressList = new ArrayList<Address>();
		proofList = new ArrayList<Proof>();
		contactList = new ArrayList<Contact>();
		String branch_id = null;
		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement("select * from NON_PERSONAL_PARTY e where e.ID =?");
			ps.setLong(1, npcId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				npc.setNonPersonalCustomerID(rs.getLong(1));
				npc.setBusinessName(rs.getString(2));
				npc.setTradingName(rs.getString(3));
				npc.setBusinessType(rs.getString(4));
				branch_id = rs.getString(5);
				npc.setIsStartUpBusiness(rs.getString(6));
				if (rs.getString(7) != null) {
					npc.setDateEstablished(rs.getDate(7).toString());
				}
				if (rs.getString(8) != null) {
					npc.setDateOfRegistration(rs.getDate(8).toString());
				}
				npc.setExpectedAnnualTurnover(rs.getDouble(9));
				npc.setTotalBusinessCapital(rs.getDouble(10));
				npc.setBusinessStatus(rs.getString(11));
				npc.setTellMoreAboutYourBusiness(rs.getString(12));
				npc.setRequireFunding(rs.getString(13));
				npc.setFundAmount(rs.getDouble(14));
				npc.setNumberOfEmployees(rs.getLong(15));
				npc.setCountryOfRegistration(rs.getString(16));
				npc.setEmailId(rs.getString(17));
				npc.setGoods(rs.getString(22));
				npc.setIndustrySector(rs.getString(19));
				npc.setMainActivity(rs.getString(20));
				npc.setPreciseActivity(rs.getString(21));

				// logger.info(rs1.getDouble(22));

				npc.setGroupFranchise(rs.getString(23));
				npc.setFranchiseDetails(rs.getString(24));
			}
			ps = null;
			rs = null;
			ps = con.prepareStatement("select BRANCH_NAME from BRANCH d where d.BRANCH_ID='" + branch_id + "'");
			rs = ps.executeQuery();

			while (rs.next()) {
				npc.setBankBranch(rs.getString(1));
			}
			ps = null;
			rs = null;
			ps = con.prepareStatement("select * from NP_ADDRESS c WHERE c.NP_PARTY_ID='" + npcId + "'");
			rs = ps.executeQuery();
			while (rs.next()) {
				address = new Address();
				address.setBuildingNumber(rs.getString(2));
				address.setBuildingName(rs.getString(3));
				address.setStreetName(rs.getString(4));
				address.setCityName(rs.getString(5));
				address.setTownName(rs.getString(6));
				address.setCountry(rs.getString(7));
				address.setPostalCode(rs.getString(8));
				address.setAddressType(rs.getString(9));
				addressList.add(address);
			}
			npc.setAl(addressList);

			ps = null;
			rs = null;
			ps = con.prepareStatement("select * from NP_PROOF b WHERE b.PARTY_ID='" + npcId + "'");
			rs = ps.executeQuery();
			while (rs.next()) {
				proof = new Proof();
				proof.setDocumentType(rs.getString(2));
				proof.setDocument(rs.getString(3));
				proof.setSubmittedDate(rs.getString(4));
				proof.setStatus(rs.getString(5));

				ByteArrayOutputStream bos = new ByteArrayOutputStream();

				InputStream img = rs.getBinaryStream(6);
				BufferedImage bf = ImageIO.read(img);
				ImageIO.write(bf, "jpeg", bos);

				byte[] data = bos.toByteArray();
				proof.setDocumentProof(data);

				logger.info("Getting Image");

				proofList.add(proof);
			}
			npc.setPl(proofList);

			ps = null;
			rs = null;
			ps = con.prepareStatement("select * from NP_CONTACTS a WHERE a.NP_ID='" + npcId + "'");
			rs = ps.executeQuery();

			while (rs.next()) {
				contact = new Contact();
				contact.setCountryCode(rs.getInt(2));
				contact.setAreaCode(rs.getInt(3));
				contact.setContactNumber(rs.getLong(4));
				contact.setContactType(rs.getString(5));
				contactList.add(contact);
			}
			npc.setCl(contactList);

		} catch (SQLException e) {
			throw new BusinessCustRegException("Error has Occurred");
		} catch (ClassNotFoundException e) {
			throw new BusinessCustRegException("Error has Occurred");

		} catch (IOException e) {
			logger.info("Error");
			throw new BusinessCustRegException("Error has Occurred");
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {
				throw new BusinessCustRegException("Error has Occurred");
			}

		}

		return npc;

	}

	public List<String> getBranch() throws BusinessCustRegException {
		PreparedStatement ps = null;
		Connection con = null;
		List<String> branchName = new ArrayList<String>();
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select * from BRANCH order by BRANCH_NAME");
			// int row=ps.executeUpdate();
			// long[] idArray=new long[row];
			ResultSet rs = ps.executeQuery();
			// int index=0;
			while (rs.next()) {
				// idArray[index]=rs.getLong(1);
				branchName.add(rs.getString(2));
			}
		} catch (ClassNotFoundException e) {
			throw new BusinessCustRegException("Error has occurred");
		} catch (SQLException e) {
			throw new BusinessCustRegException("Error has occurred");
		}

		return branchName;
	}

	public List<ReportData> report() throws BusinessCustRegException {
		PreparedStatement ps = null;
		Connection con = null;
		List<ReportData> reportData = new ArrayList<ReportData>();

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"select count(id),country_of_registration from non_personal_party group by country_of_registration");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ReportData data = new ReportData(rs.getInt(1), rs.getString(2));
				reportData.add(data);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new BusinessCustRegException("Error has occurred while generating the report");

		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessCustRegException("Error has occurred while generating the report");

		}
		return reportData;
	}

	public List<ReportData> reportByYear(String year) throws BusinessCustRegException {
		PreparedStatement ps = null;
		Connection con = null;
		List<ReportData> reportData = new ArrayList<ReportData>();

		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement(
					"select count(id),country_of_registration from non_personal_party np join registrationdate r on np.id=r.np_id where to_char(regdate,'yyyy')=? group by country_of_registration");
			ps.setString(1, year);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ReportData data = new ReportData(rs.getInt(1), rs.getString(2));
				reportData.add(data);
			}
		} catch (ClassNotFoundException e) {
			throw new BusinessCustRegException("Error has occurred while generating the report");

		} catch (SQLException e) {
			throw new BusinessCustRegException("Error has occurred while generating the report");

		}
		return reportData;
	}

	public List<ReportData> reportByMonth(String month) throws BusinessCustRegException {
		PreparedStatement ps = null;
		Connection con = null;
		List<ReportData> reportData = new ArrayList<ReportData>();

		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement(
					"select count(id),country_of_registration from non_personal_party np join registrationdate r on np.id=r.np_id where to_char(regdate,'mm')=? group by country_of_registration");
			ps.setString(1, month);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ReportData data = new ReportData(rs.getInt(1), rs.getString(2));
				reportData.add(data);
			}
		} catch (ClassNotFoundException e) {
			throw new BusinessCustRegException("Error has occurred while generating the report");

		} catch (SQLException e) {
			throw new BusinessCustRegException("Error has occurred while generating the report");

		}
		return reportData;
	}

	public List<ReportData> reportByMonthYear(String month, String year) throws BusinessCustRegException {
		PreparedStatement ps = null;
		Connection con = null;
		List<ReportData> reportData = new ArrayList<ReportData>();

		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement(
					"select count(id),country_of_registration from non_personal_party np join registrationdate r on np.id=r.np_id where to_char(regdate,'mm')=? and to_char(regdate,'yyyy')=? group by country_of_registration");
			ps.setString(1, month);
			ps.setString(2, year);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ReportData data = new ReportData(rs.getInt(1), rs.getString(2));
				reportData.add(data);
			}
		} catch (ClassNotFoundException e) {
			throw new BusinessCustRegException("Error has occurred while generating the report");

		} catch (SQLException e) {
			throw new BusinessCustRegException("Error has occurred while generating the report");

		}
		return reportData;
	}

	public int getTotalCust() throws BusinessCustRegException {
		PreparedStatement ps = null;
		Connection con = null;
		int total = 0;

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select count(*) from non_personal_party");
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			throw new BusinessCustRegException("Error has occurred while generating the report");

		}
		return total;
	}

	public List<ReportHelpdeskData> helpdeskReport(int month, int year) throws BusinessCustRegException {
		PreparedStatement ps = null;
		Connection con = null;
		List<ReportHelpdeskData> reportData = new ArrayList<ReportHelpdeskData>();

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"select count(title),title from helpdesk_ticket where to_char(raised_on_date,'MM')=? and to_char(raised_on_date,'YYYY')=? group by title");
			ps.setInt(1, month);
			ps.setInt(2, year);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ReportHelpdeskData data = new ReportHelpdeskData(rs.getInt(1), rs.getString(2));
				reportData.add(data);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new BusinessCustRegException("Error has occurred while generating the report");

		} catch (SQLException e) {
			e.printStackTrace();
			throw new BusinessCustRegException("Error has occurred while generating the report");

		}
		return reportData;

	}

}
