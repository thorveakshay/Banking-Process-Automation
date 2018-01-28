package com.training.controllers;

import static com.training.constants.CaoConstants.ACTION;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Ticket;
import com.training.services.CreateTicketService;
import com.training.services.DisplayTicketService;

/**
 * Servlet implementation class CreateTicketServlet
 */
public class CreateTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(CreateTicketServlet.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter(ACTION);

		logger.info("In create ticket servlet");

		CreateTicketService cts = new CreateTicketService();
		Ticket t = new Ticket();
		Ticket t1 = new Ticket();
		HttpSession session = request.getSession();

		// logger.info("create");
		if (action.equals("createticket")) {
			logger.debug("Action is:" + action);
			// int ticketId= Integer.parseInt(request.getParameter("ticketid"));
			String title = request.getParameter("title");
			String description = request.getParameter("desc");
			String date = request.getParameter("date");
			Long accId = Long.parseLong(request.getParameter("accountPartyID"));

			Long id = Long.parseLong(session.getAttribute("uid").toString());

			Long busid = Long.parseLong(request.getParameter("busid"));
			// logger.info(accId);
			String priority = (String) request.getParameter("priority");
			// t.setId(ticketId);
			t.setTitle(title);
			t.setSummary(description);
			t.setNpId(busid);
			t.setPid(accId);
			t.setPriorityId(priority);
			t.setRaised_by(id);
			logger.debug("Account Party Id:" + accId);
			try {

				// logger.info("in try");

				Long tikid = cts.createTicket(t);

				// ---------------setting values for the next page

				String busId = request.getParameter("busid");
				// logger.info("is"+busId);
				String busName = request.getParameter("busname");
				// long accId=Long.parseLong(request.getParameter("accountPartyID"));
				String accName = request.getParameter("accpName");
				String relationship = request.getParameter("relationshipType");
				String branchName = request.getParameter("brname");

				request.setAttribute("businessId", busId);
				request.setAttribute("businessName", busName);
				request.setAttribute("accId", accId);
				request.setAttribute("accName", accName);
				request.setAttribute("relationship", relationship);
				request.setAttribute("branchName", branchName);
				request.setAttribute("tktdesc", t.getSummary());
				request.setAttribute("tktstatus", t.getStatus());
				request.setAttribute("tktid", "" + tikid);
				request.setAttribute("title", title);
				request.setAttribute("priority", priority);

				RequestDispatcher rd = request.getRequestDispatcher("jsp/ShowTicketDetail.jsp");
				rd.forward(request, response);

			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("msg", msg);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
				rd.forward(request, response);
				logger.error("Sorry, Ticket not generated");
			}

		} else if (action.equals("Close")) {
			logger.debug("Action is:" + action);
			logger.info("List of Ticket");
			long tikId = Long.parseLong(request.getParameter("tikid"));
			String tikStatus = request.getParameter("tikstatus");
			DisplayTicketService dts = new DisplayTicketService();
			try {
				boolean flag = dts.closeTicket(tikId, tikStatus);
				if (flag) {
					String msg = "Ticket has been closed";
					request.setAttribute("msg", msg);

					RequestDispatcher rd = request.getRequestDispatcher("/jsp/HomeTicket.jsp");
					rd.forward(request, response);
				}
			} catch (SQLException e) {

			} catch (ClassNotFoundException e) {

				e.printStackTrace();
			}

		}

		else if (action.equals("Close1")) {

			logger.info("Ticket generated successfully");
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/HomeTicket.jsp");
			rd.forward(request, response);
		}
	}

}
