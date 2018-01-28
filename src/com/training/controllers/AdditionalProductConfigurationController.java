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
import org.apache.log4j.Logger;

import com.training.exception.AssignRelationshipManagerException;
import com.training.model.Account;
import com.training.model.AdditionalProduct;
import com.training.model.BusinessCustomer;
import com.training.services.AdditionalProductConfigurationService;

/**
 * Servlet implementation class AdditionalProductConfigurationController
 */
public class AdditionalProductConfigurationController extends HttpServlet {
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

		AdditionalProductConfigurationService apService = new AdditionalProductConfigurationService();
		BusinessCustomer bcust = (BusinessCustomer) request.getSession().getAttribute("bcust");
		String action = request.getParameter(ACTION);

		// show the list of eligible Additional Product Details

		if (ADDADDITIONALPRODUCT.equals(action)) {
			ArrayList<AdditionalProduct> aplist = null;
			String prod = null;
			int productid = 0;
			prod = (String) (request.getSession().getAttribute("productId"));
			productid = Integer.parseInt(prod);
			logger.info("product selected for selecting additional product is " + prod);
			try {
				// get the list of additional products based on the product id

				aplist = apService.getAdditionalProductDetails(productid);

				if (aplist.size() == 0) {
					// If no additional products are available
					String bname = bcust.getBusinessName();
					request.setAttribute("bname", bname);
					request.setAttribute("msg", "Sorry, currently no Additional Products are available for you.");
					request.setAttribute("adprdlist", aplist);
				}

				else {
					String bname = bcust.getBusinessName();
					request.setAttribute("bname", bname);
					request.setAttribute("adprdlist", aplist);
					request.setAttribute("msg", "success");
				}

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/AdditionalProductConfiguration.jsp");
				rd.forward(request, response);
			} catch (AssignRelationshipManagerException e) {
				e.printStackTrace();
				logger.error(e.getMessage());

				request.setAttribute("error", e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			}

		}

		// to get the selected Additional Product List from the user

		else if (GETADDITIONAL.equals(action)) {
			String[] selectedaplist;
			if (null != (request.getParameterValues("check"))) {
				selectedaplist = request.getParameterValues("check");
				logger.info("Selected additional products are:");
				for (String s : selectedaplist) {
					logger.info(s);
				}

				// Get the list of product intentions selected by user and remove the first one
				// since account generation process is completed for that account

				List<Account> accList = (ArrayList<Account>) request.getSession().getAttribute("accList");

				if (accList.size() != 0)
					accList.remove(0);

				if (accList.size() == 0) {
					RequestDispatcher rd = getServletContext()
							.getRequestDispatcher("/ExistingCustomerController?action=assign");
					rd.forward(request, response);
				} else {
					request.setAttribute("intentionList", accList);
					RequestDispatcher rd = getServletContext()
							.getRequestDispatcher("/AccountCreationServlet?action=SubmitDetails");
					rd.forward(request, response);
				}
			} // end of else if

			// if user doesn't select any additional products
			else {

				selectedaplist = null;
				logger.info("no additional product are selected");

				List<Account> accList = (ArrayList<Account>) request.getSession().getAttribute("accList");

				if (accList.size() != 0)
					accList.remove(0);

				if (accList.size() == 0) {
					RequestDispatcher rd = getServletContext()
							.getRequestDispatcher("/ExistingCustomerController?action=assign");
					rd.forward(request, response);
				} else {
					request.setAttribute("intentionList", accList);
					RequestDispatcher rd = getServletContext()
							.getRequestDispatcher("/AccountCreationServlet?action=SubmitDetails");
					rd.forward(request, response);
				}
			}
		}
	}

}
