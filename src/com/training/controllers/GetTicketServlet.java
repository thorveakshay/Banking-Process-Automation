package com.training.controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Account;
import com.training.model.Address;
import com.training.model.NonPersonalCustomer;
import com.training.model.PersonalParty;
import com.training.model.Ticket;
import com.training.services.GetTicketService;
import com.training.services.VerifyCustomerService;

/**
 * Servlet implementation class GetTicketServlet
 */
public class GetTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(GetTicketServlet.class);

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

		logger.info("In GetTicketServlet");

		Ticket ticket = new Ticket();
		PersonalParty pp = new PersonalParty();
		NonPersonalCustomer npc = new NonPersonalCustomer();
		Account account = new Account();
		Address add = new Address();
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

			// account = gts.getAccountService(tikid);

			if (ticket.getTitle().equalsIgnoreCase("Add Account Party")) {
				logger.debug("Ticket Title:" + ticket.getTitle());
				request.setAttribute("ticket", ticket);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/CaptureBasicAccountPartyDetails.jsp");
				rd.forward(request, response);
			} else if (ticket.getTitle().equalsIgnoreCase("Update Business Customer Address")) {
				logger.debug("Ticket Title:" + ticket.getTitle());
				request.setAttribute("ticket", ticket);
				request.setAttribute("personalParty", pp);
				request.setAttribute("nonPersonalParty", npc);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/UpdateNppAddressDetails.jsp");
				rd.forward(request, response);
			} else if (ticket.getTitle().equalsIgnoreCase("Delete Account Party")) {
				logger.debug("Ticket Title:" + ticket.getTitle());
				request.setAttribute("ticket", ticket);
				RequestDispatcher rd = request.getRequestDispatcher("#");
				rd.forward(request, response);
			} else if (ticket.getTitle().equalsIgnoreCase("Update Business Customer Contact")) {
				logger.debug("Ticket Title:" + ticket.getTitle());
				request.setAttribute("ticket", ticket);
				request.setAttribute("personalParty", pp);
				request.setAttribute("nonPersonalParty", npc);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/UpdateNppContactDetails.jsp");
				rd.forward(request, response);

			} else if (ticket.getTitle().equalsIgnoreCase("Change Account Title")) {
				logger.debug("Ticket Title:" + ticket.getTitle());
				request.setAttribute("ticket", ticket);
				request.setAttribute("nonPersonalParty", npc);

				ArrayList<Account> acl = new ArrayList<Account>();
				VerifyCustomerService vcs = new VerifyCustomerService();

				acl = vcs.get_account_list(npc.getBusinessId());

				request.setAttribute("accountlist", acl);
				request.setAttribute("tikId", "" + tikid);

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/UpdateAccountTitle.jsp");
				rd.forward(request, response);
			} else if (ticket.getTitle().equalsIgnoreCase("Update Account Party Contact")) {
				logger.debug("Ticket Title:" + ticket.getTitle());
				request.setAttribute("ticket", ticket);
				request.setAttribute("pesonalParty", pp);
				request.setAttribute("nonPersonalParty", npc);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/UpdatePpContact.jsp");
				rd.forward(request, response);
			} else if (ticket.getTitle().equalsIgnoreCase("Update Account Party Relationship")) {
				logger.debug("Ticket Title:" + ticket.getTitle());
				request.setAttribute("ticket", ticket);
				request.setAttribute("personalParty", pp);
				request.setAttribute("nonPersonalParty", npc);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/UpdatePpRelationship.jsp");
				rd.forward(request, response);
			} else if (ticket.getTitle().equalsIgnoreCase("Update Account Party Address")) {
				logger.debug("Ticket Title:" + ticket.getTitle());
				request.setAttribute("ticket", ticket);
				request.setAttribute("personalParty", pp);
				request.setAttribute("nonPersonalParty", npc);
				request.setAttribute("partyAddress", add);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/UpdatePpAddress.jsp");
				rd.forward(request, response);
			}

		} catch (CommercialCustandAcctMaintenance e) {
			String msg = e.getMessage();
			request.setAttribute("msg", msg);
			logger.error(msg);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
			rd.forward(request, response);

		}

	}

}
