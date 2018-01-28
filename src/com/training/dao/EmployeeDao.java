package com.training.dao;

import java.util.List;

import com.training.exception.EmployeeManagementException;
import com.training.model.Employee;

public interface EmployeeDao {
	public List<Employee> getEmployee() throws EmployeeManagementException;

	public List<Employee> searchEmployeeByName(String name) throws EmployeeManagementException;

	public Employee searchEmployee(long id) throws EmployeeManagementException;

	public boolean addEmployee(Employee emp) throws EmployeeManagementException;

	public Employee SearchById(long id) throws EmployeeManagementException;

	public boolean updateDetails(Employee employee) throws EmployeeManagementException;

	public boolean updateStatus(Employee employee) throws EmployeeManagementException;

	public boolean updateDeactivationDetails(Employee employee) throws EmployeeManagementException;

	public List<String> getBranch() throws EmployeeManagementException;

	public Employee SearchEmployeeById(long id) throws EmployeeManagementException;

	public boolean setPassword(long id, String password, String question, String answer);

	public String getPassword(long id);

	public boolean updateActivationDetails(Employee employee) throws EmployeeManagementException;

}
