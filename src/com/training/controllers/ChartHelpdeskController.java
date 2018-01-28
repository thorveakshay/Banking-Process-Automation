package com.training.controllers;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.chart.labels.PieSectionLabelGenerator;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.CategoryItemRenderer;
import org.jfree.data.jdbc.JDBCCategoryDataset;
import org.jfree.data.jdbc.JDBCPieDataset;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.training.exception.BusinessCustRegException;
import com.training.model.ReportHelpdeskData;
import com.training.services.CustomerManagementService;
import com.training.utils.ConnectionUtil;

/**
 * Servlet implementation class ChartHelpdeskController
 */
public class ChartHelpdeskController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChartHelpdeskController() {
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

		String action = request.getParameter("action");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		int totaltickets = 0;

		if (action.equals("piegenerate")) {

			try {

				Connection con = ConnectionUtil.getConnection();

				JDBCPieDataset dataset = new JDBCPieDataset(con);
				dataset.executeQuery(
						"SELECT TITLE,COUNT(TITLE) FROM HELPDESK_TICKET WHERE TO_CHAR(RAISED_ON_DATE,'MM')=" + month
								+ " AND TO_CHAR(RAISED_ON_DATE,'YYYY')=" + year + " GROUP BY TITLE");

				PreparedStatement ps = con
						.prepareStatement("SELECT COUNT(TITLE) FROM HELPDESK_TICKET WHERE TO_CHAR(RAISED_ON_DATE,'MM')="
								+ month + " AND TO_CHAR(RAISED_ON_DATE,'YYYY')=" + year + "GROUP BY TITLE");
				ResultSet rs = ps.executeQuery();

				if (rs.next())
					totaltickets = rs.getInt(1);

				ps = con.prepareStatement(
						"SELECT TO_CHAR(RAISED_ON_DATE,'Month') FROM HELPDESK_TICKET WHERE TO_CHAR(RAISED_ON_DATE,'MM')="
								+ month);
				rs = ps.executeQuery();

				if (rs.next())
					month = rs.getString(1);
				request.getSession().setAttribute("ticketmonth", month);

				if (dataset.getItemCount() != 0) {

					JFreeChart chart = ChartFactory.createPieChart3D("", dataset, true, true, false);

					PiePlot plot = (PiePlot) chart.getPlot();
					PieSectionLabelGenerator generator = new StandardPieSectionLabelGenerator("{0} = {2}",
							new DecimalFormat("0"), new DecimalFormat("0.00%"));
					plot.setLabelGenerator(generator);

					try {
						final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
						OutputStream out1 = response.getOutputStream();

						response.setContentType("image/png");
						ChartUtilities.writeChartAsPNG(out1, chart, 600, 400, info);
						out1.close();
					} catch (Exception e) {
						System.out.println(e);
					}
				}

			}

			catch (ClassNotFoundException e) {

				e.printStackTrace();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		}

		if (action.equals("bargenerate")) {
			Connection con;
			try {
				con = ConnectionUtil.getConnection();
				JDBCCategoryDataset dataset = new JDBCCategoryDataset(con);
				dataset.executeQuery(
						"SELECT TITLE,COUNT(TITLE) as TICKETS FROM HELPDESK_TICKET WHERE TO_CHAR(RAISED_ON_DATE,'MM')="
								+ month + " AND TO_CHAR(RAISED_ON_DATE,'YYYY')=" + year + " GROUP BY TITLE");
				PreparedStatement ps = con
						.prepareStatement("SELECT COUNT(TITLE) FROM HELPDESK_TICKET WHERE TO_CHAR(RAISED_ON_DATE,'MM')="
								+ month + " AND TO_CHAR(RAISED_ON_DATE,'YYYY')=" + year + "GROUP BY TITLE");
				ResultSet rs = ps.executeQuery();

				if (rs.next())
					totaltickets = rs.getInt(1);

				ps = con.prepareStatement(
						"SELECT TO_CHAR(RAISED_ON_DATE,'Month') FROM HELPDESK_TICKET WHERE TO_CHAR(RAISED_ON_DATE,'MM')="
								+ month);
				rs = ps.executeQuery();

				if (rs.next())
					month = rs.getString(1);
				request.getSession().setAttribute("ticketmonth", month);

				if (dataset.getRowCount() != 0) {
					JFreeChart chart = ChartFactory.createBarChart3D("", "Issues for raised tickets", "No of tickets",
							dataset, PlotOrientation.HORIZONTAL, true, true, false);
					chart.setBackgroundPaint(Color.white);

					// Set the background colour of the chart

					chart.getTitle().setPaint(Color.black);

					// Adjust the colour of the title

					CategoryPlot plot = chart.getCategoryPlot();

					// Get the Plot object for a bar graph

					plot.setBackgroundPaint(Color.white);
					plot.setRangeGridlinePaint(Color.blue);

					CategoryItemRenderer renderer = plot.getRenderer();

					renderer.setSeriesPaint(0, Color.blue);

					renderer.setSeriesPaint(1, Color.green);
					final NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
					rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
					// CategoryAxis domainAxis = plot.getDomainAxis();
					// domainAxis.setCategoryLabelPositions(
					// CategoryLabelPositions.createUpRotationLabelPositions(Math.PI
					// / 2));

					try {

						OutputStream out1 = response.getOutputStream();

						final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());

						response.setContentType("image/png");
						ChartUtilities.writeChartAsPNG(out1, chart, 600, 400, info);
						out1.close();

					} catch (Exception e) {
						System.out.println(e);
					}
				}

			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		if (action.equals("chart")) {

			if (request.getParameter("choice").equals("pdf")) {
				int iyear = Integer.parseInt(request.getParameter("year"));
				// String monthNo=(String)request.getAttribute("monthNo");
				int imonth = Integer.parseInt(request.getParameter("month"));

				String heading = null;
				List<ReportHelpdeskData> report = new ArrayList<ReportHelpdeskData>();
				CustomerManagementService cmservice = new CustomerManagementService();
				try {

					report = cmservice.generateHelpdeskReport(imonth, iyear);
					heading = "Number of Tickets raised";

				} catch (BusinessCustRegException e) {

					e.printStackTrace();
				}
				response.setContentType("application/pdf");
				response.setHeader("Content-Disposition", "attachment; filename=\"report.pdf\"");
				Document document = new Document();
				try {
					System.out.println("in try");
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
					paragraph = new Paragraph("on", fontbold);

					paragraph.setAlignment(Element.ALIGN_CENTER);
					document.add(paragraph);

					paragraph = new Paragraph(heading, fontbold);

					paragraph.setAlignment(Element.ALIGN_CENTER);

					document.add(paragraph);

					String ticketMonth = null;
					if (month.equals("1"))
						ticketMonth = "January";
					else if (month.equals("2"))
						ticketMonth = "February";
					else if (month.equals("3"))
						ticketMonth = "March";
					else if (month.equals("4"))
						ticketMonth = "April";
					else if (month.equals("5"))
						ticketMonth = "May";
					else if (month.equals("6"))
						ticketMonth = "June";
					else if (month.equals("7"))
						ticketMonth = "July";
					else if (month.equals("8"))
						ticketMonth = "August";
					else if (month.equals("9"))
						ticketMonth = "September";
					else if (month.equals("10"))
						ticketMonth = "October";
					else if (month.equals("11"))
						ticketMonth = "November";
					else if (month.equals("12"))
						ticketMonth = "December";

					paragraph = new Paragraph("in " + ticketMonth + " " + year, fontbold);
					paragraph.setAlignment(Element.ALIGN_CENTER);
					document.add(paragraph);

					document.add(new Paragraph("\n\n"));

					PdfPTable table = CustomerManagementService
							.createHelpdeskTable((ArrayList<ReportHelpdeskData>) report);

					document.add(table);

					fontbold = FontFactory.getFont("Arial", 18, Font.BOLD);
					paragraph = new Paragraph("\nReport Generated On : " + new Date());
					paragraph.setAlignment(Element.ALIGN_LEFT);
					document.add(paragraph);

					// step 5
					document.close();
					System.out.println("report generated successfully ");

					System.out.println("after try");
				} catch (BusinessCustRegException e) {
					request.setAttribute("msg", "An error has occurred while generating the report.");
					RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
					rd.forward(request, response);
				} catch (DocumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}

			if (request.getParameter("choice").equals("bar")) {
				request.setAttribute("month", month);
				request.setAttribute("year", year);
				request.setAttribute("total", totaltickets);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/jspbarchart.jsp");
				rd.forward(request, response);
			}

			if (request.getParameter("choice").equals("pie")) {
				request.setAttribute("month", month);
				request.setAttribute("year", year);
				request.setAttribute("total", totaltickets);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/jsppiechart.jsp");
				rd.forward(request, response);
			}
		}

	}

}
