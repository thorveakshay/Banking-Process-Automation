package com.training.controllers;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

/**
 * Servlet implementation class LanguageServlet
 */
public class LanguageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(LoginServlet.class);
	HttpSession session;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LanguageServlet() {
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
		session = request.getSession();
		String action = request.getParameter("action");
		String language = null;
		String country = null;
		String loginContent = null;
		Locale currentLocale;
		String lang = request.getParameter("lang");
		String link = null;
		if (action.equals("sendLanguage")) {
			if (lang.equals("english") || lang == "") {

				language = "en";
				country = "US";
				logger.info("In english");
			} else if (lang.equals("french")) {
				language = "fr";
				country = "FR";
				logger.info("In french");
			} else if (lang.equals("german")) {
				language = "de";
				country = "DE";
				logger.info("In german");
			} else if (lang.equals("spanish")) {
				language = "es";
				country = "MX";

			}

			ResourceBundle message;
			currentLocale = new Locale(language, country);
			message = ResourceBundle.getBundle("com.training.multilingualsupport.MessagesBundle", currentLocale);
			session.setAttribute("message", message);
			session.setAttribute("lang", lang);
			String updateHeading = message.getString("updateHeading");
			session.setAttribute("updateHeading", updateHeading);
			loginContent = message.getString("content");
			session.setAttribute("loginContent", loginContent);
			String loginHead = message.getString("loginhead");
			session.setAttribute("loginHead", loginHead);
			String banner = message.getString("banner");
			session.setAttribute("banner", banner);
			String footer = message.getString("footer");
			session.setAttribute("footer", footer);
			String navigation = message.getString("navigation");
			session.setAttribute("navigation", navigation);
			session.getAttribute("message");
			String welcomeNote = message.getString("welcomeNote");
			session.setAttribute("welcomeNote", welcomeNote);
			String adminMenu = message.getString("adminMenu");
			session.setAttribute("adminMenu", adminMenu);
			String adminLink1 = message.getString("adminLink1");
			session.setAttribute("adminLink1", adminLink1);
			String adminLink2 = message.getString("adminLink2");
			session.setAttribute("adminLink2", adminLink2);
			String adminContent = message.getString("adminContent");
			session.setAttribute("adminContent", adminContent);

			String adminSorry = message.getString("adminSorry");
			session.setAttribute("adminSorry", adminSorry);
			session.getAttribute("message");
			String ticketId = message.getString("ticketId");
			session.setAttribute("ticketId", ticketId);
			String ticketTitle = message.getString("ticketTitle");
			session.setAttribute("ticketTitle", ticketTitle);
			String ticketPriority = message.getString("ticketPriority");
			session.setAttribute("ticketPriority", ticketPriority);
			String associatedBC = message.getString("associatedBC");
			session.setAttribute("associatedBC", associatedBC);
			String assignemp = message.getString("assignemp");
			session.setAttribute("assignemp", assignemp);
			String bcId = message.getString("bcId");
			session.setAttribute("bcId", bcId);
			String bcName = message.getString("bcName");
			session.setAttribute("bcName", bcName);
			String apName = message.getString("apName");
			session.setAttribute("apName", apName);
			String apId = message.getString("apId");
			session.setAttribute("apId", apId);
			String selectEmp = message.getString("selectEmp");
			session.setAttribute("selectEmp", selectEmp);
			String empmsg = message.getString("empmsg");
			session.setAttribute("empmsg", empmsg);

			session.getAttribute("message");
			String boHead = message.getString("boHead");
			session.setAttribute("boHead", boHead);
			String boContent = message.getString("boContent");
			session.setAttribute("boContent", boContent);
			String boMenu = message.getString("boMenu");
			session.setAttribute("boMenu", boMenu);
			String boMenuHead = message.getString("boMenuHead");
			session.setAttribute("boMenuHead", boMenuHead);
			String boTitle = message.getString("boTitle");
			session.setAttribute("boTitle", boTitle);
			String boMsg = message.getString("boMsg");
			session.setAttribute("boMsg", boMsg);

			session.getAttribute("message");
			String heHomeContent = message.getString("heHomeContent");
			session.setAttribute("heHomeContent", heHomeContent);
			String heMenu4 = message.getString("heMenu4");
			session.setAttribute("heMenu4", heMenu4);
			String heMenu1 = message.getString("heMenu1");
			session.setAttribute("heMenu1", heMenu1);
			String heMenu2 = message.getString("heMenu2");
			session.setAttribute("heMenu2", heMenu2);
			String heMenu3 = message.getString("heMenu3");
			session.setAttribute("heMenu3", heMenu3);

			session.getAttribute("message");
			String searchHead = message.getString("searchHead");
			session.setAttribute("searchHead", searchHead);
			String fieldMsg = message.getString("fieldMsg");
			session.setAttribute("fieldMsg", fieldMsg);
			String fieldCntd = message.getString("fieldCntd");
			session.setAttribute("fieldCntd", fieldCntd);
			String searchBrTrade = message.getString("searchBrTrade");
			session.setAttribute("searchBrTrade", searchBrTrade);
			String searchAccNo = message.getString("searchAccNo");
			session.setAttribute("searchAccNo", searchAccNo);
			String searchBrBusn = message.getString("searchBrBusn");
			session.setAttribute("searchBrBusn", searchBrBusn);
			String heBusnName = message.getString("heBusnName");
			session.setAttribute("heBusnName", heBusnName);
			String heBranchName = message.getString("heBranchName");
			session.setAttribute("heBranchName", heBranchName);
			String heAccNo = message.getString("heAccNo");
			session.setAttribute("heAccNo", heAccNo);
			String heTradeName = message.getString("heTradeName");
			session.setAttribute("heTradeName", heTradeName);
			String heSearchMenu1 = message.getString("heSearchMenu1");
			session.setAttribute("heSearchMenu1", heSearchMenu1);
			String heSearchMenu2 = message.getString("heSearchMenu2");
			session.setAttribute("heSearchMenu2", heSearchMenu2);
			String heSearchMenu3 = message.getString("heSearchMenu3");
			session.setAttribute("heSearchMenu3", heSearchMenu3);
			String heSearchMenu4 = message.getString("heSearchMenu4");
			session.setAttribute("heSearchMenu4", heSearchMenu4);
			String heSearchMenu5 = message.getString("heSearchMenu5");
			session.setAttribute("heSearchMenu5", heSearchMenu5);

			String postus = message.getString("postus");
			session.setAttribute("postus", postus);
			String conhelpdesk = message.getString("conhelpdesk");
			session.setAttribute("conhelpdesk", conhelpdesk);
			String conadd = message.getString("conadd");
			session.setAttribute("conadd", conadd);

			String ticketReport = message.getString("ticketReport");
			session.setAttribute("ticketReport", ticketReport);
			String unticketsorry = message.getString("unticketsorry");
			session.setAttribute("unticketsorry", unticketsorry);

			// grp b

			String home = message.getString("home");
			session.setAttribute("home", home);

			String aboutUs = message.getString("aboutUs");
			session.setAttribute("aboutUs", aboutUs);

			String contactUs = message.getString("contactUs");
			session.setAttribute("contactUs", contactUs);

			String help = message.getString("help");
			session.setAttribute("help", help);

			String leftcontent1 = message.getString("leftcontent1");
			session.setAttribute("leftcontent1", leftcontent1);

			String leftcontent2 = message.getString("leftcontent2");
			session.setAttribute("leftcontent2", leftcontent2);

			String centercontent1 = message.getString("centercontent1");
			session.setAttribute("centercontent1", centercontent1);

			String centercontent2 = message.getString("centercontent2");
			session.setAttribute("centercontent2", centercontent2);

			String side = message.getString("side");
			session.setAttribute("side", side);

			String SignOut = message.getString("SignOut");
			session.setAttribute("SignOut", SignOut);

			String headerContent = message.getString("headerContent");
			session.setAttribute("headerContent", headerContent);

			String welcomePro = message.getString("welcomePro");
			session.setAttribute("welcomePro", welcomePro);

			String proHome = message.getString("proHome");
			session.setAttribute("proHome", proHome);

			String addProduct = message.getString("addProduct");
			session.setAttribute("addProduct", addProduct);

			String productID = message.getString("productID");
			session.setAttribute("productID", productID);

			String field = message.getString("field");
			session.setAttribute("field", field);

			String proName = message.getString("proName");
			session.setAttribute("proName", proName);

			String accType = message.getString("accType");
			session.setAttribute("accType", accType);

			String busType = message.getString("busType");
			session.setAttribute("busType", busType);

			String validFrom = message.getString("validFrom");
			session.setAttribute("validFrom", validFrom);

			String status = message.getString("status");
			session.setAttribute("status", status);

			String addtionalPro = message.getString("addtionalPro");
			session.setAttribute("addtionalPro", addtionalPro);

			String pleaseProId = message.getString("pleaseProId");
			session.setAttribute("pleaseProId", pleaseProId);

			String pleaseProName = message.getString("pleaseProName");
			session.setAttribute("pleaseProName", pleaseProName);

			String plsProDesc = message.getString("plsProDesc");
			session.setAttribute("plsProDesc", plsProDesc);

			String plsAccType = message.getString("plsAccType");
			session.setAttribute("plsAccType", plsAccType);

			String accTypeField = message.getString("accTypeField");
			session.setAttribute("accTypeField", accTypeField);

			String currAcc = message.getString("currAcc");
			session.setAttribute("currAcc", currAcc);

			String savAcc = message.getString("savAcc");
			session.setAttribute("savAcc", savAcc);
			///
			String plsBusType = message.getString("plsBusType");
			session.setAttribute("plsBusType", plsBusType);

			String busTypeField = message.getString("busTypeField");
			session.setAttribute("busTypeField", busTypeField);

			String plsStatus = message.getString("plsStatus");
			session.setAttribute("plsStatus", plsStatus);

			String proDetails = message.getString("proDetails");
			session.setAttribute("proDetails", proDetails);

			String validFromdd = message.getString("validFromdd");
			session.setAttribute("validFromdd", validFromdd);

			String submit = message.getString("submit");
			session.setAttribute("submit", submit);

			String reset = message.getString("reset");
			session.setAttribute("reset", reset);

			String back = message.getString("back");
			session.setAttribute("back", back);

			String mandatory = message.getString("mandatory");
			session.setAttribute("mandatory", mandatory);

			String actv = message.getString("actv");
			session.setAttribute("actv", actv);

			String inactv = message.getString("inactv");
			session.setAttribute("inactv", inactv);

			String welcome = message.getString("welcome");
			session.setAttribute("welcome", welcome);

			String leftcontent3 = message.getString("leftcontent3");
			session.setAttribute("leftcontent3", leftcontent3);

			String leftcontent4 = message.getString("leftcontent4");
			session.setAttribute("leftcontent4", leftcontent4);

			String upldPro = message.getString("upldPro");
			session.setAttribute("upldPro", upldPro);

			String viewPro = message.getString("viewPro");
			session.setAttribute("viewPro", viewPro);

			String genPro = message.getString("genPro");
			session.setAttribute("genPro", genPro);

			String updates = message.getString("updates");
			session.setAttribute("updates", updates);

			String ProMngmnt = message.getString("ProMngmnt");
			session.setAttribute("ProMngmnt", ProMngmnt);

			String login = message.getString("login");
			session.setAttribute("login", login);

			String userName = message.getString("userName");
			session.setAttribute("userName", userName);

			String pswrd = message.getString("pswrd");
			session.setAttribute("pswrd", pswrd);

			String scrlogin = message.getString("scrlogin");
			session.setAttribute("scrlogin", scrlogin);

			String genChr = message.getString("genChr");
			session.setAttribute("genChr", genChr);

			String proSum = message.getString("proSum");
			session.setAttribute("proSum", proSum);

			String welAccCr = message.getString("welAccCr");
			session.setAttribute("welAccCr", welAccCr);

			String accHomeCon1 = message.getString("accHomeCon1");
			session.setAttribute("accHomeCon1", accHomeCon1);

			String accHomeCon2 = message.getString("accHomeCon2");
			session.setAttribute("accHomeCon2", accHomeCon2);

			String accHomeCon3 = message.getString("accHomeCon3");
			session.setAttribute("accHomeCon3", accHomeCon3);

			String accHomeCon4 = message.getString("accHomeCon4");
			session.setAttribute("accHomeCon4", accHomeCon4);

			String accHomeCon5 = message.getString("accHomeCon5");
			session.setAttribute("accHomeCon5", accHomeCon5);

			String accCr = message.getString("accCr");
			session.setAttribute("accCr", accCr);

			String openAc = message.getString("openAc");
			session.setAttribute("openAc", openAc);

			String assignRel = message.getString("assignRel");
			session.setAttribute("assignRel", assignRel);

			String srchCust = message.getString("srchCust");
			session.setAttribute("srchCust", srchCust);

			String busName = message.getString("busName");
			session.setAttribute("busName", busName);

			String srchBy = message.getString("srchBy");
			session.setAttribute("srchBy", srchBy);

			String brName = message.getString("brName");
			session.setAttribute("brName", brName);

			String trName = message.getString("trName");
			session.setAttribute("trName", trName);

			String srch = message.getString("srch");
			session.setAttribute("srch", srch);

			String accNum = message.getString("accNum");
			session.setAttribute("accNum", accNum);

			String allRyts = message.getString("allRyts");
			session.setAttribute("allRyts", allRyts);

			String selLang = message.getString("selLang");
			session.setAttribute("selLang", selLang);

			String select = message.getString("select");
			session.setAttribute("select", select);

			String regEmployee = message.getString("regEmployee");
			session.setAttribute("regEmployee", regEmployee);

			String viewEmployee = message.getString("viewEmployee");
			session.setAttribute("viewEmployee", viewEmployee);

			String searchEmployee = message.getString("searchEmployee");
			session.setAttribute("searchEmployee", searchEmployee);

			String searchCust = message.getString("searchCust");
			session.setAttribute("searchCust", searchCust);

			String manageAccParty = message.getString("manageAccParty");
			session.setAttribute("manageAccParty", manageAccParty);

			String genReport = message.getString("genReport");
			session.setAttribute("genReport", genReport);

			String empMngmnt = message.getString("empMngmnt");
			session.setAttribute("empMngmnt", empMngmnt);

			String helpMng = message.getString("helpMng");
			session.setAttribute("helpMng", helpMng);

			String custReg = message.getString("custReg");
			session.setAttribute("custReg", custReg);

			String help1 = message.getString("help1");
			session.setAttribute("help1", help1);

			String help2 = message.getString("help2");
			session.setAttribute("help2", help2);

			String help3 = message.getString("help3");
			session.setAttribute("help3", help3);

			String help4 = message.getString("help4");
			session.setAttribute("help4", help4);

			String help5 = message.getString("help5");
			session.setAttribute("help5", help5);

			String help6 = message.getString("help6");
			session.setAttribute("help6", help6);

			String help7 = message.getString("help7");
			session.setAttribute("help7", help7);

			String help8 = message.getString("help8");
			session.setAttribute("help8", help8);

			String help9 = message.getString("help9");
			session.setAttribute("help9", help9);

			// contact Us page
			String contactUsFirst = message.getString("contactUsFirst");
			session.setAttribute("contactUsFirst", contactUsFirst);

			String rmMenu1 = message.getString("rmMenu1");
			session.setAttribute("rmMenu1", rmMenu1);
			String rmMenu2 = message.getString("rmMenu2");
			session.setAttribute("rmMenu2", rmMenu2);
			String rmMenu3 = message.getString("rmMenu3");
			session.setAttribute("rmMenu3", rmMenu3);
			String rmMenu4 = message.getString("rmMenu4");
			session.setAttribute("rmMenu4", rmMenu4);
			String rmMenu5 = message.getString("rmMenu5");
			session.setAttribute("rmMenu5", rmMenu5);
			String rmMenu6 = message.getString("rmMenu6");
			session.setAttribute("rmMenu6", rmMenu6);
			String rmHome1 = message.getString("rmHome1");
			session.setAttribute("rmHome1", rmHome1);

			RequestDispatcher rd = request.getRequestDispatcher("/jsp/index.jsp");
			rd.forward(request, response);
		}
	}

}
