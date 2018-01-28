/**
 * 
 */
package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.training.exception.AssignRelationshipManagerException;
import com.training.model.*;
import com.training.utils.ConnectionUtil;

/**
 *  
 *
 */
public class AdditionalProductDao implements AdditionalProductDaoInterface {

	public ArrayList<AdditionalProduct> getAdditionalProductDetails(int productid)
			throws AssignRelationshipManagerException {
		ArrayList<AdditionalProduct> aplist = new ArrayList<AdditionalProduct>();
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select * from ADDITIONAL_PRODUCT " + "where apid in(select apid "
					+ "from MAIN_ADDITIONAL_PRODUCT where pid=?) ");
			ps.setInt(1, productid);
			ResultSet rs = ps.executeQuery();
			while (rs.next() != false) {
				AdditionalProduct ap = new AdditionalProduct();
				ap.setApId(rs.getInt(1));
				ap.setApName(rs.getString(2));
				aplist.add(ap);
			}

		} catch (SQLException e) {

			throw new AssignRelationshipManagerException("Unable to solve the query");
		} catch (ClassNotFoundException e) {

			throw new AssignRelationshipManagerException("Unable to get the details of relationship Manager");
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {

				throw new AssignRelationshipManagerException("Unable to solve the query");
			}

		}

		return aplist;
	}

}
