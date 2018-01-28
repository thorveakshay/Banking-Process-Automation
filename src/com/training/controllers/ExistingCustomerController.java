package com.training.controllers;

import static com.training.constants.CaoConstants.*;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.training.dao.AssignRelationshipManagerDao;
import com.training.exception.AssignRelationshipManagerException;
import com.training.model.Account;
import com.training.model.BusinessCustomer;
import com.training.model.RelationshipManager;

/**
 * Servlet implementation class ExistingCustomerController
 */
public class ExistingCustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
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

		AssignRelationshipManagerDao armdao = new AssignRelationshipManagerDao();

		String action = request.getParameter(ACTION);
		String bname = (String) request.getSession().getAttribute("bname");

		Account acc = (Account) request.getSession().getAttribute("account");
		BusinessCustomer bcust = (BusinessCustomer) request.getSession().getAttribute("bcust");

		// assigning relationship manager
		if (ASSIGN.equals(action)) {

			if (null != bcust && null != acc) {
				// for existing customer
				int bcustid = bcust.getId();
				try {

					String rmname = armdao.getRelationshipManager(bcustid);
					logger.info("Relationship manager name  " + rmname + ", for existing cust " + bcustid);
					if (null != rmname) {
						// already a relationship manager is assigned for a customer
						// print the details in existing customer page
						logger.info("Details of EXISTING customer are:");
						logger.info(bcust.getId() + "  " + bcust.getBusinessName() + " " + rmname);
						logger.info(acc.getBranch());

						bname = bcust.getBusinessName();

						request.setAttribute("bname", bname);
						request.setAttribute("id", bcust.getId());
						request.setAttribute("name", bcust.getBusinessName());
						request.setAttribute("rm", rmname);

						request.setAttribute("branch", acc.getBranch());

						RequestDispatcher rd = request.getRequestDispatcher("/jsp/ExistingCustomerRM.jsp");
						rd.forward(request, response);

					} else {
						// for new customer
						// print the details in new customer page

						logger.info("Details of NEW customer are:");
						logger.info(bcust.getId() + "  " + bcust.getBusinessName());
						logger.info(acc.getBranch());

						ArrayList<RelationshipManager> rmlist = new ArrayList<RelationshipManager>();
						String branchname = acc.getBranch();

						try {
							rmlist = armdao.getDetails(branchname);
						} catch (AssignRelationshipManagerException e) {

							e.printStackTrace();
							logger.error(e.getMessage());
							request.setAttribute("error", e.getMessage());
							RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
							rd.forward(request, response);
						}

						logger.info("Retreived Relationship manager details for new.cust from db (in size) is"
								+ rmlist.size());
						for (RelationshipManager rm : rmlist) {
							logger.info("id is:" + rm.getId() + "name:" + rm.getName() + "branch:" + rm.getBranch());
						}

						request.setAttribute("id", bcust.getId());
						request.setAttribute("name", bcust.getBusinessName());
						request.setAttribute("branch", acc.getBranch());
						request.setAttribute("relmgr", rmlist);
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/AssignRelationshipManager.jsp");
						rd.forward(request, response);

					}
				} // try block
				catch (AssignRelationshipManagerException e) {

					logger.error(e.getMessage());
					request.setAttribute("error", e.getMessage());
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
					rd.forward(request, response);
				}

			} // if business customer exists
			else {
				String msg = "Please create an account to assign Relationship Manager";
				request.setAttribute("error", msg);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			}
		} // if action=assign
	}

}
