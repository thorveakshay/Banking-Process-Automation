package com.training.controllers;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Account;
import com.training.model.AccountParty;
import com.training.model.Branch;
import com.training.model.BusinessCustomer;
import com.training.services.AccountPartyListService;
import com.training.services.SearchCustomerService;
import com.training.services.VerifyCustomerService;
import com.training.utils.AeSimpleSHA1;

public class VerifyCustomerServlet extends HttpServlet {
	HttpSession session;
	private static Logger logger = Logger.getLogger(VerifyCustomerServlet.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// logger.info("i am inside cust servlet");

		String action = request.getParameter("action");
		// logger.info("hi servlet");
		logger.info("In verify Customer Servlet");
		if (action.equals("gotoShowBusinessCustomer")) {
			logger.debug("Action is:" + action);
			session = request.getSession();
			String loggeduser = (String) session.getAttribute("subLoggedUser");
			String businessDetail = request.getParameter("businessData");
			// logger.info("business details are "+businessDetail);
			// logger.info((new
			// StringBuilder(String.valueOf(businessDetail))).append("
			// businessDetail").toString());
			int i = 0;
			String s = businessDetail;
			String temp[] = new String[7];
			String delim = "#";
			for (StringTokenizer st = new StringTokenizer(s, delim); st.hasMoreTokens();) {
				temp[i] = st.nextToken();
				i++;
			}

			String businessId = temp[0];
			// logger.info("bus id is "+temp[0]);
			Long busId = Long.parseLong(businessId);
			if (loggeduser.equalsIgnoreCase("VIEW_CUSTOMER_DETAILS")) {
				BusinessCustomer bc = new BusinessCustomer();
				SearchCustomerService scs = new SearchCustomerService();
				try {
					bc = scs.getBusinessDetails(busId);

					request.setAttribute("bcobj", bc);
					RequestDispatcher rd = request.getRequestDispatcher("jsp/ShowBusinessCustomerDetails.jsp");
					rd.forward(request, response);

				} catch (NumberFormatException e) {

					e.printStackTrace();
				} catch (CommercialCustandAcctMaintenance e) {

					e.printStackTrace();
				}

			}
		}
		if (action.equals("verifyCustomer")) {
			logger.debug("Action is:" + action);
			boolean flag = false;
			// logger.info("===============================");
			// logger.info("hi action verify");
			String answer1 = request.getParameter("seqans");
			String answer2 = request.getParameter("seqans1");
			String accpid = request.getParameter("accountPartyID");
			Long busid = Long.parseLong(request.getParameter("busid"));

			Long apid = Long.valueOf(Long.parseLong(accpid));
			String seqans = request.getParameter("seqans").toString();
			String seqans1 = null;

			if (request.getParameter("seqans1") != null) {
				seqans1 = request.getParameter("seqans1").toString();
			}
			int chk_flag = 0;

			VerifyCustomerService vcs = new VerifyCustomerService();
			try {

				ArrayList<String> seq_ans_array = new ArrayList<String>();

				seq_ans_array = vcs.getSecurityQuestionAnswer(apid);

				int n = seq_ans_array.size();

				if (n == 2) {
					if (AeSimpleSHA1.SHA1(seqans).equals(seq_ans_array.get(0))) {
						if (AeSimpleSHA1.SHA1(seqans1).equals(seq_ans_array.get(1)))
							chk_flag = 1;

					}
				}

				if (n == 1) {
					if (AeSimpleSHA1.SHA1(seqans).equals(seq_ans_array.get(0))) {
						chk_flag = 1;

					}

				}

				if (chk_flag == 1) {
					session = request.getSession();
					String loggeduser = (String) session.getAttribute("subLoggedUser");
					// logger.info("in verify customer servlet session name is "+loggeduser);
					logger.debug("logged user is:" + loggeduser);
					// logger.info("user"+loggeduser);
					// logger.info("Customer verified Successfully !!!!");
					logger.info("Customer verified Successfully");
					logger.info("link clicked is : " + loggeduser);
					if (loggeduser.equalsIgnoreCase("ADD_ACCOUNT_PARTY")) {
						String npId = request.getParameter("busid");

						request.setAttribute("npId", npId);
						HttpSession session = request.getSession();
						session.setAttribute("npId", npId);
						AccountPartyListService apls = new AccountPartyListService();
						ArrayList<Branch> blist = new ArrayList<Branch>();

						blist = apls.getBranchList();

						// HttpSession session;
						session = request.getSession();

						session.setAttribute("blist", blist);

						RequestDispatcher rd = request.getRequestDispatcher("jsp/CaptureBasicAccountPartyDetails.jsp");
						rd.forward(request, response);
					}
					if (loggeduser.equalsIgnoreCase("VIEW_ACCOUNT_PARTY")) {
						// logger.info("navdeep in view account party");
						String npId = request.getParameter("busid");

						request.setAttribute("npId", npId);
						HttpSession session = request.getSession();
						session.setAttribute("npId", npId);
						logger.info("npId in verify servlet.. " + npId);
						/*
						 * RequestDispatcher rd =
						 * request.getRequestDispatcher("jsp/ViewAccountParty.jsp" );
						 * rd.forward(request,response);
						 */
						response.sendRedirect(
								"/NexusBankingGroup/AccountPartyManagementMainServlet?action=viewAccountParty");
					}
					if (loggeduser.equalsIgnoreCase("GENERATE_TICKET")) {
						// logger.info("hi hde");

						accpid = request.getParameter("accountPartyID");
						String accpName = request.getParameter("accpName");
						String busname = request.getParameter("busname");
						String busid1 = request.getParameter("busid");
						String relationshipType = request.getParameter("relationshipType");
						String branchName = request.getParameter("brname");

						request.setAttribute("branchName", branchName);
						request.setAttribute("accpid", accpid);
						request.setAttribute("accpName", accpName);
						request.setAttribute("busname", busname);
						request.setAttribute("busid", busid1);
						request.setAttribute("relationshipType", relationshipType);

						RequestDispatcher rd = request.getRequestDispatcher("jsp/CreateTicket.jsp");
						rd.forward(request, response);
					}

					if (loggeduser.equalsIgnoreCase("CHANGE_ACCT_TITLE")
							|| loggeduser.equalsIgnoreCase("SWITCH_PRODUCT")
							|| loggeduser.equalsIgnoreCase("CLOSE_ACCOUNT")
							|| loggeduser.equalsIgnoreCase("UPDATE_BUZ_ADDR")
							|| loggeduser.equalsIgnoreCase("UPDATE_BUZ_CONTACT")) {

						accpid = request.getParameter("accountPartyID");
						String accpName = request.getParameter("accpName");
						String busname = request.getParameter("busname");
						String busid1 = request.getParameter("busid");
						String relationshipType = request.getParameter("relationshipType");

						request.setAttribute("accpid", accpid);
						request.setAttribute("accpName", accpName);
						request.setAttribute("busname", busname);
						request.setAttribute("busid", busid1);

						request.setAttribute("relationshipType", relationshipType);

						ArrayList<Account> acl = new ArrayList<Account>();
						acl = vcs.get_account_list(busid);
						request.setAttribute("accountlist", acl);

						// for(int i=0;i<ac.size();i++)
						// {
						// logger.info("acc no is : "+ac.get(i).getAccno());
						// }CHANGE_ACCT_TITLE
						if (loggeduser.equalsIgnoreCase("CHANGE_ACCT_TITLE")) {
							// logger.info("size of account list in ====="+acl.size());
							if (acl.size() != 0) {
								RequestDispatcher rd = request.getRequestDispatcher("jsp/ChangeAccountTitle.jsp");
								rd.forward(request, response);
							} else {
								String message = "No active accounts found !!";
								logger.error("No active accounts found");
								request.setAttribute("msg", message);
								RequestDispatcher rd = request.getRequestDispatcher("jsp/ChangeAccountTitle.jsp");
								rd.forward(request, response);

							}
						}

						if (loggeduser.equalsIgnoreCase("UPDATE_BUZ_ADDR")) {
							RequestDispatcher rd = request.getRequestDispatcher("jsp/MngrUpdateBizAddress.jsp");
							rd.forward(request, response);

						}

						if (loggeduser.equalsIgnoreCase("UPDATE_BUZ_CONTACT")) {
							RequestDispatcher rd = request.getRequestDispatcher("jsp/MngrUpdateBizContact.jsp");
							rd.forward(request, response);

						}

						if (loggeduser.equalsIgnoreCase("CLOSE_ACCOUNT")) {
							if (acl.size() != 0) {
								RequestDispatcher rd = request.getRequestDispatcher("jsp/CloseAccount.jsp");
								rd.forward(request, response);
							} else {
								String message = "No active accounts found !!";
								request.setAttribute("msg", message);
								logger.error("No active accounts found");
								RequestDispatcher rd = request.getRequestDispatcher("jsp/CloseAccount.jsp");
								rd.forward(request, response);
							}

						}
						if (loggeduser.equalsIgnoreCase("SWITCH_PRODUCT")) {
							System.out.println("going to switchtonewproduct.jsp");

							if (acl.size() != 0) {
								RequestDispatcher rd = request.getRequestDispatcher("jsp/SwitchProduct.jsp");
								rd.forward(request, response);
							} else {

								String message = "No active accounts found !!";
								request.setAttribute("msg", message);
								logger.error("No active accounts found");
								RequestDispatcher rd = request.getRequestDispatcher("jsp/SwitchProduct.jsp");
								rd.forward(request, response);
							}
						}

					}
				} else {
					/*
					 * session=request.getSession(); AccountParty
					 * accParty=(AccountParty)session.getAttribute("accParty"); BusinessCustomer
					 * businessCust=(BusinessCustomer)session.getAttribute("businessCust");
					 */
					String message = "Sorry, Security answer doesn't match.";
					request.setAttribute("msg", message);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/CustomerVerification.jsp");
					rd.forward(request, response);

				}
			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("msg", msg);
				logger.error(msg);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
				rd.forward(request, response);

			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

	private static final long serialVersionUID = 1L;
}