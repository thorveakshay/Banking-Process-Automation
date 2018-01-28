package com.training.controllers;

import static com.training.constants.CaoConstants.*;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.training.exception.EmployeeManagementException;
import com.training.exception.LoginException;
import com.training.model.Employee;
import com.training.services.EmployeeManageService;
import com.training.services.LoginService;
import com.training.utils.AeSimpleSHA1;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String action = request.getParameter("action");

		String aboutUs = null;
		String aboutUsFirst = null;
		String aboutUsNext = null;
		String aboutUsNextAfter = null;
		if ("aboutUs".equals(action)) {
			if (null != request.getSession().getAttribute("message")) {
				aboutUs = ((ResourceBundle) request.getSession().getAttribute("message")).getString("aboutUs");
				aboutUsFirst = ((ResourceBundle) request.getSession().getAttribute("message"))
						.getString("aboutUsFirst");
				aboutUsNext = ((ResourceBundle) request.getSession().getAttribute("message")).getString("aboutUsNext");
				aboutUsNextAfter = ((ResourceBundle) request.getSession().getAttribute("message"))
						.getString("aboutUsNextAfter");

			}

			request.setAttribute("aboutUs", aboutUs);
			request.setAttribute("aboutUsFirst", aboutUsFirst);
			request.setAttribute("aboutUsNext", aboutUsNext);
			request.setAttribute("aboutUsNextAfter", aboutUsNextAfter);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/AboutUs.jsp");
			rd.forward(request, response);
		} else if ("contactUs".equals(action)) {
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/ContactUs.jsp");
			rd.forward(request, response);
		} else if (("help").equals(action)) {
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/Help.jsp");
			rd.forward(request, response);
		}

		else if (LOGINDETAILS.equals(action)) {
			logger.info("login servlet..");

			String empID = request.getParameter("username");

			String password = request.getParameter("password");
			String epassword = null;
			try {
				epassword = AeSimpleSHA1.SHA1(password);
			} catch (NoSuchAlgorithmException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			int username = 0;

			if (null != empID || null != epassword) {

				logger.info("User : " + empID);
				logger.info("Password : " + epassword);

				username = Integer.parseInt(empID);
			}

			// Authenticate the user
			boolean flag = false;
			LoginService lservice = new LoginService();
			try {
				flag = lservice.authenticateUser(username, epassword);
				logger.info("Authenticated");
				if (flag == true) {
					// If user is admin
					String designation = lservice.checkDesignation(username);
					String uname = lservice.getUserName(username);
					logger.info(uname);
					logger.info(designation);

					HttpSession sessionLogin = request.getSession(true);
					logger.info("Login Session ID: " + sessionLogin.getId());
					/*
					 * if(designation.equals("admin")) {
					 * 
					 * sessionLogin.setAttribute("user", username);
					 * sessionLogin.setAttribute("designation",designation);
					 * sessionLogin.setAttribute("uname",uname);
					 * response.sendRedirect(request.getContextPath()+"/jsp/AdminHome.jsp"); }
					 */
					/*
					 * else if(designation.equals("hdadmin")) {
					 * sessionLogin.setAttribute("LoggedUser", "ADMINISTRATOR");
					 * 
					 * RequestDispatcher rd = request .getRequestDispatcher("/jsp/Admin.jsp");
					 * rd.forward(request, response); }
					 */ if (designation.equals("ADMINISTRATOR")) {
						EmployeeManageService empService = new EmployeeManageService();
						Employee emp = null;
						try {
							emp = empService.searchEmployee(username);
						} catch (EmployeeManagementException e) {
							logger.error("Unable to Login");
						}

						sessionLogin.setAttribute("user", username);
						sessionLogin.setAttribute("uname", uname);
						sessionLogin.setAttribute("username", uname);
						// sessionLogin.setAttribute("designation","admin");
						sessionLogin.setAttribute("name", emp.getfName());
						sessionLogin.setAttribute("emp", emp);

						// for module c
						sessionLogin.setAttribute("uid", username);
						sessionLogin.setAttribute("pwd", password);
						sessionLogin.setAttribute("designation", "ADMINISTRATOR");
						sessionLogin.setAttribute("empName", uname);

						RequestDispatcher rd = request.getRequestDispatcher("/jsp/AdminHome.jsp");
						rd.forward(request, response);

					}
					// if user is commercial account opener
					else if (designation.equals("COMMERCIAL ACCOUNT OPENER")) {
						EmployeeManageService empService = new EmployeeManageService();
						Employee emp = null;
						try {
							emp = empService.searchEmployee(username);
						} catch (EmployeeManagementException e) {
							logger.error("Unable to Login");
						}

						sessionLogin.setAttribute("user", username);
						sessionLogin.setAttribute("uname", uname);
						sessionLogin.setAttribute("username", uname);
						sessionLogin.setAttribute("designation", "COMMERCIAL ACCOUNT OPENER");
						sessionLogin.setAttribute("name", emp.getfName());
						sessionLogin.setAttribute("emp", emp);
						response.sendRedirect(request.getContextPath() + "/jsp/AccountHome.jsp");
					} else if (designation.equalsIgnoreCase("HELPDESK EMPLOYEE")) {
						sessionLogin.setAttribute("LoggedUser", "HELPDESK EMPLOYEE");

						sessionLogin.setAttribute("user", username);
						sessionLogin.setAttribute("uname", uname);
						sessionLogin.setAttribute("username", uname);
						sessionLogin.setAttribute("uid", username);
						sessionLogin.setAttribute("pwd", password);
						sessionLogin.setAttribute("designation", designation);
						sessionLogin.setAttribute("empName", uname);

						RequestDispatcher rd = request.getRequestDispatcher("/jsp/HomeTicket.jsp");
						rd.forward(request, response);

					}

					else if (designation.equalsIgnoreCase("RELATIONSHIP MANAGER")) {

						sessionLogin.setAttribute("user", username);
						sessionLogin.setAttribute("uname", uname);
						sessionLogin.setAttribute("username", uname);

						sessionLogin.setAttribute("uid", username);
						sessionLogin.setAttribute("pwd", password);
						sessionLogin.setAttribute("designation", designation);
						sessionLogin.setAttribute("empName", uname);

						sessionLogin.setAttribute("LoggedUser", "RELATIONSHIP MANAGER");
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/ASPHome.jsp");
						rd.forward(request, response);
					}

					else if (designation.equalsIgnoreCase("BACKOFFICE EMPLOYEE")) {
						sessionLogin.setAttribute("user", username);
						sessionLogin.setAttribute("uname", uname);
						sessionLogin.setAttribute("username", uname);

						sessionLogin.setAttribute("uid", username);

						sessionLogin.setAttribute("pwd", password);
						sessionLogin.setAttribute("designation", designation);
						sessionLogin.setAttribute("empName", uname);

						sessionLogin.setAttribute("LoggedUser", "BACKOFFICE EMPLOYEE");

						RequestDispatcher rd = request.getRequestDispatcher("/jsp/backoffice.jsp");
						rd.forward(request, response);
					} else {
						logger.error("Expected designation is not found");
						throw new LoginException("Please check the username and password");
					}
				} else {
					logger.error("User cannot be authenticated");
					throw new LoginException("Please check the username and password");

				}
			} catch (LoginException e) {
				// Show the error message on same page
				logger.error("Username or password is not correct");
				request.getSession().setAttribute("user", "login");
				String message = e.getMessage();
				String firstMsg = message.substring(0, 25);
				String secondMsg = message.substring(25);
				request.setAttribute("msg", firstMsg);
				request.setAttribute("msgPass", secondMsg);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/index.jsp");
				rd.forward(request, response);
			}

		}

		else if (LOGOUT.equals(action)) {
			logger.info("Invalidating the session because of logout");
			request.getSession().invalidate();
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/index.jsp");
			rd.forward(request, response);
		}

		else if (HOME.equals(action)) {

			if (request.getSession().getAttribute("designation").equals("ADMINISTRATOR")) {
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/AdminHome.jsp");
				rd.forward(request, response);
			} else if (request.getSession().getAttribute("designation").equals("COMMERCIAL ACCOUNT OPENER")) {
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/AccountHome.jsp");
				rd.forward(request, response);
			} else if (request.getSession().getAttribute("designation").equals("RELATIONSHIP MANAGER")) {
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/ASPHome.jsp");
				rd.forward(request, response);
			} else if (request.getSession().getAttribute("designation").equals("BACKOFFICE EMPLOYEE")) {
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/backoffice.jsp");
				rd.forward(request, response);
			}

		} else if (LOGINHOME.equals(action)) {

			RequestDispatcher rd = request.getRequestDispatcher("/jsp/index.jsp");
			rd.forward(request, response);

		}

	}

}
