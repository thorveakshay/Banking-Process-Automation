package com.training.controllers;

import static com.training.constants.CaoConstants.ACTION;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.AccountView;
import com.training.model.BusinessCustomer;
import com.training.services.GetCustomersService;
import com.training.services.ViewAccountDetailService;

/**
 * Servlet implementation class ViewAccountDetailServlet
 */
public class ViewAccountDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(ViewAccountDetailServlet.class);
	ViewAccountDetailService vads = new ViewAccountDetailService();

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

		logger.info("In ViewAccountDetailServlet");

		String action = request.getParameter(ACTION);
		AccountView accview = new AccountView();
		if (action.equals("searchaccount")) {
			logger.debug("Action is:" + action);
			// logger.info("hi"+action);
			String accNo = action = request.getParameter("getAccNo");
			try {

				GetCustomersService gcs = new GetCustomersService();
				Boolean flag = gcs.checkAccountNumber(accNo);
				// logger.info("flag"+flag);

				if (flag == true)

				{
					BusinessCustomer bcust = new BusinessCustomer();

					long accNum = Long.parseLong(accNo);
					accview = vads.getAccountDetail(accNum);
					try {
						bcust = vads.getBusinessCustomer(accNum);
						request.setAttribute("bCust", bcust);
						request.setAttribute("accountobj", accview);
						RequestDispatcher rd = request.getRequestDispatcher("jsp/ViewAccountDetail.jsp");
						rd.forward(request, response);
					} catch (CommercialCustandAcctMaintenance e) {

						e.printStackTrace();
						String msg = e.getMessage();
						request.setAttribute("msg", msg);
						logger.error("Error Occured");
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
						rd.forward(request, response);
					}

				} else {

					RequestDispatcher rd = request.getRequestDispatcher("/jsp/AccountNotFound.jsp");
					rd.forward(request, response);
				}

			} catch (SQLException e) {

				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

		}

		else if (action.equals("tryAgain")) {
			// logger.info("hi action"+action);
			logger.debug("Action is:" + action);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/SearchAccount.jsp");
			rd.forward(request, response);
		}

		else if (action.equals("CloseAccount")) {
			logger.debug("Action is:" + action);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/HomeTicket.jsp");
			rd.forward(request, response);
		}

	}

}
