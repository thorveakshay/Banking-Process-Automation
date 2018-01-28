package com.training.controllers;

//NBG
import java.awt.Color;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
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

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.training.dao.ReportDao;
import com.training.dao.ReportDaoInterface;
import com.training.model.BusinessCustomer;
import com.training.services.ReportService;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;

import org.apache.catalina.connector.Request;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import java.io.*;
import org.jfree.chart.*;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.entity.*;
import org.jfree.chart.labels.PieSectionLabelGenerator;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.CategoryItemRenderer;

import com.itextpdf.text.Chunk;

import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

/**
 * Servlet implementation class GenerateReportServlet
 */
public class GenerateReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String CACHE_CONTROL = null;

	static ArrayList<Long> values = new ArrayList<Long>();
	String[] heading;

	ReportService rs = new ReportService();
	ArrayList<Long> accountCountPercentage = new ArrayList<Long>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GenerateReportServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

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
	public String getMonth(int monthNo) {
		if (monthNo == 1)
			return "January";
		else

		if (monthNo == 2)
			return "February";
		else if (monthNo == 3)
			return "March";
		else if (monthNo == 4)
			return "April";
		else if (monthNo == 5)
			return "May";
		else if (monthNo == 6)
			return "June";
		else if (monthNo == 7)
			return "July";
		else if (monthNo == 8)
			return "August";
		else if (monthNo == 9)
			return "September";
		else if (monthNo == 10)
			return "October";
		else if (monthNo == 11)
			return "November";
		else if (monthNo == 12)
			return "December";
		return "null";

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action").toString();

		// action="accountReport";
		if (action.equals("gotochart")) {

			HttpSession session;
			session = request.getSession();
			ReportService rs1 = new ReportService();
			ArrayList<BusinessCustomer> blist = new ArrayList<BusinessCustomer>();

			blist = rs1.getBusinessDetails();

			session.setAttribute("blist", blist);

			// System.out.println("value of radId is"+request.getParameter("radId"));
			String option = request.getParameter("chart");
			session.setAttribute("option", option);
			Integer j = Integer.parseInt(request.getParameter("radId"));

			session.setAttribute("j", j);

			String custMonth;
			String custYear;
			String month;
			String year;
			String year1;
			String custId;
			;

			if (j == 1) {
				// String custId=request.getParameter("CustId");
				// String custMonth=request.getParameter("custMonth");
				// String custYear=request.getParameter("custYear");

				custId = request.getParameter("CustId");
				custMonth = request.getParameter("custMonth");
				custYear = request.getParameter("custYear");

				session.setAttribute("custId", custId);
				session.setAttribute("custMonth", custMonth);
				session.setAttribute("custYear", custYear);

				ReportService rs2 = new ReportService();

				BusinessCustomer bcust = rs2.getBusinessDetails(Long.parseLong(custId));
				session.setAttribute("custName", bcust.getBusinessName());

				try {
					if ((custMonth == null && custYear == null)
							|| ((custMonth.length() == 0) && (custYear.length() == 0)))
						accountCountPercentage = rs.getTypeOfAccountsCount(Long.parseLong(custId));

					else if ((custMonth == null && custYear != null)
							|| ((custMonth.length() == 0) && (custYear.length() != 0)))
						accountCountPercentage = rs.getTypeOfAccountsCount(Integer.parseInt(custYear),
								Long.parseLong(custId));

					else
						accountCountPercentage = rs.getTypeOfAccountsCount(Integer.parseInt(custMonth),
								Integer.parseInt(custYear), Long.parseLong(custId));

					// accountCountPercentage=rs.getTypeOfAccountsCount(Integer.parseInt(custMonth),
					// Integer.parseInt(custYear),Long.parseLong(custId));

				} catch (NumberFormatException e) {

					e.printStackTrace();
				} catch (ClassNotFoundException e) {

					e.printStackTrace();
				} catch (SQLException e) {

					e.printStackTrace();
				}

			} else if (j == 2) {
				// String custMonth=request.getParameter("month");
				// String custYear=request.getParameter("year");
				month = request.getParameter("month");
				year = request.getParameter("year");
				String currentMonth = getMonth(Integer.parseInt(month));
				session.setAttribute("month", month);
				session.setAttribute("currentMonth", currentMonth);
				session.setAttribute("year", year);

				try {

					accountCountPercentage = rs.getTypeOfAccountsCount(Integer.parseInt(month), Integer.parseInt(year),
							null);
				} catch (NumberFormatException e) {

					e.printStackTrace();
				} catch (ClassNotFoundException e) {

					e.printStackTrace();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}

			else if (j == 3) {

				// String custYear=request.getParameter("year1");
				year1 = request.getParameter("year1");

				session.setAttribute("year1", year1);
				try {

					accountCountPercentage = rs.getTypeOfAccountsCount(Integer.parseInt(year1), null);
					for (int i = 0; i < accountCountPercentage.size(); i++) {
						System.out.println("values are " + accountCountPercentage.get(i));
					}
				} catch (NumberFormatException e) {

					e.printStackTrace();
				} catch (ClassNotFoundException e) {

					e.printStackTrace();
				} catch (SQLException e) {

					e.printStackTrace();
				}

			} else if (j == 9) {
				Date date = new Date();
				SimpleDateFormat sd = new SimpleDateFormat("dd-MMM-yyyy");
				String todayDate = sd.format(date);
				session.setAttribute("todayDate", todayDate);
				try {
					accountCountPercentage = rs.getTypeOfAccountsCount();

				} catch (NumberFormatException e) {

					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			session.setAttribute("accountCountPercentage", accountCountPercentage);

			if (option.equalsIgnoreCase("pie")) {

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/ShowPie.jsp");

				rd.forward(request, response);
			} else if (option.equalsIgnoreCase("bar")) {

				RequestDispatcher rd = request.getRequestDispatcher("/jsp/ShowBar.jsp");

				rd.forward(request, response);

			}

		}
		if (action.equals("viewPieChart")) {

			HttpSession session1;
			session1 = request.getSession();
			accountCountPercentage = (ArrayList<Long>) session1.getAttribute("accountCountPercentage");
			// response.setHeader("Content-Disposition"," attachment;
			// filename=\"example.pdf\"");

			DefaultPieDataset dataset = new DefaultPieDataset();

			// dataset.setValue("Total accounts", accountCountPercentage.get(0));
			/*
			 * dataset.setValue("Saving Accounts", accountCountPercentage.get(1));
			 * dataset.setValue("Current Accounts", accountCountPercentage.get(2));
			 */
			if (accountCountPercentage.get(3) != 0)
				dataset.setValue("Active Current Accounts", accountCountPercentage.get(3));
			if (accountCountPercentage.get(4) != 0)
				dataset.setValue("Inactive Current Accounts", accountCountPercentage.get(4));
			if (accountCountPercentage.get(5) != 0)
				dataset.setValue("Inprogress Current Accounts", accountCountPercentage.get(5));
			if (accountCountPercentage.get(6) != 0)
				dataset.setValue("Active Savings Accounts", accountCountPercentage.get(6));
			if (accountCountPercentage.get(7) != 0)
				dataset.setValue("Inactive Savings Accounts", accountCountPercentage.get(7));
			if (accountCountPercentage.get(8) != 0)
				dataset.setValue("Inprogress 'Savings Accounts'", accountCountPercentage.get(8));

			if (dataset.getItemCount() != 0) {

				JFreeChart chart = ChartFactory.createPieChart("", dataset, true, true, false);

				PiePlot plot = (PiePlot) chart.getPlot();
				PieSectionLabelGenerator generator = new StandardPieSectionLabelGenerator("{0} = {2}",
						new DecimalFormat("0"), new DecimalFormat("0.00%"));
				plot.setLabelGenerator(generator);
				final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
				// final File file1 = new File("C:/Documents and
				// Settings/585280/workspace/CommercialAccountOpening/WebContent/Chart/piechart.png");
				/*
				 * ChartUtilities.saveChartAsPNG( file1, chart, 800, 500, info);
				 */
				OutputStream out1 = response.getOutputStream();

				response.setContentType("image/png");
				ChartUtilities.writeChartAsPNG(out1, chart, 800, 500, info);
				out1.close();
			}
		}

		if (action.equals("viewBarChart")) {
			System.out.println("in view Bar chart action part==");
			HttpSession session2;
			session2 = request.getSession();
			accountCountPercentage = (ArrayList<Long>) session2.getAttribute("accountCountPercentage");
			// response.setHeader("Content-Disposition"," attachment;
			// filename=\"example.pdf\"");
			System.out.println("value of percentage 1st object ==" + accountCountPercentage.get(0));
			DefaultCategoryDataset dataset = new DefaultCategoryDataset();

			// dataset.setValue("Total accounts", accountCountPercentage.get(0));
			/*
			 * dataset.setValue("Saving Accounts", accountCountPercentage.get(1));
			 * dataset.setValue("Current Accounts", accountCountPercentage.get(2));
			 */
			if (accountCountPercentage.get(3) != 0)
				dataset.addValue(accountCountPercentage.get(3), "Accounts Category", "Active Current Accounts");
			if (accountCountPercentage.get(4) != 0)
				dataset.addValue(accountCountPercentage.get(4), "Accounts Category", "Inactive Current Accounts");
			if (accountCountPercentage.get(5) != 0)
				dataset.addValue(accountCountPercentage.get(5), "Accounts Category", "Inprogress Current Accounts");
			if (accountCountPercentage.get(6) != 0)
				dataset.addValue(accountCountPercentage.get(6), "Accounts Category", "Active Savings Accounts");
			if (accountCountPercentage.get(7) != 0)
				dataset.addValue(accountCountPercentage.get(7), "Accounts Category", "Inctive Savings Accounts");
			if (accountCountPercentage.get(8) != 0)
				dataset.addValue(accountCountPercentage.get(8), "Accounts Category", "Inprogress Savings Accounts");
			if (dataset.getColumnCount() != 0) {
				JFreeChart chart = ChartFactory.createBarChart3D("Account distribution(in numbers)", "",
						"Number of Accounts", dataset, PlotOrientation.HORIZONTAL, true, true, false);

				chart.setBackgroundPaint(Color.white);

				// Set the background colour of the chart

				chart.getTitle().setPaint(Color.black);

				// Adjust the colour of the title

				CategoryPlot plot = chart.getCategoryPlot();

				// Get the Plot object for a bar graph

				plot.setBackgroundPaint(Color.white);
				plot.setRangeGridlinePaint(Color.darkGray);

				CategoryItemRenderer renderer = plot.getRenderer();

				Color cl = new Color(0, 138, 138);
				renderer.setSeriesPaint(0, cl);

				renderer.setSeriesPaint(1, Color.green);
				final NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
				rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
				// CategoryAxis domainAxis = plot.getDomainAxis();
				// domainAxis.setCategoryLabelPositions(
				// CategoryLabelPositions.createUpRotationLabelPositions(Math.PI /
				// 2));

				try {
					final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
					/*
					 * final File file1 = new File(
					 * "C:/Documents and Settings/589768/Desktop/barchart.png");
					 */
					response.setContentType("image/png");
					OutputStream out1 = response.getOutputStream();
					ChartUtilities.writeChartAsPNG(out1, chart, 800, 350, info);
					// ChartUtilities.saveChartAsPNG(file1, chart, 800, 500, info);
				} catch (Exception e) {
					System.out.println(e);
				}

			}
		} // end of checking the null in dataset

		if (action.equals("goToChartPage")) {
			HttpSession session;
			session = request.getSession();
			ReportService rs1 = new ReportService();
			ArrayList<BusinessCustomer> blist = new ArrayList<BusinessCustomer>();

			blist = rs1.getBusinessDetails();

			session.setAttribute("blist", blist);

			RequestDispatcher rd = request.getRequestDispatcher("/jsp/Chart.jsp");

			rd.forward(request, response);
		}

		if (action.equals("goToPdfReportPage")) {
			HttpSession session;
			session = request.getSession();
			ReportService rs1 = new ReportService();
			ArrayList<BusinessCustomer> blist = new ArrayList<BusinessCustomer>();

			blist = rs1.getBusinessDetails();

			session.setAttribute("blist", blist);

			RequestDispatcher rd = request.getRequestDispatcher("/jsp/Report.jsp");

			rd.forward(request, response);
		}

		if (action.equals("accountReport")) {
			int j = Integer.parseInt(request.getParameter("radId").toString());
			System.out.println("hey rad id is " + j);
			String custMonth;
			String custYear;
			String month;
			String year;
			String year1;
			String custId;
			;

			if (j == 1) {
				// String custId=request.getParameter("CustId");
				// String custMonth=request.getParameter("custMonth");
				// String custYear=request.getParameter("custYear");

				ReportService rs = new ReportService();
				custId = request.getParameter("CustId");
				custMonth = request.getParameter("custMonth");
				custYear = request.getParameter("custYear");
				ReportService rs2 = new ReportService();

				ReportService rs1 = new ReportService();
				heading = new String[3];

				BusinessCustomer bcust = rs1.getBusinessDetails(Long.parseLong(custId));

				heading[0] = "\nCustomer Name: " + bcust.getBusinessName() + "(ID:" + bcust.getId() + ")";
				heading[1] = "Month : " + getMonth(Integer.parseInt(custMonth));
				heading[2] = "Year : " + custYear;

				try {
					values = rs.getTypeOfAccountsCount(Integer.parseInt(custMonth), Integer.parseInt(custYear),
							Long.parseLong(custId));

				} catch (NumberFormatException e) {

					e.printStackTrace();
				} catch (ClassNotFoundException e) {

					e.printStackTrace();
				} catch (SQLException e) {

					e.printStackTrace();
				}

			} else if (j == 2) {
				month = request.getParameter("month");
				year = request.getParameter("year");
				// String custMonth=request.getParameter("month");
				// String custYear=request.getParameter("year");
				heading = new String[2];
				heading[0] = "\nMonth : " + getMonth(Integer.parseInt(month));

				heading[1] = "Year : " + year;

				try {

					values = rs.getTypeOfAccountsCount(Integer.parseInt(month), Integer.parseInt(year), null);
				} catch (NumberFormatException e) {

					e.printStackTrace();
				} catch (ClassNotFoundException e) {

					e.printStackTrace();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}

			else if (j == 3) {
				year1 = request.getParameter("year1");
				// String custYear=request.getParameter("year1");

				heading = new String[1];
				heading[0] = "\nYear : " + year1;
				System.out.println(year1);
				try {

					values = rs.getTypeOfAccountsCount(Integer.parseInt(year1), null);

				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			response.setHeader("Cache-Control", "private, max-age=15");
			response.setHeader("Pragma", "");

			response.setContentType("application/pdf");
			response.setHeader("Content-Disposition", " attachment; filename=\"report.pdf\"");

			try {
				Document document = new Document();

				// document.add("Nexus Banking Group");

				// step 2
				PdfWriter.getInstance(document, response.getOutputStream());

				// step 3
				document.open();
				// step 4

				Font fontbold = FontFactory.getFont("Arial", 35, Font.BOLD);

				Paragraph paragraph = new Paragraph("Nexus Banking Group ", fontbold);

				paragraph.setAlignment(Element.ALIGN_CENTER);

				// document.add(new Paragraph("Times-Roman, Bold", fontbold));

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

				paragraph = new Paragraph("Cumulative Status of all Current and Savings Account", fontbold);

				paragraph.setAlignment(Element.ALIGN_CENTER);

				document.add(paragraph);
				if (j == 1) {

					Date d = new Date();
					paragraph = new Paragraph("till Date : " + d.getDate() + "-" + getMonth(d.getMonth() + 1) + "-"
							+ (1900 + d.getYear()), fontbold);
					paragraph.setAlignment(Element.ALIGN_CENTER);
					document.add(paragraph);
				}

				for (int i = 0; i < heading.length; i++) {
					fontbold = FontFactory.getFont("Arial", 20, Font.BOLD);
					paragraph = new Paragraph(heading[i], fontbold);

					paragraph.setAlignment(Element.ALIGN_CENTER);
					document.add(paragraph);
				}

				document.add(new Paragraph("\n\n"));

				PdfPTable table;

				table = createTable();

				document.add(table);

				fontbold = FontFactory.getFont("Arial", 18, Font.BOLD);
				paragraph = new Paragraph("\nReport Generated On : " + new Date());
				paragraph.setAlignment(Element.ALIGN_LEFT);
				document.add(paragraph);

				// step 5
				document.close();
				System.out.println("report generated successfully ");
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		if (action.equals("ClosePie")) {
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/Chart.jsp");

			rd.forward(request, response);
		}

		if (action.equals("customerReport")) {

		}

	}

	public static ArrayList<Double> calculatePercentage(ArrayList<Long> accountCount) {

		ArrayList<Double> accountCountPercentage = new ArrayList<Double>();
		Long[] accountArray;

		accountArray = new Long[accountCount.size() + 1];

		int i = 0;
		for (long l : accountCount) {
			// System.out.println("value of colum are "+l);
			accountArray[i] = l;
			i++;
		}
		for (int j = 0; j < i; j++) {
			double temp = 0;
			temp = (Double.parseDouble("" + accountArray[j]) / Double.parseDouble("" + accountArray[0])) * 100;
			accountCountPercentage.add(temp);
		}
		return accountCountPercentage;

	}

	public static PdfPTable createTable() throws DocumentException, ClassNotFoundException, SQLException {
		PdfPTable table = new PdfPTable(4);
		table.setWidthPercentage(95);
		table.setWidths(new int[] { 2, 1, 1, 1 });
		PdfPCell cell;

		ArrayList<Double> percentage = new ArrayList<Double>();

		// values=rs.getTypeOfAccountsCount(Long BusId);
		// values=rs.getTypeOfAccountsCount(String Month,int year);
		// values=rs.getTypeOfAccountsCount(int year);

		// values=rs.getTypeOfAccountsCount();

		// values=rs.getTypeOfAccountsCount();

		percentage = calculatePercentage(values);

		for (int i = 0; i < values.size(); i++) {
			System.out.println("value : " + values.get(i));

			if (values.get(i) != 0)
				percentage.set(i, Double.parseDouble(new DecimalFormat("#.##").format(percentage.get(i))));
			else
				percentage.set(i, 0.0);

		}

		// row1
		cell = new PdfPCell(new Phrase("Total no of accounts"));
		cell.setColspan(3);
		table.addCell(cell);

		cell = new PdfPCell(new Phrase("" + values.get(0)));
		// cell.setColspan(3);
		table.addCell(cell);

		// row2
		cell = new PdfPCell(new Phrase("Current accounts"));
		cell.setRowspan(3);
		table.addCell(cell);

		table.addCell("Active");// divide this into two rows and two columns
		table.addCell("" + values.get(3) + " (" + percentage.get(3) + "%)");

		cell = new PdfPCell(new Phrase("" + values.get(2) + " (" + percentage.get(2) + "%)"));
		cell.setRowspan(3);// last row total percentage of current account
		table.addCell(cell);

		table.addCell("Inprogress");// divide this into two rows and two columns
		table.addCell("" + values.get(5) + " (" + percentage.get(5) + "%)");

		table.addCell("Inactive");// divide this into two rows and two columns
		table.addCell("" + values.get(4) + " (" + percentage.get(4) + "%)");

		// row3
		cell = new PdfPCell(new Phrase("Savings accounts"));
		cell.setRowspan(3);
		table.addCell(cell);

		table.addCell("Active");// divide this into two rows and two columns
		table.addCell("" + values.get(6) + " (" + percentage.get(6) + "%)");

		cell = new PdfPCell(new Phrase("" + values.get(1) + " (" + percentage.get(1) + "%)"));
		cell.setRowspan(3);// last row total percentage of current account
		table.addCell(cell);

		table.addCell("Inprogress");// divide this into two rows and two columns
		table.addCell("" + values.get(8) + " (" + percentage.get(8) + "%)");

		table.addCell("Inactive");// divide this into two rows and two columns
		table.addCell("" + values.get(7) + " (" + percentage.get(7) + "%)");

		return table;

	}

	/**
	 * Creates a table; widths are set with setWidths().
	 * 
	 * @return a PdfPTable
	 * @throws DocumentException
	 */

}
