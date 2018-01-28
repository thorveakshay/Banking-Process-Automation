package com.training.logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.training.controllers.LoginServlet;

/**
 * Servlet implementation class LoggingServlet
 */
public class LoggingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	public void init() throws ServletException {
		// Get Fully Qualified Path to Properties File
		String config = getServletContext().getRealPath("/") + getInitParameter("log4jconfig");
		logger.info("*** LoggingServlet Initialized using file :" + config);

		// Initialize Properties for All Servlets
		PropertyConfigurator.configure(config);
	}
}
