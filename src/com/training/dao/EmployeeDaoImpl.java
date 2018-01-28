/**
 * 
 */
package com.training.dao;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.training.controllers.LoginServlet;
import com.training.exception.EmployeeManagementException;
import com.training.model.Employee;
import com.training.utils.AeSimpleSHA1;
import com.training.utils.ConnectionUtil;

/**
 *  
 * 
 */
public class EmployeeDaoImpl implements EmployeeDao {
	Employee emp = new Employee();
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	/*
	 * public boolean addEmployee(Employee employee) throws SQLException { boolean
	 * flag = false; PreparedStatement ps = null; Connection con = null; ps =
	 * con.prepareStatement("alter table Employee modify ID AUTO_INCREMENT"); ps =
	 * con.prepareStatement("insert into Employee values(?,?,?,?,?,?,?,?,?,?,?);" );
	 * ps.setString(1,emp.g); ps.setString(2,emp.getfName());
	 * ps.setString(3,emp.getlName()); ps.setString(4,emp.getDesignation());
	 * ps.setString(2,emp.getfName()); ps.setString(2,emp.getfName());
	 * ps.setString(2,emp.getfName()); ps.setString(2,emp.getfName());
	 * ps.setString(2,emp.getfName());
	 * 
	 * return flag; }
	 */
	@Override
	public List<Employee> getEmployee() throws EmployeeManagementException {
		List<Employee> empList = new ArrayList<Employee>();
		PreparedStatement ps = null;
		Connection con = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select * from EMPLOYEE ");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Employee emp = new Employee();
				emp.setId(rs.getLong(1));
				emp.setfName(rs.getString(3));
				emp.setlName(rs.getString(4));
				String dob = sdf.format(rs.getDate(5));

				emp.setDateOfBirth(dob);
				// emp.setDateOfBirth(rs.getString(5));
				emp.setDesignation(rs.getString(6));
				emp.setDateOfJoin(rs.getString(7));
				emp.setAddress(rs.getString(10));
				emp.setContactNumber(rs.getLong(11));
				emp.setEmailId(rs.getString(12));

				empList.add(emp);
			}
		} catch (ClassNotFoundException e) {
			throw new EmployeeManagementException();
		} catch (SQLException e) {
			throw new EmployeeManagementException();
		}

		return empList;

	}

	@Override
	public List<Employee> searchEmployeeByName(String name) throws EmployeeManagementException {
		List<Employee> empList = new ArrayList<Employee>();
		PreparedStatement ps = null;
		Connection con = null;

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select * from EMPLOYEE where FIRST_NAME=? and rownum<=10");
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Employee emp = new Employee();
				emp.setId(rs.getLong(1));
				emp.setfName(rs.getString(3));
				emp.setlName(rs.getString(4));
				emp.setDateOfBirth(rs.getString(5));
				emp.setDesignation(rs.getString(6));
				emp.setDateOfJoin(rs.getString(7));
				emp.setAddress(rs.getString(10));
				emp.setContactNumber(rs.getLong(11));
				emp.setEmailId(rs.getString(12));

				empList.add(emp);
			}

		} catch (ClassNotFoundException e) {
			throw new EmployeeManagementException();
		} catch (SQLException e) {
			throw new EmployeeManagementException();
		}
		return empList;

	}

	@Override
	public Employee searchEmployee(long id) throws EmployeeManagementException {
		Employee emp = new Employee();
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		Connection con = null;

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"select ID,STATUS,FIRST_NAME,LAST_NAME,to_char(DATE_OF_BIRTH,'yyyy/MM/dd'),DESIGNATION,to_char(DATE_OF_JOINING,'yyyy/MM/dd'),to_char(DATE_OF_LEAVING,'yyyy/MM/dd'),REASON_FOR_LEAVING,ADDRESS,CONTACT,EMAIL from EMPLOYEE where ID=?");
			ps.setLong(1, id);
			ps1 = con.prepareStatement("select GROUP_NAME from GROUPS where EMP_ID=?");
			ps1.setLong(1, id);
			ps2 = con.prepareStatement("select BRANCH_ID from EMPLOYEE where ID=?");
			ps2.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				emp.setId(rs.getLong(1));
				emp.setStatus(rs.getString(2));
				emp.setfName(rs.getString(3));
				emp.setlName(rs.getString(4));
				emp.setDateOfBirth(rs.getString(5));
				emp.setDesignation(rs.getString(6));
				emp.setDateOfJoin(rs.getString(7));
				emp.setDateOfLeaving(rs.getString(8));
				emp.setReasonOfLeaving(rs.getString(9));
				emp.setAddress(rs.getString(10));
				emp.setContactNumber(rs.getLong(11));
				emp.setEmailId(rs.getString(12));

			}
			ResultSet rs1 = ps1.executeQuery();
			List<String> gList = new ArrayList<String>();
			// int i=1;
			if (rs1 != null) {
				while (rs1.next()) {
					gList.add(rs1.getString(1));

				}
				emp.setGroups(gList);
			} else {
				logger.info("No entries Found");
			}
			ResultSet rs2 = ps2.executeQuery();
			rs2.next();
			String BranchId = rs2.getString(1);
			ps3 = con.prepareStatement("select BRANCH_NAME from BRANCH where BRANCH_ID=?");
			ps3.setString(1, BranchId);
			ResultSet rs3 = ps3.executeQuery();
			rs3.next();
			emp.setBranchName(rs3.getString(1));

		} catch (ClassNotFoundException e) {
			throw new EmployeeManagementException();
		} catch (SQLException e) {
			throw new EmployeeManagementException();
		}

		return emp;
	}

	@Override
	public boolean addEmployee(Employee emp) throws EmployeeManagementException {
		boolean flag = false;
		PreparedStatement ps = null;
		Connection con = null;
		List<String> empList = new ArrayList<String>();

		empList = emp.getGroups();
		try {
			con = ConnectionUtil.getConnection();
			// ps = con
			// .prepareStatement("alter table Employee modify ID AUTO_INCREMENT");
			// ps =
			// con.prepareStatement("insert into
			// Employee(ID,STATUS,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,DESIGNATION,DATE_OF_JOINING,ADDRESS,CONTACT,EMAIL)
			// VALUES
			// (ID.nextval,'ACTIVE',?,?,to_date(?,'yyyy/mm/dd'),?,to_date(?,'yyyy/mm/dd'),?,?,?)");
			// ps =
			// con.prepareStatement("insert into
			// Employee(ID,STATUS,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,DESIGNATION,DATE_OF_JOINING,ADDRESS,CONTACT,EMAIL)
			// VALUES
			// (ID.nextval,'ACTIVE',?,?,to_date('1989/10/12','yyyy/mm/dd'),?,to_date('2012/11/07','yyyy/mm/dd'),?,?,?)");
			ps = con.prepareStatement(
					"insert into Employee(ID,STATUS,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,DESIGNATION,DATE_OF_JOINING,ADDRESS,CONTACT,EMAIL) VALUES (ID.nextval,'ACTIVE',?,?,to_date(?,'yyyy/mm/dd'),?,to_date(?,'yyyy/mm/dd'),?,?,?)");
			// ps.setString(2,emp.getStatus());

			ps.setString(1, emp.getfName());
			ps.setString(2, emp.getlName());
			ps.setString(3, emp.getDateOfBirth());
			ps.setString(4, emp.getDesignation());
			ps.setString(5, emp.getDateOfJoin());
			ps.setString(6, emp.getAddress());
			ps.setLong(7, emp.getContactNumber());
			ps.setString(8, emp.getEmailId());

			/*
			 * correct code ps.setString(1,emp.getfName()); ps.setString(2,emp.getlName());
			 * // ps.setString(3,emp.getDateOfBirth());
			 * ps.setString(3,emp.getDesignation()); // ps.setString(3,"Administrator"); //
			 * ps.setString(5,emp.getDateOfJoin()); ps.setString(4,emp.getAddress());
			 * ps.setLong(5,emp.getContactNumber()); ps.setString(6,emp.getEmailId());
			 */

			int i = ps.executeUpdate();
			if (i > 0) {

				for (String string : empList) {
					ps = con.prepareStatement("insert into GROUPS(EMP_ID,GROUP_NAME) values(ID.currval,?)");
					ps.setString(1, string);
					int j = ps.executeUpdate();
					if (j > 0) {
						flag = true;
					}

				}

			}
			// UPDATING VALUES IN EMPLOYEE Model class
			long id = 0;
			emp.setStatus("ACTIVE");
			ps = con.prepareStatement("select ID.currval from EMPLOYEE");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				id = rs.getLong(1);
			}
			emp.setId(id);

			// Setting Branch Id for the employee
			String branch = emp.getBranchName();
			// ps=con.prepareStatement("insert into EMPLOYEE(BRANCH_ID) values (select
			// BRANCH_ID from BRANCH where BRANCH_NAME=?)) ");
			ps = con.prepareStatement(
					"update EMPLOYEE set BRANCH_ID=(select BRANCH_ID from BRANCH where BRANCH_NAME=?)where ID=?");
			ps.setString(1, branch);
			ps.setLong(2, emp.getId());
			i = ps.executeUpdate();

			if (i > 0) {
				flag = true;
			}

			// Adding Login Details for the Employee
			// ps=null;
			flag = false;
			// String password="ChangePassword";
			ps = con.prepareStatement("insert into LOGIN(EMP_ID,PASSWORD) values(ID.currval,?)");
			// ps.setLong(1, id);
			String epassword = AeSimpleSHA1.SHA1(emp.getDateOfBirth());
			ps.setString(1, epassword);
			i = ps.executeUpdate();
			if (i > 0) {
				flag = true;
			}

		} catch (SQLException e) {
			throw new EmployeeManagementException();
		} catch (ClassNotFoundException e) {
			throw new EmployeeManagementException();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {
				throw new EmployeeManagementException();
			}

		}

		return flag;

	}

	@Override
	public Employee SearchById(long id) throws EmployeeManagementException {
		List<String> groupList = new ArrayList<String>();
		int i = 0;
		// boolean flag = false;
		PreparedStatement ps = null;
		Connection con = null;
		Employee emp = new Employee();
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select * from EMPLOYEE where ID=?");
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			emp.setfName(rs.getString(3));
			emp.setlName(rs.getString(4));
			emp.setDateOfBirth(rs.getString(5));
			emp.setDesignation(rs.getString(6));
			emp.setDateOfJoin(rs.getString(7));
			emp.setContactNumber(Long.parseLong(rs.getString(11)));
			emp.setAddress(rs.getString(10));
			emp.setEmailId(rs.getString(12));
			ConnectionUtil.closeConnection(con);
			ConnectionUtil.closeStatement(ps);
			// ps =
			// con.prepareStatement("select * from GROUPS g inner join EMPLOYEE e on e.ID =
			// g.EMP_ID where(select g.EMP_ID in(select e.ID where FIRST_NAME=?));");
			con = ConnectionUtil.getConnection();

			ps = con.prepareStatement("select * from GROUPS where EMP_ID=?");
			ps.setLong(1, id);
			ResultSet rs1 = ps.executeQuery();
			while (rs1.next()) {
				groupList.add(rs1.getString(i));
				i++;
			}
			emp.setGroups(groupList);
		} catch (SQLException e) {
			throw new EmployeeManagementException();
		} catch (ClassNotFoundException e) {
			throw new EmployeeManagementException();
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {
				throw new EmployeeManagementException();
			}

		}
		return emp;

	}

	@Override
	public boolean updateDetails(Employee employee) throws EmployeeManagementException {
		Connection con = null;
		PreparedStatement ps = null;
		boolean flag = false;
		List<String> groupList = new ArrayList<String>();
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"update EMPLOYEE set FIRST_NAME = ?,LAST_NAME=?,DATE_OF_BIRTH=to_date(?,'yyyy/MM/dd'),DESIGNATION=?,DATE_OF_JOINING=to_date(?,'yyyy/MM/dd'),ADDRESS=?,CONTACT=?,EMAIL=? where ID=?");
			ps.setString(1, employee.getfName());
			ps.setString(2, employee.getlName());
			ps.setString(3, employee.getDateOfBirth());
			ps.setString(4, employee.getDesignation());
			ps.setString(5, employee.getDateOfJoin());
			ps.setString(6, employee.getAddress());
			ps.setLong(7, employee.getContactNumber());
			ps.setString(8, employee.getEmailId());
			ps.setLong(9, employee.getId());
			logger.info("Id os Employee as in database is " + employee.getId());
			int i = ps.executeUpdate();
			if (i > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			throw new EmployeeManagementException();
		} catch (ClassNotFoundException e) {
			throw new EmployeeManagementException();
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {
				throw new EmployeeManagementException();
			}

		}
		con = null;
		ps = null;

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("delete from GROUPS where EMP_ID=?");
			ps.setLong(1, employee.getId());
			int i = ps.executeUpdate();
			if (i > 0) {
				flag = true;
			}

		} catch (ClassNotFoundException e) {

			throw new EmployeeManagementException();
		} catch (SQLException e) {
			throw new EmployeeManagementException();
		}

		groupList = employee.getGroups();
		for (int t = 0; t < groupList.size(); t++) {
			logger.info("In Dao" + groupList.get(t));
		}
		con = null;
		ps = null;

		try {
			con = ConnectionUtil.getConnection();
			for (int y = 0; y < groupList.size(); y++) {
				ps = con.prepareStatement("insert into GROUPS(EMP_ID,GROUP_NAME) values(?,?)");
				ps.setLong(1, employee.getId());
				ps.setString(2, groupList.get(y));
				ps.executeQuery();
				ps = null;
				flag = true;
				logger.info("Value of Group in Dao" + groupList.get(y));
			}
		} catch (ClassNotFoundException e) {
			throw new EmployeeManagementException();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}

	@Override
	public boolean updateStatus(Employee employee) throws EmployeeManagementException {
		boolean flag = false;
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("update EMPLOYEE set STATUS=? where ID=?");
			ps.setString(1, employee.getStatus());
			ps.setLong(2, employee.getId());
			int i = ps.executeUpdate();
			if (i > 0) {
				flag = true;
			}
		} catch (ClassNotFoundException e) {
			throw new EmployeeManagementException();
		} catch (SQLException e) {
			throw new EmployeeManagementException();
		}

		return flag;
	}

	@Override
	public boolean updateDeactivationDetails(Employee employee) throws EmployeeManagementException {
		boolean flag = false;
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"update EMPLOYEE set DATE_OF_LEAVING=to_date(?,'yyyy/MM/dd'),REASON_FOR_LEAVING=?,STATUS=? where ID=?");
			ps.setString(1, employee.getDateOfLeaving());
			ps.setString(2, employee.getReasonOfLeaving());
			ps.setString(3, employee.getStatus());
			ps.setLong(4, employee.getId());
			int i = ps.executeUpdate();
			if (i > 0) {
				flag = true;
			}
		} catch (ClassNotFoundException e) {
			throw new EmployeeManagementException();
		} catch (SQLException e) {
			throw new EmployeeManagementException();
		}

		return flag;
	}

	@Override
	public List<String> getBranch() throws EmployeeManagementException {
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
			throw new EmployeeManagementException();
		} catch (SQLException e) {
			throw new EmployeeManagementException();
		}

		return branchName;
	}

	@Override
	public Employee SearchEmployeeById(long id) throws EmployeeManagementException {
		PreparedStatement ps = null;
		Connection con = null;
		Employee emp = new Employee();
		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select * from EMPLOYEE where ID=?");
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			emp.setId(rs.getLong(1));
			emp.setStatus(rs.getString(2));
			emp.setfName(rs.getString(3));
			emp.setlName(rs.getString(4));
			emp.setDateOfBirth(rs.getString(5));
			emp.setDesignation(rs.getString(6));
			emp.setDateOfJoin(rs.getString(7));
			emp.setContactNumber(Long.parseLong(rs.getString(11)));
			emp.setAddress(rs.getString(10));
			emp.setEmailId(rs.getString(12));

		} catch (ClassNotFoundException e) {
			throw new EmployeeManagementException();
		} catch (SQLException e) {
			throw new EmployeeManagementException();
		} finally {
			try {
				ConnectionUtil.closeConnection(con);
				ConnectionUtil.closeStatement(ps);
			} catch (SQLException e) {
				throw new EmployeeManagementException();
			}

		}
		return emp;
	}

	@Override
	public boolean setPassword(long id, String password, String question, String answer) {
		boolean flag = false;
		PreparedStatement ps = null;
		Connection con = null;

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"update LOGIN set PASSWORD=?,SECURITY_QUESTION=?,SECURITY_ANSWER=? where EMP_ID=?");
			ps.setString(1, password);
			ps.setString(2, question);
			ps.setString(3, answer);
			ps.setLong(4, id);

			int i = ps.executeUpdate();
			if (i > 0) {
				flag = true;
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}

	@Override
	public String getPassword(long id) {
		PreparedStatement ps = null;
		Connection con = null;
		String password = "";

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement("select PASSWORD from LOGIN where EMP_ID=?");
			ps.setLong(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				password = rs.getString(1);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return password;
	}
	// search username from Id
	/*
	 * public Employee searchUsername(String username) { PreparedStatement ps =
	 * null; Connection con = null; String password=""; String userFname= null;
	 * String userLname= null; Employee emp = new Employee(); try { con =
	 * ConnectionUtil.getConnection(); ps =
	 * con.prepareStatement("select FIRST_NAME,LAST_NAME from EMPLOYEE where ID=?");
	 * ps.setLong(1, Long.parseLong(username)); ResultSet rs=ps.executeQuery();
	 * while(rs.next()) { userFname=rs.getString(1); emp.setfName(userFname);
	 * userLname = rs.getString(2); emp.setlName(userLname); } }catch
	 * (ClassNotFoundException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } catch (SQLException e) { // TODO Auto-generated catch
	 * block e.printStackTrace(); } return emp; }
	 */

	@Override
	public boolean updateActivationDetails(Employee employee) throws EmployeeManagementException {
		boolean flag = false;
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ConnectionUtil.getConnection();
			ps = con.prepareStatement(
					"update EMPLOYEE set DATE_OF_LEAVING='',REASON_FOR_LEAVING='',STATUS=? where ID=?");
			// ps.setString(1,employee.getDateOfLeaving());
			// ps.setString(2,employee.getReasonOfLeaving());
			ps.setString(1, employee.getStatus());

			ps.setLong(2, employee.getId());
			int i = ps.executeUpdate();
			if (i > 0) {
				emp.setDateOfLeaving(null);
				emp.setReasonOfLeaving(null);
				flag = true;
			}
		} catch (ClassNotFoundException e) {
			throw new EmployeeManagementException();
		} catch (SQLException e) {
			throw new EmployeeManagementException();
		}

		return flag;
	}
}
