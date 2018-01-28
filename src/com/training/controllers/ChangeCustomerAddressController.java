package com.training.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Address;
import com.training.model.NonPersonalCustomer;
import com.training.model.PersonalParty;
import com.training.services.ChangeCustomerAddressService;
import com.training.services.PersonalPartyServices;

public class ChangeCustomerAddressController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static Logger logger = Logger.getLogger(LoginServlet.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		logger.info("In ChangeCustomerAddressController");

		String action = (String) request.getParameter("action");
		Long idno3 = (Long.parseLong(request.getParameter("idno")));
		// logger.info("id no in servlet " +idno3);
		if (action.equals("address_tkt_hidden")) {

			logger.debug("Action is:" + action);
			String tktdesc1 = (String) request.getParameter("ticketdesc");
			logger.info("ticket description==" + tktdesc1);
			String idno1 = (String) request.getParameter("idno");
			request.setAttribute("tktdesc2", tktdesc1);
			request.setAttribute("idno2", idno1);
			long ticketId = Long.parseLong(request.getParameter("ticketId"));
			// logger.info("in controller ===== "+ticketId);
			request.setAttribute("ticketId", ticketId);
			logger.debug("Ticket Id:" + ticketId);
			ChangeCustomerAddressService cs = new ChangeCustomerAddressService();
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
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/ShowNppAddressDetails.jsp");
				rd.forward(request, response);
			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("msg", msg);
				logger.error("Error Occured");
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
				rd.forward(request, response);

			}

		} else if (action.equals("update_address_tkt_hidden")) {
			logger.debug("Action is:" + action);
			String tktdesc1 = (String) request.getParameter("textdesc3");
			String idno1 = (String) request.getParameter("idno");
			request.setAttribute("tktdesc2", tktdesc1);
			request.setAttribute("idno2", idno1);
			String type_of_address = (String) request.getParameter("address_dd");
			request.setAttribute("txtadd_type", type_of_address);
			long ticketId = Long.parseLong(request.getParameter("ticketId"));
			logger.debug("Ticket Id:" + ticketId);
			// logger.info("inservlet===================="+ticketId);
			request.setAttribute("ticketId", ticketId);
			ChangeCustomerAddressService ca = new ChangeCustomerAddressService();
			try {
				Address newaddress = ca.showAddressService(idno3, type_of_address);
				request.setAttribute("address", newaddress);
				String building = newaddress.getBuildingName();
				request.setAttribute("txtbulding", building);
				String number = newaddress.getBuildingNumber();
				request.setAttribute("txtnumber", number);
				String city = newaddress.getCityName();
				request.setAttribute("txtcname", city);
				String street = newaddress.getStreetName();
				request.setAttribute("txtstreet", street);
				String town = newaddress.getTownName();
				request.setAttribute("txttown", town);
				String country = newaddress.getCountry();
				request.setAttribute("txtcountry", country);
				String postalcode = newaddress.getPostalCode();
				request.setAttribute("txtpostal", postalcode);

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/UpdatingNppAddress.jsp");
				rd.forward(request, response);
			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("msg", msg);
				logger.error(msg);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
				rd.forward(request, response);

			}
		} else if (action.equalsIgnoreCase("start_updation")) {
			logger.debug("Action is:" + action);
			Address updated_address = new Address();
			boolean success = false;
			long ticketId = Long.parseLong(request.getParameter("ticketId"));
			// long ticketId = Long.parseLong(request.getParameter("ticketId"));
			// logger.info(" again inservlet===================="+ticketId);
			logger.debug("Ticket Id:" + ticketId);
			updated_address.setBuildingNumber(request.getParameter("txtnumber"));
			updated_address.setBuildingName(request.getParameter("txtbuilding"));
			updated_address.setCityName(request.getParameter("txtcname"));
			updated_address.setTownName(request.getParameter("txttown"));
			updated_address.setCountry(request.getParameter("txtcountry"));
			updated_address.setStreetName(request.getParameter("txtstreet"));
			updated_address.setPostalCode(request.getParameter("txtpostal"));
			updated_address.setAddressType(request.getParameter("txttype"));
			long id = Long.parseLong(request.getParameter("idno"));
			ChangeCustomerAddressService ccas = new ChangeCustomerAddressService();
			try {
				success = ccas.updateAddressService(updated_address, id, ticketId);
				if (success) {

					String message = "Updation Done and Ticket closed";
					logger.info("Updation Done and Ticket closed");
					logger.info("Updation Done and Ticket closed");
					request.setAttribute("msg", message);
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
		} else if (action.equalsIgnoreCase("pp_address_hidden_tkt")) {
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
				Address ad = new Address();
				ad = cs.getPersonalPartyAddressService(idno3);
				// logger.info("addin servlet ==== "+ad.getHouseName());
				request.setAttribute("address", ad);
				request.setAttribute("accParty", accountParty);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/ShowPpAddress.jsp");
				rd.forward(request, response);

			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("msg", msg);
				logger.error(msg);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
				rd.forward(request, response);

			}

		} else if (action.equalsIgnoreCase("start_pp_address_updation")) {
			logger.debug("Action is:" + action);
			Address updated_address = new Address();
			boolean success = false;
			long ticketId = Long.parseLong(request.getParameter("ticketId"));
			// logger.info("navdeep ticket id in servlet ===="+ticketId
			// );
			logger.debug("Ticket Id:" + ticketId);
			updated_address.setHouseNumber(request.getParameter("houseNo"));
			updated_address.setHouseName((request.getParameter("houseName")));
			// logger.info("house name updated add ===== "+updated_address.getHouseName());
			updated_address.setBuildingNumber(request.getParameter("buildingNumber"));
			updated_address.setCityName(request.getParameter("cityName"));
			updated_address.setTownName(request.getParameter("townName"));
			updated_address.setCountry(request.getParameter("country"));
			updated_address.setStreetName(request.getParameter("streetName"));
			updated_address.setPostalCode(request.getParameter("postalCode"));
			// updated_address.setAddressType(request.getParameter("txttype"));
			long id = Long.parseLong(request.getParameter("idno"));

			PersonalPartyServices ccas = new PersonalPartyServices();
			try {
				success = ccas.updateAddressService(updated_address, id, ticketId);
				logger.info("successis ::  " + success);
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
		// request.setAttribute("msg", message);

	}

}
