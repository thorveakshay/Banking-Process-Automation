package com.training.controllers;

import static com.training.constants.CaoConstants.ACTION;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Employee;
import com.training.model.NonPersonalCustomer;
import com.training.model.PersonalParty;
import com.training.model.Ticket;
import com.training.services.GetTicketService;

/**
 * Servlet implementation class AssignTicketServlet
 */
public class AssignTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(LoginServlet.class);

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

		HttpSession newSession = request.getSession();

		logger.info(" In AssignTicketServlet");

		String action = request.getParameter(ACTION);
		// logger.info("action in assign ticket servlet :"+action);

		if (action.equalsIgnoreCase("displayTicket")) {
			logger.debug("action is:" + action);
			Ticket ticket = new Ticket();
			PersonalParty pp = new PersonalParty();
			NonPersonalCustomer npc = new NonPersonalCustomer();

			GetTicketService gts = new GetTicketService();
			// logger.info("inside dispatch");
			long tikid = Long.parseLong(request.getParameter("tikid"));
			// logger.info("tik id is "+tikid);

			String tiktitle = request.getParameter("tiktitle");
			String ticketPriority = (String) request.getParameter("tikpriorty");
			logger.debug("Ticket Title:" + tiktitle);
			// logger.info("tik title is "+tiktitle);
			try {
				ticket = gts.getTicketService(tikid);
				pp = gts.getPersonalPartyService(tikid);
				npc = gts.getNonPersonalCustomerService(tikid);
				ArrayList<Employee> emplist = new ArrayList<Employee>();
				emplist = gts.getEmployeelist();

				request.setAttribute("empList", emplist);

				request.setAttribute("ticket", ticket);
				request.setAttribute("personalParty", pp);
				request.setAttribute("nonPersonalParty", npc);

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/assignEmployee.jsp");
				rd.forward(request, response);

			} // try
			catch (Exception d) {
				d.printStackTrace();

			}

		} // if
		if (action.equalsIgnoreCase("reAssign")) {
			logger.debug("action is:" + action);
			Ticket ticket = new Ticket();
			PersonalParty pp = new PersonalParty();
			NonPersonalCustomer npc = new NonPersonalCustomer();

			GetTicketService gts = new GetTicketService();
			// logger.info("inside dispatch");
			long tikid = Long.parseLong(request.getParameter("tikid"));
			// logger.info("tik id is "+tikid);

			String tiktitle = request.getParameter("tiktitle");
			String ticketPriority = (String) request.getParameter("tikpriorty");
			logger.debug("Ticket Title:" + tiktitle);
			// logger.info("tik title is "+tiktitle);
			try {
				ticket = gts.getTicketService(tikid);
				pp = gts.getPersonalPartyService(tikid);
				npc = gts.getNonPersonalCustomerService(tikid);
				ArrayList<Employee> emplist = new ArrayList<Employee>();
				emplist = gts.getEmployeelist();

				request.setAttribute("empList", emplist);

				request.setAttribute("ticket", ticket);
				request.setAttribute("personalParty", pp);
				request.setAttribute("nonPersonalParty", npc);

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/ReAssignEmployee.jsp");
				rd.forward(request, response);

			} // try
			catch (Exception d) {
				d.printStackTrace();

			}

		} // if

		if (action.equalsIgnoreCase("ReassignEmployee")) {
			logger.debug("action is:" + action);
			long tikid = Long.parseLong(request.getParameter("tikid"));
			logger.debug("Ticket Id:" + tikid);
			// logger.info("tikkkk id is "+tikid);
			String empIdandEmpName = request.getParameter("empId");

			// logger.info("############### : "+empIdandEmpName);

			GetTicketService gts = new GetTicketService();
			// Long loggedUserId=1223l;
			HttpSession session;
			session = request.getSession();
			int i = 0;
			String s = empIdandEmpName;
			String temp[] = new String[7];
			String delim = "#";
			for (StringTokenizer st = new StringTokenizer(s, delim); st.hasMoreTokens();) {
				temp[i] = st.nextToken();
				i++;
			}
			// logger.info("emp id is : "+temp[0]);
			Long empid = Long.parseLong(temp[0]);

			String empName = temp[1];

			Long loggedUserId = Long.parseLong(session.getAttribute("uid").toString());// getting userid of logged user

			try {

				long prevEmp = Long.parseLong(request.getParameter("assignedTo"));
				Boolean chk = gts.reassignTicket(tikid, empid, loggedUserId, prevEmp);
				if (chk == false) {

					String msg = "No more tickets can be assigned to Mr/Ms " + empName + " .\n\nLimit reached";
					logger.debug("No more tickets can be assigned to Mr/Ms " + empName);
					// logger.info(msg);
					request.setAttribute("ticketSuccess", msg);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/Admin.jsp");
					rd.forward(request, response);

				} else {
					String msg = "Ticket assigned successfully";
					logger.info("Ticket assigned successfully");
					request.setAttribute("ticketSuccess", msg);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/Admin.jsp");
					rd.forward(request, response);
				}

				// logger.info("chk "+chk);
			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("msg", msg);
				logger.error("Error occured");
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
				rd.forward(request, response);

			}

		}

		if (action.equalsIgnoreCase("assignEmployee")) {
			logger.debug("action is:" + action);
			long tikid = Long.parseLong(request.getParameter("tikid"));
			logger.debug("Ticket Id:" + tikid);
			// logger.info("tikkkk id is "+tikid);
			String empIdandEmpName = request.getParameter("empId");

			// logger.info("############### : "+empIdandEmpName);

			GetTicketService gts = new GetTicketService();
			// Long loggedUserId=1223l;
			HttpSession session;
			session = request.getSession();
			int i = 0;
			String s = empIdandEmpName;
			String temp[] = new String[7];
			String delim = "#";
			for (StringTokenizer st = new StringTokenizer(s, delim); st.hasMoreTokens();) {
				temp[i] = st.nextToken();
				i++;
			}
			// logger.info("emp id is : "+temp[0]);
			Long empid = Long.parseLong(temp[0]);

			String empName = temp[1];

			Long loggedUserId = Long.parseLong(session.getAttribute("uid").toString());// getting userid of logged user

			try {
				Boolean chk = gts.assignTicket(tikid, empid, loggedUserId);
				if (chk == false) {

					String msg = "No more tickets can be assigned to Mr/Ms " + empName + " .\n\nLimit reached";
					logger.debug("No more tickets can be assigned to Mr/Ms " + empName);
					// logger.info(msg);
					request.setAttribute("ticketSuccess", msg);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/Admin.jsp");
					rd.forward(request, response);

				} else {
					String msg = "Ticket assigned successfully";
					logger.info("Ticket assigned successfully");
					request.setAttribute("ticketSuccess", msg);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/Admin.jsp");
					rd.forward(request, response);
				}

				// logger.info("chk "+chk);
			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("msg", msg);
				logger.error("Error occured");
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
				rd.forward(request, response);

			}

		}

		if (action.equalsIgnoreCase("updateTicket")) {
			logger.debug("action is:" + action);
			Ticket ticket = new Ticket();
			PersonalParty pp = new PersonalParty();
			NonPersonalCustomer npc = new NonPersonalCustomer();

			GetTicketService gts = new GetTicketService();
			// logger.info("inside dispatch");
			long tikid = Long.parseLong(request.getParameter("tikid"));
			// logger.info("tik id is "+tikid);

			String tiktitle = request.getParameter("tiktitle");

			// logger.info("tik title is "+tiktitle);
			try {
				ticket = gts.getTicketService(tikid);
				pp = gts.getPersonalPartyService(tikid);
				npc = gts.getNonPersonalCustomerService(tikid);
				ArrayList<Employee> emplist = new ArrayList<Employee>();
				emplist = gts.getEmployeelist();

				request.setAttribute("empList", emplist);

				request.setAttribute("ticket", ticket);
				request.setAttribute("personalParty", pp);
				request.setAttribute("nonPersonalParty", npc);

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/updateTicket.jsp");
				rd.forward(request, response);

			} // try
			catch (Exception d) {
				d.printStackTrace();

			}

		} // if
	}// do post

}
