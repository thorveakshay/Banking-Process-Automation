package com.training.controllers;

import static com.training.constants.CaoConstants.ACTION;
import static com.training.constants.CaoConstants.PP_CONTACT_HIDDEN;
import static com.training.constants.CaoConstants.SHOW_CONTACT_HIDDEN;
import static com.training.constants.CaoConstants.START_UPDATION;
import static com.training.constants.CaoConstants.UPDATE_CONTACT_HIDDEN;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Contact;
import com.training.model.NonPersonalCustomer;
import com.training.model.PersonalParty;
import com.training.services.ChangeCustomerContactService;
import com.training.services.PersonalPartyServices;

public class ChangeCustomerContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(ChangeCustomerContactController.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		logger.info("In ChangeCustomerContactController");
		String action = (String) request.getParameter(ACTION);
		Long idno3 = (Long.parseLong(request.getParameter("idno")));

		if (action.equals(UPDATE_CONTACT_HIDDEN)) {
			logger.debug("Action is:" + action);
			String tktdesc1 = (String) request.getParameter("ticketdesc");
			String idno1 = (String) request.getParameter("idno");
			request.setAttribute("tktdesc2", tktdesc1);
			request.setAttribute("idno2", idno1);
			long ticketId = Long.parseLong(request.getParameter("ticketId"));
			ChangeCustomerContactService cs = new ChangeCustomerContactService();
			NonPersonalCustomer businesscustomer;
			try {
				businesscustomer = cs.searchBusinessCustomer(idno3);

				String bname = businesscustomer.getBusinessName();
				request.setAttribute("businessname", bname);
				String tname = businesscustomer.getTradingName();
				request.setAttribute("tradingname", tname);
				String country = businesscustomer.getCountryOfRegistration();
				request.setAttribute("country_of_reg", country);
				String emailid = businesscustomer.getBusinessEmailAddress();
				request.setAttribute("business_email_id", emailid);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/ShowNppContactDetails.jsp");
				rd.forward(request, response);

			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("msg", msg);
				logger.error(msg);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
				rd.forward(request, response);

			}

		} else if (action.equals(SHOW_CONTACT_HIDDEN)) {
			logger.debug("Action is:" + action);
			String tktdesc1 = (String) request.getParameter("textdesc3");
			String idno1 = (String) request.getParameter("idno");
			request.setAttribute("tktdesc2", tktdesc1);
			request.setAttribute("idno2", idno1);
			String type_of_contact = (String) request.getParameter("contact_dd");
			request.setAttribute("txt_contact_type", type_of_contact);
			long ticketId = Long.parseLong(request.getParameter("ticketId"));
			// logger.info("inservlet===================="+ticketId);
			request.setAttribute("ticketId", ticketId);
			logger.debug("Ticket Id:" + ticketId);
			ChangeCustomerContactService cs = new ChangeCustomerContactService();

			try {

				Contact newcontact = cs.showContactService(idno3, type_of_contact);
				long areacode = newcontact.getAreaCode();
				request.setAttribute("txt_area_code", areacode);

				int countrycode = newcontact.getCountryCode();
				request.setAttribute("txt_country_code", countrycode);
				long contactnumber = newcontact.getContactNumber();
				request.setAttribute("txt_contact", contactnumber);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/UpdatingNppContact.jsp");
				rd.forward(request, response);

			}

			catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("msg", msg);
				logger.error(msg);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
				rd.forward(request, response);

			}

		} // end else if

		else if (action.equals(START_UPDATION)) {
			logger.debug("Action is:" + action);
			Contact updated_contact = new Contact();
			boolean success = false;
			updated_contact.setAreaCode(Integer.parseInt(request.getParameter("txtarea")));
			updated_contact.setContactNumber(Long.parseLong(request.getParameter("txtcontact")));
			if (null != request.getParameter("txtcountry"))
				updated_contact.setCountryCode(Integer.parseInt(request.getParameter("txtcountry")));
			long id = Long.parseLong(request.getParameter("idno"));
			long ticketId = Long.parseLong(request.getParameter("ticketId"));
			String contactType = request.getParameter("contactType");
			// long ticketId = Long.parseLong(request.getParameter("ticketId"));
			// logger.info(" again inservlet===================="+ticketId);
			logger.debug("Ticket Id:" + ticketId);
			ChangeCustomerContactService cccs = new ChangeCustomerContactService();
			try {
				// logger.info("Contact type in servlet "+contactType);
				success = cccs.updateContactService(updated_contact, id, ticketId, contactType);
				// logger.info("success value "+success);

				if (success) {

					String message = "Updation Done and Ticket closed";
					request.setAttribute("msg", message);
					logger.info("Updation Done and Ticket closed");
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

		/* PERSONAL PARTY CONTACT UPDATION */
		else if (action.equals(PP_CONTACT_HIDDEN)) {
			logger.debug("Action is:" + action);
			String tktdesc1 = (String) request.getParameter("ticketdesc");
			String idno1 = (String) request.getParameter("idno");
			long ticketId = Long.parseLong(request.getParameter("ticketId"));
			request.setAttribute("tktdesc2", tktdesc1);
			request.setAttribute("idno2", idno1);
			request.setAttribute("ticketId", ticketId);
			PersonalPartyServices cs = new PersonalPartyServices();
			PersonalParty accountParty;
			try {
				accountParty = cs.searchPersonalParty(idno3);

				String fname = accountParty.getFirstName();
				request.setAttribute("firstname", fname);
				String sname = accountParty.getSurName();
				request.setAttribute("surname", sname);
				String rtype = accountParty.getRelationshipType();
				request.setAttribute("relation", rtype);

				String emailid = accountParty.getEmailId();
				request.setAttribute("email", emailid);

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/ShowPpContactTicket.jsp");
				rd.forward(request, response);

			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("msg", msg);
				logger.error(msg);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
				rd.forward(request, response);

			}

		}

		else if (action.equals("show_pp_tckt_hidden")) {
			logger.debug("Action is:" + action);

			PersonalPartyServices cs = new PersonalPartyServices();
			// long party_id =
			// (Long.parseLong(request.getParameter("acc_idno")));
			long newcontact = Long.parseLong(request.getParameter("txtcontact"));
			String contactType = request.getParameter("contact_type");
			// logger.info("id no in servlet "+idno3);
			long ticketId = Long.parseLong(request.getParameter("ticketId"));
			try {
				boolean success = cs.updatePartyContactNumber(idno3, newcontact, ticketId, contactType);

				if (success) {

					String message = "Updation Done Successfully";
					request.setAttribute("msg", message);
					logger.info("Updation Done Successfully");
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/backoffice.jsp");
					rd.forward(request, response);
				} else {
					// logger.info("in else");
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
