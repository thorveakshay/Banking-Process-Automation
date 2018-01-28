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
import com.training.model.Branch;
import com.training.model.RelationshipManager;
import com.training.utils.ConnectionUtil;

/**
 *  
 *
 */
public class AssignRelationshipManagerDao implements AssignRelationshipManagerDaoInterface {

	/* function to get list of relationship manager based on selected branch */
	public ArrayList<RelationshipManager> getDetails(String branch) throws AssignRelationshipManagerException {
		Connection con = null;
		PreparedStatement ps = null;
		ArrayList<RelationshipManager> rmlist = new ArrayList<RelationshipManager>();
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select e.id, e.first_name||' '||e.last_name,b.branch_name "
					+ "from employee e join branch b on e.branch_id=b.branch_id "
					+ "where e.branch_id=(select branch_id from BRANCH where branch_name=?) and e.designation='RELATIONSHIP MANAGER'");
			ps.setString(1, branch);
			ResultSet rs = ps.executeQuery();
			while (rs.next() != false) {
				RelationshipManager rm = new RelationshipManager();
				rm.setId((rs.getInt(1)));
				rm.setName(rs.getString(2));
				rm.setBranch(rs.getString(3));
				rmlist.add(rm);
			}

		} catch (ClassNotFoundException e) {

			throw new AssignRelationshipManagerException("Unable to get the details of relationship Manager");
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {

				throw new AssignRelationshipManagerException("Unable to process the query");
			}

		}
		return rmlist;
	}

	/* function to get the list of branch */
	public ArrayList<Branch> getBranchDetails(int npId) throws AssignRelationshipManagerException {
		Connection con = null;
		PreparedStatement ps = null;
		ArrayList<Branch> brlist = new ArrayList<Branch>();

		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement(
					"select * from branch where branch_id in (select branch from NON_PERSONAL_ACCOUNT where np_id=? group by branch)");
			ps.setInt(1, npId);
			ResultSet rs = ps.executeQuery();
			while (rs.next() != false) {
				Branch br = new Branch();
				br.setBranchId(rs.getString(1));
				br.setBranchName(rs.getString(2));
				br.setBranchAddress(rs.getString(3));
				brlist.add(br);

			}
		} catch (ClassNotFoundException e) {

			throw new AssignRelationshipManagerException("Unable to get the Branch List");
		} catch (SQLException e) {

			throw new AssignRelationshipManagerException("Unable to process the query");
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {

				throw new AssignRelationshipManagerException("Unable to process the query");
			}

		}

		return brlist;

	}

	// check is relationship manager is assigned to the business customer

	public String getRelationshipManager(int bcustid) throws AssignRelationshipManagerException {
		Connection con = null;
		PreparedStatement ps = null;

		String empname = null;

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"select first_name||' '||last_name from EMPLOYEE where id=(select rm_assigned from non_personal_party where id=?) and designation='RELATIONSHIP MANAGER'");
			ps.setInt(1, bcustid);
			ResultSet rs = ps.executeQuery();
			while (rs.next() != false) {
				empname = rs.getString(1);

			}

		} catch (SQLException e) {

			throw new AssignRelationshipManagerException("Unable to process the query");
		} catch (ClassNotFoundException e) {

			throw new AssignRelationshipManagerException("Unable to get the relationship manager List");
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {

				throw new AssignRelationshipManagerException("Unable to process the query");
			}

		}
		return empname;
	}

	// set relationship manager for the business customer

	public boolean setRelationshipManager(int bcustid, int relmgrid) throws AssignRelationshipManagerException {
		boolean flag = false;
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("UPDATE NON_PERSONAL_PARTY set RM_ASSIGNED=? " + "WHERE ID=?");
			ps.setInt(1, relmgrid);
			ps.setInt(2, bcustid);
			int i = ps.executeUpdate();
			if (i > 0) {
				flag = true;
			} else {
				flag = false;
			}

		} catch (SQLException e) {

			throw new AssignRelationshipManagerException("Unable to process the query");
		} catch (ClassNotFoundException e) {

			throw new AssignRelationshipManagerException("Unable to get the relationship manager List");
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {

				throw new AssignRelationshipManagerException("Unable to process the query");
			}

		}
		return flag;

	}

	// function to get the relationship manager id

	public int getRelationshipManagerId(int bcustid) throws AssignRelationshipManagerException {

		Connection con = null;
		PreparedStatement ps = null;
		int empid = 0;

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"select id from employee " + "where id=(select rm_assigned from non_personal_party where id=?)");
			ps.setInt(1, bcustid);
			ResultSet rs = ps.executeQuery();
			while (rs.next() != false) {
				empid = rs.getInt(1);

			}
		} catch (SQLException e) {

			throw new AssignRelationshipManagerException("Unable to process the query");
		} catch (ClassNotFoundException e) {

			throw new AssignRelationshipManagerException("Unable to get the relationship manager id");
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {

				throw new AssignRelationshipManagerException("Unable to process the query");
			}

		}
		return empid;
	}

	/* function to get the relationship manager name */

	public String getRelationshipManagerName(int rmid) throws AssignRelationshipManagerException {

		Connection con = null;
		PreparedStatement ps = null;
		String name = null;

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select first_name||' '||last_name from employee where id=?");
			ps.setInt(1, rmid);
			ResultSet rs = ps.executeQuery();
			while (rs.next() != false) {
				name = rs.getString(1);
			}
		} catch (SQLException e) {

			throw new AssignRelationshipManagerException("Unable to process the query");
		} catch (ClassNotFoundException e) {

			throw new AssignRelationshipManagerException("Unable to get the relationship manager name");
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {

				throw new AssignRelationshipManagerException("Unable to process the query");
			}

		}
		return name;

	}

	public ArrayList<Branch> getAllBranchDetails() throws AssignRelationshipManagerException {
		Connection con = null;
		PreparedStatement ps = null;
		ArrayList<Branch> brlist = new ArrayList<Branch>();

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select * from branch");

			ResultSet rs = ps.executeQuery();
			while (rs.next() != false) {
				Branch br = new Branch();
				br.setBranchId(rs.getString(1));
				br.setBranchName(rs.getString(2));
				br.setBranchAddress(rs.getString(3));
				brlist.add(br);

			}
		} catch (ClassNotFoundException e) {

			throw new AssignRelationshipManagerException("Unable to get the Branch List");
		} catch (SQLException e) {

			throw new AssignRelationshipManagerException("Unable to process the query");
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {

				throw new AssignRelationshipManagerException("Unable to process the query");
			}

		}

		return brlist;

	}
}
