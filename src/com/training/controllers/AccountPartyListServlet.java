package com.training.controllers;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.AccParty;
import com.training.services.*;

import java.io.IOException;
import java.io.PrintStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.StringTokenizer;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.apache.log4j.Logger;

public class AccountPartyListServlet extends HttpServlet {
	private static Logger logger = Logger.getLogger(AccountPartyListServlet.class);

	protected void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = null;

		logger.info("In Account Party List Servlet");
		String action = request.getParameter("action");
		// logger.info((new

		if (action.equals("goToCustVeriPage")) {
			String busName = request.getParameter("businessName");
			String branchName = request.getParameter("branchName");
			Long busId = Long.valueOf(Long.parseLong(request.getParameter("businessId")));
			String apId = request.getParameter("accParty");
			String s = apId;
			String temp[] = new String[7];
			String delim = "#";
			int i = 0;
			session = request.getSession();
			String loggeduser = (String) session.getAttribute("subLoggedUser");
			for (StringTokenizer st = new StringTokenizer(s, delim); st.hasMoreTokens();) {
				temp[i] = st.nextToken();
				i++;
			}

			// logger.info((new
			// StringBuilder("id is ")).append(temp[0]).append(" reltn is
			// ").append(temp[1]).append(" name is ").append(temp[2]).toString());
			session = request.getSession();
			session.setAttribute("accPartyID", temp[0]);
			session.setAttribute("relationshipType", temp[1]);
			session.setAttribute("AccPartyName", temp[2]);
			session.setAttribute("busName", busName);
			session.setAttribute("branchName", branchName);
			session.setAttribute("busId", busId);
			VerifyCustomerService vcs = new VerifyCustomerService();
			try {
				ArrayList<String> seqques = new ArrayList<String>();
				ArrayList<String> seqans = new ArrayList<String>();

				seqques = vcs.getQuestion(Long.valueOf(Long.parseLong(temp[0])));
				session.setAttribute("seqQue", seqques);

				seqans = vcs.getAnswer(Long.valueOf(Long.parseLong(temp[0])));

				session.setAttribute("seqans", seqans);
				if (session.getAttribute("designation").toString().equals("RELATIONSHIP MANAGER") && seqques.size() == 1
						&& (!loggeduser.equals("CHANGE_ACCT_TITLE") && !loggeduser.equals("UPDATE_BUZ_ADDR")
								&& !loggeduser.equals("UPDATE_BUZ_CONTACT")))

				{
					String message = "You are not authorized to continue the current operation";
					session = request.getSession();
					request.setAttribute("msg", message);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/AccountPartyList.jsp");
					rd.forward(request, response);

				} else {
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/CustomerVerification.jsp");
					rd.forward(request, response);
				}
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("msg", msg);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
				rd.forward(request, response);
				logger.error("Error Occured.");
			}

		}
		if (action.equals("viewAccountPartyList")) {
			// logger.info("in servlet right ");
			String businessDetail = request.getParameter("businessData");
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
			// logger.info((new
			// StringBuilder(String.valueOf(businessId))).toString());
			String businessName = temp[1];
			String branchName = temp[2];
			ArrayList<AccParty> ap = new ArrayList<AccParty>();
			AccountPartyListService aps = new AccountPartyListService();

			Long busiId = Long.valueOf(Long.parseLong(businessId));
			// logger.info((new
			// StringBuilder("########## hey bus id is ")).append(busiId).toString());
			try {

				// logger.info("r81");
				ap = aps.getAccountPartyList(busiId.longValue());
				session = request.getSession();
				// logger.info("r82");
				session.setAttribute("npId", busiId);
				session.setAttribute("accountParty", ap);
				session.setAttribute("businessName", businessName);
				// logger.info((new
				// StringBuilder(String.valueOf(businessName))).append(" bname").toString());
				session.setAttribute("branchName", branchName);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/AccountPartyList.jsp");
				rd.forward(request, response);
				logger.info("Showing account party list");
			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("message", msg);
				logger.error("Error Occured");
				RequestDispatcher rd = request.getRequestDispatcher(request.getContextPath() + "/jsp/ErrorPage.jsp");
			}

			if (action.equals("Home") || action.equals("Cancel")) {
				response.sendRedirect((new StringBuilder(String.valueOf(request.getContextPath())))
						.append("/jsp/HomeTicket.jsp").toString());
				logger.info("In home page");
			} else if (action.equals("Customer Details"))
				response.sendRedirect((new StringBuilder(String.valueOf(request.getContextPath())))
						.append("/jsp/SearchCustomerToView.jsp").toString());
			else if (action.equals("Generate Ticket"))
				response.sendRedirect((new StringBuilder(String.valueOf(request.getContextPath())))
						.append("/jsp/SearchCustomer.jsp").toString());
		}

	}

	private static final long serialVersionUID = 1L;
	SearchCustomerService scs;
}