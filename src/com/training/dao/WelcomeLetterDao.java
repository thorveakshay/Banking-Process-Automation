/**
 * 
 */
package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import com.training.controllers.LoginServlet;
import com.training.exception.AssignRelationshipManagerException;
import com.training.model.CustomerAddress;
import com.training.utils.ConnectionUtil;

/**
 *  
 *
 */
public class WelcomeLetterDao implements WelcomeLetterInterface {

	// Get the address of the Customer
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	public CustomerAddress getAddress(int bcustid) throws AssignRelationshipManagerException {
		Connection con = null;
		PreparedStatement ps = null;

		CustomerAddress ca = null;
		ca = new CustomerAddress();
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"select building_no,building_name,street_name,city_name,town_name,country,postal_code from np_address where np_party_id=? and LOWER(address_type)='business address'");
			ps.setInt(1, bcustid);
			ResultSet rs = ps.executeQuery();
			while (rs.next() != false) {
				// set address fields
				ca.setBuildingNo(rs.getString(1));
				ca.setBuildingName(rs.getString(2));
				ca.setStreetName(rs.getString(3));
				ca.setCityName(rs.getString(4));
				ca.setTownName(rs.getString(5));
				ca.setCountry(rs.getString(6));
				ca.setPostalCode(rs.getString(7));
				logger.info("building no in welcome dao ==" + ca.getBuildingNo());
			}
		} catch (ClassNotFoundException e) {

			throw new AssignRelationshipManagerException("Unable to get the address of business customer");
		} catch (SQLException e) {

			throw new AssignRelationshipManagerException("Unable to solve the query");
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {

				throw new AssignRelationshipManagerException("Unable to solve the query");
			}

		}
		return ca;

	}
}
