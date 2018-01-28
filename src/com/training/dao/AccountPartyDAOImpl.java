package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.training.exception.AccountPartyException;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.AccountParty;
import com.training.model.Branch;
import com.training.model.PartyAddress;
import com.training.model.PartyContact;
import com.training.utils.ConnectionUtil;

public class AccountPartyDAOImpl implements AccountPartyDAO {
	Connection con = null;
	PreparedStatement ps = null;

	public void createQuestion(AccountParty ap) throws AccountPartyException {

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("INSERT INTO VERIFY_ACCOUNT_PARTY VALUES(?,?,?)");
			ps.setLong(1, ap.getId());
			ps.setString(2, ap.getQuestion1());
			ps.setString(3, ap.getAnswer());
			ps.executeUpdate();

			if (ap.getQuestion2() != null) {
				ps = con.prepareStatement("INSERT INTO VERIFY_ACCOUNT_PARTY VALUES(?,?,?)");
				ps.setLong(1, ap.getId());
				ps.setString(2, ap.getQuestion2());
				ps.setString(3, ap.getAnswer2());
				ps.executeUpdate();
			}
		} catch (SQLException e) {
			throw new AccountPartyException();
		} catch (ClassNotFoundException e) {
			throw new AccountPartyException();

		}

	}

	public Long createAccountParty(AccountParty ap) throws AccountPartyException {
		Long pId = null;
		try {

			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"INSERT INTO PERSONAL_PARTY VALUES(SEQUENCEPP.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,to_date(?,'dd/mm/yyyy'))");
			ps.setLong(1, ap.getNpid());
			ps.setString(2, ap.getTitle());
			ps.setString(3, ap.getFname());
			ps.setString(4, ap.getMname());
			ps.setString(5, ap.getLname());
			ps.setString(6, ap.getRelationship());
			ps.setString(7, ap.getIsKeyParty());
			ps.setString(8, ap.getHasAccount());
			ps.setString(9, ap.getBranch());
			ps.setLong(10, ap.getAccountNo());
			ps.setString(11, ap.getEmail());
			ps.setString(12, ap.getDob());
			ps.executeUpdate();

			ps = con.prepareStatement("INSERT INTO PARTY_ADDRESS VALUES(SEQUENCEPP.CURRVAL,?,?,?,?,?,?,?,?,'Current')");
			ps.setString(1, ap.getCurrentAddress().getHouseNo());
			ps.setString(2, ap.getCurrentAddress().getHouseName());
			ps.setString(3, ap.getCurrentAddress().getBuildingNo());
			ps.setString(4, ap.getCurrentAddress().getStreetName());
			ps.setString(5, ap.getCurrentAddress().getCityName());
			ps.setString(6, ap.getCurrentAddress().getTownName());
			ps.setString(7, ap.getCurrentAddress().getCountry());
			ps.setString(8, ap.getCurrentAddress().getPostalCode());
			ps.executeUpdate();

			if (ap.getPreviousAddress() != null) {
				ps = con.prepareStatement(
						"INSERT INTO PARTY_ADDRESS VALUES(SEQUENCEPP.CURRVAL,?,?,?,?,?,?,?,?,'Previous')");
				ps.setString(1, ap.getPreviousAddress().getHouseNo());
				ps.setString(2, ap.getPreviousAddress().getHouseName());
				ps.setString(3, ap.getPreviousAddress().getBuildingNo());
				ps.setString(4, ap.getPreviousAddress().getStreetName());
				ps.setString(5, ap.getPreviousAddress().getCityName());
				ps.setString(6, ap.getPreviousAddress().getTownName());
				ps.setString(7, ap.getPreviousAddress().getCountry());
				ps.setString(8, ap.getPreviousAddress().getPostalCode());
				ps.executeUpdate();
			}
			ps = con.prepareStatement("INSERT INTO PARTY_CONTACTS VALUES(SEQUENCEPP.CURRVAL,?,?,?,'Mobile')");
			ps.setLong(1, ap.getMobileContact().getCountryCode());
			ps.setLong(2, ap.getMobileContact().getAreaCode());
			ps.setLong(3, ap.getMobileContact().getContactNumber());
			ps.executeUpdate();

			ps = con.prepareStatement("INSERT INTO PARTY_CONTACTS VALUES(SEQUENCEPP.CURRVAL,?,?,?,'Home')");
			ps.setLong(1, ap.getHomeContact().getCountryCode());
			ps.setLong(2, ap.getHomeContact().getAreaCode());
			ps.setLong(3, ap.getHomeContact().getContactNumber());
			ps.executeUpdate();

			ps = con.prepareStatement("INSERT INTO PARTY_CONTACTS VALUES(SEQUENCEPP.CURRVAL,?,?,?,'Office')");
			ps.setLong(1, ap.getOfficeContact().getCountryCode());
			ps.setLong(2, ap.getOfficeContact().getAreaCode());
			ps.setLong(3, ap.getOfficeContact().getContactNumber());
			ps.executeUpdate();
			// module c returning id
			ps = con.prepareStatement("select max(ID) from PERSONAL_PARTY ");

			ResultSet rs1 = ps.executeQuery();
			rs1.next();

			pId = rs1.getLong(1);

		} catch (SQLException e) {
			e.printStackTrace();
			throw new AccountPartyException();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new AccountPartyException();

		} finally {

			try {
				con.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
				throw new AccountPartyException();
			}
		}
		return pId;
	}

	public AccountParty getAddressContactDetails(AccountParty ap, String branch, Long accNo)
			throws AccountPartyException {
		Boolean flag = true;
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"SELECT HOUSE_NO,HOUSE_NAME,BUILDING_NO,STREET_NAME,CITY_NAME,TOWN_NAME,COUNTRY,POSTAL_CODE,EMAIL FROM PERSONAL_ACCOUNT PA JOIN PERSONAL_ACCOUNT_ADDRESS PAA ON PA.ACCOUNT_NO=PAA.ACCOUNT_NO WHERE PAA.ADDRESS_TYPE='Current' AND PA.ACCOUNT_NO=? AND BRANCH=?");
			ps.setString(2, branch);
			ps.setLong(1, accNo);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				PartyAddress curAdd = new PartyAddress();
				PartyAddress prevAdd = new PartyAddress();
				PartyContact mobileCont = new PartyContact();
				PartyContact homeCont = new PartyContact();
				PartyContact officeCont = new PartyContact();
				curAdd.setHouseNo(rs.getString(1));
				curAdd.setHouseName(rs.getString(2));
				curAdd.setBuildingNo(rs.getString(3));
				curAdd.setStreetName(rs.getString(4));
				curAdd.setCityName(rs.getString(5));
				curAdd.setTownName(rs.getString(6));
				curAdd.setCountry(rs.getString(7));
				curAdd.setPostalCode(rs.getString(8));
				ap.setEmail(rs.getString(9));
				ap.setCurrentAddress(curAdd);

				ps = con.prepareStatement(
						"SELECT HOUSE_NO,HOUSE_NAME,BUILDING_NO,STREET_NAME,CITY_NAME,TOWN_NAME,COUNTRY,POSTAL_CODE FROM PERSONAL_ACCOUNT PA JOIN PERSONAL_ACCOUNT_ADDRESS PAA ON PA.ACCOUNT_NO=PAA.ACCOUNT_NO WHERE PAA.ADDRESS_TYPE='Previous' AND PA.ACCOUNT_NO=? AND BRANCH=?");
				ps.setString(2, branch);
				ps.setLong(1, accNo);
				rs = ps.executeQuery();
				rs.next();
				prevAdd.setHouseNo(rs.getString(1));
				prevAdd.setHouseName(rs.getString(2));
				prevAdd.setBuildingNo(rs.getString(3));
				prevAdd.setStreetName(rs.getString(4));
				prevAdd.setCityName(rs.getString(5));
				prevAdd.setTownName(rs.getString(6));
				prevAdd.setCountry(rs.getString(7));
				prevAdd.setPostalCode(rs.getString(8));
				ap.setPreviousAddress(prevAdd);

				ps = con.prepareStatement(
						"SELECT COUNTRY_CODE,AREA_CODE,CONTACT_NUMBER FROM PERSONAL_ACCOUNT PA JOIN PERSONAL_ACCOUNT_CONTACTS PAC ON PA.ACCOUNT_NO=PAC.ACCOUNT_NO WHERE CONTACT_TYPE='Mobile' AND PA.ACCOUNT_NO=? AND PA.BRANCH=?");
				ps.setString(2, branch);
				ps.setLong(1, accNo);
				rs = ps.executeQuery();
				rs.next();
				mobileCont.setCountryCode(Long.parseLong(rs.getString(1)));
				mobileCont.setAreaCode(Long.parseLong(rs.getString(2)));
				mobileCont.setContactNumber(Long.parseLong(rs.getString(3)));
				ap.setMobileContact(mobileCont);

				ps = con.prepareStatement(
						"SELECT COUNTRY_CODE,AREA_CODE,CONTACT_NUMBER FROM PERSONAL_ACCOUNT PA JOIN PERSONAL_ACCOUNT_CONTACTS PAC ON PA.ACCOUNT_NO=PAC.ACCOUNT_NO WHERE CONTACT_TYPE='Home' AND PA.ACCOUNT_NO=? AND PA.BRANCH=?");
				ps.setString(2, branch);
				ps.setLong(1, accNo);
				rs = ps.executeQuery();
				rs.next();
				homeCont.setCountryCode(Long.parseLong(rs.getString(1)));
				homeCont.setAreaCode(Long.parseLong(rs.getString(2)));
				homeCont.setContactNumber(Long.parseLong(rs.getString(3)));
				ap.setHomeContact(homeCont);

				ps = con.prepareStatement(
						"SELECT COUNTRY_CODE,AREA_CODE,CONTACT_NUMBER FROM PERSONAL_ACCOUNT PA JOIN PERSONAL_ACCOUNT_CONTACTS PAC ON PA.ACCOUNT_NO=PAC.ACCOUNT_NO WHERE CONTACT_TYPE='Office' AND PA.ACCOUNT_NO=? AND PA.BRANCH=?");
				ps.setString(2, branch);
				ps.setLong(1, accNo);
				rs = ps.executeQuery();
				rs.next();
				officeCont.setCountryCode(Long.parseLong(rs.getString(1)));
				officeCont.setAreaCode(Long.parseLong(rs.getString(2)));
				officeCont.setContactNumber(Long.parseLong(rs.getString(3)));
				ap.setOfficeContact(officeCont);
			} else {
				flag = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new AccountPartyException();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new AccountPartyException();
		} finally {
			try {
				con.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
				throw new AccountPartyException();
			}

		}
		if (flag == false)
			return null;
		else
			return ap;
	}

	@Override
	public List<AccountParty> viewAccountParty(Long npid) throws AccountPartyException {
		List<AccountParty> list = new ArrayList<AccountParty>();
		try {

			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement("SELECT * FROM  PERSONAL_PARTY WHERE NP_ID=? ORDER BY ID");
			ps.setLong(1, npid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				AccountParty ap = new AccountParty();
				PartyAddress pa = new PartyAddress();
				PartyContact pc = new PartyContact();
				ap.setId(rs.getLong(1));
				ap.setNpid(rs.getLong(2));
				ap.setTitle(rs.getString(3));
				ap.setFname(rs.getString(4));
				ap.setMname(rs.getString(5));
				ap.setLname(rs.getString(6));
				ap.setRelationship(rs.getString(7));
				ap.setIsKeyParty(rs.getString(8));
				ap.setIsKeyParty(rs.getString(9));
				ap.setBranch(rs.getString(10));
				ap.setAccountNo(rs.getLong(11));
				ap.setEmail(rs.getString(12));
				ap.setDob(rs.getString(13));

				PreparedStatement ps1 = con
						.prepareStatement("SELECT * FROM  PARTY_ADDRESS WHERE PARTY_ID=? AND ADDRESS_TYPE='Current'");
				ps1.setLong(1, ap.getId());

				ResultSet rs1 = ps1.executeQuery();

				if (rs1.next()) {
					pa.setHouseNo(rs1.getString(2));
					pa.setHouseName(rs1.getString(3));
					pa.setBuildingNo(rs1.getString(4));
					pa.setStreetName(rs1.getString(5));
					pa.setCityName(rs1.getString(6));
					pa.setTownName(rs1.getString(7));
					pa.setCountry(rs1.getString(8));
					pa.setPostalCode(rs1.getString(9));
					pa.setAddressType(rs1.getString(10));
					ap.setCurrentAddress(pa);
				}
				PreparedStatement ps2 = con
						.prepareStatement("SELECT * FROM  PARTY_ADDRESS WHERE PARTY_ID=? AND ADDRESS_TYPE='Previous'");
				ps2.setLong(1, ap.getId());

				ResultSet rs2 = ps2.executeQuery();

				if (rs2.next()) {
					pa.setHouseNo(rs2.getString(2));
					pa.setHouseName(rs2.getString(3));
					pa.setBuildingNo(rs2.getString(4));
					pa.setStreetName(rs2.getString(5));
					pa.setCityName(rs2.getString(6));
					pa.setTownName(rs2.getString(7));
					pa.setCountry(rs2.getString(8));
					pa.setPostalCode(rs2.getString(9));
					pa.setAddressType(rs2.getString(10));
					ap.setPreviousAddress(pa);
				}
				PreparedStatement ps3 = con
						.prepareStatement("SELECT * FROM PARTY_CONTACTS WHERE PARTY_ID=? AND CONTACT_TYPE='Mobile'");
				ps3.setLong(1, ap.getId());

				ResultSet rs3 = ps3.executeQuery();
				if (rs3.next()) {
					pc.setCountryCode(rs3.getLong(2));
					pc.setAreaCode(rs3.getLong(3));
					pc.setContactNumber(rs3.getLong(4));
					pc.setContactType(rs3.getString(5));
					ap.setMobileContact(pc);
				}
				PreparedStatement ps4 = con
						.prepareStatement("SELECT * FROM PARTY_CONTACTS WHERE PARTY_ID=? AND CONTACT_TYPE='Home'");
				ps4.setLong(1, ap.getId());

				ResultSet rs4 = ps4.executeQuery();

				if (rs4.next()) {

					pc.setCountryCode(rs4.getLong(2));
					pc.setAreaCode(rs4.getLong(3));
					pc.setContactNumber(rs4.getLong(4));
					pc.setContactType(rs4.getString(5));
					ap.setHomeContact(pc);
				}
				PreparedStatement ps5 = con
						.prepareStatement("SELECT * FROM PARTY_CONTACTS WHERE PARTY_ID=? AND CONTACT_TYPE='Office'");
				ps5.setLong(1, ap.getId());

				ResultSet rs5 = ps5.executeQuery();

				if (rs5.next()) {
					pc.setCountryCode(rs5.getLong(2));
					pc.setAreaCode(rs5.getLong(3));
					pc.setContactNumber(rs5.getLong(4));
					pc.setContactType(rs5.getString(5));
					ap.setOfficeContact(pc);
				}
				list.add(ap);
			}

		} catch (SQLException e) {
			throw new AccountPartyException();
		} catch (ClassNotFoundException e) {
			throw new AccountPartyException();
		} finally {
			try {
				con.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
				throw new AccountPartyException();
			}

		}
		return list;
	}

	public AccountParty viewAccountPartyDetails(Long id) throws AccountPartyException {
		AccountParty ap = new AccountParty();
		PartyAddress cpa = new PartyAddress();
		PartyAddress ppa = new PartyAddress();
		PartyContact mpc = new PartyContact();
		PartyContact opc = new PartyContact();
		PartyContact hpc = new PartyContact();

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"SELECT ID,NP_ID,TITLE,FIRST_NAME,MIDDLE_NAME,SURNAME,RELATIONSHIP_TYPE,IS_KEY_PARTY,IS_EXISTING_CUSTOMER,BRANCH_ID,ACCOUNT_NUMBER,EMAIL_ADDRESS,TO_CHAR(DATE_OF_BIRTH,'DD-MON-YYYY') FROM  PERSONAL_PARTY WHERE ID=?");
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			ap.setId(rs.getLong(1));
			ap.setNpid(rs.getLong(2));
			ap.setTitle(rs.getString(3));
			ap.setFname(rs.getString(4));
			ap.setMname(rs.getString(5));
			ap.setLname(rs.getString(6));
			ap.setRelationship(rs.getString(7));
			ap.setIsKeyParty(rs.getString(8));
			ap.setIsKeyParty(rs.getString(9));
			ap.setBranch(rs.getString(10));
			ap.setAccountNo(rs.getLong(11));
			ap.setEmail(rs.getString(12));
			ap.setDob(rs.getString(13));

			PreparedStatement ps1 = con
					.prepareStatement("SELECT * FROM  PARTY_ADDRESS WHERE PARTY_ID=? AND ADDRESS_TYPE='Current'");
			ps1.setLong(1, ap.getId());
			ResultSet rs1 = ps1.executeQuery();

			if (rs1.next()) {
				cpa.setHouseNo(rs1.getString(2));
				cpa.setHouseName(rs1.getString(3));
				cpa.setBuildingNo(rs1.getString(4));
				cpa.setStreetName(rs1.getString(5));
				cpa.setCityName(rs1.getString(6));
				cpa.setTownName(rs1.getString(7));
				cpa.setCountry(rs1.getString(8));
				cpa.setPostalCode(rs1.getString(9));
				cpa.setAddressType(rs1.getString(10));
				ap.setCurrentAddress(cpa);
			}

			PreparedStatement ps2 = con
					.prepareStatement("SELECT * FROM  PARTY_ADDRESS WHERE PARTY_ID=? AND ADDRESS_TYPE='Previous'");
			ps2.setLong(1, ap.getId());
			ResultSet rs2 = ps2.executeQuery();

			if (rs2.next()) {
				ppa.setHouseNo(rs2.getString(2));
				ppa.setHouseName(rs2.getString(3));
				ppa.setBuildingNo(rs2.getString(4));
				ppa.setStreetName(rs2.getString(5));
				ppa.setCityName(rs2.getString(6));
				ppa.setTownName(rs2.getString(7));
				ppa.setCountry(rs2.getString(8));
				ppa.setPostalCode(rs2.getString(9));
				ppa.setAddressType(rs2.getString(10));
				ap.setPreviousAddress(ppa);
			}

			PreparedStatement ps3 = con
					.prepareStatement("SELECT * FROM PARTY_CONTACTS WHERE PARTY_ID=? AND CONTACT_TYPE='Mobile'");
			ps3.setLong(1, ap.getId());
			ResultSet rs3 = ps3.executeQuery();
			if (rs3.next()) {
				mpc.setCountryCode(rs3.getLong(2));
				mpc.setAreaCode(rs3.getLong(3));
				mpc.setContactNumber(rs3.getLong(4));
				mpc.setContactType(rs3.getString(5));
				ap.setMobileContact(mpc);
			}

			PreparedStatement ps4 = con
					.prepareStatement("SELECT * FROM PARTY_CONTACTS WHERE PARTY_ID=? AND CONTACT_TYPE='Home'");
			ps4.setLong(1, ap.getId());
			ResultSet rs4 = ps4.executeQuery();

			if (rs4.next()) {

				hpc.setCountryCode(rs4.getLong(2));
				hpc.setAreaCode(rs4.getLong(3));
				hpc.setContactNumber(rs4.getLong(4));
				hpc.setContactType(rs4.getString(5));
				ap.setHomeContact(hpc);
			}
			PreparedStatement ps5 = con
					.prepareStatement("SELECT * FROM PARTY_CONTACTS WHERE PARTY_ID=? AND CONTACT_TYPE='Office'");
			ps5.setLong(1, ap.getId());
			ResultSet rs5 = ps5.executeQuery();

			if (rs5.next()) {
				opc.setCountryCode(rs5.getLong(2));
				opc.setAreaCode(rs5.getLong(3));
				opc.setContactNumber(rs5.getLong(4));
				opc.setContactType(rs5.getString(5));
				ap.setOfficeContact(opc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new AccountPartyException();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new AccountPartyException();
		} finally {
			try {
				con.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
				throw new AccountPartyException();
			}

		}
		return ap;

	}

	@Override
	public void updateAccountParty(AccountParty ap) throws AccountPartyException {
		try {

			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"UPDATE PARTY_ADDRESS SET HOUSE_NO=?,HOUSE_NAME=?,BUILDING_NO=?,STREET_NAME=?,CITY_NAME=?,TOWN_NAME=?,COUNTRY=?,POSTAL_CODE=? WHERE PARTY_ID=? AND ADDRESS_TYPE='Current'");

			ps.setString(1, ap.getCurrentAddress().getHouseNo());
			ps.setString(2, ap.getCurrentAddress().getHouseName());
			ps.setString(3, ap.getCurrentAddress().getBuildingNo());
			ps.setString(4, ap.getCurrentAddress().getStreetName());
			ps.setString(5, ap.getCurrentAddress().getCityName());
			ps.setString(6, ap.getCurrentAddress().getTownName());
			ps.setString(7, ap.getCurrentAddress().getCountry());
			ps.setString(8, ap.getCurrentAddress().getPostalCode());
			ps.setLong(9, ap.getId());
			ps.executeUpdate();

			ps = con.prepareStatement(
					"UPDATE PARTY_ADDRESS SET HOUSE_NO=?,HOUSE_NAME=?,BUILDING_NO=?,STREET_NAME=?,CITY_NAME=?,TOWN_NAME=?,COUNTRY=?,POSTAL_CODE=? WHERE PARTY_ID=? AND ADDRESS_TYPE='Previous'");

			ps.setString(1, ap.getPreviousAddress().getHouseNo());
			ps.setString(2, ap.getPreviousAddress().getHouseName());
			ps.setString(3, ap.getPreviousAddress().getBuildingNo());
			ps.setString(4, ap.getPreviousAddress().getStreetName());
			ps.setString(5, ap.getPreviousAddress().getCityName());
			ps.setString(6, ap.getPreviousAddress().getTownName());
			ps.setString(7, ap.getPreviousAddress().getCountry());
			ps.setString(8, ap.getPreviousAddress().getPostalCode());
			ps.setLong(9, ap.getId());
			ps.executeUpdate();

			ps = con.prepareStatement(
					"UPDATE PARTY_CONTACTS SET COUNTRY_CODE=?,AREA_CODE=?,CONTACT_NUMBER=? WHERE PARTY_ID=? AND CONTACT_TYPE='Mobile'");
			ps.setLong(1, ap.getMobileContact().getCountryCode());
			ps.setLong(2, ap.getMobileContact().getAreaCode());
			ps.setLong(3, ap.getMobileContact().getContactNumber());
			ps.setLong(4, ap.getId());
			ps.executeUpdate();

			ps = con.prepareStatement(
					"UPDATE PARTY_CONTACTS SET COUNTRY_CODE=?,AREA_CODE=?,CONTACT_NUMBER=? WHERE PARTY_ID=? AND CONTACT_TYPE='Home'");
			ps.setLong(1, ap.getHomeContact().getCountryCode());
			ps.setLong(2, ap.getHomeContact().getAreaCode());
			ps.setLong(3, ap.getHomeContact().getContactNumber());
			ps.setLong(4, ap.getId());
			ps.executeUpdate();

			ps = con.prepareStatement(
					"UPDATE PARTY_CONTACTS SET COUNTRY_CODE=?,AREA_CODE=?,CONTACT_NUMBER=? WHERE PARTY_ID=? AND CONTACT_TYPE='Office'");
			ps.setLong(1, ap.getOfficeContact().getCountryCode());
			ps.setLong(2, ap.getOfficeContact().getAreaCode());
			ps.setLong(3, ap.getOfficeContact().getContactNumber());
			ps.setLong(4, ap.getId());
			ps.executeUpdate();

			ps = con.prepareStatement(
					"UPDATE PERSONAL_PARTY SET RELATIONSHIP_TYPE=?,IS_KEY_PARTY=?,EMAIL_ADDRESS=? WHERE ID=?");

			ps.setString(1, ap.getRelationship());
			ps.setString(2, ap.getIsKeyParty());
			ps.setString(3, ap.getEmail());
			ps.setLong(4, ap.getId());
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			throw new AccountPartyException();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new AccountPartyException();
		} finally {
			try {
				con.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
				throw new AccountPartyException();
			}

		}

	}

	@Override
	public void deleteAccountParty(Long id) throws AccountPartyException {

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("DELETE FROM PARTY_ADDRESS WHERE PARTY_ID=?");
			ps.setLong(1, id);
			ps.executeUpdate();

			ps = con.prepareStatement("DELETE FROM PARTY_CONTACTS WHERE PARTY_ID=?");
			ps.setLong(1, id);
			ps.executeUpdate();

			ps = con.prepareStatement("DELETE FROM VERIFY_ACCOUNT_PARTY WHERE ID=?");
			ps.setLong(1, id);
			ps.executeUpdate();

			ps = con.prepareStatement(
					"DELETE FROM TICKET_ASSIGNMENT WHERE TICKET_ID IN(SELECT TICKET_ID FROM HELPDESK_TICKET WHERE P_ID=?)");
			ps.setLong(1, id);
			ps.executeUpdate();

			ps = con.prepareStatement("DELETE FROM HELPDESK_TICKET WHERE P_ID=?");
			ps.setLong(1, id);
			ps.executeUpdate();

			ps = con.prepareStatement("DELETE FROM PERSONAL_PARTY WHERE ID=?");
			ps.setLong(1, id);
			ps.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new AccountPartyException();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new AccountPartyException();
		}

	}

	@Override
	// module c
	public boolean addQuestionDao(long partyId, String question, String answer)
			throws CommercialCustandAcctMaintenance {
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select max(ID) from PERSONAL_PARTY ");

			int i = ps.executeUpdate();

			ps = con.prepareStatement("INSERT INTO VERIFY_ACCOUNT_PARTY  VALUES(?,?,?) ");
			ps.setLong(1, partyId);
			ps.setString(2, question);
			ps.setString(3, answer);

			i = ps.executeUpdate();

			ps.close();
			con.close();

			if (i > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception d) {
			d.printStackTrace();

		}

		return false;

	}

	public ArrayList<Branch> getBranchList() throws CommercialCustandAcctMaintenance {
		try {
			con = ConnectionUtil.getConnection();
			Branch b = null;
			ArrayList<Branch> blist = new ArrayList<Branch>();

			ps = con.prepareStatement("select * from BRANCH");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Branch();
				b.setBranch_id(rs.getString(1));
				b.setBranch_name(rs.getString(2));
				blist.add(b);

			}
			rs.close();
			ps.close();
			con.close();
			return blist;

		} catch (SQLException e) {
			e.printStackTrace();
			throw new CommercialCustandAcctMaintenance("");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new CommercialCustandAcctMaintenance("Class is not available.");

		}

	}

}
