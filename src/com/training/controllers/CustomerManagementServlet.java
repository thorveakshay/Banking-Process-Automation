package com.training.controllers;

import static com.training.constants.CaoConstants.GENERATEREPORT;
import static com.training.constants.CaoConstants.REPORT;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.training.exception.BusinessCustRegException;
import com.training.model.Address;
import com.training.model.Contact;
import com.training.model.NonPersonalCustomer;
import com.training.model.Proof;
import com.training.model.ReportData;
import com.training.services.CustomerManagementService;

import java.util.ResourceBundle;

/**
 * Servlet implementation class CustomerManagementServlet
 */
public class CustomerManagementServlet extends HttpServlet {
	HttpSession session;
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(LoginServlet.class);
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	// BusinessCustRegDAOImpl businessCustRegDaoImpl = new BusinessCustRegDAOImpl();
	// CustomerManagementService customerManagementService = new
	// CustomerManagementService();
	boolean flag = false;
	private static int chartno;
	String year;
	String month;
	String monthNo;

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

		NonPersonalCustomer nonPersonalCustomer = null;
		CustomerManagementService cmservice = null;
		// List<Address> addresslist = null;
		Address bAddress = null;
		Address cAddress = null;
		Address mAddress = null;

		Contact contactW = null;
		Contact contactF = null;
		Proof proofId = null;
		Proof proofAdd = null;
		// boolean isSameAddress = false;
		// session = request.getSession();

		String action = request.getParameter("action");
		if (action.equals("add")) {
			List<String> branch = null;
			cmservice = new CustomerManagementService();

			try {
				branch = cmservice.getBranch();
				logger.info("The elements in the Branch table are:");
				for (String branchName : branch) {
					logger.info(branchName);
				}

				session = request.getSession();
				session.setAttribute("branchList", branch);
				String businessName = null;
				String tradingName = null;
				String branchName = null;
				String businessType = null;
				String isStartUp = null;
				String estDate = null;
				String regDate = null;
				String turnover = null;
				String totalBusinessCapital = null;
				String noOfEmployees = null;
				String businessStatus = null;
				String countryOfReg = null;
				String moreAboutBusiness = null;
				String field = null;
				String millionPounds = null;
				if (null != session.getAttribute("message")) {
					field = ((ResourceBundle) session.getAttribute("message")).getString("field");
					businessName = ((ResourceBundle) session.getAttribute("message")).getString("businessName");
					tradingName = ((ResourceBundle) session.getAttribute("message")).getString("tradingName");
					businessType = ((ResourceBundle) session.getAttribute("message")).getString("businessType");
					branchName = ((ResourceBundle) session.getAttribute("message")).getString("branchName");
					isStartUp = ((ResourceBundle) session.getAttribute("message")).getString("isStartUp");
					estDate = ((ResourceBundle) session.getAttribute("message")).getString("estDate");
					regDate = ((ResourceBundle) session.getAttribute("message")).getString("regDate");
					turnover = ((ResourceBundle) session.getAttribute("message")).getString("turnover");
					totalBusinessCapital = ((ResourceBundle) session.getAttribute("message"))
							.getString("totalBusinessCapital");
					noOfEmployees = ((ResourceBundle) session.getAttribute("message")).getString("noOfEmployees");
					businessStatus = ((ResourceBundle) session.getAttribute("message")).getString("businessStatus");
					countryOfReg = ((ResourceBundle) session.getAttribute("message")).getString("countryOfReg");
					moreAboutBusiness = ((ResourceBundle) session.getAttribute("message"))
							.getString("moreAboutBusiness");
					millionPounds = ((ResourceBundle) session.getAttribute("message")).getString("millionPounds");
				}
				request.setAttribute("field", field);
				request.setAttribute("businessName", businessName);
				request.setAttribute("tradingName", tradingName);
				request.setAttribute("businessType", businessType);
				request.setAttribute("branchName", branchName);
				request.setAttribute("isStartUp", isStartUp);
				request.setAttribute("estDate", estDate);
				request.setAttribute("regDate", regDate);
				request.setAttribute("turnover", turnover);
				request.setAttribute("totalBusinessCapital", totalBusinessCapital);
				request.setAttribute("noOfEmployees", noOfEmployees);
				request.setAttribute("businessStatus", businessStatus);
				request.setAttribute("countryOfReg", countryOfReg);
				request.setAttribute("moreAboutBusiness", moreAboutBusiness);
				request.setAttribute("millionPounds", millionPounds);

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/CaptuteCoreBusinessDetails.jsp");
				rd.forward(request, response);
				// response.sendRedirect(request.getContextPath()
				// + "/jsp/CaptuteCoreBusinessDetails.jsp");
			} catch (BusinessCustRegException e) {

			}
			// Checking the Group List

		} else if (action.equals("sendForm1")) {

			double expectedAnnualTurnover = 0.00;
			long numberOfEmployees = 00;
			double totalBusinessCapital = 0.00;
			String businessName = request.getParameter("businessName");
			String tradingName = request.getParameter("tradingName");
			String businessType = request.getParameter("businessType");
			String bankBranch = request.getParameter("branchName");
			String isStartUpBusiness = request.getParameter("isStartUpBusiness");
			String dateEstablished = request.getParameter("establismentDate");
			String dateOfRegistration = request.getParameter("registrationDate");
			if (request.getParameter("expectedAnnualTurnover") != null) {
				expectedAnnualTurnover = Double.parseDouble(request.getParameter("expectedAnnualTurnover"));
			}
			if (request.getParameter("noOfEmployees") != null) {
				numberOfEmployees = Long.parseLong(request.getParameter("noOfEmployees"));
			}
			if (request.getParameter("bCapital") != null) {
				totalBusinessCapital = Double.parseDouble(request.getParameter("bCapital"));
			}
			String businessStatus = request.getParameter("businessStatus");
			String countryOfRegistration = request.getParameter("countryRegistration");
			String tellMoreAboutYourBusiness = request.getParameter("tellMoreAboutYourBusiness");

			nonPersonalCustomer = new NonPersonalCustomer();
			nonPersonalCustomer.setBusinessName(businessName);
			nonPersonalCustomer.setTradingName(tradingName);
			nonPersonalCustomer.setBusinessType(businessType);
			nonPersonalCustomer.setBankBranch(bankBranch);
			nonPersonalCustomer.setIsStartUpBusiness(isStartUpBusiness);
			nonPersonalCustomer.setDateEstablished(dateEstablished);
			nonPersonalCustomer.setDateOfRegistration(dateOfRegistration);
			nonPersonalCustomer.setExpectedAnnualTurnover(expectedAnnualTurnover);
			nonPersonalCustomer.setNumberOfEmployees(numberOfEmployees);
			nonPersonalCustomer.setTotalBusinessCapital(totalBusinessCapital);
			nonPersonalCustomer.setBusinessStatus(businessStatus);
			nonPersonalCustomer.setCountryOfRegistration(countryOfRegistration);
			nonPersonalCustomer.setTellMoreAboutYourBusiness(tellMoreAboutYourBusiness);

			String field = null;
			String industrySector = null;
			String mainActivity = null;
			String preciseActivity = null;
			String DoYouRequireFunding = null;
			String HowMuchFundingYouRequire = null;
			String DoYouImportExportGoods = null;
			String AreYouPartofGroupOrEnterprise = null;
			String franchiseDetails = null;
			String PleaseEnterDetails = null;
			String millionPounds = null;

			if (null != session.getAttribute("message")) {
				field = ((ResourceBundle) session.getAttribute("message")).getString("field");
				industrySector = ((ResourceBundle) session.getAttribute("message")).getString("industrySector");
				mainActivity = ((ResourceBundle) session.getAttribute("message")).getString("mainActivity");
				preciseActivity = ((ResourceBundle) session.getAttribute("message")).getString("preciseActivity");
				DoYouRequireFunding = ((ResourceBundle) session.getAttribute("message"))
						.getString("DoYouRequireFunding");
				HowMuchFundingYouRequire = ((ResourceBundle) session.getAttribute("message"))
						.getString("HowMuchFundingYouRequire");
				DoYouImportExportGoods = ((ResourceBundle) session.getAttribute("message"))
						.getString("DoYouImportExportGoods");
				AreYouPartofGroupOrEnterprise = ((ResourceBundle) session.getAttribute("message"))
						.getString("AreYouPartofGroupOrEnterprise");
				franchiseDetails = ((ResourceBundle) session.getAttribute("message")).getString("franchiseDetails");
				PleaseEnterDetails = ((ResourceBundle) session.getAttribute("message")).getString("PleaseEnterDetails");
				millionPounds = ((ResourceBundle) session.getAttribute("message")).getString("millionPounds");
			}

			request.setAttribute("field", field);
			request.setAttribute("industrySector", industrySector);
			request.setAttribute("mainActivity", mainActivity);
			request.setAttribute("preciseActivity", preciseActivity);
			request.setAttribute("DoYouRequireFunding", DoYouRequireFunding);
			request.setAttribute("HowMuchFundingYouRequire", HowMuchFundingYouRequire);
			request.setAttribute("DoYouImportExportGoods", DoYouImportExportGoods);
			request.setAttribute("AreYouPartofGroupOrEnterprise", AreYouPartofGroupOrEnterprise);
			request.setAttribute("franchiseDetails", franchiseDetails);
			request.setAttribute("PleaseEnterDetails", PleaseEnterDetails);
			request.setAttribute("msg", businessName);
			request.setAttribute("millionPounds", millionPounds);
			session = request.getSession();
			session.setAttribute("customer", nonPersonalCustomer);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/CaptureAdditionalBusinessDetails.jsp");
			rd.forward(request, response);

		}

		else if (action.equals("sendForm2")) {
			nonPersonalCustomer = new NonPersonalCustomer();
			nonPersonalCustomer = (NonPersonalCustomer) session.getAttribute("customer");
			double fundAmount = 0.0;
			String industrySector = request.getParameter("industrySector");
			String mainActivity = request.getParameter("mainActivity");
			String preciseActivity = request.getParameter("preciseActivity");
			String requireFunding = request.getParameter("requireFunding");
			if (request.getParameter("fundAmount") != null) {
				fundAmount = Double.parseDouble(request.getParameter("fundAmount"));
			}
			String goods = request.getParameter("goods");
			String groupFranchise = request.getParameter("groupFranchise");
			String franchiseDetails = request.getParameter("franchiseDetails");
			String businessName = request.getParameter("businessName");

			nonPersonalCustomer.setIndustrySector(industrySector);
			nonPersonalCustomer.setMainActivity(mainActivity);
			nonPersonalCustomer.setPreciseActivity(preciseActivity);
			nonPersonalCustomer.setRequireFunding(requireFunding);
			nonPersonalCustomer.setFundAmount(fundAmount);
			nonPersonalCustomer.setGoods(goods);
			nonPersonalCustomer.setGroupFranchise(groupFranchise);
			nonPersonalCustomer.setFranchiseDetails(franchiseDetails);

			request.setAttribute("msg", businessName);
			session = request.getSession();
			session.setAttribute("customer", nonPersonalCustomer);

			RequestDispatcher rd = request.getRequestDispatcher("/jsp/CaptureBusinessAddress.jsp");
			rd.forward(request, response);

		}

		else if (action.equals("sendForm3")) {
			nonPersonalCustomer = new NonPersonalCustomer();
			nonPersonalCustomer = (NonPersonalCustomer) session.getAttribute("customer");
			String buildingNumber = request.getParameter("buildingNumber");
			String buildingName = request.getParameter("buildingName");
			String streetName = request.getParameter("streetName");
			String townName = request.getParameter("townName");
			String cityName = request.getParameter("cityName");
			String postalCode = request.getParameter("postalCode");
			String country = request.getParameter("country");
			String businessName = request.getParameter("businessName");
			String sameAddress = request.getParameter("sameAddress");

			bAddress = new Address();
			bAddress.setBuildingNumber(buildingNumber);
			bAddress.setBuildingName(buildingName);
			bAddress.setStreetName(streetName);
			bAddress.setTownName(townName);
			bAddress.setCityName(cityName);
			bAddress.setPostalCode(postalCode);
			bAddress.setCountry(country);
			bAddress.setAddressType("Business Address");

			nonPersonalCustomer.addAddress(bAddress);

			if (sameAddress.equals("No")) {
				request.setAttribute("msg", businessName);
				nonPersonalCustomer = new NonPersonalCustomer();
				nonPersonalCustomer = (NonPersonalCustomer) session.getAttribute("customer");
				session = request.getSession();
				session.setAttribute("customer", nonPersonalCustomer);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/CaptureCorrespondenceAddress.jsp");
				rd.forward(request, response);
			} else if (sameAddress.equals("Yes")) {
				cAddress = new Address();
				cAddress.setBuildingNumber(buildingNumber);
				cAddress.setBuildingName(buildingName);
				cAddress.setStreetName(streetName);
				cAddress.setTownName(townName);
				cAddress.setCityName(cityName);
				cAddress.setPostalCode(postalCode);
				cAddress.setCountry(country);
				cAddress.setAddressType("Correspondence Address");

				nonPersonalCustomer.addAddress(cAddress);

				mAddress = new Address();
				mAddress.setBuildingNumber(buildingNumber);
				mAddress.setBuildingName(buildingName);
				mAddress.setStreetName(streetName);
				mAddress.setTownName(townName);
				mAddress.setCityName(cityName);
				mAddress.setPostalCode(postalCode);
				mAddress.setCountry(country);
				mAddress.setAddressType("Mailing Address");

				nonPersonalCustomer.addAddress(mAddress);

				request.setAttribute("msg", businessName);
				session = request.getSession();
				session.setAttribute("customer", nonPersonalCustomer);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/CaptureBusinessEvidences.jsp");
				rd.forward(request, response);
			}
		} else if (action.equals("sendForm4")) {
			nonPersonalCustomer = new NonPersonalCustomer();
			nonPersonalCustomer = (NonPersonalCustomer) session.getAttribute("customer");

			String buildingNumber = request.getParameter("cbuildingNumber");
			String buildingName = request.getParameter("cbuildingName");
			String streetName = request.getParameter("cstreetName");
			String townName = request.getParameter("ctownName");
			String cityName = request.getParameter("ccityName");
			String postalCode = request.getParameter("cpostalCode");
			String country = request.getParameter("ccountry");
			String businessName = request.getParameter("businessName");

			cAddress = new Address();
			cAddress.setBuildingNumber(buildingNumber);
			cAddress.setBuildingName(buildingName);
			cAddress.setStreetName(streetName);
			cAddress.setTownName(townName);
			cAddress.setCityName(cityName);
			cAddress.setPostalCode(postalCode);
			cAddress.setCountry(country);
			cAddress.setAddressType("Correspondence Address");

			nonPersonalCustomer.addAddress(cAddress);

			request.setAttribute("msg", businessName);
			session = request.getSession();
			session.setAttribute("customer", nonPersonalCustomer);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/CaptureMailingAddress.jsp");
			rd.forward(request, response);
		} else if (action.equals("sendForm5")) {
			nonPersonalCustomer = new NonPersonalCustomer();
			nonPersonalCustomer = (NonPersonalCustomer) session.getAttribute("customer");
			String buildingNumber = request.getParameter("mbuildingNumber");
			String buildingName = request.getParameter("mbuildingName");
			String streetName = request.getParameter("mstreetName");
			String townName = request.getParameter("mtownName");
			String cityName = request.getParameter("mcityName");
			String postalCode = request.getParameter("mpostalCode");
			String country = request.getParameter("mcountry");
			String businessName = request.getParameter("businessName");

			mAddress = new Address();
			mAddress.setBuildingNumber(buildingNumber);
			mAddress.setBuildingName(buildingName);
			mAddress.setStreetName(streetName);
			mAddress.setTownName(townName);
			mAddress.setCityName(cityName);
			mAddress.setPostalCode(postalCode);
			mAddress.setCountry(country);
			mAddress.setAddressType("Mailing Address");

			nonPersonalCustomer.addAddress(mAddress);
			session = request.getSession();
			session.setAttribute("customer", nonPersonalCustomer);

			request.setAttribute("msg", businessName);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/CaptureBusinessEvidences.jsp");
			rd.forward(request, response);
		} else if (action.equals("sendForm6")) {

			/*
			 * 
			 * 
			 * nonPersonalCustomer = new NonPersonalCustomer(); nonPersonalCustomer =
			 * (NonPersonalCustomer) session .getAttribute("customer"); int w_areaCode =
			 * 000; int w_countryCode = 000; long phone_no = 000000; int f_areaCode = 000;
			 * long fax_no = 000; int f_countryCode = 000;
			 * 
			 * 
			 * 
			 * if (request.getParameter("w_areaCode") != null) { w_areaCode =
			 * Integer.parseInt(request .getParameter("w_areaCode")); } if
			 * (request.getParameter("w_countryCode") != null) { w_countryCode =
			 * Integer.parseInt(request .getParameter("w_countryCode")); } if
			 * (request.getParameter("phone_no") != null) { phone_no =
			 * Long.parseLong(request.getParameter("phone_no")); } if
			 * (request.getParameter("f_areaCode") != null) { f_areaCode =
			 * Integer.parseInt(request .getParameter("f_areaCode")); } if
			 * (request.getParameter("f_countryCode") != null) { f_countryCode =
			 * Integer.parseInt(request .getParameter("f_countryCode")); } if
			 * (request.getParameter("fax_no") != null) { fax_no =
			 * Long.parseLong(request.getParameter("fax_no")); }
			 * 
			 * String emailId = request.getParameter("emailId"); String details =
			 * request.getParameter("details"); String idProof =
			 * request.getParameter("idProof"); String addressProof =
			 * request.getParameter("addProof");
			 * 
			 * contactW = new Contact(); contactW.setAreaCode(w_areaCode);
			 * contactW.setCountryCode(w_countryCode); contactW.setContactNumber(phone_no);
			 * contactW.setContactType("Work"); contactF = new Contact();
			 * contactF.setAreaCode(f_areaCode); contactF.setCountryCode(f_countryCode);
			 * contactF.setContactNumber(fax_no); contactF.setContactType("Fax");
			 * nonPersonalCustomer.setAdditionalDetails(details);
			 * nonPersonalCustomer.setEmailId(emailId); proofId = new Proof();
			 * proofId.setDocument(idProof); proofId.setDocumentType("ID"); proofAdd = new
			 * Proof(); proofAdd.setDocument(addressProof);
			 * proofAdd.setDocumentType("Address");
			 * 
			 * nonPersonalCustomer.addContact(contactF);
			 * nonPersonalCustomer.addContact(contactW);
			 * 
			 * nonPersonalCustomer.addProof(proofId);
			 * nonPersonalCustomer.addProof(proofAdd);
			 * 
			 * try { cmservice = new CustomerManagementService(); flag =
			 * cmservice.registerAllDetails(nonPersonalCustomer); session =
			 * request.getSession(); session.setAttribute("cust", nonPersonalCustomer);
			 * RequestDispatcher rd = request
			 * .getRequestDispatcher("/jsp/BusinessCustAddSuccess.jsp"); rd.forward(request,
			 * response); } catch (BusinessCustRegException e) { request.setAttribute("msg",
			 * "An error has occurred."); RequestDispatcher rd = request
			 * .getRequestDispatcher("jsp/Error.jsp"); rd.forward(request, response); }
			 * 
			 */

		}

		else if (action.equals("delete")) {

			long id = Long.parseLong(request.getParameter("id"));
			try {
				cmservice = new CustomerManagementService();
				flag = cmservice.deleteBusinessCustomer(id);
				String message = "Business Customer Details are sucessfully Deleted.";
				request.setAttribute("msg", message);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/success.jsp");
				rd.forward(request, response);
			} catch (BusinessCustRegException e) {
				request.setAttribute("msg", "An error has occurred.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

		}

		else if (action.equals("ViewDetails")) {
			cmservice = new CustomerManagementService();
			long npc_id;
			npc_id = Long.parseLong(request.getParameter("npc_id"));
			logger.info("npc_id" + npc_id);

			try {
				nonPersonalCustomer = cmservice.viewBusinessCustomer(npc_id);
				logger.info("object:" + nonPersonalCustomer);
				if (nonPersonalCustomer.getAl().size() < 3 || nonPersonalCustomer.getCl().size() < 2
						|| nonPersonalCustomer.getPl().size() < 2) {
					request.setAttribute("msg", "Sorry,Full Details dont Exist in System");
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/success.jsp");
					rd.forward(request, response);
				} else {
					logger.info("date out in servlet" + nonPersonalCustomer.getDateEstablished());
					session = request.getSession();
					session.setAttribute("cust", nonPersonalCustomer);
					session.setAttribute("flag", false);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewBusinessCustomerFullDetails.jsp");
					rd.forward(request, response);
				}
			} catch (BusinessCustRegException e) {
				request.setAttribute("msg", "An error has occurred.");
				e.printStackTrace();
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

		} else if (action.equals("viewIdProof")) {
			ServletOutputStream sos = response.getOutputStream();
			response.setContentType("image/jpeg");

			nonPersonalCustomer = (NonPersonalCustomer) session.getAttribute("cust");
			List<Proof> pl = nonPersonalCustomer.getPl();
			Proof p = pl.get(0);
			response.setContentLength(p.getDocumentProof().length);
			response.setHeader("Content-Disposition", "attachment; filename=" + p.getDocument() + ".jpg");
			sos.write(p.getDocumentProof());

			logger.info("Viewing Id Proof");
			/*
			 * RequestDispatcher rd=request.getRequestDispatcher("/jsp/viewDocument.jsp");
			 * rd.forward(request, response);
			 */
		}

		else if (action.equals("viewAddressProof")) {

			ServletOutputStream sos = response.getOutputStream();
			response.setContentType("image/jpeg");

			nonPersonalCustomer = (NonPersonalCustomer) session.getAttribute("cust");
			List<Proof> pl = nonPersonalCustomer.getPl();
			Proof p = pl.get(1);
			response.setContentLength(p.getDocumentProof().length);
			response.setHeader("Content-Disposition", "attachment; filename=" + p.getDocument() + ".jpg");
			sos.write(p.getDocumentProof());
			sos.flush();
			sos.close();
			logger.info("Viewing Address Proof");
			/*
			 * RequestDispatcher rd=request.getRequestDispatcher("/jsp/viewDocument.jsp");
			 * rd.forward(request, response);
			 */
		}
		if (action.equals("SearchCust")) {

			session = request.getSession();
			response.sendRedirect(request.getContextPath() + "/jsp/SearchBusinessCustomer.jsp");
		}

		else if (action.equals("SearchCustomer")) {
			cmservice = new CustomerManagementService();
			String parameter1 = null;
			String parameter2 = null;
			String actionname = null;
			if (request.getParameter("TradingName") != null) {
				parameter1 = request.getParameter("TradingName");
				parameter2 = request.getParameter("BranchName");
				actionname = "SearchCustomer2";

			} else if (request.getParameter("BusinessName") != null) {
				parameter1 = request.getParameter("BusinessName");
				parameter2 = request.getParameter("BranchName");
				actionname = "SearchCustomer1";
			} else if (request.getParameter("AccountNumber") != null) {
				parameter1 = request.getParameter("AccountNumber");
				parameter2 = null;
				actionname = "SearchCustomer3";
			}

			List<NonPersonalCustomer> customerList = new ArrayList<NonPersonalCustomer>();

			try {
				customerList = cmservice.searchBusinessCustomer(parameter1, parameter2, actionname);
				request.setAttribute("customerList", customerList);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/ShowSearchDetails.jsp");
				rd.forward(request, response);
			} catch (BusinessCustRegException e) {
				request.setAttribute("msg", "An error has occurred.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

		}

		else if (action.equals("update")) {
			cmservice = new CustomerManagementService();
			String npc_id = request.getParameter("npc_id");

			List<NonPersonalCustomer> npcList = new ArrayList<NonPersonalCustomer>();

			try {
				npcList = cmservice.searchBusinessCustomer(null, npc_id, "update");
				session = request.getSession();
				session.setAttribute("npc_id", npc_id);
				session.setAttribute("customer", npcList.get(0));
				logger.info(npcList.get(0).getFundAmount());
				RequestDispatcher rd = request.getRequestDispatcher("jsp/UpdateCoreBusinessDetails.jsp");
				rd.forward(request, response);
			} catch (BusinessCustRegException e) {
				request.setAttribute("msg", "An error has occurred.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}

		} else if (action.equals("sendUpdatedForm1")) {

			NonPersonalCustomer npc = (NonPersonalCustomer) session.getAttribute("customer");

			String businessName = request.getParameter("businessName");
			String tradingName = request.getParameter("tradingName");
			String businessType = request.getParameter("businessType");
			String branchName = request.getParameter("branchName");
			String isStartUpBusiness = request.getParameter("isStartUpBusiness");
			String dateEstablished = request.getParameter("establismentDate");

			String dateOfRegistration = request.getParameter("registrationDate");
			double expectedAnnualTurnover = Double.parseDouble(request.getParameter("expectedAnnualTurnover"));
			long numberOfEmployees = Long.parseLong(request.getParameter("noOfEmployees"));
			double totalBusinessCapital = Double.parseDouble(request.getParameter("bCapital"));
			String businessStatus = request.getParameter("businessStatus");
			String countryOfRegistration = request.getParameter("countryRegistration");
			String tellMoreAboutYourBusiness = request.getParameter("tellMoreAboutYourBusiness");

			npc.setBusinessName(businessName);
			npc.setTradingName(tradingName);
			npc.setBusinessType(businessType);
			npc.setBankBranch(branchName);
			npc.setIsStartUpBusiness(isStartUpBusiness);

			String s = "";

			if (dateEstablished != null) {
				npc.setDateEstablished(dateEstablished);
			} else {
				npc.setDateEstablished(s);
			}
			logger.info(npc.getDateEstablished());
			if (dateOfRegistration != null) {
				npc.setDateOfRegistration(dateOfRegistration);
			} else {
				npc.setDateOfRegistration(s);
			}
			npc.setExpectedAnnualTurnover(expectedAnnualTurnover);
			npc.setNumberOfEmployees(numberOfEmployees);
			npc.setTotalBusinessCapital(totalBusinessCapital);
			npc.setBusinessStatus(businessStatus);
			npc.setCountryOfRegistration(countryOfRegistration);
			npc.setTellMoreAboutYourBusiness(tellMoreAboutYourBusiness);

			request.setAttribute("msg", businessName);
			session = request.getSession();
			session.setAttribute("cust", npc);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewBusinessCustomerFullDetails.jsp");
			rd.forward(request, response);

		} else if (action.equals("sendUpdatedForm2")) {
			double fundAmount;
			NonPersonalCustomer npc = (NonPersonalCustomer) session.getAttribute("customer");

			String industrySector = request.getParameter("industrySector");
			String mainActivity = request.getParameter("mainActivity");
			String preciseActivity = request.getParameter("preciseActivity");
			String requireFunding = request.getParameter("requireFunding");
			if (requireFunding.equalsIgnoreCase("Yes")) {
				fundAmount = Double.parseDouble(request.getParameter("fundAmount"));
			} else {
				fundAmount = 0.0;
			}
			String goods = request.getParameter("goods");
			String groupFranchise = request.getParameter("groupFranchise");
			String franchiseDetails = request.getParameter("franchiseDetails");
			String businessName = request.getParameter("businessName");

			npc.setIndustrySector(industrySector);
			npc.setMainActivity(mainActivity);
			npc.setPreciseActivity(preciseActivity);
			npc.setRequireFunding(requireFunding);
			npc.setFundAmount(fundAmount);
			npc.setGoods(goods);
			npc.setGroupFranchise(groupFranchise);
			npc.setFranchiseDetails(franchiseDetails);

			request.setAttribute("msg", businessName);
			session = request.getSession();
			session.setAttribute("cust", npc);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewBusinessCustomerFullDetails.jsp");
			rd.forward(request, response);

		} else if (action.equals("sendUpdatedForm3")) {

			NonPersonalCustomer npc = (NonPersonalCustomer) session.getAttribute("customer");

			String buildingNumber = request.getParameter("buildingNumber");
			String buildingName = request.getParameter("buildingName");
			String streetName = request.getParameter("streetName");
			String townName = request.getParameter("townName");
			String cityName = request.getParameter("cityName");
			String postalCode = request.getParameter("postalCode");
			String country = request.getParameter("country");
			// String businessName = request.getParameter("businessName");
			String sameAddress = request.getParameter("sameAddress");

			bAddress = new Address();
			bAddress.setBuildingNumber(buildingNumber);
			bAddress.setBuildingName(buildingName);
			bAddress.setStreetName(streetName);
			bAddress.setTownName(townName);
			bAddress.setCityName(cityName);
			bAddress.setPostalCode(postalCode);
			bAddress.setCountry(country);
			bAddress.setAddressType("Business Address");

			npc.getAl().set(0, bAddress);

			if (sameAddress.equalsIgnoreCase("No")) {

				session = request.getSession();
				session.setAttribute("customer", npc);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/UpdateCorrespondenceAddress.jsp");
				rd.forward(request, response);
			} else {
				npc.getAl().set(1, bAddress);
				npc.getAl().set(2, bAddress);
				session = request.getSession();
				session.setAttribute("cust", npc);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewBusinessCustomerFullDetails.jsp");
				rd.forward(request, response);
			}

		}

		else if (action.equals("sendUpdatedForm4")) {

			NonPersonalCustomer npc = (NonPersonalCustomer) session.getAttribute("customer");

			String buildingNumber = request.getParameter("cbuildingNumber");
			String buildingName = request.getParameter("cbuildingName");
			String streetName = request.getParameter("cstreetName");
			String townName = request.getParameter("ctownName");
			String cityName = request.getParameter("ccityName");
			String postalCode = request.getParameter("cpostalCode");
			String country = request.getParameter("ccountry");
			String businessName = request.getParameter("cbusinessName");
			String sameAddress = request.getParameter("sameAddress1");
			cAddress = new Address();
			cAddress.setBuildingNumber(buildingNumber);
			cAddress.setBuildingName(buildingName);
			cAddress.setStreetName(streetName);
			cAddress.setTownName(townName);
			cAddress.setCityName(cityName);
			cAddress.setPostalCode(postalCode);
			cAddress.setCountry(country);
			cAddress.setAddressType("Correspondence Address");

			npc.getAl().set(1, cAddress);
			if (sameAddress.equalsIgnoreCase("No")) {
				request.setAttribute("msg", businessName);
				session = request.getSession();
				session.setAttribute("customer", npc);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/UpdateMailingAddress.jsp");
				rd.forward(request, response);
			} else {
				npc.getAl().set(2, cAddress);
				session = request.getSession();
				session.setAttribute("cust", npc);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewBusinessCustomerFullDetails.jsp");
				rd.forward(request, response);
			}
		}

		else if (action.equals("sendUpdatedForm5")) {

			NonPersonalCustomer npc = (NonPersonalCustomer) session.getAttribute("customer");

			String buildingNumber = request.getParameter("mbuildingNumber");
			String buildingName = request.getParameter("mbuildingName");
			String streetName = request.getParameter("mstreetName");
			String townName = request.getParameter("mtownName");
			String cityName = request.getParameter("mcityName");
			String postalCode = request.getParameter("mpostalCode");
			String country = request.getParameter("mcountry");
			String businessName = request.getParameter("mbusinessName");

			mAddress = new Address();
			mAddress.setBuildingNumber(buildingNumber);
			mAddress.setBuildingName(buildingName);
			mAddress.setStreetName(streetName);
			mAddress.setTownName(townName);
			mAddress.setCityName(cityName);
			mAddress.setPostalCode(postalCode);
			mAddress.setCountry(country);
			mAddress.setAddressType("Mailing Address");

			npc.getAl().set(2, mAddress);

			request.setAttribute("msg", businessName);
			session = request.getSession();
			session.setAttribute("cust", npc);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewBusinessCustomerFullDetails.jsp");
			rd.forward(request, response);
		}

		else if (action.equals("sendUpdatedForm6")) {

			NonPersonalCustomer npc = (NonPersonalCustomer) session.getAttribute("customer");

			int w_areaCode = Integer.parseInt(request.getParameter("w_areaCode"));
			int w_countryCode = Integer.parseInt(request.getParameter("w_countryCode"));
			long phone_no = Long.parseLong(request.getParameter("phone_no"));
			int f_areaCode = Integer.parseInt(request.getParameter("f_areaCode"));
			int f_countryCode = Integer.parseInt(request.getParameter("f_countryCode"));
			long fax_no = Long.parseLong(request.getParameter("fax_no"));
			String emailId = request.getParameter("emailId");
			String details = request.getParameter("details");
			String idProof = request.getParameter("idProof");
			String addressProof = request.getParameter("addProof");

			contactW = new Contact();
			contactW.setAreaCode(w_areaCode);
			contactW.setCountryCode(w_countryCode);
			contactW.setContactNumber(phone_no);
			contactW.setContactType("Work");

			contactF = new Contact();
			contactF.setAreaCode(f_areaCode);
			contactF.setCountryCode(f_countryCode);
			contactF.setContactNumber(fax_no);
			contactF.setContactType("Fax");

			proofId = new Proof();
			proofId.setDocument(idProof);
			proofId.setDocumentType("ID");
			proofAdd = new Proof();
			proofAdd.setDocument(addressProof);
			proofAdd.setDocumentType("Address");

			npc.setAdditionalDetails(details);
			npc.setEmailId(emailId);

			npc.getCl().set(0, contactW);
			npc.getCl().set(1, contactF);

			npc.getPl().set(0, proofId);
			npc.getPl().set(1, proofAdd);

			String businessName = npc.getBusinessName();
			request.setAttribute("msg", businessName);
			session = request.getSession();
			session.setAttribute("cust", npc);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewBusinessCustomerFullDetails.jsp");
			rd.forward(request, response);

		}

		else if (action.equalsIgnoreCase("updateconfirm")) {
			cmservice = new CustomerManagementService();

			NonPersonalCustomer npc = (NonPersonalCustomer) session.getAttribute("cust");

			try {
				flag = cmservice.updateAllDetails(npc);
				String message = "Business Customer Details are sucessfully Updated.";
				request.setAttribute("msg", message);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/success.jsp");
				rd.forward(request, response);
			} catch (BusinessCustRegException e) {
				e.printStackTrace();
				/*
				 * request.setAttribute("msg", "An error has occurred."); RequestDispatcher rd =
				 * request .getRequestDispatcher("jsp/Error.jsp"); rd.forward(request,
				 * response);
				 */}

		}

		else if ("updateForm1".equalsIgnoreCase(action)) {

			NonPersonalCustomer npc = (NonPersonalCustomer) session.getAttribute("cust");
			if (npc.getDateEstablished() == null) {
				npc.setDateEstablished("");
			}
			if (npc.getDateOfRegistration() == null) {
				npc.setDateOfRegistration("");
			}
			session = request.getSession();
			session.setAttribute("flag", true);
			session.setAttribute("customer", npc);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/UpdateCoreBusinessDetails.jsp");
			rd.forward(request, response);

		} else if ("updateForm2".equalsIgnoreCase(action)) {

			NonPersonalCustomer npc = (NonPersonalCustomer) session.getAttribute("cust");
			session = request.getSession();
			session.setAttribute("flag", true);
			session.setAttribute("customer", npc);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/UpdateAdditionalBusinessDetails.jsp");
			rd.forward(request, response);

		} else if ("updateForm3".equalsIgnoreCase(action)) {

			NonPersonalCustomer npc = (NonPersonalCustomer) session.getAttribute("cust");
			session = request.getSession();
			session.setAttribute("flag", true);
			session.setAttribute("customer", npc);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/UpdateBusinessAddress.jsp");
			rd.forward(request, response);

		} else if ("updateForm4".equalsIgnoreCase(action)) {

			NonPersonalCustomer npc = (NonPersonalCustomer) session.getAttribute("cust");
			session.setAttribute("flag", true);
			session.setAttribute("customer", npc);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/UpdateCorrespondenceAddress.jsp");
			rd.forward(request, response);

		} else if ("updateForm5".equalsIgnoreCase(action)) {

			NonPersonalCustomer npc = (NonPersonalCustomer) session.getAttribute("cust");
			session.setAttribute("customer", npc);
			session.setAttribute("flag", true);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/UpdateMailingAddress.jsp");
			rd.forward(request, response);

		} else if ("updateForm6".equalsIgnoreCase(action)) {

			if (request.getSession() == null || request.getSession().getAttribute("username") == null) {
				response.sendRedirect(request.getContextPath());
				return;
			}
			// end check session validity
			NonPersonalCustomer npc = (NonPersonalCustomer) session.getAttribute("cust");
			session = request.getSession();
			session.setAttribute("flag", true);
			session.setAttribute("customer", npc);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/UpdateBusinessEvidences.jsp");
			rd.forward(request, response);

		}

		else if (REPORT.equals(action)) {
			RequestDispatcher rd = request.getRequestDispatcher("jsp/ReportCriteria.jsp");
			rd.forward(request, response);
		}

		else if (action.equals("chart"))

		{
			year = request.getParameter("year");
			System.out.println(year);
			month = request.getParameter("month");
			String type = request.getParameter("type");
			System.out.println(type);
			String heading = null;
			List<ReportData> report = new ArrayList<ReportData>();
			if (year.equalsIgnoreCase("Select") && month.equals("Select")) {
				chartno = 1;
			} else if (!(year.equals("Select")) && month.equals("Select") && type.equals("Pie Chart")) {
				chartno = 2;
			} else if (year.equals("Select") && (!month.equals("Select"))) {
				if (month.equalsIgnoreCase("January"))
					month = "01";
				else if (month.equalsIgnoreCase("February"))
					month = "02";
				if (month.equalsIgnoreCase("March"))
					month = "03";
				else if (month.equalsIgnoreCase("April"))
					month = "04";
				else if (month.equalsIgnoreCase("May"))
					month = "05";
				else if (month.equalsIgnoreCase("June"))
					month = "06";
				if (month.equalsIgnoreCase("July"))
					month = "07";
				else if (month.equalsIgnoreCase("August"))
					month = "08";
				else if (month.equalsIgnoreCase("September"))
					month = "09";
				else if (month.equalsIgnoreCase("October"))
					month = "10";
				if (month.equalsIgnoreCase("November"))
					month = "11";
				else if (month.equalsIgnoreCase("December"))
					month = "12";
				chartno = 3;
			}

			else if (!(year.equals("Select")) && !(month.equals("Select"))) {
				if (month.equalsIgnoreCase("January"))
					month = "01";
				else if (month.equalsIgnoreCase("February"))
					month = "02";
				if (month.equalsIgnoreCase("March"))
					month = "03";
				else if (month.equalsIgnoreCase("April"))
					month = "04";
				else if (month.equalsIgnoreCase("May"))
					month = "05";
				else if (month.equalsIgnoreCase("June"))
					month = "06";
				if (month.equalsIgnoreCase("July"))
					month = "07";
				else if (month.equalsIgnoreCase("August"))
					month = "08";
				else if (month.equalsIgnoreCase("September"))
					month = "09";
				else if (month.equalsIgnoreCase("October"))
					month = "10";
				if (month.equalsIgnoreCase("November"))
					month = "11";
				else if (month.equalsIgnoreCase("December"))
					month = "12";
				chartno = 4;
			}
			if (type.equals("PDF Report")) {

				request.setAttribute("year", year);
				request.setAttribute("monthNo", month);
				request.setAttribute("month", request.getParameter("month"));
				request.setAttribute("chartNo", " " + chartno);

				RequestDispatcher rd = request.getRequestDispatcher("/PdfReportServlet?action=pdfreport");
				rd.forward(request, response);

			} else {
				request.setAttribute("year", year);
				request.setAttribute("month", month);
				request.setAttribute("type", type);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/PieChart.jsp");
				rd.forward(request, response);
			}
		}

		else if (GENERATEREPORT.equals(action)) {
			List<ReportData> report = new ArrayList<ReportData>();
			cmservice = new CustomerManagementService();
			String heading = null;
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String type = request.getParameter("type");
			String monthName = null;
			if (month.equals("01"))
				monthName = "January";
			else if (month.equals("02"))
				monthName = "February";
			else if (month.equals("03"))
				monthName = "March";
			else if (month.equals("04"))
				monthName = "April";
			else if (month.equals("05"))
				monthName = "May";
			else if (month.equals("06"))
				monthName = "June";
			else if (month.equals("07"))
				monthName = "July";
			else if (month.equals("08"))
				monthName = "August";
			else if (month.equals("09"))
				monthName = "September";
			else if (month.equals("10"))
				monthName = "October";
			else if (month.equals("11"))
				monthName = "November";
			else if (month.equals("12"))
				monthName = "December";
			try {

				if (chartno == 1) {
					if (type.equalsIgnoreCase("Pie Chart"))
						heading = "Location wise percentage of customers";
					else if (type.equalsIgnoreCase("Bar Chart"))
						heading = "Location wise percentage of customers";
					report = cmservice.generateReport();
					cmservice.generatePieChart(type, report.size(), (ArrayList<ReportData>) report, heading, response);
				} else if (chartno == 2) {
					if (type.equalsIgnoreCase("Pie Chart"))
						heading = "Location wise percentage of customers for year " + year;
					else if (type.equalsIgnoreCase("Bar Chart"))
						heading = "Location wise percentage of customers for year " + year;
					report = cmservice.generateReportByYear(year);
					cmservice.generatePieChart(type, report.size(), (ArrayList<ReportData>) report, heading, response);
				} else if (chartno == 3) {
					if (type.equalsIgnoreCase("Pie Chart"))
						heading = "Location wise percentage of customers for month " + monthName;
					else if (type.equalsIgnoreCase("Bar Chart"))
						heading = "Location wise percentage of customers for month " + monthName;
					report = cmservice.generateReportByMonth(month);
					cmservice.generatePieChart(type, report.size(), (ArrayList<ReportData>) report, heading, response);
				} else if (chartno == 4) {
					if (type.equalsIgnoreCase("Pie Chart"))
						heading = "Location wise percentage of customers for month " + monthName + " and year " + year;
					else if (type.equalsIgnoreCase("Bar Chart"))
						heading = "Location wise percentage of customers for month " + monthName + " and year " + year;
					report = cmservice.generateReportByMonthYear(month, year);
					cmservice.generatePieChart(type, report.size(), (ArrayList<ReportData>) report, heading, response);
				}

			} // end of try
			catch (BusinessCustRegException e) {
				request.setAttribute("msg", "An error has occurred while generating the report.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			}
		} // end of generate report

	}// end of doPost

}
