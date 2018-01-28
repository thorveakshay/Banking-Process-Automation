//NBG

package com.training.controllers;

import static com.training.constants.CaoConstants.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.training.exception.SearchCustomerException;
import com.training.model.Account;
import com.training.model.BusinessCustomer;
import com.training.services.SearchCustomerService;

/**
 * Servlet implementation class SearchCustomerController
 */
public class SearchCustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private List<String> branchList;
	private List<Account> accountList;
	private List<BusinessCustomer> searchList = new ArrayList<BusinessCustomer>();
	private static Logger logger = Logger.getLogger(LoginServlet.class);

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

		SearchCustomerService scservice = new SearchCustomerService();
		HttpSession session = request.getSession();
		String action = request.getParameter(ACTION);

		if (SEARCH.equals(action)) {
			// get branchList

			try {
				branchList = (ArrayList<String>) scservice.retrieveBranches();
			} catch (SearchCustomerException e) {
				logger.error(e.getMessage());
				request.setAttribute("error", e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			}
			if (null != branchList) {
				request.setAttribute("branchList", branchList);

				request.setAttribute("msg", " ");

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/SearchCustomer.jsp");
				rd.forward(request, response);
			} else {
				logger.error("Error occured while fetching the branch list.");
				request.setAttribute("error", "Sorry, an internal error has occured. Please try after some time.");
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			}
		}

		else if (SEARCHDETAILS.equals(action)) {
			// Search by Business Name and Branch Name

			if (request.getParameter("businessName") != null && (!request.getParameter("bBranch").equals("Select"))) {

				String businessName = request.getParameter("businessName");
				String branch = request.getParameter("bBranch");
				String message;
				logger.info("Searching by business name and branch name");

				try {
					searchList = (ArrayList<BusinessCustomer>) scservice.searchByBusiness(businessName, branch);
				} catch (SearchCustomerException e) {
					logger.error(e.getMessage());
					request.setAttribute("error", e.getMessage());
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
					rd.forward(request, response);
				}

				if (searchList.size() == 0) {
					logger.info("The customer is not found");
					message = "Sorry, no match is found";
					request.setAttribute("msg", message);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/NoMatch.jsp");
					rd.forward(request, response);
				} else if (searchList.size() == 1) {
					// go for account creation
					// pass the business id

					logger.info("Only one customer is found");
					BusinessCustomer bcust = null;
					try {
						bcust = scservice.retrieveDetails(searchList.get(0).getId());
					} catch (SearchCustomerException e) {
						logger.error(e.getMessage());
						request.setAttribute("error", e.getMessage());
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
						rd.forward(request, response);

					}
					if (bcust != null) {
						// HttpSession session = request.getSession();
						session.setAttribute("bcust", bcust);
						request.setAttribute("bcust", bcust);
						RequestDispatcher rd = request.getRequestDispatcher("jsp/CustomerSummary.jsp");
						rd.forward(request, response);
					}

				} else {
					logger.info("A list of customers is found");
					request.setAttribute("businessCustomerList", searchList);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewSearchResult.jsp");
					rd.forward(request, response);
				}
			} // end of if businessname and branch

			// Search by Trading name and branch
			else if (request.getParameter("tradingName") != null
					&& (!request.getParameter("tBranch").equals("Select"))) {

				logger.info("Searching by trading name and branch name");

				searchList = new ArrayList<BusinessCustomer>();
				String tradingName = request.getParameter("tradingName");
				String branch = request.getParameter("tBranch");
				String message;

				try {
					searchList = (ArrayList<BusinessCustomer>) scservice.searchByTrading(tradingName, branch);
				} catch (SearchCustomerException e) {
					logger.error(e.getMessage());
					request.setAttribute("error", e.getMessage());
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
					rd.forward(request, response);
				}

				if (searchList.size() == 0) {

					logger.info("The customer is not found");
					message = "Sorry, no match is found";
					request.setAttribute("msg", message);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/NoMatch.jsp");
					rd.forward(request, response);
				} else if (searchList.size() == 1) {
					logger.info("Only one customer is found");

					// go for account creation
					// pass the business id
					BusinessCustomer bcust = null;
					try {
						bcust = scservice.retrieveDetails(searchList.get(0).getId());
					} catch (SearchCustomerException e) {
						logger.error(e.getMessage());
						request.setAttribute("error", e.getMessage());
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
						rd.forward(request, response);
					}
					if (bcust != null) {
						// HttpSession session = request.getSession();
						session.setAttribute("bcust", bcust);
						request.setAttribute("bcust", bcust);
						RequestDispatcher rd = request.getRequestDispatcher("jsp/CustomerSummary.jsp");
						rd.forward(request, response);
					}

				} else {
					logger.info("A list of customers is found");
					request.setAttribute("businessCustomerList", searchList);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewSearchResult.jsp");
					rd.forward(request, response);
				}
			} // end of search by trading name and branch

			// search by Account number
			else if (request.getParameter("accountNo") != null) {
				// List<BusinessCustomer> searchList = new ArrayList<BusinessCustomer>();

				logger.info("Search by account number");
				searchList = new ArrayList<BusinessCustomer>();
				String accNo = request.getParameter("accountNo");
				String message;

				try {
					searchList = (ArrayList<BusinessCustomer>) scservice.searchByAccountNo(accNo);
				} catch (SearchCustomerException e) {
					logger.error(e.getMessage());
					request.setAttribute("error", e.getMessage());
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
					rd.forward(request, response);
				}

				if (searchList.size() == 0) {
					logger.info("The customer is not found");
					message = "Sorry, no match is found";
					request.setAttribute("msg", message);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/NoMatch.jsp");
					rd.forward(request, response);
				} else if (searchList.size() == 1) {
					logger.info("Only one customer is found");

					// go for account creation
					// pass the business id
					BusinessCustomer bcust = null;
					try {
						bcust = scservice.retrieveDetails(searchList.get(0).getId());
					} catch (SearchCustomerException e) {
						logger.error(e.getMessage());
						request.setAttribute("error", e.getMessage());
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
						rd.forward(request, response);
					}
					if (bcust != null) {
						// HttpSession session = request.getSession();
						session.setAttribute("bcust", bcust);
						request.setAttribute("bcust", bcust);
						RequestDispatcher rd = request.getRequestDispatcher("jsp/CustomerSummary.jsp");
						rd.forward(request, response);
					}

				} else {
					logger.info("A list of customers is found");
					request.setAttribute("businessCustomerList", searchList);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewSearchResult.jsp");
					rd.forward(request, response);
				}
			} // end of search by account number

		} // end of else if searchDetails

		else if (BACK.equals(action)) {
			logger.info("Back to the Search Customer Page");
			int j = 0;
			for (int i = 0; i < searchList.size();) {
				searchList.remove(j);
			}
			request.setAttribute("branchList", branchList);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/SearchCustomer.jsp");
			rd.forward(request, response);
		}

		else if (BACKFROMSUMMARY.equals(action)) {
			if (searchList.size() == 1) {
				logger.info("In back summary");
				RequestDispatcher rd = request.getRequestDispatcher("/SearchCustomerController?action=back");
				rd.forward(request, response);
			} else if (searchList.size() > 1) {
				request.setAttribute("businessCustomerList", searchList);

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewSearchResult.jsp");
				rd.forward(request, response);
			}
		}

		else if (SHOWDETAILS.equals(action)) {

			logger.info("in show details");
			// get the value of radio button in ViewSearchResult
			String selectedOption = (String) request.getParameter("select");

			int bid = Integer.parseInt(selectedOption);

			logger.info("Selected Business ID= " + bid);
			BusinessCustomer bcust = null;
			try {
				bcust = scservice.retrieveDetails(bid);
			} catch (SearchCustomerException e) {
				logger.error(e.getMessage());
				request.setAttribute("error", e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			}
			if (null != bcust) {
				// HttpSession session = request.getSession();
				session.setAttribute("bcust", bcust);
				request.setAttribute("bcust", bcust);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/CustomerSummary.jsp");
				rd.forward(request, response);
			} else {
				logger.error("Null value has been detected");
				request.setAttribute("error", "Sorry, Internal error has occured. Please try again after some time.");
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			}
		}

		else if (action.equals("SummaryDetails")) {
			BusinessCustomer bcust = new BusinessCustomer();
			ArrayList<Account> accList = new ArrayList<Account>();
			bcust = (BusinessCustomer) session.getAttribute("bcust");
			try {
				logger.info("bcust id in summarydetails ===" + bcust.getId());
				accList = scservice.getAccountInProgress(bcust);
				logger.info("size of accountList in summaryDetails =" + accList.size());
			} catch (SearchCustomerException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (accList.size() > 0) {
				request.setAttribute("accountList", accList);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewPendingAccounts.jsp");
				rd.forward(request, response);

			} else {
				logger.info("User has confirmed the details and proceeding for Account Creation");
				logger.info("in else of summarydetails");
				RequestDispatcher rd = request.getRequestDispatcher("/AccountCreationServlet?action=open");
				rd.forward(request, response);
			}

		} else if (action.equals("ShowAccDetails")) {
			ArrayList<Account> accountsList = new ArrayList<Account>();
			String selectedOption[] = request.getParameterValues("select");

			for (int i = 0; i < selectedOption.length; i++) {
				/// proList.delProduct(Integer.parseInt(values[i]));
				try {
					Account account = scservice.retrieveAccountDetails((Integer.parseInt(selectedOption[i])));
					accountsList.add(account);

				} catch (NumberFormatException e) {

					e.printStackTrace();
				} catch (SearchCustomerException e) {

					e.printStackTrace();
				}

			}
			logger.info("size of accout List in showAccDEtails in search servlet ==" + accountsList.size());
			session.setAttribute("accountsList", accountsList);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/AccountHome.jsp");

			rd.forward(request, response);

		}
	}

}
