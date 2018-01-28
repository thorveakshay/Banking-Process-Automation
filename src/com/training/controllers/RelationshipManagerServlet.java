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
import com.training.model.Address;
import com.training.model.Contact;
import com.training.model.NonPersonalCustomer;
import com.training.services.RelationshipMngrService;

public class RelationshipManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(RelationshipManagerServlet.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		logger.info("In RelationshipManagerServlet");
		// logger.info("navdeep i'm in ur servlet ");

		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("updateBusinessAddress")) {
			logger.debug("Action is:" + action);
			long accountNumber = Long.parseLong(request.getParameter("accNumber"));
			String addressType = request.getParameter("addressTypeDd");

			RelationshipMngrService rs = new RelationshipMngrService();
			try {
				Address address = rs.getAddressService(accountNumber, addressType);
				NonPersonalCustomer npc = rs.getNonPersonalCustomerService(accountNumber);
				// logger.info("in servlet " +address.getPostalCode());
				request.setAttribute("address", address);
				request.setAttribute("businessCustomer", npc);
				request.setAttribute("addressType", addressType);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/ShowBizCustomerDetails.jsp");
				rd.forward(request, response);
			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("msg", msg);
				logger.error(msg);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
				rd.forward(request, response);

			}

		} else if (action.equalsIgnoreCase("updateAddress")) {
			logger.debug("Action is:" + action);
			Address updated_address = new Address();
			boolean success = false;
			long npId = (Long.parseLong(request.getParameter("txtId")));
			String addressType = request.getParameter("addressType");
			updated_address.setBuildingNumber(request.getParameter("txtBuildingNumber"));
			updated_address.setBuildingName(request.getParameter("txtBuildingName"));
			updated_address.setTownName(request.getParameter("txtTown"));
			updated_address.setCityName(request.getParameter("txtCity"));
			updated_address.setStreetName(request.getParameter("txtStreet"));
			updated_address.setPostalCode(request.getParameter("txtPostal"));
			updated_address.setCountry(request.getParameter("txtCountry"));

			RelationshipMngrService rss = new RelationshipMngrService();
			try {
				success = rss.updateAddressService(updated_address, npId, addressType);
				// logger.info("In servlet" +success);
				if (success) {

					String message = "Updation Done Successfully";
					logger.info("Updation Done Successfully");
					request.setAttribute("msg", message);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/ASPHome.jsp");
					rd.forward(request, response);

				}
			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("msg", msg);
				logger.error(msg);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
				rd.forward(request, response);

			}

		} else if (action.equalsIgnoreCase("updateBusinessContact")) {
			logger.debug("Action is:" + action);
			long accountNumber = Long.parseLong(request.getParameter("accNumber"));
			String contactType = request.getParameter("contactTypeDd");
			RelationshipMngrService rs = new RelationshipMngrService();
			NonPersonalCustomer npc;
			try {
				npc = rs.getNonPersonalCustomerService(accountNumber);
				long id = npc.getBusinessId();
				Contact contact = rs.getContactService(id, contactType);
				request.setAttribute("contact", contact);
				request.setAttribute("businessCustomer", npc);
				request.setAttribute("contactType", contactType);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/ShowBizContactDetails.jsp");
				rd.forward(request, response);
			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("msg", msg);
				logger.error(msg);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
				rd.forward(request, response);

			}
		} else if (action.equalsIgnoreCase("updateContact")) {
			logger.debug("Action is:" + action);
			Contact updated_contact = new Contact();
			boolean success = false;
			long npId = (Long.parseLong(request.getParameter("txtId")));
			String contactType = request.getParameter("contactType");
			// logger.info("type of Contact "+contactType);
			if (null != request.getParameter("txtCountryCode"))
				updated_contact.setCountryCode(Integer.parseInt(request.getParameter("txtCountryCode")));
			updated_contact.setAreaCode(Integer.parseInt(request.getParameter("txtAreaCode")));
			updated_contact.setContactNumber(Long.parseLong(request.getParameter("txtContact")));
			RelationshipMngrService rss = new RelationshipMngrService();
			try {
				success = rss.updateContactService(updated_contact, npId, contactType);
				// logger.info("In servlet" +success);
				if (success) {

					String message = "Updation Done Successfully";
					request.setAttribute("msg", message);
					logger.info("Updation Done Successfully");
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/ASPHome.jsp");
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
