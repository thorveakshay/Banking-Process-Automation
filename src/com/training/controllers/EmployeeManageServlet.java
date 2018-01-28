package com.training.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.training.exception.EmployeeManagementException;
import com.training.model.Employee;
import com.training.services.EmployeeManageService;

/**
 * Servlet implementation class EmployeeManageServlet
 */
public class EmployeeManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EmployeeManageService empService = new EmployeeManageService();
	HttpSession session;
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmployeeManageServlet() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		/**
		 * Applying Session restriction
		 */
		HttpSession session = request.getSession(false);
		response.setHeader("Cache-Control", "no-cache"); // Forces caches to obtain a new copy of the page from the
															// origin server
		response.setHeader("Cache-Control", "no-store"); // Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); // Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0 backward compatibility

		if (session == null || session.getAttribute("username") == null) {
			response.sendRedirect(request.getContextPath());
			return;
		}

		if (action.equalsIgnoreCase("Home") || action.equals(null)) {
			response.sendRedirect(request.getContextPath() + "/jsp/AdminHome.jsp");

		}

		else if (action.equalsIgnoreCase("ViewEmployees")) {
			List<Employee> empList = new ArrayList<Employee>();
			try {
				empList = empService.getEmployee();
				request.setAttribute("EmployeeList", empList);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/SearchEmployee.jsp");
				rd.forward(request, response);
			} catch (EmployeeManagementException e) {

				request.setAttribute("error", "Employee you are trying to search doesn't exist.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

		} else if (action.equals("SearchDetails")) {

			// logger.info("reached Here");
			String name = request.getParameter("t1");
			String id = request.getParameter("t2");
			if (name.length() > 0) {
				List<Employee> empList = new ArrayList<Employee>();
				// logger.info(name);
				try {
					empList = empService.searchEmployeeByName(name);
					request.setAttribute("EmployeeList", empList);
					request.setAttribute("searchName", name);
					RequestDispatcher rd = request.getRequestDispatcher("jsp/SearchEmployee.jsp");
					rd.forward(request, response);
				} catch (EmployeeManagementException e) {

					request.setAttribute("error", "Employee you are trying to search doesnot exist.");
					RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
					rd.forward(request, response);
				}

			} else if (id.length() > 0) {
				// logger.info(id);
				Employee employee = null;
				long empId = Long.parseLong(id);
				logger.info("id of the employee for search" + empId);
				try {
					employee = empService.searchEmployeeById(empId);
					List<Employee> empList = new ArrayList<Employee>();
					empList.add(employee);
					request.setAttribute("EmployeeList", empList);
					// request.setAttribute("searchName", name);
					RequestDispatcher rd = request.getRequestDispatcher("jsp/SearchEmployee.jsp");
					rd.forward(request, response);

				} catch (EmployeeManagementException e) {

					request.setAttribute("error", "Employee you are trying to search does not exist.");
					RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
					rd.forward(request, response);
				}

			} else {

				request.setAttribute("error", "Employee you are trying to search is not available.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

		} else if (action.equalsIgnoreCase("viewComplete")) {
			long id = Long.parseLong(request.getParameter("id"));
			Employee e = new Employee();
			try {
				e = empService.searchEmployee(id);
				session = request.getSession();

				session.setAttribute("employee", e);
				logger.info("Status is " + e.getStatus());
				if (e.getStatus().equalsIgnoreCase("ACTIVE")) {
					RequestDispatcher rd = request.getRequestDispatcher("jsp/viewProfileA.jsp");

					rd.forward(request, response);
				} else if (e.getStatus().equalsIgnoreCase("INACTIVE")) {
					RequestDispatcher rd = request.getRequestDispatcher("jsp/viewProfileA.jsp");

					rd.forward(request, response);
				} else {
					logger.info("error");
				}
				List<String> gList = new ArrayList<String>();
				for (String string : gList) {
					logger.info(string);
				}

			} catch (EmployeeManagementException e1) {

				e1.printStackTrace();
				request.setAttribute("error", "Details of employee are not available");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

		}

		/**
		 * Passing the branches retrieved from database to registration page
		 * 
		 * @param action
		 */
		else if (action.equalsIgnoreCase("Register")) {
			List<String> branch = null;
			try {
				branch = empService.getBranch();
				// Checking the Group List
				logger.info("The elements in the Branch table are:");
				for (String branchName : branch) {
					logger.info(branchName);
				}

				request.setAttribute("branchList", branch);

				String fields = null;
				String first_name = null;
				String employee = null;
				String registration = null;
				String last_name = null;
				String Date_of_birth = null;
				String Role_of_Employee = null;
				String Select_Role = null;
				String ADMINISTRATOR = null;
				String BACKOFFICE_EMPLOYEE = null;
				String COMMERCIAL_ACCOUNT_OPENER = null;
				String HELPDESK_EMPLOYEE = null;
				String RELATIONSHIP_MANAGER = null;
				String Branch = null;
				String Select_Branch = null;
				String Date_of_Joining = null;
				String dmy = null;
				String Address = null;
				String ContactNumber = null;
				String Email_Id = null;
				String eg = null;
				String Group = null;
				String BB_CAO_Common = null;
				String Product = null;
				String Maintenance = null;
				String helpdesk = null;
				String Submit = null;
				String reset = null;
				if (null != session.getAttribute("message")) {

					fields = ((ResourceBundle) session.getAttribute("message")).getString("fields");
					first_name = ((ResourceBundle) session.getAttribute("message")).getString("first_name");
					employee = ((ResourceBundle) session.getAttribute("message")).getString("employee");
					registration = ((ResourceBundle) session.getAttribute("message")).getString("registration");
					last_name = ((ResourceBundle) session.getAttribute("message")).getString("last_name");
					Date_of_birth = ((ResourceBundle) session.getAttribute("message")).getString("Date_of_birth");
					Role_of_Employee = ((ResourceBundle) session.getAttribute("message")).getString("Role_of_Employee");
					Select_Role = ((ResourceBundle) session.getAttribute("message")).getString("Select_Role");
					ADMINISTRATOR = ((ResourceBundle) session.getAttribute("message")).getString("ADMINISTRATOR");
					BACKOFFICE_EMPLOYEE = ((ResourceBundle) session.getAttribute("message"))
							.getString("BACKOFFICE_EMPLOYEE");
					COMMERCIAL_ACCOUNT_OPENER = ((ResourceBundle) session.getAttribute("message"))
							.getString("COMMERCIAL_ACCOUNT_OPENER");
					HELPDESK_EMPLOYEE = ((ResourceBundle) session.getAttribute("message"))
							.getString("HELPDESK_EMPLOYEE");
					RELATIONSHIP_MANAGER = ((ResourceBundle) session.getAttribute("message"))
							.getString("RELATIONSHIP_MANAGER");
					Branch = ((ResourceBundle) session.getAttribute("message")).getString("Branch");
					Select_Branch = ((ResourceBundle) session.getAttribute("message")).getString("Select_Branch");
					Date_of_Joining = ((ResourceBundle) session.getAttribute("message")).getString("Date_of_Joining");
					dmy = ((ResourceBundle) session.getAttribute("message")).getString("(yyyy/mm/dd)");
					Address = ((ResourceBundle) session.getAttribute("message")).getString("Address");
					ContactNumber = ((ResourceBundle) session.getAttribute("message")).getString("Contact_Number");
					Email_Id = ((ResourceBundle) session.getAttribute("message")).getString("Email_Id");
					eg = ((ResourceBundle) session.getAttribute("message")).getString("eg");
					Group = ((ResourceBundle) session.getAttribute("message")).getString("Group");
					BB_CAO_Common = ((ResourceBundle) session.getAttribute("message")).getString("BB_CAO_Common");
					Product = ((ResourceBundle) session.getAttribute("message")).getString("Product");
					Maintenance = ((ResourceBundle) session.getAttribute("message")).getString("Maintenance");
					helpdesk = ((ResourceBundle) session.getAttribute("message")).getString("helpdesk");
					Submit = ((ResourceBundle) session.getAttribute("message")).getString("Submit");
					reset = ((ResourceBundle) session.getAttribute("message")).getString("reset");

				}
				request.setAttribute("fields", fields);
				request.setAttribute("first_name", first_name);
				request.setAttribute("employee", employee);
				request.setAttribute("registration", registration);
				request.setAttribute("last_name", last_name);
				request.setAttribute("Date_of_birth", Date_of_birth);
				request.setAttribute("Role_of_Employee", Role_of_Employee);
				request.setAttribute("Select_Role", Select_Role);
				request.setAttribute("ADMINISTRATOR", ADMINISTRATOR);
				request.setAttribute("BACKOFFICE_EMPLOYEE", BACKOFFICE_EMPLOYEE);
				request.setAttribute("COMMERCIAL_ACCOUNT_OPENER", COMMERCIAL_ACCOUNT_OPENER);
				request.setAttribute("HELPDESK_EMPLOYEE", HELPDESK_EMPLOYEE);
				request.setAttribute("RELATIONSHIP_MANAGER", RELATIONSHIP_MANAGER);
				request.setAttribute("Branch", Branch);
				request.setAttribute("Select_Branch", Select_Branch);
				request.setAttribute("Date_of_Joining", Date_of_Joining);
				request.setAttribute("dmy", dmy);
				request.setAttribute("Address", Address);
				request.setAttribute("Email_Id", Email_Id);
				request.setAttribute("eg", eg);
				request.setAttribute("Group", Group);
				request.setAttribute("BB_CAO_Common", BB_CAO_Common);
				request.setAttribute("Product", Product);
				request.setAttribute("Maintenance", Maintenance);
				request.setAttribute("helpdesk", helpdesk);
				request.setAttribute("Submit", Submit);
				request.setAttribute("reset", reset);

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/EmployeeRegistration.jsp");
				rd.forward(request, response);

			} catch (EmployeeManagementException e) {

				request.setAttribute("error", "Sorry employee cannot be registered.Try again.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

			// response.sendRedirect(request.getContextPath()+
			// "/jsp/EmployeeRegistration.jsp");

			/**
			 * Registering Employee for the first time
			 */
		} else if (action.equals("EmployeeDetails")) {
			EmployeeManageService empService = new EmployeeManageService();
			Employee employee = new Employee();
			boolean flag = false;

			String name = request.getParameter("fname");
			employee.setfName(name);
			String surname = request.getParameter("lname");
			employee.setlName(surname);
			if (request.getParameter("dob") != null) {
				String dob = request.getParameter("dob");
				employee.setDateOfBirth(dob);
			}
			// First time employee will be active by default
			employee.setStatus("ACTIVE");
			String post = request.getParameter("designation");
			employee.setDesignation(post);
			String branch = request.getParameter("branch");
			employee.setBranchName(branch);
			if (request.getParameter("datejoin") != null) {
				String doj = request.getParameter("datejoin");
				employee.setDateOfJoin(doj);
			}
			String address = request.getParameter("address");
			employee.setAddress(address);
			if (request.getParameter("contactNo") != null) {
				Long contactNum = Long.parseLong(request.getParameter("contactNo"));
				employee.setContactNumber(contactNum);
			}
			String email = request.getParameter("email");
			employee.setEmailId(email);
			String group[] = request.getParameterValues("chbox");
			List<String> groupList = new ArrayList<String>();
			for (int i = 0; i < group.length; i++) {
				logger.info("The GROUPS SELECTED ARE" + group[i]);
				groupList.add(group[i]);
			}
			employee.setGroups(groupList);
			try {
				flag = empService.addEmployee(employee);
				if (flag) {
					String message = "Employee has been added successfully";
					request.setAttribute("error", message);
					session = request.getSession();
					session.setAttribute("employee", employee);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/EmployeeSuccess.jsp");
					rd.forward(request, response);

				}

			} catch (EmployeeManagementException e) {
				e.printStackTrace();
				request.setAttribute("error", "Employee registration failed.Try again.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

		} else if (action.equals("Edit")) {
			Employee employee = new Employee();
			List<String> branch = null;
			try {
				branch = empService.getBranch();
				employee = (Employee) session.getAttribute("employee");
				session.setAttribute("employee", employee);
				request.setAttribute("branchList", branch);
				List<String> gList = employee.getGroups();
				for (String string : gList) {
					logger.info(string);
				}
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/UpdateEmployee.jsp");
				rd.forward(request, response);
			} catch (EmployeeManagementException e) {

				request.setAttribute("error", "Updating details of employee failed.Try again.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

			// response.sendRedirect(request.getContextPath()+"/jsp/UpdateEmployee.jsp");
		}

		else if (action.equals("UpdatedEmployeeDetails")) {
			boolean flag = false;
			Employee employee = null;
			employee = (Employee) session.getAttribute("employee");
			String name = request.getParameter("fname");
			employee.setfName(name);
			String surname = request.getParameter("lname");
			employee.setlName(surname);
			String dob = request.getParameter("dob");
			employee.setDateOfBirth(dob);
			String post = request.getParameter("designation");
			employee.setDesignation(post);
			String branch = request.getParameter("branch");
			employee.setBranchName(branch);
			String doj = request.getParameter("datejoin");
			employee.setDateOfJoin(doj);
			String address = request.getParameter("address");
			employee.setAddress(address);
			Long contactNum = Long.parseLong(request.getParameter("contactNo"));
			employee.setContactNumber(contactNum);
			String email = request.getParameter("email");
			employee.setEmailId(email);
			// String group[]=null;
			String group[] = request.getParameterValues("chbox");
			logger.info("The length of the group is" + group.length);

			List<String> groupList = new ArrayList<String>();
			for (int i = 0; i < group.length; i++) {
				logger.info("In SERVLET from an array" + group[i]);
				groupList.add(group[i]);
			}
			employee.setGroups(groupList);
			if (request.getParameter("status") != null) {
				String status = request.getParameter("status");
				employee.setStatus(status);

				try {
					flag = empService.updateStatus(employee);
					if (flag == true) {
						System.out.println("Status of Employee has been updated to:" + status);
					}
				} catch (EmployeeManagementException e) {

					request.setAttribute("error", "Status of employee cannot be updated.Try again.");
					RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
					rd.forward(request, response);
				}

			}
			if (request.getParameter("dateOfLeaving") != null && request.getParameter("reasonOfLeaving") != null) {
				String dateOfLeaving = request.getParameter("dateOfLeaving");
				employee.setDateOfLeaving(dateOfLeaving);

				String reasonOfLeaving = request.getParameter("reasonOfLeaving");
				employee.setReasonOfLeaving(reasonOfLeaving);

				try {
					flag = empService.updateDeactivationDetails(employee);
				} catch (EmployeeManagementException e) {

					request.setAttribute("error", "Details of employee cannot be updated.Try again.");
					RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
					rd.forward(request, response);
				}
			}

			EmployeeManageService empservice = new EmployeeManageService();
			try {
				flag = empservice.updateEmployeeDetails(employee);
				if (flag == true) {
					String message = "Data is updated successfully";
					session = request.getSession();
					session.setAttribute("employee", employee);
					request.setAttribute("error", message);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/EmployeeSuccess.jsp");
					rd.forward(request, response);

				} else {
					logger.info("not updated");
				}
			} catch (EmployeeManagementException e) {

				request.setAttribute("error", "Employee details cannot be updated.Try again.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

		} else if (action.equals("DeactivateEmployeeDetails")) {
			boolean flag = false;
			Employee employee = null;
			employee = (Employee) session.getAttribute("employee");
			if (request.getParameter("dateOfLeaving") != null && request.getParameter("reasonOfLeaving") != null) {
				String dateOfLeaving = request.getParameter("dateOfLeaving");
				employee.setDateOfLeaving(dateOfLeaving);

				String reasonOfLeaving = request.getParameter("reasonOfLeaving");
				employee.setReasonOfLeaving(reasonOfLeaving);
				String status = request.getParameter("status");
				employee.setStatus(status);
				try {
					flag = empService.updateDeactivationDetails(employee);
				} catch (EmployeeManagementException e) {

					request.setAttribute("error", "Employee cannot be deactivated.Please try again.");
					RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
					rd.forward(request, response);
				}
			}

			EmployeeManageService empservice = new EmployeeManageService();
			try {
				flag = empservice.updateEmployeeDetails(employee);
				if (flag == true) {
					String message = "Data is updated successfully";
					session = request.getSession();
					session.setAttribute("employee", employee);
					request.setAttribute("error", message);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/EmployeeSuccess.jsp");
					rd.forward(request, response);

				} else {
					logger.info("not updataed");
				}
			} catch (EmployeeManagementException e) {

				request.setAttribute("error", "Employee details cannot be updated.Please try again.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

		}

		else if (action.equals("activateEmployeeDetails")) {
			boolean flag = false;
			Employee employee = null;
			employee = (Employee) session.getAttribute("employee");

			String status = request.getParameter("status");
			employee.setStatus(status);
			employee.setDateOfLeaving(null);
			employee.setReasonOfLeaving(null);
			try {
				flag = empService.updateActivationDetails(employee);

			} catch (EmployeeManagementException e) {

				request.setAttribute("error", "Employee cannot be deactivated.Please try again.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

			EmployeeManageService empservice = new EmployeeManageService();
			try {
				flag = empservice.updateEmployeeDetails(employee);
				if (flag == true) {
					String message = "Data is updated successfully";
					session = request.getSession();
					session.setAttribute("employee", employee);
					request.setAttribute("error", message);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/EmployeeSuccess.jsp");
					rd.forward(request, response);

				} else {
					logger.info("not updataed");
				}
			} catch (EmployeeManagementException e) {

				request.setAttribute("error", "Employee details cannot be updated.Please try again.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

		}

		else if ("Deactivate".equalsIgnoreCase(action)) {
			Employee employee = (Employee) session.getAttribute("employee");
			session.setAttribute("employee", employee);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/EmployeeDeactivate.jsp");
			rd.forward(request, response);

		} else if ("Activate".equalsIgnoreCase(action)) {
			Employee employee = (Employee) session.getAttribute("employee");
			session.setAttribute("employee", employee);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/EmployeeActivate.jsp");
			rd.forward(request, response);

		}
	}
}
