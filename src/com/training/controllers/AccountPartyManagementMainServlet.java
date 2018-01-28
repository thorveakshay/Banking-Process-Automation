package com.training.controllers;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.training.dao.AccountPartyDAO;
import com.training.dao.AccountPartyDAOImpl;
import com.training.exception.AccountPartyException;
import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.AccountParty;
import com.training.model.Branch;
import com.training.model.PartyAddress;
import com.training.model.PartyContact;
import com.training.services.AccountPartyListService;
import com.training.services.AccountPartyManagementService;
import com.training.utils.AeSimpleSHA1;

/**
 * Servlet implementation class AccountPartyController
 */

public class AccountPartyManagementMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static AccountParty ap = new AccountParty();
	HttpSession session;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AccountPartyManagementMainServlet() {

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

		session = request.getSession();

		String action = null;
		action = (String) request.getParameter("action");

		// logger.info("i am in dopost of apms latest action is : "+action);
		if (action.equals("addAccountParty")) {
			try {
				Long npId = Long.parseLong(session.getAttribute("npId").toString());
				// session.setAttribute("npid", npid);
				// logger.info("npId in servlet is: -- "+npId);

			} catch (NumberFormatException e) {
				request.setAttribute("msg", "An error has occurred.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

			response.sendRedirect("jsp/CaptureBasicAccountPartyDetails.jsp");

		}
		if (action.equals("accountPartyDetails1")) {
			// logger.info("is i am here?");
			String title = (String) request.getParameter("title");
			String fname = (String) request.getParameter("fname");
			String mname = (String) request.getParameter("mname");
			String lname = (String) request.getParameter("lname");
			String dob = (String) request.getParameter("dob");
			String dob1;
			String relationship = (String) request.getParameter("relationship");
			String hasAccount = (String) request.getParameter("hasAccount");
			String isKeyParty = (String) request.getParameter("keyParty");
			// logger.info("value of npId--- "+session.getAttribute("npId").toString());
			long npId = Long.parseLong(session.getAttribute("npId").toString());
			dob1 = dob.substring(8, 10) + "/" + dob.substring(5, 7) + "/" + dob.substring(0, 4);

			ap.setNpid(npId);
			// logger.info("In servlet value of npId---"+ap.getNpid());
			ap.setTitle(title);
			ap.setFname(fname);
			ap.setMname(mname);
			ap.setLname(lname);
			ap.setDob(dob1);
			ap.setRelationship(relationship);
			ap.setHasAccount(hasAccount);
			ap.setIsKeyParty(isKeyParty);
			if (isKeyParty.equalsIgnoreCase("no")) {
				HttpSession session = request.getSession();
				int i = 1;
				session.setAttribute("setQuestion", i);
			}
			if (isKeyParty.equalsIgnoreCase("yes")) {
				HttpSession session = request.getSession();
				int i = 2;
				session.setAttribute("setQuestion", i);
			}

			if (hasAccount.equalsIgnoreCase("no")) {
				response.sendRedirect("jsp/CaptureCurrentPersonalAddressDetails.jsp");
			} else {
				String branch = (String) request.getParameter("branch");
				// logger.info("*********** branch id is "+branch);

				Long accNo = Long.parseLong(request.getParameter("accNo"));

				AccountPartyDAO apd = new AccountPartyDAOImpl();

				AccountParty accp = new AccountParty();
				try {
					accp = apd.getAddressContactDetails(ap, branch, accNo);
					session.setAttribute("accountPartyAddress", accp);
				} catch (AccountPartyException e) {
					e.printStackTrace();
				}
				if (accp == null) {

					String msg = "No account details found. Please try again";

					request.setAttribute("msg", msg);

					RequestDispatcher rd = request.getRequestDispatcher(
							"AccountPartyManagementMainServlet?action=viewAccountParty&&id=" + ap.getId());
					rd.forward(request, response);
				} else {
					ap.setBranch(branch);
					ap.setAccountNo(accNo);
					HttpSession session = request.getSession();
					session.setAttribute("accountParty", ap);

					RequestDispatcher rd = request.getRequestDispatcher("jsp/EnterSecurityQuestion.jsp");
					rd.forward(request, response);
				}

			}

		}
		if (action.equalsIgnoreCase("enterQuestion")) {

			AccountPartyDAO apd = new AccountPartyDAOImpl();
			Long apId = null;
			HttpSession session = request.getSession();
			AccountParty app = (AccountParty) session.getAttribute("accountPartyAddress");
			if (app == null)// app =null if hasaccopunt =t
			{
				// logger.info("This account party is null");
				app = (AccountParty) session.getAttribute("accountParty");

				try {
					session = request.getSession();
					int chk = Integer.parseInt(session.getAttribute("setQuestion").toString());

					if (chk == 1) {

						String question = request.getParameter("selectQuestion1");
						String answer = AeSimpleSHA1.SHA1(request.getParameter("answer1"));

						app.setQuestion1(question);
						app.setAnswer(answer);
						apId = apd.createAccountParty(app);
						String msg = "Account party added successfully";
						// logger.info("ADDED SUCCESSFULLY");
						request.setAttribute("msg", msg);
						RequestDispatcher rd = request.getRequestDispatcher(
								"AccountPartyManagementMainServlet?action=viewAccountParty&&id=" + ap.getId());
						rd.forward(request, response);
					}
					if (chk == 2) {
						String question = request.getParameter("selectQuestion1");
						String answer = AeSimpleSHA1.SHA1(request.getParameter("answer1"));
						app.setQuestion1(question);
						app.setAnswer(answer);

						question = request.getParameter("selectQuestion2");
						answer = AeSimpleSHA1.SHA1(request.getParameter("answer2"));
						app.setQuestion2(question);
						app.setAnswer2(answer);

						apId = apd.createAccountParty(app);
						app.setId(apId);
						apd.createQuestion(app);
						String msg = "Account party added successfully";
						// logger.info("ADDED SUCCESSFULLY");
						request.setAttribute("msg", msg);
						RequestDispatcher rd = request.getRequestDispatcher(
								"AccountPartyManagementMainServlet?action=viewAccountParty&&id=" + ap.getId());
						rd.forward(request, response);

					}
				} catch (AccountPartyException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				try {
					session = request.getSession();
					int chk = Integer.parseInt(session.getAttribute("setQuestion").toString());

					if (chk == 1) {
						String question = request.getParameter("selectQuestion1");
						String answer = request.getParameter("answer1");
						app.setQuestion1(question);
						app.setAnswer(answer);
						apId = apd.createAccountParty(app);
						String msg = "Account party added successfully";
						// logger.info("ADDED SUCCESSFULLY");
						request.setAttribute("msg", msg);
						RequestDispatcher rd = request.getRequestDispatcher(
								"AccountPartyManagementMainServlet?action=viewAccountParty&&id=" + ap.getId());
						rd.forward(request, response);
					}
					if (chk == 2) {
						String question = request.getParameter("selectQuestion1");
						String answer = request.getParameter("answer1");
						app.setQuestion1(question);
						app.setAnswer(answer);

						question = request.getParameter("selectQuestion2");
						answer = request.getParameter("answer2");
						app.setQuestion2(question);
						app.setAnswer2(answer);

						apId = apd.createAccountParty(app);

						String msg = "Account party added successfully";
						// logger.info("ADDED SUCCESSFULLY");
						request.setAttribute("msg", msg);
						RequestDispatcher rd = request.getRequestDispatcher(
								"AccountPartyManagementMainServlet?action=viewAccountParty&&id=" + ap.getId());
						rd.forward(request, response);
					}

				} catch (AccountPartyException e) {
					e.printStackTrace();
				}
			}

		}
		if (action.equals("accountPartyDetails2")) {
			// logger.info("now i am in acc party 2");
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
			// logger.info("now gho forward");
			if (curDate.compareTo(today) < 0) {
				response.sendRedirect(request.getContextPath() + "/jsp/CapturePersonalContactDetails.jsp");

			} else {
				response.sendRedirect(request.getContextPath() + "/jsp/CapturePreviousPersonalAddressDetails.jsp");

			}
		}

		if (action.equals("accountPartyDetails3")) {
			// logger.info("capture my ");
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
			response.sendRedirect("jsp/CapturePersonalContactDetails.jsp");
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
				ap.setEmail(email);
				ap.setMobileContact(mobile);
				ap.setHomeContact(home);
				ap.setOfficeContact(office);

				// logger.info(ap.getTitle());
				// logger.info(ap.getFname());
				// logger.info("last step "+ap.getNpid());
				AccountPartyDAO apd = new AccountPartyDAOImpl();
				HttpSession session = request.getSession();
				session.setAttribute("accountParty", ap);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/EnterSecurityQuestion.jsp");
				rd.forward(request, response);
				/*
				 * apd.createAccountParty(ap);
				 * 
				 * String msg="Account party added successfully";
				 * logger.info("ADDED SUCCESSFULLY"); request.setAttribute("msg",msg);
				 * 
				 * 
				 * RequestDispatcher rd = request.getRequestDispatcher(
				 * "AccountPartyManagementMainServlet?action=viewAccountParty&&id="+ap.getId());
				 * rd.forward(request, response);
				 */

			} catch (NumberFormatException e) {
				e.printStackTrace();

				request.setAttribute("msg", "An error has occurred. u r r8 number format excep");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/error.jsp");
				rd.forward(request, response);
			}

		}

		if (action.equals("viewAccountParty")) {
			List<AccountParty> list = new ArrayList<AccountParty>();
			AccountPartyDAO apd = new AccountPartyDAOImpl();
			// logger.info("navdeep in account manag servlet");
			// Long npid=Long.parseLong(request.getParameter("id"));
			HttpSession session1;
			session1 = request.getSession();

			// logger.info("hey navdeep npid is :
			// "+session1.getAttribute("npId").toString());
			try {
				list = apd.viewAccountParty(Long.parseLong(session1.getAttribute("npId").toString()));

				// request.setAttribute("list",list);
				session1.setAttribute("list", list);
				// logger.info("size of list is :"+list.size());
				RequestDispatcher rd = request.getRequestDispatcher("jsp/ViewAccountParty.jsp");
				rd.forward(request, response);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (AccountPartyException e) {
				e.printStackTrace();
			}

		}

		if (action.equals("viewAccountPartyDetails")) {

			Long id = Long.parseLong(request.getParameter("id"));
			AccountPartyDAO apd = new AccountPartyDAOImpl();
			try {
				ap = apd.viewAccountPartyDetails(id);

				request.setAttribute("ap", ap);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/ViewBasicAccountPartyDetails.jsp");
				rd.forward(request, response);

			} catch (AccountPartyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		if (action.equals("updateAccountPartyDetails")) {
			Long pid = Long.parseLong(request.getParameter("id"));
			AccountPartyDAO apd = new AccountPartyDAOImpl();
			try {
				ap = apd.viewAccountPartyDetails(pid);
				request.setAttribute("ap", ap);
				HttpSession session;
				session = request.getSession();
				session.setAttribute("prevPartyAddress", ap.getPreviousAddress());
				session.setAttribute("prevMobileContact", ap.getMobileContact());
				session.setAttribute("prevOfficeContact", ap.getOfficeContact());
				session.setAttribute("prevHomeContact", ap.getHomeContact());

				session.setAttribute("partyId", ap.getId().toString());

				RequestDispatcher rd = request.getRequestDispatcher("jsp/UpdateBasicAccountPartyDetails.jsp");
				rd.forward(request, response);

			} catch (AccountPartyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		if (action.equals("updateAccountParty1")) {
			ap = new AccountParty();
			// logger.info("i am at the beg. of updateAccountParty1");
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

			HttpSession session;
			session = request.getSession();

			PartyAddress prevAddr = new PartyAddress();
			prevAddr = (PartyAddress) session.getAttribute("prevPartyAddress");// ,ap.getPreviousAddress());
			ap.setPreviousAddress(prevAddr);

			PartyContact prevMobileContact = new PartyContact();
			prevMobileContact = (PartyContact) session.getAttribute("prevMobileContact");// ,ap.getMobileContact());
			ap.setMobileContact(prevMobileContact);

			PartyContact prevOfficeContact = new PartyContact();
			prevOfficeContact = (PartyContact) session.getAttribute("prevOfficeContact");// ,ap.getMobileContact());
			ap.setOfficeContact(prevOfficeContact);

			PartyContact prevHomeContact = new PartyContact();
			prevHomeContact = (PartyContact) session.getAttribute("prevHomeContact");// ,ap.getMobileContact());
			ap.setHomeContact(prevHomeContact);

			request.setAttribute("ap", ap);
			session = request.getSession();
			session.setAttribute("ap", ap);

			// logger.info("heyy hiii uacd,...prev house no is :
			// "+ap.getPreviousAddress().getHouseNo());
			// logger.info("i am at the end of updateAccountParty1");
			RequestDispatcher rd = request.getRequestDispatcher("jsp/UpdateAddressContactDetails.jsp");
			rd.forward(request, response);

		}
		if (action.equals("cancelUpdate")) {
			session.setAttribute("npid", request.getParameter("id"));
			response.sendRedirect("../../NexusBankingGroup/AccountPartyManagementMainServlet?action=viewAccountParty");
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
			HttpSession session;
			session = request.getSession();

			ap.setId(Long.parseLong(session.getAttribute("partyId").toString()));

			ap.setNpid(Long.parseLong(session.getAttribute("npId").toString()));

			ap.setEmail(email);
			ap.setMobileContact(mobile);
			ap.setHomeContact(home);
			ap.setOfficeContact(office);

			AccountPartyDAO apd = new AccountPartyDAOImpl();
			try {
				apd.updateAccountParty(ap);
				request.setAttribute("msg", "Account party updated successfully. ");

				RequestDispatcher rd = request.getRequestDispatcher(
						"AccountPartyManagementMainServlet?action=viewAccountParty&&id=" + ap.getId());
				rd.forward(request, response);
				// response.sendRedirect("jsp/ViewAccountParty.jsp");

			} catch (AccountPartyException e) {
				e.printStackTrace();
			}

		}
		if (action.equals("deleteAccountParty")) {

			Long id = Long.parseLong(request.getParameter("id"));
			AccountPartyDAO apd = new AccountPartyDAOImpl();
			try {
				apd.deleteAccountParty(id);
				request.setAttribute("msg", "Account party deleted successfully. ");

				RequestDispatcher rd = request.getRequestDispatcher(
						"AccountPartyManagementMainServlet?action=viewAccountParty&&id=" + ap.getId());
				rd.forward(request, response);

			} catch (AccountPartyException e) {
				e.printStackTrace();
			}
		}

		if (action.equals("search")) {

			if (request.getParameter("search").equals("searchbyname"))

			{
				String name = request.getParameter("txtname");
				List<AccountParty> list = new ArrayList<AccountParty>();
				AccountPartyManagementService serv = new AccountPartyManagementService();
				try {
					list = serv.searchByBusinessID((Long) session.getAttribute("npid"));
				} catch (CommercialCustandAcctMaintenance e) {

					request.setAttribute("msg", "An error has occurred.");
					RequestDispatcher rd = request.getRequestDispatcher("jsp/error.jsp");
					rd.forward(request, response);
				} catch (AccountPartyException e) {
					request.setAttribute("msg", "An error has occurred.");
					RequestDispatcher rd = request.getRequestDispatcher("jsp/error.jsp");
					rd.forward(request, response);
				}
				request.setAttribute("list", list);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/ViewAccountParty.jsp");
				rd.forward(request, response);

			}

			/*
			 * if (request.getParameter("search").equals("searchbyrelationship"))
			 * 
			 * { String relationship = request.getParameter("relationship");
			 * List<AccountParty> list = new ArrayList<AccountParty>();
			 * AccountPartyManagementService serv = new AccountPartyManagementService(); try
			 * { list =
			 * serv.searchByRelationship(relationship,(Long)session.getAttribute("npid")); }
			 * catch (CommercialCustandAcctMaintenance e) {
			 * 
			 * request.setAttribute("msg", "An error has occurred."); RequestDispatcher
			 * rd=request.getRequestDispatcher("jsp/error.jsp");
			 * rd.forward(request,response); } request.setAttribute("list", list);
			 * RequestDispatcher rd = request
			 * .getRequestDispatcher("jsp/ViewAccountParty.jsp"); rd.forward(request,
			 * response);
			 * 
			 * }
			 */
		}
	}

}
