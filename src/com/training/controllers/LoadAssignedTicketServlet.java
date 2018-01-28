package com.training.controllers;

import static com.training.constants.CaoConstants.ACTION;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.training.model.BusinessCustomer;
import com.training.model.Ticket;
import com.training.services.DisplayTicketService;
import com.training.services.LoadAssignedTicketService;

/**
 * Servlet implementation class LoadAssignedTicketServlet
 */
public class LoadAssignedTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int offset;
	int length;
	Long uid = null;
	String action;
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	List<Ticket> tickets;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadAssignedTicketServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		action = request.getParameter(ACTION);

		ArrayList<BusinessCustomer> bList = new ArrayList<BusinessCustomer>();

		if (action.equalsIgnoreCase("assignedTicketsByAdmin")) {
			Long adminUid;
			LoadAssignedTicketService lats = new LoadAssignedTicketService();
			DisplayTicketService dServ = new DisplayTicketService();

			ArrayList<Ticket> tickets = new ArrayList<Ticket>();

			HttpSession session;
			session = request.getSession();
			adminUid = Long.parseLong(session.getAttribute("uid").toString());
			logger.info("logged uid is " + adminUid);

			try {
				lats = new LoadAssignedTicketService();
				tickets = lats.getTicketsAssignedByAdmin(adminUid);// tickets assigned by admin

				// logger.info("making call to blist"+tickets.size());

				bList = dServ.getBusinessCustomer((ArrayList<Ticket>) tickets);
				// logger.info("not an error : fnameis "+bList.get(0).getBusinessName());

				if (bList.size() == 0) {
					session = request.getSession();

					session.setAttribute("msg1", "Sorry there are no assigned tickets");
				}
				HttpSession httpSession = request.getSession();

				httpSession.setAttribute("ticketArray", tickets);
				httpSession.setAttribute("bList", bList);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/DisplayTicketsAssignedByAdmin.jsp");
				rd.forward(request, response);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		if (action.equalsIgnoreCase("assignedTicket")) {

			DisplayTicketService dServ = new DisplayTicketService();

			LoadAssignedTicketService lats = new LoadAssignedTicketService();

			ArrayList<Ticket> tickets = new ArrayList<Ticket>();

			HttpSession session;
			session = request.getSession();
			uid = Long.parseLong(session.getAttribute("uid").toString());

			lats = new LoadAssignedTicketService();
			try {
				tickets = lats.getUnresolvedTickets(uid);
				logger.info("size of ticket list on loadAssignticket ===" + tickets.size());
				bList = dServ.getBusinessCustomer((ArrayList<Ticket>) tickets);
			} catch (SQLException e1) {

				e1.printStackTrace();
			} catch (ClassNotFoundException e1) {

				e1.printStackTrace();
			}

			session.setAttribute("bList", bList);
			session.setAttribute("ticketArray", tickets);

			// request.setAttribute("ticketArray",tickets);
			ArrayList<Ticket> tempTicketArray = null;

			try {
				tempTicketArray = lats.getUnresolvedTickets(uid);

			} catch (SQLException e) {

				e.printStackTrace();
			} catch (ClassNotFoundException e) {

				e.printStackTrace();
			}
			if (tempTicketArray.size() != 0) {

				request.setAttribute("msg", "TICKETS_ASSIGNED");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/DisplayAssignedTickets.jsp");
				rd.forward(request, response);
			}

			else {
				request.setAttribute("msg", "TICKETS_NOT_ASSIGNED");

				RequestDispatcher rd = request.getRequestDispatcher("jsp/DisplayAssignedTickets.jsp");
				rd.forward(request, response);

			}

		}

		if (action.equalsIgnoreCase("UnassignedTicket")) {
			logger.info("inside unassigned");
			DisplayTicketService dServ = new DisplayTicketService();
			LoadAssignedTicketService lats = new LoadAssignedTicketService();
			try {
				tickets = lats.getUnassignedTickets();
				bList = dServ.getBusinessCustomer((ArrayList<Ticket>) tickets);
				if (bList.size() == 0) {
					// session=request.getSession();

					request.setAttribute("msg1", "All tickets have been assigned. No unassigned tickets are available");
				}
			} catch (SQLException e) {

				e.printStackTrace();
			} catch (ClassNotFoundException e) {

				e.printStackTrace();
			}

			HttpSession httpSession = request.getSession();

			httpSession.setAttribute("ticketArray", tickets);
			httpSession.setAttribute("bList", bList);
			logger.info("at the end of unassigned");

			RequestDispatcher rd = request.getRequestDispatcher("jsp/DisplayUnassignedTickets.jsp");
			rd.forward(request, response);

		}

	}

}
