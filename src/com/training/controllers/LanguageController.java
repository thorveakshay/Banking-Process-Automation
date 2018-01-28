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

/**
 * Servlet implementation class LanguageController
 */
public class LanguageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LanguageController() {
		super();

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
		// String action=request.getParameter("action");
		String action = request.getParameter("action");
		String lang = request.getParameter("languageOption");

		String language = null;
		String country = null;

		session = request.getSession();
		Locale currentLocale;
		ResourceBundle messages;
		if (action.equals("sendLanguage")) {
			if (lang.equalsIgnoreCase("English")) {
				language = "en";
				country = "US";

			} else if (lang.equalsIgnoreCase("French")) {
				language = "fr";
				country = "FR";
				/*
				 * currentLocale = new Locale(language, country); messages =
				 * ResourceBundle.getBundle("com.training.multilingualsupport.MessagesBundle",
				 * currentLocale); session.setAttribute("message",messages); RequestDispatcher
				 * rd=request.getRequestDispatcher("/temp/index2.jsp"); rd.forward(request,
				 * response);
				 */
			} else if (lang.equalsIgnoreCase("German")) {
				language = "de";
				country = "DE";
			} else if (lang.equalsIgnoreCase("Spanish")) {
				language = "es";
				country = "MX";
			}

			currentLocale = new Locale(language, country);
			messages = ResourceBundle.getBundle("com.training.multilingualsupport.MessagesBundle", currentLocale);
			session.setAttribute("message", messages);
			RequestDispatcher rd = request.getRequestDispatcher("/temp/index2.jsp");
			rd.forward(request, response);
		}
	}
}
