package com.training.controllers;

import static com.training.constants.CaoConstants.*;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.List;

import com.training.exception.AccountCreationException;
import com.training.exception.SearchCustomerException;
import com.training.model.Account;
import com.training.model.BusinessCustomer;
import com.training.model.Product;
import com.training.services.AccountCreationService;
import com.training.services.SearchCustomerService;

/**
 * Servlet implementation class AccountCreationServlet
 */
public class AccountCreationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AccountCreationService accountService = new AccountCreationService();
	static List<Account> accDisplayList = new ArrayList<Account>();
	static List<Account> accountsList = new ArrayList<Account>();
	static int serialNo;
	BusinessCustomer bcustomer = null;

	private static Logger logger = Logger.getLogger(LoginServlet.class);

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
		SearchCustomerService scservice = new SearchCustomerService();
		Account acc = null;
		List<String> branchList = null;
		List<Product> productList = null;
		String bname = null;

		String action = request.getParameter(ACTION);

		if (OPEN.equals(action)) {
			logger.info("Account creation process has been started");

			serialNo = 0;

			if (accDisplayList.size() > 0)
				for (int i = 0; i < accDisplayList.size();)
					accDisplayList.remove(i);

			if (accountsList.size() > 0)
				for (int i = 0; i < accountsList.size();)
					accountsList.remove(i);

			logger.info("The list of accounts is initialized");

			bcustomer = (BusinessCustomer) request.getSession().getAttribute("bcust");

			try {
				// Retrieve and show the branches of the bank
				branchList = (ArrayList<String>) scservice.retrieveBranches();
			} catch (SearchCustomerException e) {
				logger.error(e.getMessage());
				request.setAttribute("error", e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			} catch (Exception e) {
				logger.error(e.getMessage());
				request.setAttribute("error",
						"Sorry, an internal error has occured or your session has expired. Please try again after some time");
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			}

			if (bcustomer != null && branchList != null) {
				// At first combo box will be shown
				request.setAttribute("activate", "ON");
				request.setAttribute("branchList", branchList);

				bname = bcustomer.getBusinessName();
				request.setAttribute("bname", bname);

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/AccountCreation.jsp");
				rd.forward(request, response);
			}

		}

		else if (ACCOUNTDETAILS.equals(action)) {

			String branch = request.getParameter("BranchName");

			// Save the branch name selected by user in which account will be
			// opened
			request.getSession().setAttribute("selectedBranch", branch);

			String productIntention = request.getParameter("ProductIntention");
			int npId = 0;
			if (bcustomer != null)
				npId = bcustomer.getId();
			else {
				logger.error("Cannot forward because of refreshing the page");
				request.setAttribute("error", "Please do not refresh the page during the account creation");
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			}

			logger.info("Selected product intention is: " + productIntention + " for customer with ID :" + npId);

			acc = new Account(0, branch, productIntention);

			if (bcustomer != null)
				bname = bcustomer.getBusinessName();
			accDisplayList.add(acc);
			String view = "result";

			if (bcustomer != null && branch != null && accDisplayList != null) {
				// Only text box with already selected branch name will be shown
				request.setAttribute("activate", "OFF");
				request.setAttribute("branchList", branchList);
				request.setAttribute("branch", branch);
				request.setAttribute("msg", view);
				request.setAttribute("acc", accDisplayList);
				request.setAttribute("bname", bname);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/AccountCreation.jsp");
				rd.forward(request, response);
			}

		} // action.equals(accountdetails)

		else if (SUBMITDETAILS.equals(action)) {
			boolean flag = false;

			// Displaying for which account type you are generating an account number from
			// the selected account types
			serialNo++;
			String sno = " " + serialNo;
			int npId = 0;
			if (bcustomer != null) {
				bname = bcustomer.getBusinessName();
				npId = bcustomer.getId();
			} else {
				logger.error("Cannot forward because of refreshing the page");
				/*
				 * request.setAttribute("error",
				 * "Please do not refresh the page during the account creation");
				 * RequestDispatcher rd = request .getRequestDispatcher("/jsp/Error.jsp");
				 * rd.forward(request, response);
				 */
			}
			// If user has deleted all the product intentions and clicking on
			// Proceed
			if (accDisplayList.size() == 0) {
				try {
					throw new AccountCreationException(
							"Sorry we cannot process your request as you have not selected any product intention.");
				} catch (AccountCreationException e) {
					logger.error("Error occured since user has not selected any product intention");
					request.setAttribute("error", e.getMessage());
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
					rd.forward(request, response);
				} catch (Exception e) {
					logger.error(e.getMessage());
					request.setAttribute("error",
							"Sorry, an internal error has occured or your session has expired. Please try again after some time");
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
					rd.forward(request, response);
				}
			} else {
				// checks if customer is from UK or not
				try {
					flag = accountService.customerFromUkOrNot(npId);
				} catch (AccountCreationException e1) {
					logger.error(e1.getMessage());
					request.setAttribute("error", e1.getMessage());
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
					rd.forward(request, response);
				} catch (Exception e) {
					logger.error(e.getMessage());
					request.setAttribute("error",
							"Sorry, an internal error has occured or your session has expired. Please try again after some time");
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
					rd.forward(request, response);
				}

				if (flag == true) // UK customer
				{
					logger.info("The customer is from UK");
					// go for product selection
					logger.info("Product Intention: " + accDisplayList.get(0).getProductIntension());
					request.setAttribute("intentionList", accDisplayList);
					productList = new ArrayList<Product>();

					// display eligible product list in combo box
					String account_type = accDisplayList.get(0).getProductIntension();
					String business_type = bcustomer.getBusinessType();
					try {
						productList = accountService.getEligibleProducts(account_type, business_type);
					} catch (AccountCreationException e) {
						logger.error(e.getMessage());
						request.setAttribute("error", e.getMessage());
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
						rd.forward(request, response);
					} catch (Exception e) {
						logger.error(e.getMessage());
						request.setAttribute("error",
								"Sorry, an internal error has occured or your session has expired. Please try again after some time");
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
						rd.forward(request, response);
					}

					if (productList != null) {
						logger.info("in prod");
						request.setAttribute("prodList", productList);
						request.setAttribute("bname", bname);
						request.setAttribute("serialNo", sno.trim());
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/SelectProduct.jsp");
						rd.forward(request, response);
					} else {
						request.setAttribute("error", "Sorry, currently no product is available");
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
						rd.forward(request, response);
					}
				} else if (flag == false) // Non UK customer
				{
					logger.info("The customer is not from UK");
					String message = null;

					// Check already assigned and recently selected product
					// intentions
					try {
						message = accountService.checkNoOfAccounts((ArrayList<Account>) accDisplayList, npId);
					} catch (AccountCreationException e1) {
						logger.error(e1.getMessage());
						request.setAttribute("error", e1.getMessage());
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
						rd.forward(request, response);
					} catch (Exception e) {
						logger.error(e.getMessage());
						request.setAttribute("error",
								"Sorry, an internal error has occured or your session has expired. Please try again after some time");
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
						rd.forward(request, response);
					}
					if (message.equals("OK")) {
						productList = new ArrayList<Product>();

						// go for product
						request.setAttribute("intentionList", accDisplayList);

						// display eligible product list in combo box
						String account_type = accDisplayList.get(0).getProductIntension();
						String business_type = bcustomer.getBusinessType();
						try {
							productList = accountService.getEligibleProducts(account_type, business_type);
						} catch (AccountCreationException e) {
							logger.error(e.getMessage());
							request.setAttribute("error", e.getMessage());
							RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
							rd.forward(request, response);
						} catch (Exception e) {
							logger.error(e.getMessage());
							request.setAttribute("error",
									"Sorry, an internal error has occured or your session has expired. Please try again after some time");
							RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
							rd.forward(request, response);
						}

						if (productList != null) {
							request.setAttribute("prodList", productList);
							request.setAttribute("bname", bname);

							request.setAttribute("serialNo", sno.trim());
							RequestDispatcher rd = request.getRequestDispatcher("/jsp/SelectProduct.jsp");
							rd.forward(request, response);
						} else {
							request.setAttribute("error", "Sorry, currently no product is available");
							RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
							rd.forward(request, response);
						}
					} else {
						// User has selected more than 1 current or savings account
						String view = "result";
						request.setAttribute("branchList", branchList);
						request.setAttribute("msg", view);
						request.setAttribute("alert", message);
						request.setAttribute("acc", accDisplayList);
						request.setAttribute("bname", bname);

						request.setAttribute("branch", (String) request.getSession().getAttribute("selectedBranch"));
						request.setAttribute("activate", "OFF");
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/AccountCreation.jsp");
						rd.forward(request, response);
					}

				} // end flag
			} // end of else
		}

		else if (REMOVE.equals(action)) {

			logger.info("Removing the selected product intention");
			String prodIntention = request.getParameter("intension");
			String serialNum = request.getParameter("number");
			int serialNumber = Integer.parseInt(serialNum);
			logger.info("The serial number is :" + serialNumber);
			accDisplayList = accountService.removeIntention(accDisplayList, prodIntention, serialNumber);

			bname = bcustomer.getBusinessName();

			String view = "result";
			request.setAttribute("branchList", branchList);
			request.setAttribute("msg", view);

			// show the table if there are still some product intentions added
			if (accDisplayList.size() != 0)
				request.setAttribute("acc", accDisplayList);

			// The table should be disappeared if all the intentions are removed
			else if (accDisplayList.size() == 0)
				request.setAttribute("msg", " ");

			request.setAttribute("branch", (String) request.getSession().getAttribute("selectedBranch"));

			request.setAttribute("activate", "OFF");
			request.setAttribute("bname", bname);

			RequestDispatcher rd = request.getRequestDispatcher("/jsp/AccountCreation.jsp");
			rd.forward(request, response);
		}

		else if (PRODUCTCHOICE.equals(action)) {
			String branchEntered = (String) request.getSession().getAttribute("selectedBranch");
			String branchCode = null;// initialized it

			try {
				branchCode = accountService.findBranchCode(branchEntered);
			} catch (AccountCreationException e1) {
				logger.error("Error has occured while fetching the code of branch");
				request.setAttribute("error", e1.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			} catch (Exception e) {
				logger.error(e.getMessage());
				request.setAttribute("error",
						"Sorry, an internal error has occured or your session has expired. Please try again after some time");
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			}
			if (branchCode != null) {
				branchCode = branchCode.substring(1);
			} else {
				request.setAttribute("error", "Sorry, internal error has occured. Please try after some time.");
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			}

			// For generating unique account number
			long acNo = 0;
			int unique = 0;
			// Check whether the generated account number is unique or not
			while (unique == 0) // account number is already present in the
			// database
			{
				acNo = accountService.generateAccountNo(Integer.parseInt(branchCode));
				try {
					unique = accountService.checkUniqueness(acNo);
					logger.info("Is account number unique? " + unique);
				} catch (AccountCreationException e) {
					unique = 0;
				} catch (Exception e) {
					logger.error(e.getMessage());
					request.setAttribute("error",
							"Sorry, an internal error has occured or your session has expired. Please try again after some time");
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
					rd.forward(request, response);
				}
			}

			bname = bcustomer.getBusinessName();

			logger.info("Account generated with " + acNo);
			String acNoString = "" + acNo;
			request.setAttribute("AccountNo", acNoString);
			request.setAttribute("branchName", branchEntered);
			request.setAttribute("businessName", bname);
			request.setAttribute("productIntention", accDisplayList.get(0).getProductIntension());

			request.getSession().setAttribute("intention", accDisplayList.get(0).getProductIntension());

			request.setAttribute("productName", (String) request.getParameter("chooseProduct"));

			request.getSession().setAttribute("accList", accDisplayList);

			// setting product id in a session so that it can be used for
			// additional product selection
			int prodId = 0;
			try {
				prodId = accountService.getProductId((String) request.getParameter("chooseProduct"));
			} catch (AccountCreationException e1) {
				logger.error("Error occured while fetching product id");

				request.setAttribute("error", e1.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			} catch (Exception e) {
				logger.error(e.getMessage());
				request.setAttribute("error",
						"Sorry, an internal error has occured or your session has expired. Please try again after some time");
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			}

			// Create an account object
			if (prodId != 0) {

				logger.info("Creating an account");

				Account account = new Account(acNo, branchEntered, (String) request.getParameter("intention"),
						(String) request.getParameter("chooseProduct"));

				request.getSession().setAttribute("account", account);
				request.getSession().setAttribute("productId", "" + prodId);

			}

			request.setAttribute("bname", bname);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/ConfirmPage.jsp");
			rd.forward(request, response);
		}

		else if (action.equals("ConfirmationPage")) {

			// Insert captured details into database
			int prodId = Integer.parseInt((String) request.getSession().getAttribute("productId"));
			Account account = null;
			if (request.getSession() != null)
				account = (Account) request.getSession().getAttribute("account");
			else {
				request.setAttribute("error", "Sorry, the session is expired");
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			}
			logger.info("Confirming the account: " + account.getAccNumber() + " with product intention: "
					+ account.getProductIntension());
			if (prodId != 0) {
				try {
					int npId = bcustomer.getId();
					String businessName = bcustomer.getBusinessName();
					accountService.addAccount(account, npId, businessName, prodId);
					// maintain a list of accounts for changing status
					// afterwards
					accountsList.add(account);

					request.getSession().setAttribute("accountsList", accountsList);

					logger.info(
							"Account " + accountsList.get(0).getAccNumber() + " is successfully added in the database");

				} catch (AccountCreationException e) {

					logger.error(e.getMessage());

				} catch (Exception e) {
					logger.error(e.getMessage());
					request.setAttribute("error",
							"Sorry, an internal error has occured or your session has expired. Please try again after some time");
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
					rd.forward(request, response);
				}
			}

			RequestDispatcher rd = request
					.getRequestDispatcher("/AdditionalProductConfigurationController?action=AddAdditionalProduct");
			rd.forward(request, response);
		}

	}// do post
}// end servlet
