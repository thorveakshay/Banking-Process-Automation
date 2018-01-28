/**
 * 
 */
package com.training.services;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.training.dao.EmployeeDao;
import com.training.dao.EmployeeDaoImpl;
import com.training.exception.EmployeeManagementException;
import com.training.model.Employee;

/**
 *  
 *
 */
public class EmployeeManageService {
	EmployeeDao empDao;

	/*
	 * public boolean addEmployee(Employee employee) { boolean ans =
	 * empDao.addEmployee(employee); return ans; }
	 */
	public List<Employee> getEmployee() throws EmployeeManagementException {
		empDao = new EmployeeDaoImpl();
		List<Employee> empList = new ArrayList<Employee>();
		empList = empDao.getEmployee();
		return empList;

	}

	public List<Employee> searchEmployeeByName(String name) throws EmployeeManagementException {
		empDao = new EmployeeDaoImpl();
		List<Employee> empList = new ArrayList<Employee>();
		empList = empDao.searchEmployeeByName(name);
		return empList;
	}

	public Employee searchEmployee(long id) throws EmployeeManagementException {
		empDao = new EmployeeDaoImpl();
		Employee emp = new Employee();
		emp = empDao.searchEmployee(id);
		return emp;
	}

	boolean ans = false;

	public boolean addEmployee(Employee employee) throws EmployeeManagementException {
		empDao = new EmployeeDaoImpl();
		ans = empDao.addEmployee(employee);
		return ans;
	}
	/*
	 * public Employee searchById(long id) throws SQLException,
	 * ClassNotFoundException { Employee employee; employee = empDao.SearchById(id);
	 * return employee;
	 * 
	 * }
	 */

	public boolean updateEmployeeDetails(Employee employee) throws EmployeeManagementException {
		boolean flag = false;
		empDao = new EmployeeDaoImpl();
		flag = empDao.updateDetails(employee);
		return flag;

	}

	public boolean updateStatus(Employee e) throws EmployeeManagementException {
		boolean flag = false;
		empDao = new EmployeeDaoImpl();
		flag = empDao.updateStatus(e);
		return flag;
	}

	public boolean updateDeactivationDetails(Employee employee) throws EmployeeManagementException {
		boolean flag = false;
		empDao = new EmployeeDaoImpl();
		flag = empDao.updateDeactivationDetails(employee);
		return flag;
	}

	public List<String> getBranch() throws EmployeeManagementException {
		List<String> branchList;
		empDao = new EmployeeDaoImpl();
		branchList = empDao.getBranch();

		return branchList;

	}

	public Employee searchEmployeeById(long id) throws EmployeeManagementException {
		empDao = new EmployeeDaoImpl();
		Employee emp = empDao.SearchEmployeeById(id);
		return emp;
	}

	public boolean setPassword(long id, String password, String question, String answer) {
		boolean flag = false;
		empDao = new EmployeeDaoImpl();
		flag = empDao.setPassword(id, password, question, answer);
		return flag;
	}

	public String getPassword(long id) {
		empDao = new EmployeeDaoImpl();
		String password = empDao.getPassword(id);
		return password;
	}

	public boolean updateActivationDetails(Employee employee) throws EmployeeManagementException {
		boolean flag = false;
		empDao = new EmployeeDaoImpl();
		flag = empDao.updateActivationDetails(employee);
		return flag;
	}

}
