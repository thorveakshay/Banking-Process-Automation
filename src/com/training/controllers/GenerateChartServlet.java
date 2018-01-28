package com.training.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.jfree.data.general.Dataset;
import org.jfree.data.jdbc.JDBCPieDataset;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.training.model.Branch;
import com.training.services.ReportService;
import com.training.utils.ConnectionUtil;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot;
import java.awt.*;
import java.io.*;
import org.jfree.chart.*;
import org.jfree.chart.labels.*;
import java.text.*;
import org.jfree.chart.plot.*;
import org.jfree.chart.entity.*;
import org.jfree.data.general.*;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

/**
 * Servlet implementation class GenerateReportServlet
 */
public class GenerateChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ReportService rs = new ReportService();
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);

	}

	//
	// select ROUND (RATIO_TO_REPORT (COUNT (*)) OVER () * 100, 2) || '%',(select
	// B1.BRANCH_NAME from BRANCH B1 where b1.BRANCH_ID=B.BRANCH_ID)as "BRANCH
	// NAME",B.BRANCH_ID from NON_PERSONAL_PARTY NP join BRANCH B on
	// NP.BRANCH_ID=B.BRANCH_ID group by B.BRANCH_ID;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/pdf");
		logger.info("hiiiiiiiii");
		ArrayList<Long> accountCount = new ArrayList<Long>();
		ArrayList<Long> accountCountPercentage = new ArrayList<Long>();
		try {
			accountCountPercentage = rs.getTypeOfAccountsCount();
			logger.info("fg" + accountCountPercentage);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// response.setHeader("Content-Disposition"," attachment;
		// filename=\"example.pdf\"");

		DefaultPieDataset dataset = new DefaultPieDataset();

		// dataset.setValue("Total accounts", accountCountPercentage.get(0));
		dataset.setValue("Saving Accounts", accountCountPercentage.get(1));
		dataset.setValue("Current Accounts", accountCountPercentage.get(2));
		dataset.setValue("Active Current Accounts", accountCountPercentage.get(3));
		dataset.setValue("Inactive 'Current Accounts'", accountCountPercentage.get(4));
		dataset.setValue("Inprogress 'Current Accounts'", accountCountPercentage.get(5));
		dataset.setValue("Active 'Saving Accounts'", accountCountPercentage.get(6));
		dataset.setValue("Inctive 'Saving Accounts'", accountCountPercentage.get(7));
		dataset.setValue("Inprogress 'Saving Accounts'", accountCountPercentage.get(8));
		// dataset.setValue("Section 8", accountCountPercentage.get(7));

		JFreeChart chart = ChartFactory.createPieChart("Chart 1", dataset, false, false, false);

		final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
		final File file1 = new File("C:/Documents and Settings/684087/Desktop/piechart.png");
		ChartUtilities.saveChartAsPNG(file1, chart, 800, 500, info);

		/*
		 * RequestDispatcher rd=request.getRequestDispatcher("/jsp/ShowPieChart.jsp");
		 * rd.forward(request, response);
		 */
		// try {
		// step 1
		// Document document = new Document();
		// // step 2
		// PdfWriter.getInstance(document, response.getOutputStream());
		// // step 3
		// document.open();
		// // step 4
		// HttpSession session=request.getSession();
		//
		// document.add(new Paragraph("Welcome
		// "+session.getAttribute("uname").toString()));
		// document.add(new Paragraph(new Date().toString()));
		//
		// ReportService rs=new ReportService();
		// ArrayList<Branch> list=new ArrayList<Branch>();
		//
		//
		// list=rs.locationWisePercOfCustomers();
		// for(Branch b:list)
		// {
		// document.add(new Paragraph(b.getBranchId()+" "+b.getBranchName() +"
		// "+b.getPercentage()+"%"));
		// }
		//
		// // step 5
		// document.close();

	}
}
