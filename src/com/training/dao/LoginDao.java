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
import com.training.exception.LoginException;
import com.training.utils.ConnectionUtil;

/**
 *  
 *
 */
public class LoginDao implements LoginDaoInterface {
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	@Override
	public boolean authenticateUser(int user, String Password) throws LoginException {

		boolean flag = false;
		Connection con = null;
		PreparedStatement ps = null;

		try {

			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"select password from login where emp_id=" + user + " and password='" + Password + "'");
			ResultSet rs = ps.executeQuery();
			logger.info("rs executed");

			if (rs.next() != false)
				flag = true;
			else
				flag = false;

		} catch (ClassNotFoundException e) {

			throw new LoginException("Please check the username and password");
		} catch (SQLException e) {
			throw new LoginException("Please check the username and password");
		}
		return flag;
	}

	@Override
	public String checkDesignation(int user) throws LoginException {
		Connection con = null;
		PreparedStatement ps = null;

		String designation = null;
		try {

			logger.info("in login designation");

			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select designation from employee where id=" + user);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				designation = rs.getString(1);

			}
		} catch (ClassNotFoundException e) {
			throw new LoginException("Please check the username and password");
		} catch (SQLException e) {
			throw new LoginException("Please check the username and password");
		}
		return designation;
	}

	@Override
	public String getUserName(int user) throws LoginException {

		Connection con = null;
		PreparedStatement ps = null;

		String username = null;
		try {

			logger.info("in login username");

			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select first_name||' '||last_name from employee where id=?");
			ps.setInt(1, user);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				username = rs.getString(1);
			}
		} catch (ClassNotFoundException e) {
			throw new LoginException("Please check the username and password");
		} catch (SQLException e) {
			throw new LoginException("Please check the username and password");
		}
		return username;
	}

	public boolean getLoginDetails(int username, String password) {
		Connection con = null;
		PreparedStatement ps = null;
		boolean flag = false;

		try {
			con = ConnectionUtil.getConnection();
			System.out.println("connected");
			ps = con.prepareStatement("select * from login where emp_id=? and password=?");
			ps.setInt(1, username);
			ps.setString(2, password);
			int i = ps.executeUpdate();
			if (i > 0) {
				System.out.println("rows:" + i);
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();

		} finally {

			try {
				con.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();

			}
		}

		return flag;
	}

}
