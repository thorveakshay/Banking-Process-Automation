package com.training.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.training.dao.AccountPartyDAO;
import com.training.dao.AccountPartyDAOImpl;
import com.training.exception.AccountPartyException;
import com.training.model.AccountParty;
import com.training.model.PartyAddress;
import com.training.model.PartyContact;
import com.training.services.AccountPartyManagementService;

/**
 * Servlet implementation class AccountPartyController
 */
public class AccountPartyManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AccountParty ap = new AccountParty();
	HttpSession session;

	private static Logger logger = Logger.getLogger(LoginServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AccountPartyManagementServlet() {

	}

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
		// Check Session Validity
		response.setHeader("Cache-Control", "no-cache"); // Forces caches to obtain a new copy of the page from the
															// origin server
		response.setHeader("Cache-Control", "no-store"); // Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); // Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0 backward compatibility
		if (request.getSession() == null || request.getSession().getAttribute("username") == null) {
			response.sendRedirect(request.getContextPath());
			return;
		}
		// end check session validity
		session = request.getSession();

		String action = null;
		action = request.getParameter("action");

		if (action.equals("addAccountParty")) {
			try {
				Long npid = Long.parseLong(request.getParameter("id"));
				session.setAttribute("npid", npid);

				String Title = null;
				String BasicDetails = null;
				String logout = null;
				String MR = null;
				String MISS = null;
				String MRS = null;
				String DOCTOR = null;
				String Mandatory = null;
				String FirstName = null;
				String MiddleName = null;
				String LastName = null;
				String DateOfBirth = null;
				String Bank = null;
				String thisBank = null;
				String Party = null;
				String PersonalAccountDetails = null;
				String If = null;
				String Branch = null;
				String AccountNumber = null;
				String CONTINUE = null;
				String RESET = null;
				String YES = null;
				String NO = null;
				String DIRECTOR = null;
				String TRUSTEE = null;
				String OWNER = null;
				String PARTNER = null;
				String SELECT = null;
				String add = null;
				String acc_party = null;
				String home = null;
				String register = null;
				String search = null;
				String manage = null;
				String add_cust = null;
				String view = null;

				if (null != session.getAttribute("message")) {

					BasicDetails = ((ResourceBundle) session.getAttribute("message")).getString("BasicDetails");
					Title = ((ResourceBundle) session.getAttribute("message")).getString("Title");
					Mandatory = ((ResourceBundle) session.getAttribute("message")).getString("Mandatory");
					logout = ((ResourceBundle) session.getAttribute("message")).getString("logout");
					MR = ((ResourceBundle) session.getAttribute("message")).getString("MR");
					MISS = ((ResourceBundle) session.getAttribute("message")).getString("MISS");
					MRS = ((ResourceBundle) session.getAttribute("message")).getString("MRS");
					DOCTOR = ((ResourceBundle) session.getAttribute("message")).getString("DOCTOR");

					FirstName = ((ResourceBundle) session.getAttribute("message")).getString("FirstName");
					MiddleName = ((ResourceBundle) session.getAttribute("message")).getString("MiddleName");
					LastName = ((ResourceBundle) session.getAttribute("message")).getString("LastName");
					DateOfBirth = ((ResourceBundle) session.getAttribute("message")).getString("DateOfBirth");
					Bank = ((ResourceBundle) session.getAttribute("message")).getString("Bank");
					thisBank = ((ResourceBundle) session.getAttribute("message")).getString("thisBank");
					Party = ((ResourceBundle) session.getAttribute("message")).getString("Party");
					PersonalAccountDetails = ((ResourceBundle) session.getAttribute("message"))
							.getString("PersonalAccountDetails");
					If = ((ResourceBundle) session.getAttribute("message")).getString("If");
					Branch = ((ResourceBundle) session.getAttribute("message")).getString("Branch");
					AccountNumber = ((ResourceBundle) session.getAttribute("message")).getString("AccountNumber");
					CONTINUE = ((ResourceBundle) session.getAttribute("message")).getString("CONTINUE");
					RESET = ((ResourceBundle) session.getAttribute("message")).getString("RESET");
					YES = ((ResourceBundle) session.getAttribute("message")).getString("YES");
					NO = ((ResourceBundle) session.getAttribute("message")).getString("NO");
					DIRECTOR = ((ResourceBundle) session.getAttribute("message")).getString("DIRECTOR");
					TRUSTEE = ((ResourceBundle) session.getAttribute("message")).getString("TRUSTEE");
					OWNER = ((ResourceBundle) session.getAttribute("message")).getString("OWNER");
					PARTNER = ((ResourceBundle) session.getAttribute("message")).getString("PARTNER");
					SELECT = ((ResourceBundle) session.getAttribute("message")).getString("SELECT");

					add = ((ResourceBundle) session.getAttribute("message")).getString("add");
					acc_party = ((ResourceBundle) session.getAttribute("message")).getString("acc_party");
					home = ((ResourceBundle) session.getAttribute("message")).getString("home");
					register = ((ResourceBundle) session.getAttribute("message")).getString("register");
					search = ((ResourceBundle) session.getAttribute("message")).getString("search");
					manage = ((ResourceBundle) session.getAttribute("message")).getString("manage");
					view = ((ResourceBundle) session.getAttribute("message")).getString("view");
					add_cust = ((ResourceBundle) session.getAttribute("message")).getString("add_cust");

				}
				request.setAttribute("BASICDETAILS", BasicDetails);
				request.setAttribute("Title", Title);
				request.setAttribute("Mandatory", Mandatory);
				request.setAttribute("logout", logout);
				request.setAttribute("MR", MR);
				request.setAttribute("MISS", MISS);
				request.setAttribute("MRS", MRS);
				request.setAttribute("DOCTOR", DOCTOR);

				request.setAttribute("FirstName", FirstName);
				request.setAttribute("MiddleName", MiddleName);
				request.setAttribute("LastName", LastName);
				request.setAttribute("DateOfBirth", DateOfBirth);
				request.setAttribute("Bank", Bank);
				request.setAttribute("thisBank", thisBank);
				request.setAttribute("Party", Party);
				request.setAttribute("PersonalAccountDetails", PersonalAccountDetails);
				request.setAttribute("If", If);
				request.setAttribute("Branch", Branch);
				request.setAttribute("AccountNumber", AccountNumber);
				request.setAttribute("CONTINUE", CONTINUE);
				request.setAttribute("RESET", RESET);
				request.setAttribute("YES", YES);
				request.setAttribute("NO", NO);
				request.setAttribute("DIRECTOR", DIRECTOR);
				request.setAttribute("TRUSTEE", TRUSTEE);
				request.setAttribute("OWNER", OWNER);
				request.setAttribute("PARTNER", PARTNER);
				request.setAttribute("SELECT", SELECT);

				request.setAttribute("add", add);
				request.setAttribute("acc_party", acc_party);
				request.setAttribute("home", home);
				request.setAttribute("register", register);
				request.setAttribute("search", search);
				request.setAttribute("manage", manage);
				request.setAttribute("view", view);
				request.setAttribute("add_cust", add_cust);

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/AccountPartyCaptureBasicDetails.jsp");
				rd.forward(request, response);
				// if(null!=session.getAttribute("message"))
				// Title=((ResourceBundle)
				// session.getAttribute("message")).getString("BasicDetails");
				// request.setAttribute("BasicDetails",BasicDetails);
			} catch (NumberFormatException e) {
				request.setAttribute("msg", "An error has occurred.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

			response.sendRedirect("jsp/AccountPartyCaptureBasicDetails.jsp");

		}
		if (action.equals("accountPartyDetails1")) {

			String title = (String) request.getParameter("title");
			String fname = (String) request.getParameter("fname");
			String mname = (String) request.getParameter("mname");
			String lname = (String) request.getParameter("lname");
			String dob = (String) request.getParameter("dob");
			String relationship = (String) request.getParameter("relationship");
			String hasAccount = (String) request.getParameter("hasAccount");
			String isKeyParty = (String) request.getParameter("keyParty");

			ap.setNpid((Long) session.getAttribute("npid"));
			ap.setTitle(title);
			ap.setFname(fname);
			ap.setMname(mname);
			ap.setLname(lname);
			ap.setDob(dob);
			ap.setRelationship(relationship);
			ap.setHasAccount(hasAccount);
			ap.setIsKeyParty(isKeyParty);

			if (hasAccount.equalsIgnoreCase("no")) {
				response.sendRedirect("jsp/AccountPartyCaptureCurrentPersonalAddressDetails.jsp");
			} else {
				String branch = (String) request.getParameter("branch");
				Long accNo = Long.parseLong(request.getParameter("accNo"));

				AccountPartyDAO apd = new AccountPartyDAOImpl();
				try {
					AccountParty accp = new AccountParty();
					accp = apd.getAddressContactDetails(ap, branch, accNo);
					if (accp == null) {
						request.setAttribute("msg", "No account details found.");
						RequestDispatcher rd = request.getRequestDispatcher("jsp/NoAccountError.jsp");
						rd.forward(request, response);
					} else {
						ap.setBranch(branch);
						ap.setAccountNo(accNo);
						apd.createAccountParty(accp);
						response.sendRedirect("jsp/AccountPartySuccess.jsp");
					}

				} catch (AccountPartyException e) {

					request.setAttribute("msg", "An error has occurred.");
					RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
					rd.forward(request, response);
				}

			}
		}

		if (action.equals("accountPartyDetails2")) {
			String curHouseNo = request.getParameter("hno");
			String curHouseName = request.getParameter("hname");
			String curBuildingNo = request.getParameter("bno");
			String curStreetName = request.getParameter("sname");
			String curCityName = request.getParameter("cname");
			String curTownName = request.getParameter("tname");
			String curCountry = request.getParameter("country");
			String curPostalCode = request.getParameter("pcode");
			String cd = request.getParameter("curDate");
			Date curDate = new Date(cd);
			Date today = new Date();
			today.setYear(today.getYear() - 3);

			PartyAddress add = new PartyAddress();

			add.setHouseNo(curHouseNo);
			add.setHouseName(curHouseName);
			add.setBuildingNo(curBuildingNo);
			add.setStreetName(curStreetName);
			add.setCityName(curCityName);
			add.setTownName(curTownName);
			add.setCountry(curCountry);
			add.setPostalCode(curPostalCode);
			ap.setCurrentAddress(add);
			if (curDate.compareTo(today) < 0) {
				response.sendRedirect(request.getContextPath() + "/jsp/AccountPartyCapturePersonalContactDetails.jsp");

			} else {
				response.sendRedirect(
						request.getContextPath() + "/jsp/AccountPartyCapturePreviousPersonalAddressDetails.jsp");

			}
		}

		if (action.equals("accountPartyDetails3")) {
			String prevHouseNo = request.getParameter("hno");
			String prevHouseName = request.getParameter("hname");
			String prevBuildingNo = request.getParameter("bno");
			String prevStreetName = request.getParameter("sname");
			String prevCityName = request.getParameter("cname");
			String prevTownName = request.getParameter("tname");
			String prevCountry = request.getParameter("country");
			String prevPostalCode = request.getParameter("pcode");

			PartyAddress add = new PartyAddress();
			add.setHouseNo(prevHouseNo);
			add.setHouseName(prevHouseName);
			add.setBuildingNo(prevBuildingNo);
			add.setStreetName(prevStreetName);
			add.setCityName(prevCityName);
			add.setTownName(prevTownName);
			add.setCountry(prevCountry);
			add.setPostalCode(prevPostalCode);
			ap.setPreviousAddress(add);
			response.sendRedirect(request.getContextPath() + "/jsp/AccountPartyCapturePersonalContactDetails.jsp");
		}

		if (action.equals("accountPartyDetails4")) {
			String email = request.getParameter("email");
			String mAreaCode = request.getParameter("mAreaCode");
			String mCountryCode = request.getParameter("mCountryCode");
			String mNumber = request.getParameter("mNumber");

			String hAreaCode = request.getParameter("hAreaCode");
			String hCountryCode = request.getParameter("hCountryCode");
			String hNumber = request.getParameter("hNumber");

			String oAreaCode = request.getParameter("oAreaCode");
			String oCountryCode = request.getParameter("oCountryCode");
			String oNumber = request.getParameter("oNumber");

			PartyContact mobile = new PartyContact();
			PartyContact home = new PartyContact();
			PartyContact office = new PartyContact();
			try {
				mobile.setAreaCode(Long.parseLong(mAreaCode));
				mobile.setCountryCode(Long.parseLong(mCountryCode));
				mobile.setContactNumber(Long.parseLong(mNumber));

				home.setAreaCode(Long.parseLong(hAreaCode));
				home.setCountryCode(Long.parseLong(hCountryCode));
				home.setContactNumber(Long.parseLong(hNumber));

				office.setAreaCode(Long.parseLong(oAreaCode));
				office.setCountryCode(Long.parseLong(oCountryCode));
				office.setContactNumber(Long.parseLong(oNumber));
			} catch (NumberFormatException e) {
				request.setAttribute("msg", "An error has occurred.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

			ap.setEmail(email);
			ap.setMobileContact(mobile);
			ap.setHomeContact(home);
			ap.setOfficeContact(office);

			logger.info(ap.getTitle());
			logger.info(ap.getFname());
			AccountPartyDAO apd = new AccountPartyDAOImpl();
			try {
				apd.createAccountParty(ap);
				List<AccountParty> list = new ArrayList<AccountParty>();
				Long npid = (Long) session.getAttribute("npid");
				list = apd.viewAccountParty(npid);

				request.setAttribute("list", list);
				String msg = "Account Party added successfully.";
				request.setAttribute("msg", msg);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/AccountPartyView.jsp");
				rd.forward(request, response);

			} catch (AccountPartyException e) {

				request.setAttribute("msg", "An error has occurred.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);

			}

		}

		if (action.equals("viewAccountParty")) {
			List<AccountParty> list = new ArrayList<AccountParty>();
			AccountPartyDAO apd = new AccountPartyDAOImpl();

			Long npid = Long.parseLong(request.getParameter("id"));
			session.setAttribute("npid", npid);
			try {
				list = apd.viewAccountParty(npid);
				/*
				 * String Welcome=null; String ACCOUNT_DETAILS=null; String by_name=null; String
				 * by_relation=null; String Search=null; String DIRECTOR=null; String
				 * TRUSTEE=null; String OWNER=null; String PARTNER=null; String SELECT=null;
				 * String RESET=null; String WELCOME=null; String no_acc=null;
				 * 
				 * Welcome=((ResourceBundle)
				 * session.getAttribute("message")).getString("Welcome"); logger.info(Welcome);
				 * ACCOUNT_DETAILS=((ResourceBundle)
				 * session.getAttribute("message")).getString("ACCOUNT_DETAILS");
				 * by_name=((ResourceBundle)
				 * session.getAttribute("message")).getString("by_name");
				 * by_relation=((ResourceBundle)
				 * session.getAttribute("message")).getString("by_relation");
				 * Search=((ResourceBundle)
				 * session.getAttribute("message")).getString("Search");
				 * DIRECTOR=((ResourceBundle)
				 * session.getAttribute("message")).getString("DIRECTOR");
				 * TRUSTEE=((ResourceBundle)
				 * session.getAttribute("message")).getString("TRUSTEE");
				 * OWNER=((ResourceBundle) session.getAttribute("message")).getString("OWNER");
				 * PARTNER=((ResourceBundle)
				 * session.getAttribute("message")).getString("PARTNER");
				 * SELECT=((ResourceBundle)
				 * session.getAttribute("message")).getString("SELECT"); RESET=((ResourceBundle)
				 * session.getAttribute("message")).getString("RESET");
				 * WELCOME=((ResourceBundle)
				 * session.getAttribute("message")).getString("WELCOME");
				 * no_acc=((ResourceBundle)
				 * session.getAttribute("message")).getString("no_acc");
				 * request.setAttribute("Welcome",Welcome);
				 * request.setAttribute("ACCOUNT_DETAILS",ACCOUNT_DETAILS);
				 * request.setAttribute("by_name",by_name);
				 * request.setAttribute("by_relation",by_relation);
				 * request.setAttribute("Search",Search);
				 * request.setAttribute("DIRECTOR",DIRECTOR);
				 * request.setAttribute("TRUSTEE",TRUSTEE); request.setAttribute("OWNER",OWNER);
				 * request.setAttribute("PARTNER",PARTNER);
				 * request.setAttribute("SELECT",SELECT); request.setAttribute("RESET",RESET);
				 * request.setAttribute("WELCOME",WELCOME);
				 * request.setAttribute("no_acc",no_acc);
				 * 
				 * 
				 */
				request.setAttribute("list", list);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/AccountPartyView.jsp");
				rd.forward(request, response);
			} catch (AccountPartyException e) {

				request.setAttribute("msg", "An error has occurred.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

		}

		if (action.equals("viewAccountPartyDetails")) {

			Long id = Long.parseLong(request.getParameter("id"));
			AccountPartyDAO apd = new AccountPartyDAOImpl();
			try {
				ap = apd.viewAccountPartyDetails(id);

				request.setAttribute("ap", ap);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/AccountPartyViewBasicDetails.jsp");
				rd.forward(request, response);

			} catch (AccountPartyException e) {

				request.setAttribute("msg", "An error has occurred.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

		}

		if (action.equals("updateAccountPartyDetails")) {
			Long pid = Long.parseLong(request.getParameter("id"));
			AccountPartyDAO apd = new AccountPartyDAOImpl();
			try {
				ap = apd.viewAccountPartyDetails(pid);
				request.setAttribute("ap", ap);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/AccountPartyUpdateBasicDetails.jsp");
				rd.forward(request, response);

			} catch (AccountPartyException e) {

				request.setAttribute("msg", "An error has occurred.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

		}

		if (action.equals("updateAccountParty1")) {
			String relationship = (String) request.getParameter("relationship");
			String isKeyParty = (String) request.getParameter("keyParty");
			String curHouseNo = request.getParameter("hno");
			String curHouseName = request.getParameter("hname");
			String curBuildingNo = request.getParameter("bno");
			String curStreetName = request.getParameter("sname");
			String curCityName = request.getParameter("cname");
			String curTownName = request.getParameter("tname");
			String curCountry = request.getParameter("country");
			String curPostalCode = request.getParameter("pcode");
			ap.setRelationship(relationship);
			ap.setIsKeyParty(isKeyParty);
			PartyAddress add = new PartyAddress();

			add.setHouseNo(curHouseNo);
			add.setHouseName(curHouseName);
			add.setBuildingNo(curBuildingNo);
			add.setStreetName(curStreetName);
			add.setCityName(curCityName);
			add.setTownName(curTownName);
			add.setCountry(curCountry);
			add.setPostalCode(curPostalCode);
			ap.setCurrentAddress(add);
			request.setAttribute("ap", ap);
			RequestDispatcher rd = request.getRequestDispatcher("jsp/AccountPartyUpdateAddressContactDetails.jsp");
			rd.forward(request, response);

		}
		if (action.equals("cancelUpdate")) {
			session.setAttribute("npid", request.getParameter("id"));
			response.sendRedirect("../../NexusBankingGroup/AccountPartyManagementServlet?action=viewAccountParty");
		}

		if (action.equals("updateAccountParty2")) {
			String prevHouseNo = request.getParameter("hno");
			String prevHouseName = request.getParameter("hname");
			String prevBuildingNo = request.getParameter("bno");
			String prevStreetName = request.getParameter("sname");
			String prevCityName = request.getParameter("cname");
			String prevTownName = request.getParameter("tname");
			String prevCountry = request.getParameter("country");
			String prevPostalCode = request.getParameter("pcode");

			PartyAddress add = new PartyAddress();
			add.setHouseNo(prevHouseNo);
			add.setHouseName(prevHouseName);
			add.setBuildingNo(prevBuildingNo);
			add.setStreetName(prevStreetName);
			add.setCityName(prevCityName);
			add.setTownName(prevTownName);
			add.setCountry(prevCountry);
			add.setPostalCode(prevPostalCode);
			ap.setPreviousAddress(add);

			String email = request.getParameter("email");
			String mAreaCode = request.getParameter("mAreaCode");
			String mCountryCode = request.getParameter("mCountryCode");
			String mNumber = request.getParameter("mNumber");

			String hAreaCode = request.getParameter("hAreaCode");
			String hCountryCode = request.getParameter("hCountryCode");
			String hNumber = request.getParameter("hNumber");

			String oAreaCode = request.getParameter("oAreaCode");
			String oCountryCode = request.getParameter("oCountryCode");
			String oNumber = request.getParameter("oNumber");

			PartyContact mobile = new PartyContact();
			PartyContact home = new PartyContact();
			PartyContact office = new PartyContact();

			mobile.setAreaCode(Long.parseLong(mAreaCode));
			mobile.setCountryCode(Long.parseLong(mCountryCode));
			mobile.setContactNumber(Long.parseLong(mNumber));

			home.setAreaCode(Long.parseLong(hAreaCode));
			home.setCountryCode(Long.parseLong(hCountryCode));
			home.setContactNumber(Long.parseLong(hNumber));

			office.setAreaCode(Long.parseLong(oAreaCode));
			office.setCountryCode(Long.parseLong(oCountryCode));
			office.setContactNumber(Long.parseLong(oNumber));

			ap.setEmail(email);
			ap.setMobileContact(mobile);
			ap.setHomeContact(home);
			ap.setOfficeContact(office);

			AccountPartyDAO apd = new AccountPartyDAOImpl();
			try {
				apd.updateAccountParty(ap);
				List<AccountParty> list = new ArrayList<AccountParty>();
				Long npid = (Long) session.getAttribute("npid");
				list = apd.viewAccountParty(npid);

				request.setAttribute("list", list);
				String msg = "Account Party updated successfully.";
				request.setAttribute("msg", msg);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/AccountPartyView.jsp");
				rd.forward(request, response);

			} catch (AccountPartyException e) {

				request.setAttribute("msg", "An error has occurred.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

		}
		if (action.equals("deleteAccountParty")) {

			Long id = Long.parseLong(request.getParameter("id"));
			AccountPartyDAO apd = new AccountPartyDAOImpl();
			try {
				apd.deleteAccountParty(id);
				List<AccountParty> list = new ArrayList<AccountParty>();
				Long npid = (Long) session.getAttribute("npid");
				list = apd.viewAccountParty(npid);

				request.setAttribute("list", list);
				String msg = "Account Party deleted successfully.";
				request.setAttribute("msg", msg);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/AccountPartyView.jsp");
				rd.forward(request, response);

			} catch (AccountPartyException e) {

				request.setAttribute("msg", "An error has occurred.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}
		}

		if (action.equals("search")) {

			if (request.getParameter("search").equals("searchbyname"))

			{
				String name = request.getParameter("txtname");
				List<AccountParty> list = new ArrayList<AccountParty>();
				AccountPartyManagementService serv = new AccountPartyManagementService();
				try {
					list = serv.searchByName(name, (Long) session.getAttribute("npid"));
				} catch (AccountPartyException e) {

					request.setAttribute("msg", "An error has occurred.");
					RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
					rd.forward(request, response);
				}
				request.setAttribute("list", list);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/AccountPartyView.jsp");
				rd.forward(request, response);

			}

			if (request.getParameter("search").equals("searchbyrelationship"))

			{
				String relationship = request.getParameter("relationship");
				List<AccountParty> list = new ArrayList<AccountParty>();
				AccountPartyManagementService serv = new AccountPartyManagementService();
				try {
					list = serv.searchByRelationship(relationship, (Long) session.getAttribute("npid"));
				} catch (AccountPartyException e) {

					request.setAttribute("msg", "An error has occurred.");
					RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
					rd.forward(request, response);
				}
				request.setAttribute("list", list);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/AccountPartyView.jsp");
				rd.forward(request, response);

			}
		}
	}

}
