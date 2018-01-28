package com.training.controllers;

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
import com.training.model.NonPersonalCustomer;
import com.training.model.PersonalParty;
import com.training.services.PersonalPartyServices;

/**
 * This Servlet implements the changes in Relationship of Account party
 */
public class NewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(NewServlet.class);

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

		logger.info("In NewServlet");

		String action = (String) request.getParameter("action");
		Long pp_id = (Long.parseLong(request.getParameter("idno")));
		// logger.info("in servlet ..."+pp_id);
		logger.debug("Personal Party Id:" + pp_id);
		if (action.equals("acc_tkt_hidden")) {
			logger.debug("Action is:" + action);
			String tktdesc1 = (String) request.getParameter("ticketdesc");
			String acc_id1 = (String) request.getParameter("acc_idno");
			long ticketId = Long.parseLong(request.getParameter("ticketId"));
			request.setAttribute("description", tktdesc1);
			request.setAttribute("show_acc_id", acc_id1);
			request.setAttribute("ticketId", ticketId);
			PersonalPartyServices pps = new PersonalPartyServices();
			PersonalParty pp;
			NonPersonalCustomer npc;
			try {
				pp = pps.searchPersonalParty(pp_id);
				npc = pps.searchNonPersonalParty(pp_id);
				long pp_Id = pp.getPartyId();
				logger.info("Part id in servlet " + pp_Id);
				request.setAttribute("personal_party_id", pp_Id);
				String relation = pp.getRelationshipType();
				request.setAttribute("party_relationship", relation);
				String fname = pp.getFirstName();
				request.setAttribute("party_fname", fname);
				String sname = pp.getSurName();
				request.setAttribute("party_sname", sname);
				String emailId = pp.getEmailId();
				request.setAttribute("party_email", emailId);
				request.setAttribute("businessName", npc.getBusinessName());
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/ShowPpRelationshipDetails.jsp");
				rd.forward(request, response);

			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("msg", msg);
				logger.error(msg);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
				rd.forward(request, response);

			}

		} else if (action.equals("show_pp_tckt_hidden")) {
			logger.debug("Action is:" + action);
			PersonalPartyServices pps = new PersonalPartyServices();
			String relation = (String) request.getParameter("txtrname");
			long ticketId = Long.parseLong(request.getParameter("ticketId"));
			try {
				boolean success = pps.updatePersonalPartyRelationship(relation, pp_id, ticketId);
				if (success) {

					String message = "Updation Done Successfully";
					request.setAttribute("msg", message);
					logger.info("Updation Done Successfully");
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/backoffice.jsp");
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
}
