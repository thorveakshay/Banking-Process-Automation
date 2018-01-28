package com.training.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.training.exception.BusinessCustRegException;
import com.training.model.ReportData;
import com.training.services.CustomerManagementService;

/**
 * Servlet implementation class PdfReportServlet
 */
public class PdfReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PdfReportServlet() {
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
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println(action);
		if (action.equals("pdfreport")) {
			String year = (String) request.getAttribute("year");
			String monthNo = (String) request.getAttribute("monthNo");
			String month = (String) request.getAttribute("month");
			String chartNo = (String) request.getAttribute("chartNo");
			chartNo = chartNo.trim();

			int chno = Integer.parseInt(chartNo);
			String heading = null;
			List<ReportData> report = new ArrayList<ReportData>();
			CustomerManagementService cmservice = new CustomerManagementService();
			try {
				if (chno == 1) {
					report = cmservice.generateReport();
					heading = "Country wise status of percentage of customers registered";
				} else if (chno == 2) {
					report = cmservice.generateReportByYear(year);
					heading = "Country wise status of percentage of customers registered for year " + year;
				} else if (chno == 3) {
					report = cmservice.generateReportByMonth(monthNo);
					heading = "Country wise status of percentage of customers registered for month " + month;
				} else if (chno == 4) {
					report = cmservice.generateReportByMonthYear(monthNo, year);
					heading = "Country wise status of percentage of customers registered for " + month + " " + year;
				}

			} catch (BusinessCustRegException e) {

				e.printStackTrace();
			}
			response.setHeader("Cache-Control", "private, max-age=15");
			response.setHeader("Pragma", "");
			response.setContentType("application/pdf");
			response.setHeader("Content-Disposition", "attachment; filename=\"report.pdf\"");
			Document document = new Document();
			try {

				// cmservice.createPdf(document, response,(ArrayList<ReportData>)report);

				PdfWriter.getInstance(document, response.getOutputStream());

				// step 3
				document.open();
				// step 4

				Font fontbold = FontFactory.getFont("Arial", 35, Font.BOLD);

				Paragraph paragraph = new Paragraph("Nexus Banking Group ", fontbold);

				paragraph.setAlignment(Element.ALIGN_CENTER);

				paragraph.setFont(fontbold);

				document.add(paragraph);
				document.add(new Paragraph(""));
				fontbold = FontFactory.getFont("Arial", 20, Font.NORMAL);
				paragraph = new Paragraph("\n\nGeneral Report", fontbold);

				paragraph.setAlignment(Element.ALIGN_CENTER);
				document.add(paragraph);
				paragraph = new Paragraph("On", fontbold);

				paragraph.setAlignment(Element.ALIGN_CENTER);
				document.add(paragraph);

				paragraph = new Paragraph(heading, fontbold);

				paragraph.setAlignment(Element.ALIGN_CENTER);

				document.add(paragraph);

				Date d = new Date();
				paragraph = new Paragraph(
						"till Date : " + d.getDate() + "-" + (d.getMonth() + 1) + "-" + (1900 + d.getYear()), fontbold);
				paragraph.setAlignment(Element.ALIGN_CENTER);
				document.add(paragraph);

				document.add(new Paragraph("\n\n"));
				PdfPTable tableHeader = CustomerManagementService.tableHeader();

				PdfPTable table = CustomerManagementService.createTable((ArrayList<ReportData>) report);
				document.add(tableHeader);
				document.add(table);

				fontbold = FontFactory.getFont("Arial", 18, Font.BOLD);
				paragraph = new Paragraph("\nReport Generated On : " + new Date());
				paragraph.setAlignment(Element.ALIGN_LEFT);
				document.add(paragraph);

				// step 5
				document.close();
				/*
				 * System.out.println("report generated successfully ");
				 * 
				 * System.out.println("after try");
				 */
			} catch (BusinessCustRegException e) {
				request.setAttribute("msg", "An error has occurred while generating the report.");
				RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
				rd.forward(request, response);
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} // end of pdf report

	}

}
