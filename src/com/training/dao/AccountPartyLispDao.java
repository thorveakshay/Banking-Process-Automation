package com.training.dao;

import com.training.model.*;
import com.training.utils.ConnectionUtil;

import java.sql.*;
import java.util.ArrayList;

public class AccountPartyLispDao {

	public ArrayList<AccParty> getAccountPartyList(long busId) throws SQLException, ClassNotFoundException {

		ArrayList<AccParty> accp = new ArrayList<AccParty>();
		PreparedStatement ps2 = null;
		Connection con2 = null;
		con2 = ConnectionUtil.getConnection();
		ps2 = con2.prepareStatement(
				"Select pp.FIRST_NAME,pp.SURNAME,pp.ID,npp.BUSINESS_NAME,npp.BRANCH_ID,pp.RELATIONSHIP_TYPE from PERSONAL_PARTY pp inner join NON_PERSONAL_PARTY npp on pp.NP_ID=? AND npp.ID=?");
		ps2.setLong(1, busId);
		ps2.setLong(2, busId);
		AccParty ap;
		ResultSet rs2 = ps2.executeQuery();

		while (rs2.next() != false) {

			ap = new AccParty();
			ap.setFirstName(rs2.getString(1));
			ap.setSurname(rs2.getString(2));
			ap.setApName((new StringBuilder(String.valueOf(rs2.getString(1)))).append(" ").append(rs2.getString(2))
					.toString());
			ap.setApId(rs2.getInt(3));
			ap.setNpId(busId);
			ap.setRelationshipType(rs2.getString(6));
			accp.add(ap);
		}

		return accp;
	}

}