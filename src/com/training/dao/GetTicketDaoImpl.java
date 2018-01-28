package com.training.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.sun.org.apache.bcel.internal.generic.GETSTATIC;
import com.training.controllers.LoginServlet;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Employee;
import com.training.model.NonPersonalCustomer;
import com.training.model.PersonalParty;
import com.training.model.Ticket;
import com.training.utils.ConnectionUtil;

public class GetTicketDaoImpl implements GetTicketDao {
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	public Boolean assignTicket(Long tikid, Long empid, Long loggedUserId) throws CommercialCustandAcctMaintenance {
		PreparedStatement ps = null;
		Connection con = null;
		Boolean flag = false;
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select PRIORITY from HELPDESK_TICKET where ID=?");

			ps.setLong(1, tikid);
			ResultSet rs2 = ps.executeQuery();
			rs2.next();
			String priority = rs2.getString(1);
			rs2.close();
			ps.close();
			con.close();

			if (priority.equals("Critical")) {
				con = ConnectionUtil.getConnection();
				ps = con.prepareStatement(
						"select count(*) from HELPDESK_TICKET t join TICKET_ASSIGNMENT ta on t.ID=ta.TICKET_ID and ta.ASSIGN_TO=? and t.status='ASSIGNED' and PRIORITY='Critical'");
				ps.setLong(1, empid);
				ResultSet rs1 = ps.executeQuery();
				rs1.next();
				Long chkLimit = rs1.getLong(1);
				// logger.info("!!!!!!!!!!!!!!!!!!!!!!!!!!! limit is "+chkLimit);
				if (chkLimit >= 5) {
					rs1.close();
					con.close();

					return false;

				}
				rs1.close();
				con.close();
			}
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement("insert into TICKET_ASSIGNMENT VALUES(?,?,?,sysdate)");
			Date d = new Date(0);

			ps.setLong(1, tikid);
			ps.setLong(2, empid);
			ps.setLong(3, loggedUserId);
			int i = ps.executeUpdate();
			if (i > 0) {
				flag = true;
			} else
				flag = false;
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

		ps = null;
		con = null;

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("Update HELPDESK_TICKET set STATUS='ASSIGNED' where ID=?");
			Date d = new Date(0);

			ps.setLong(1, tikid);

			int i = ps.executeUpdate();
			if (i > 0) {
				flag = true;
			} else
				flag = false;
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
			return flag;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	public ArrayList<Employee> getEmployeelist() throws CommercialCustandAcctMaintenance

	{
		Employee emp;
		ArrayList<Employee> empList = new ArrayList<Employee>();
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement(
					"select * from EMPLOYEE where STATUS='ACTIVE' and DESIGNATION='BACKOFFICE EMPLOYEE'");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				emp = new Employee();
				emp.setId(rs.getLong(1));
				emp.setDesignation(rs.getString(6));
				emp.setfName(rs.getString(3));
				emp.setlName(rs.getString(4));
				empList.add(emp);

			}
			ps.close();

			con.close();

			return empList;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	public Ticket getTicketDao(long id) throws CommercialCustandAcctMaintenance {
		Ticket tik = new Ticket();
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement("select * from HELPDESK_TICKET WHERE ID =?");

			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				tik.setId(id);
				tik.setTitle(rs.getString(2));
				tik.setSummary(rs.getString(3));
				tik.setRaisedOnDate(rs.getDate(4));
				tik.setNpId(rs.getLong(5));
				tik.setStatus(rs.getString(6));
				tik.setPriorityId(rs.getString(11));

			}

			con.close();

			con = ConnectionUtil.getConnection();
			logger.info("ticket id is " + id);

			ps = con.prepareStatement(
					"select TA.TICKET_ID,TA.ASSIGN_TO, E.FIRST_NAME, E.LAST_NAME from TICKET_ASSIGNMENT TA join EMPLOYEE E ON TA.ASSIGN_TO = E.ID AND TA.TICKET_ID=?");

			ps.setLong(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				tik.setAssignedToName(rs.getString(3) + " " + rs.getString(4));
				tik.setAssigned_to(rs.getLong(2));

			}

			ps.close();
			con.close();

		}

		catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

		return tik;

	}

	public NonPersonalCustomer getNonPersonalCustomer(long id) throws CommercialCustandAcctMaintenance {
		NonPersonalCustomer npc = new NonPersonalCustomer();

		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"select * from NON_PERSONAL_PARTY NP JOIN HELPDESK_TICKET HT ON HT.NP_ID = NP.ID JOIN BRANCH B ON B.BRANCH_ID = NP.BRANCH_ID WHERE HT.ID =?");
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				npc.setBusinessId(rs.getLong(1));
				npc.setBusinessName(rs.getString(2));
				npc.setTradingName(rs.getString(3));
				npc.setBusinessType(rs.getString(4));
				npc.setBankBranch(rs.getString(37));

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

	public PersonalParty getPersonalParty(long id) throws CommercialCustandAcctMaintenance {
		PersonalParty pp = new PersonalParty();

		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement(
					"select * from PERSONAL_PARTY PP JOIN HELPDESK_TICKET HT ON PP.ID = HT.P_ID WHERE HT.ID =?");
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				pp.setPartyId(rs.getLong(1));
				pp.setNpId(rs.getLong(2));
				pp.setTitle(rs.getString(3));
				pp.setFirstName(rs.getString(4));
				pp.setMiddleName(rs.getString(5));
				pp.setSurName(rs.getString(6));
				pp.setRelationshipType(rs.getString(7));
				pp.setKeyParty(rs.getString(8));
				pp.setIsExistingCustomer(rs.getString(9));
				pp.setEmailId(rs.getString(12));
				pp.setDateOfBirth(rs.getDate(13));

			}
			ps.close();
			con.close();
			return pp;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

	public Boolean reassignTicket(long tikid, Long empid, Long loggedUserId, Long prevEmp)
			throws CommercialCustandAcctMaintenance {
		logger.info("i am in reassign");
		PreparedStatement ps = null;
		Connection con = null;
		Boolean flag = false;
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select PRIORITY from HELPDESK_TICKET where ID=?");

			ps.setLong(1, tikid);
			ResultSet rs2 = ps.executeQuery();
			rs2.next();
			String priority = rs2.getString(1);
			rs2.close();
			ps.close();
			con.close();

			if (priority.equals("Critical")) {
				con = ConnectionUtil.getConnection();
				ps = con.prepareStatement(
						"select count(*) from HELPDESK_TICKET t join TICKET_ASSIGNMENT ta on t.ID=ta.TICKET_ID and ta.ASSIGN_TO=? and t.status='ASSIGNED' and PRIORITY='Critical'");
				ps.setLong(1, empid);
				ResultSet rs1 = ps.executeQuery();
				rs1.next();
				Long chkLimit = rs1.getLong(1);
				// logger.info("!!!!!!!!!!!!!!!!!!!!!!!!!!! limit is "+chkLimit);
				if (chkLimit >= 5) {
					rs1.close();
					con.close();

					return false;

				}
				rs1.close();
				con.close();
			}
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement(
					"update TICKET_ASSIGNMENT set ASSIGN_TO=? ,ASSIGNED_ON=sysdate,ASSIGN_BY=? where TICKET_ID=? and ASSIGN_TO=? ");
			Date d = new Date(0);

			ps.setLong(1, empid);
			ps.setLong(2, loggedUserId);

			ps.setLong(3, tikid);
			ps.setLong(4, prevEmp);

			int i = ps.executeUpdate();
			if (i > 0) {
				flag = true;
			} else
				flag = false;
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

		ps = null;
		con = null;

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("Update HELPDESK_TICKET set STATUS='ASSIGNED' where ID=?");
			Date d = new Date(0);

			ps.setLong(1, tikid);

			int i = ps.executeUpdate();
			if (i > 0) {
				flag = true;
			} else
				flag = false;
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
			return flag;
		} catch (ClassNotFoundException e) {
			throw new CommercialCustandAcctMaintenance("Class is not available");
		} catch (SQLException e) {
			throw new CommercialCustandAcctMaintenance("Database error is generated");
		}

	}

}