/**
 * 
 */
package com.training.model;

import java.util.ArrayList;
import java.util.List;

/**
 *  
 *
 */
public class EmployeeList {
	private List<Employee> empList = new ArrayList<Employee>();

	/**
	 * @return the empList
	 */
	public List<Employee> getEmpList() {
		return empList;
	}

	/**
	 * @param empList
	 *            the empList to set
	 */
	public void setEmpList(List<Employee> empList) {
		this.empList = empList;
	}

}
