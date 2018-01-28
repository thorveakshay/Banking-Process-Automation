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

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.AccParty;
import com.training.model.Branch;
import com.training.model.BusinessCustomer;
import com.training.services.AccountPartyListService;
import com.training.services.GetCustomersService;

public class GetCustServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(GetCustServlet.class);
	int offset;
	int length;
	String parameter1 = null;
	String parameter2 = null;
	String actionname = null;
	HttpServletRequest request;
	HttpServletResponse response;

	List<BusinessCustomer> bcustList;

	public GetCustServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.request = request;
		this.response = response;

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.request = request;
		this.response = response;

		HttpSession session = request.getSession();

		String action = request.getParameter("action");
		logger.info("In GetCustServlet");

		if (action.equals("searchCustomerBy")) {

			logger.debug("Action Is:" + action);

			if (request.getParameter("TradingName") != null) {
				parameter2 = request.getParameter("TradingName");
				parameter1 = request.getParameter("BranchName2");
				logger.debug("Trading Name:" + parameter2);
				logger.debug("Branch Name:" + parameter1);
				actionname = "SearchCustomer2";
			}

			else if (request.getParameter("BusinessName") != null) {

				parameter1 = request.getParameter("BusinessName");
				parameter2 = request.getParameter("BranchName1");
				actionname = "SearchCustomer1";
			} else

			if (request.getParameter("AccountNumber") != null) {
				parameter1 = request.getParameter("AccountNumber");
				parameter2 = null;
				actionname = "SearchCustomer3";
			}
			ArrayList<BusinessCustomer> bcustList = new ArrayList<BusinessCustomer>();
			try {

				GetCustomersService gcs = new GetCustomersService();

				if (parameter2 == null) {

					Boolean flag = gcs.checkAccountNumber(parameter1);

					if (flag == true)// if searching by accno

					{

						gcs = new GetCustomersService();

						session = request.getSession();

						Long rmId = Long.parseLong(session.getAttribute("uid").toString());

						bcustList = gcs.getBusinessCustomer(parameter1, parameter2, actionname);

						if (session.getAttribute("designation").toString().equals("RELATIONSHIP MANAGER")) {
							bcustList = gcs.getBusinessCustomerForRm(parameter1, parameter2, actionname, rmId);

						}
						HttpSession httpSession = request.getSession();

						logger.info("sub logged user is " + session.getAttribute("subLoggedUser").toString());

						httpSession.setAttribute("bcobj", bcustList);

						RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewBusinessCustomers.jsp");
						rd.forward(request, response);

					} else {

						RequestDispatcher rd = request.getRequestDispatcher("/jsp/SorryMessage.jsp");
						rd.forward(request, response);
					}

				} else// if searching by bus name and tranding name
				{
					bcustList = gcs.getBusinessCustomer(parameter1, parameter2, actionname);
					session = request.getSession();

					Long rmId = Long.parseLong(session.getAttribute("uid").toString());

					if (session.getAttribute("designation").toString().equals("RELATIONSHIP MANAGER")) {
						bcustList = gcs.getBusinessCustomerForRm(parameter1, parameter2, actionname, rmId);

					}
					if (bcustList.size() == 0) {
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/SorryMessage.jsp");
						rd.forward(request, response);

					} else if (bcustList.size() == 1) {
						ArrayList<AccParty> ap = new ArrayList<AccParty>();
						AccountPartyListService aps = new AccountPartyListService();
						ap = aps.getAccountPartyList(bcustList.get(0).getBusinessId());
						session = request.getSession();
						session.setAttribute("npId", bcustList.get(0).getBusinessId());
						session.setAttribute("accountParty", ap);
						session.setAttribute("businessName", bcustList.get(0).getBusinessName());
						// logger.info((new
						// StringBuilder(String.valueOf(businessName))).append(" bname").toString());
						session.setAttribute("branchName", bcustList.get(0).getBranchName());
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/AccountPartyList.jsp");
						rd.forward(request, response);
					}

					else {

						gcs = new GetCustomersService();

						bcustList = gcs.getBusinessCustomer(parameter1, parameter2, actionname);
						session = request.getSession();

						rmId = Long.parseLong(session.getAttribute("uid").toString());

						if (session.getAttribute("designation").toString().equals("RELATIONSHIP MANAGER")) {
							bcustList = gcs.getBusinessCustomerForRm(parameter1, parameter2, actionname, rmId);

						}
						HttpSession httpSession = request.getSession();
						httpSession.setAttribute("bcobj", bcustList);

						RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewBusinessCustomers.jsp");
						rd.forward(request, response);
					}
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {

				e.printStackTrace();
			} catch (CommercialCustandAcctMaintenance e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if (action.equals("tryAgain")) {
			logger.debug("Action Is:" + action);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/SearchCustomerBy.jsp");
			rd.forward(request, response);
		}

		if (action.equals("getBranchList")) {
			logger.info("In Servlet action is:" + action);
			// logger.info(" in servlet for branch =====againnnnn "+action);

			ArrayList<Branch> bList = new ArrayList<Branch>();
			try {

				session = request.getSession();
				session.setAttribute("subLoggedUser", "CLOSE_ACCOUNT");

				GetCustomersService gcs = new GetCustomersService();
				bList = gcs.getBranchListService();
				// logger.info("2nd branch naem in servlet =="+bList.get(1).getBranch_name());
				request.setAttribute("branchList", bList);

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/SearchCustomerBy.jsp");
				rd.forward(request, response);

			} catch (ClassNotFoundException e) {

				e.printStackTrace();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		}

		else if (action.equals("getBranchList1")) {
			// logger.info(" in servlet for branch =====againnnnn "+action);
			logger.debug("Action Is:" + action);

			ArrayList<Branch> bList = new ArrayList<Branch>();
			try {

				session = request.getSession();
				session.setAttribute("subLoggedUser", "CLOSE_ACCOUNT");

				GetCustomersService gcs = new GetCustomersService();
				bList = gcs.getBranchListService();
				// logger.info("2nd branch naem in servlet =="+bList.get(1).getBranch_name());
				request.setAttribute("branchList", bList);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/SearchCustomerBy.jsp");
				rd.forward(request, response);

			} catch (ClassNotFoundException e) {

				e.printStackTrace();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		} else if (action.equals("getBranchList2")) {
			logger.debug("Action Is:" + action);
			// logger.info(" in servlet for branch =====againnnnn "+action);

			ArrayList<Branch> bList = new ArrayList<Branch>();
			try {

				session = request.getSession();
				session.setAttribute("subLoggedUser", "SWITCH_PRODUCT");

				GetCustomersService gcs = new GetCustomersService();
				bList = gcs.getBranchListService();
				// logger.info("2nd branch naem in servlet =="+bList.get(1).getBranch_name());
				request.setAttribute("branchList", bList);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/SearchCustomerBy.jsp");
				rd.forward(request, response);

			} catch (ClassNotFoundException e) {

				e.printStackTrace();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		} else if (action.equals("getBranchList3")) {
			// logger.info(" in servlet for branch =====againnnnn "+action);
			logger.debug("Action Is:" + action);

			ArrayList<Branch> bList = new ArrayList<Branch>();
			try {

				session = request.getSession();
				session.setAttribute("subLoggedUser", "GENERATE_TICKET");

				GetCustomersService gcs = new GetCustomersService();
				bList = gcs.getBranchListService();
				// logger.info("2nd branch naem in servlet =="+bList.get(1).getBranch_name());
				request.setAttribute("branchList", bList);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/SearchCustomerBy.jsp");
				rd.forward(request, response);

			} catch (ClassNotFoundException e) {

				e.printStackTrace();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		} else if (action.equals("getBranchList4")) {
			// logger.info(" in servlet for branch =====againnnnn "+action);

			logger.debug("Action Is:" + action);
			ArrayList<Branch> bList = new ArrayList<Branch>();
			try {

				session = request.getSession();
				session.setAttribute("subLoggedUser", "UPDATE_BUZ_ADDR");

				GetCustomersService gcs = new GetCustomersService();
				bList = gcs.getBranchListService();
				// logger.info("2nd branch naem in servlet =="+bList.get(1).getBranch_name());
				request.setAttribute("branchList", bList);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/SearchCustomerBy.jsp");
				rd.forward(request, response);

			} catch (ClassNotFoundException e) {

				e.printStackTrace();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		} else if (action.equals("getBranchList5")) {
			// logger.info(" in servlet for branch =====againnnnn "+action);

			logger.debug("Action Is:" + action);
			ArrayList<Branch> bList = new ArrayList<Branch>();
			try {

				session = request.getSession();
				session.setAttribute("subLoggedUser", "UPDATE_BUZ_CONTACT");

				GetCustomersService gcs = new GetCustomersService();
				bList = gcs.getBranchListService();
				// logger.info("2nd branch naem in servlet =="+bList.get(1).getBranch_name());
				request.setAttribute("branchList", bList);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/SearchCustomerBy.jsp");
				rd.forward(request, response);

			} catch (ClassNotFoundException e) {

				e.printStackTrace();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		}

		else if (action.equals("getBranchList0")) {
			// logger.info(" in servlet for branch =====againnnnn "+action);

			logger.debug("Action Is:" + action);
			ArrayList<Branch> bList = new ArrayList<Branch>();
			try {

				session = request.getSession();
				session.setAttribute("subLoggedUser", "CHANGE_ACCT_TITLE");

				GetCustomersService gcs = new GetCustomersService();
				bList = gcs.getBranchListService();
				// logger.info("2nd branch naem in servlet =="+bList.get(1).getBranch_name());
				request.setAttribute("branchList", bList);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/SearchCustomerBy.jsp");
				rd.forward(request, response);

			} catch (ClassNotFoundException e) {

				e.printStackTrace();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		} else if (action.equals("getBranchList6")) {
			logger.debug("Action Is:" + action);
			String LoggedUser = "ADD_ACCOUNT_PARTY";
			session.setAttribute("subLoggedUser", LoggedUser);
			// logger.info("in getcustServlet ===== 666666");

			ArrayList<Branch> bList = new ArrayList<Branch>();
			try {

				GetCustomersService gcs = new GetCustomersService();
				bList = gcs.getBranchListService();
				// logger.info("2nd branch naem in servlet =="+bList.get(1).getBranch_name());
				request.setAttribute("branchList", bList);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/SearchCustomerBy.jsp");
				rd.forward(request, response);

			} catch (ClassNotFoundException e) {

				e.printStackTrace();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		} else if (action.equals("getBranchList7")) {
			// logger.info("in getcustServlet ===== 666666");
			logger.debug("Action Is:" + action);
			ArrayList<Branch> bList = new ArrayList<Branch>();
			try {
				session = request.getSession();
				session.setAttribute("subLoggedUser", "VIEW_CUSTOMER_DETAILS");
				// logger.info("r888888888888888888888");
				GetCustomersService gcs = new GetCustomersService();
				bList = gcs.getBranchListService();
				// logger.info("2nd branch naem in servlet =="+bList.get(1).getBranch_name());
				request.setAttribute("branchList", bList);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/SearchCustomerBy.jsp");
				rd.forward(request, response);

			} catch (ClassNotFoundException e) {

				e.printStackTrace();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		} else if (action.equals("getBranchList8")) {
			logger.debug("Action Is:" + action);
			String LoggedUser = "VIEW_ACCOUNT_PARTY";
			session.setAttribute("subLoggedUser", LoggedUser);
			// logger.info("in getcustServlet ===== 666666");

			ArrayList<Branch> bList = new ArrayList<Branch>();
			try {

				GetCustomersService gcs = new GetCustomersService();
				bList = gcs.getBranchListService();
				// logger.info("2nd branch naem in servlet =="+bList.get(1).getBranch_name());
				request.setAttribute("branchList", bList);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/SearchCustomerBy.jsp");
				rd.forward(request, response);

			} catch (ClassNotFoundException e) {

				e.printStackTrace();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		}
		if (action.equals("CloseTicket")) {
			logger.debug("Action is:" + action);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/HomeTicket.jsp");
			rd.forward(request, response);
		}
	}

}
