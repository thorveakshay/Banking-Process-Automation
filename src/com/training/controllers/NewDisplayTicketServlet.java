package com.training.controllers;

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
import org.apache.tomcat.jni.Status;

import com.training.model.BusinessCustomer;
import com.training.model.Ticket;
import com.training.services.DisplayTicketService;
import com.training.services.LoadAssignedTicketService;

/**
 * Servlet implementation class DisplayTicketServlet
 */
public class NewDisplayTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(NewDisplayTicketServlet.class);
	int offset;
	int length;
	Long uid = null;

	List<Ticket> tickets;

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

		logger.info("In NewDisplayTicketServlet");
		DisplayTicketService dts = new DisplayTicketService();
		// ArrayList<Ticket> tickets=new ArrayList<Ticket>();

		HttpSession session;
		session = request.getSession();
		Long uid = Long.parseLong(session.getAttribute("uid").toString());
		List<BusinessCustomer> bList = new ArrayList<BusinessCustomer>();

		try {
			String ticketStatus = request.getParameter("ticketStatus");
			request.setAttribute("ticketStatus", ticketStatus);

			tickets = dts.getTickets(uid, ticketStatus);

			bList = dts.getBusinessCustomer((ArrayList<Ticket>) tickets);

		} catch (SQLException e) {

			e.printStackTrace();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}
		HttpSession httpSession;
		httpSession = request.getSession();

		httpSession.setAttribute("ticketArray", tickets);
		httpSession.setAttribute("businessList", bList);

		// logger.info("ticke array size is "+tickets.size());
		RequestDispatcher rd = request.getRequestDispatcher("jsp/DisplayTicket.jsp");
		rd.forward(request, response);
	}

}
