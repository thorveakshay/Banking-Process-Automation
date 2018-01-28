package com.training.controllers;

/*
 * package com.training.controller;
 * 
 * import java.io.IOException; import java.sql.SQLException;
 * 
 * import javax.servlet.RequestDispatcher; import
 * javax.servlet.ServletException; import javax.servlet.http.HttpServlet; import
 * javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import com.training.model.PersonalParty; import
 * com.training.services.PersonalPartyServices;
 * 
 *//**
	 * Servlet implementation class AccountPartyContactController
	 */
/*
 * public class PersonalPartyController extends HttpServlet { private static
 * final long serialVersionUID = 1L;
 * 
 *//**
	 * @see HttpServlet#HttpServlet()
	 */
/*
 * public PersonalPartyController() { super(); // TODO Auto-generated
 * constructor stub }
 * 
 *//**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
/*
 * protected void doGet(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException { // TODO Auto-generated
 * method stub doPost(request, response); }
 * 
 *//**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *//*
		 * protected void doPost(HttpServletRequest request, HttpServletResponse
		 * response) throws ServletException, IOException { // TODO Auto-generated
		 * method stub logger.info("inside controller"); String action = (String)
		 * request.getParameter("action"); Long pp_id =
		 * (Long.parseLong(request.getParameter("acc_idno"))); if
		 * (action.equals("acc_tkt_hidden")) { String tktdesc1 = (String)
		 * request.getParameter("ticketdesc"); String acc_id1= (String)
		 * request.getParameter("acc_idno"); request.setAttribute("description",
		 * tktdesc1); request.setAttribute("show_acc_id", acc_id1);
		 * PersonalPartyServices pps = new PersonalPartyServices(); PersonalParty pp;
		 * try { pp = pps.searchPersonalParty(pp_id); long pp_Id = pp.getPartyId();
		 * request.setAttribute("personal_party_id", pp_Id); String relation =
		 * pp.getRelationshipType(); request.setAttribute("party_relationship",
		 * relation); String fname = pp.getFirstName();
		 * request.setAttribute("party_fname", fname); String sname = pp.getSurName();
		 * request.setAttribute("party_sname", sname); } catch (ClassNotFoundException
		 * e) { // TODO Auto-generated catch block e.printStackTrace(); } catch
		 * (SQLException e) { // TODO Auto-generated catch block e.printStackTrace(); }
		 * RequestDispatcher rd =
		 * request.getRequestDispatcher("/jsp/ShowPersonalPartyTicketDetails.jsp");
		 * rd.forward(request, response);
		 * 
		 * } else if(action.equals("show_pp_tckt_hidden")){ PersonalPartyServices pps=
		 * new PersonalPartyServices(); String
		 * relation=(String)request.getParameter("txtrname"); try { // boolean
		 * success=pps.updatePersonalPartyRelationship(relation,pp_id); if(success){
		 * 
		 * String message="Updation Done Successfully";
		 * request.setAttribute("msg",message); RequestDispatcher rd =
		 * request.getRequestDispatcher("/jsp/backoffice.jsp"); rd.forward(request,
		 * response); }
		 * 
		 * } catch (ClassNotFoundException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); } catch (SQLException e) { // TODO Auto-generated catch
		 * block e.printStackTrace(); } }
		 * 
		 * } }
		 */