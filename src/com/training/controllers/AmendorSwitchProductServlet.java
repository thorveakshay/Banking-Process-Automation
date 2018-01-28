package com.training.controllers;

import static com.training.constants.CaoConstants.ACTION;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.training.exception.CommercialCustandAcctMaintenance;
import com.training.model.Account;
import com.training.model.Business;
import com.training.model.Product;
import com.training.services.ChangeAccountTitleService;
import com.training.services.CloseAccountService;
import com.training.services.SwitchProductService;

/**
 * Servlet implementation class AmendorSwitchProductServlet
 */
public class AmendorSwitchProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(LoginServlet.class);
	ChangeAccountTitleService cats;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AmendorSwitchProductServlet() {
		super();
		// TODO Auto-generated constructor stub
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
		logger.info("In ChangeAccountTitleServlet");
		Product prod = new Product();
		String action = request.getParameter(ACTION);
		// logger.info("action in change account servlet is : "+action);
		Account acc = new Account();
		// acc=new Account();
		// acc.setId(0);

		if (action.equals("updateAccTitle")) {
			logger.debug("action is:" + action);
			String oldAcctTitle = action = request.getParameter("oldAcctTitle");

			String acctitle = action = request.getParameter("setAccTitle");
			String ano = request.getParameter("accno");
			String tikId = null;

			if (request.getParameter("tikId") != null)
				tikId = (String) request.getParameter("tikId");
			logger.debug("Ticket Id:" + tikId);
			// logger.info("ano in str is "+ano);
			long accno = Long.parseLong(request.getParameter("accno"));
			String accid = request.getParameter("accid");
			int i = 0;

			logger.info("value of ticket id in chanfeaccounttileservlet" + tikId);
			// logger.info(accid);
			// while(accno.charAt(i)!='*')
			// {
			// //logger.info(accid.charAt(i));
			//
			// i++;
			//
			// }
			// String accid=accno.substring((i+1),accno.length());
			// accno=accno.substring(0,i);

			// logger.info("Acc no is "+accno);
			// logger.info("Acc id is "+accid);
			// logger.info("New Acc title is "+acctitle);

			acc.setAcctitle(acctitle);
			acc.setId(Integer.parseInt("" + accid));
			acc.setAccno(accno);

			cats = new ChangeAccountTitleService();
			Boolean var;

			// logger.info("tikId value is "+tikId);

			try {
				if (tikId.equals("null") || tikId == null) {
					var = cats.ChangeAccountTitle(acc);
					acc.setId(-11);// id =-11 means accounttitle changed successfully
					request.setAttribute("accountobj", acc);

					logger.info("Account Title updated successfully");

					//
					HttpSession session = request.getSession();
					if (session.getAttribute("designation").toString().equalsIgnoreCase("RELATIONSHIP MANAGER")) {

						RequestDispatcher rd = request.getRequestDispatcher("jsp/ASPHome.jsp");// go to next page after
																								// changing title

						rd.forward(request, response);

					}
					if (session.getAttribute("designation").toString().equalsIgnoreCase("BACKOFFICE EMPLOYEE")) {
						RequestDispatcher rd = request.getRequestDispatcher("jsp/backoffice.jsp");// go to next page
																									// after changing
																									// title

						rd.forward(request, response);

					}

				} else {
					// logger.info("going to close ticket and ticket id is : "+tikId);
					var = cats.ChangeAccountTitleCloseTicket(acc, Long.parseLong(tikId));
					response.sendRedirect("jsp/AssignedTickets.jsp");// go to next page after changing title

				}
				// logger.info("After updating var value is "+var);

			} catch (CommercialCustandAcctMaintenance e) {

				e.printStackTrace();
			}

		}
		if (action.equals("accno")) {

			logger.debug("action is:" + action);
			String accno = request.getParameter("getAccNo");

			// logger.info("acc no is==== "+accno);
			long getAccNo = Long.parseLong(request.getParameter("getAccNo"));
			logger.debug("Account Number is:" + getAccNo);

			acc = new Account();
			cats = new ChangeAccountTitleService();

			try {
				acc = cats.getAccount(accno);
			} catch (CommercialCustandAcctMaintenance e) {
				// redirect to error page
			}

			if (acc.getId() != -1)// if account no is in database then go to showAccount i.e show details
			{

				String tikId = request.getParameter("tikId");
				request.setAttribute("tikId", tikId);
				String requestfrom = "changeaccounttitle";
				request.setAttribute("requestfrom", requestfrom);
				request.setAttribute("accountobj", acc);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/ChangAcctTitle.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("accountobj", acc);

				RequestDispatcher rd = request.getRequestDispatcher("jsp/ChangAcctTitle.jsp");
				rd.forward(request, response);

			}

		}

		if (action.equals("accno1")) {
			logger.debug("action is:" + action);
			// Account acc;
			String accno = request.getParameter("getAccNo");
			String tikId = request.getParameter("tikId");
			logger.debug("Account Number is:" + accno);
			// logger.info("acc no is "+accno);
			long getAccNo = Long.parseLong(request.getParameter("getAccNo"));

			// logger.info("u r r8 "+getAccNo);

			acc = new Account();
			cats = new ChangeAccountTitleService();

			try {
				acc = cats.getAccount("" + getAccNo);
			} catch (CommercialCustandAcctMaintenance e) {
				// redirect to error page
			}

			if (acc.getId() != -1)// if account no is in database then go to showAccount i.e show details
			{

				String requestfrom = "changeaccounttitle";
				request.setAttribute("requestfrom", requestfrom);
				request.setAttribute("accountobj", acc);
				request.setAttribute("tikId", tikId);

				RequestDispatcher rd = request.getRequestDispatcher("jsp/ChangAcctTitle.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("accountobj", acc);
				// response.sendRedirect(request.getContextPath()+"/jsp/ChangeAccountTitle.jsp");

				RequestDispatcher rd = request.getRequestDispatcher("jsp/ChangAcctTitle.jsp");
				rd.forward(request, response);

			}

		}

		ArrayList<Product> pList = new ArrayList<Product>();
		String accno;
		acc = new Account();

		Business b = new Business();
		SwitchProductService service = new SwitchProductService();

		if (action.equals("switchProduct")) {
			logger.debug("Action is:" + action);
			Boolean flag = false;

			Long newProductID = Long.parseLong(request.getParameter("newProName"));
			// logger.info("$$$$$$$$$$$$$ new pro id is "+newProductID);
			Long accid = Long.parseLong(request.getParameter("accid"));
			Long busid = Long.parseLong(request.getParameter("busid"));
			String acctype = request.getParameter("acctype");
			Long ano = Long.parseLong(request.getParameter("ano"));
			// logger.info(accid+"#"+busid+"#"+acctype+"#"+ano);
			SwitchProductService cats = new SwitchProductService();
			// logger.info("in switch product serlevt===="+ano);
			logger.debug("Account Number is:" + ano);
			try {
				flag = cats.switchProduct(accid, busid, acctype, ano, newProductID);

				if (flag == true) {
					// acc.setId(0);
					request.setAttribute("accountobj", acc);

					logger.info("Product switched successfully");

					RequestDispatcher rd = request.getRequestDispatcher("jsp/ASPHome.jsp");
					rd.forward(request, response);
				}
			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("msg", msg);

				logger.error(msg);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
				rd.forward(request, response);

			}

			// logger.info("Product switched successfully !!! in servlet");

		}
		acc = new Account();
		if (action.equals("accnoSwitch")) {
			logger.debug("Action is:" + action);
			// Account acc;

			accno = request.getParameter("accno");
			String busid = request.getParameter("busid");

			// logger.info("in servlet ======1 *"+busid+"*");

			Long bid = Long.parseLong(busid);
			// logger.info("in servlet ======1 "+accno);
			// logger.info("in servlet ======1 "+busid);
			// logger.info("in servlet ======1 "+accno);
			try {
				acc = new Account();
				service = new SwitchProductService();

				acc = service.getAccount(accno);

				// logger.info("after calling for account ===="+acc.getBranch());
				// logger.info("after prduct ===== "+accno);

				String accType = acc.getAcctype();
				prod = service.getProduct(accno);

				// logger.info("after calling for product====="+prod.getName());
				b = new Business();

				b = service.getBusinessService(accno);

				// logger.info("after calling for Business====="+b.getBusinessName());
				// logger.info("heyy acc id is "+acc.getId());

				pList = service.getProductList(accno, bid, accType);

				if (acc.getId() != -1) {
					if (pList.size() == 1) {
						String msg = "No eligible Products found";
						request.setAttribute("message", msg);
					}
					// logger.info("in switchproductServlet ===== size "+pList.size());
					request.setAttribute("accountobj", acc);
					request.setAttribute("productobj", prod);
					request.setAttribute("bus", b);
					request.setAttribute("prList", pList);
					// logger.info("in servlet bus name is "+b.getBusinessName());
					RequestDispatcher rd = request.getRequestDispatcher("jsp/ShowBusProdtls.jsp");
					rd.forward(request, response);
				} else {
					request.setAttribute("accountobj", acc);
					RequestDispatcher rd = request.getRequestDispatcher("jsp/SwitchProduct.jsp");
					rd.forward(request, response);

				}

			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("msg", msg);
				logger.error(msg);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/error.jsp");
				rd.forward(request, response);

			}
		}

		acc = new Account();
		if (action.equals("closeAccount")) {
			logger.debug("Action is:" + action);

			String acctitle = action = request.getParameter("setAccTitle");
			accno = request.getParameter("accno");
			String accid = request.getParameter("accid");

			CloseAccountService cas = new CloseAccountService();
			try {
				cas.closeAccount(accno, accid);
			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("message", msg);
				logger.error(msg);
				RequestDispatcher rd = request.getRequestDispatcher(request.getContextPath() + "/jsp/error.jsp");
			}
			acc.setId(-11);// id =-11 means accounttitle changed successfully
			request.setAttribute("accountobj", acc);
			String msg = "Account Closed Successfully";
			logger.info("Account Closed Successfully");
			request.setAttribute("closeSuccess", msg);
			RequestDispatcher rd = request.getRequestDispatcher("jsp/ASPHome.jsp");// go to next page after changing
																					// title

			rd.forward(request, response);

		}

		else if (action.equals("accnoClose")) {
			logger.debug("Action is:" + action);
			// Account acc;

			// String apId = request.getParameter("accno");

			// logger.info("new ofr veri accno and accid is "+apId);

			String getAccNo = request.getParameter("getAccNo");

			// logger.info("u r r8 in closeAccountSevlet========= "+getAccNo);

			acc = new Account();
			cats = new ChangeAccountTitleService();

			try {
				acc = cats.getAccount(getAccNo);
				if (acc.getId() != -1)// if account no is in database then go to showAccount i.e show details
				{

					String requestfrom = "closeaccount";
					request.setAttribute("requestfrom", requestfrom);

					request.setAttribute("accountobj", acc);
					RequestDispatcher rd = request.getRequestDispatcher("jsp/ShowAccount.jsp");
					rd.forward(request, response);
				} else {
					request.setAttribute("accountobj", acc);
					// response.sendRedirect(request.getContextPath()+"/jsp/ChangeAccountTitle.jsp");

					RequestDispatcher rd = request.getRequestDispatcher("jsp/CloseAccount.jsp");
					rd.forward(request, response);

				}
			} catch (CommercialCustandAcctMaintenance e) {
				String msg = e.getMessage();
				request.setAttribute("message", msg);
				logger.error(msg);
				RequestDispatcher rd = request.getRequestDispatcher(request.getContextPath() + "/jsp/error.jsp");

			}
			// logger.info("heyy acc id is "+acc.getId());

			// response.sendRedirect("jsp/ShowAccount.jsp");

			// rd.forward(request,response);

		} else if (action.equals("CloseTicket")) {
			logger.debug("Action is:" + action);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/HomeTicket.jsp");
			rd.forward(request, response);
		}

	}

}
