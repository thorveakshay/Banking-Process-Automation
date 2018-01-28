/**
 * 
 */
package com.training.services;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
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
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.training.controllers.LoginServlet;
import com.training.dao.BusinessCustRegDAOImpl;
import com.training.exception.BusinessCustRegException;
import com.training.model.NonPersonalCustomer;
import com.training.model.ReportData;
import com.training.model.ReportHelpdeskData;

/**
 *  
 *
 */
public class CustomerManagementService {
	private static Logger logger = Logger.getLogger(LoginServlet.class);
	BusinessCustRegDAOImpl businessCustRegDaoImpl;
	List<NonPersonalCustomer> customerList = new ArrayList<NonPersonalCustomer>();
	boolean flag;

	public List<NonPersonalCustomer> getCustomerList() {
		return customerList;
	}

	public void setCustomerList(List<NonPersonalCustomer> customerList) {
		this.customerList = customerList;
	}

	public boolean updateAllDetails(NonPersonalCustomer nonPersonalCustomer) throws BusinessCustRegException {
		businessCustRegDaoImpl = new BusinessCustRegDAOImpl();
		logger.info("reaching in service--check for update");
		logger.info("service " + nonPersonalCustomer.getNonPersonalCustomerID());
		flag = businessCustRegDaoImpl.updateBusinessCustomer(nonPersonalCustomer);
		return flag;
	}

	public boolean registerAllDetails(NonPersonalCustomer nonPersonalCustomer) throws BusinessCustRegException {
		businessCustRegDaoImpl = new BusinessCustRegDAOImpl();
		flag = businessCustRegDaoImpl.registerAllDetails(nonPersonalCustomer);
		return flag;
	}

	public List<NonPersonalCustomer> searchBusinessCustomer(String parameter1, String parameter2, String actionname)
			throws BusinessCustRegException {
		businessCustRegDaoImpl = new BusinessCustRegDAOImpl();
		customerList = businessCustRegDaoImpl.searchBusinessCustomer(parameter1, parameter2, actionname);
		return customerList;
	}

	public boolean deleteBusinessCustomer(long id) throws BusinessCustRegException {
		businessCustRegDaoImpl = new BusinessCustRegDAOImpl();
		flag = businessCustRegDaoImpl.deleteBusinessCustomer(id);
		return flag;
	}

	public NonPersonalCustomer viewBusinessCustomer(long npcId) throws BusinessCustRegException {
		NonPersonalCustomer npc = new NonPersonalCustomer();
		businessCustRegDaoImpl = new BusinessCustRegDAOImpl();
		npc = businessCustRegDaoImpl.viewBusinessCustomer(npcId);
		logger.info("service date" + npc.getDateEstablished());
		return npc;
	}

	public List<String> getBranch() throws BusinessCustRegException {
		List<String> branchName = new ArrayList<String>();
		businessCustRegDaoImpl = new BusinessCustRegDAOImpl();
		branchName = businessCustRegDaoImpl.getBranch();
		return branchName;
	}

	public List<ReportData> generateReport() throws BusinessCustRegException {
		businessCustRegDaoImpl = new BusinessCustRegDAOImpl();
		logger.info("Generating report");
		return (businessCustRegDaoImpl.report());
	}

	public List<ReportData> generateReportByYear(String year) throws BusinessCustRegException {
		businessCustRegDaoImpl = new BusinessCustRegDAOImpl();
		logger.info("Generating report");
		return (businessCustRegDaoImpl.reportByYear(year));
	}

	public List<ReportData> generateReportByMonth(String month) throws BusinessCustRegException {
		businessCustRegDaoImpl = new BusinessCustRegDAOImpl();
		logger.info("Generating report");
		return (businessCustRegDaoImpl.reportByMonth(month));
	}

	public List<ReportData> generateReportByMonthYear(String month, String year) throws BusinessCustRegException {
		businessCustRegDaoImpl = new BusinessCustRegDAOImpl();
		logger.info("Generating report");
		return (businessCustRegDaoImpl.reportByMonthYear(month, year));
	}

	public void generatePieChart(String type, int locations, ArrayList<ReportData> reportData, String heading,
			HttpServletResponse response) throws BusinessCustRegException {
		DefaultPieDataset pieDataset = new DefaultPieDataset();
		double percentCount = 0.0;
		BusinessCustRegDAOImpl businessCustRegDaoImpl = new BusinessCustRegDAOImpl();
		int totalCust = businessCustRegDaoImpl.getTotalCust();
		for (ReportData data : reportData) {
			pieDataset.setValue(data.getCountry(), data.getCount());
		}
		JFreeChart chart = null;
		if (pieDataset.getItemCount() != 0) {
			if (type.equalsIgnoreCase("Pie Chart")) {
				chart = ChartFactory.createPieChart(heading, pieDataset, true, true, true);

				// In above line, all the trues are for legend,tooltips,url/locale respectively.
				PiePlot plot = (PiePlot) chart.getPlot();
				PieSectionLabelGenerator generator = new StandardPieSectionLabelGenerator("{0} = {2}",
						new DecimalFormat("0"), new DecimalFormat("0.00%"));
				plot.setLabelGenerator(generator);
			} else {
				DefaultCategoryDataset dataSet = new DefaultCategoryDataset();
				int total = 0;
				for (ReportData data : reportData) {
					total = total + data.getCount();
				}
				for (ReportData data : reportData) {
					percentCount = calculatePercent(data.getCount(), total);
					dataSet.setValue(percentCount, data.getCountry(), data.getCountry());
				}
				chart = ChartFactory.createBarChart(heading, "Countries of Registration", "No. of Business Customers",
						dataSet, PlotOrientation.VERTICAL, true, true, true);

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

			} // end of else
		} // end of piedataset if
		try {

			ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
			OutputStream outs = response.getOutputStream();
			if (reportData == null) {
				response.setContentType("text/html");
				info = new ChartRenderingInfo(new StandardEntityCollection());
				// ChartUtilities.writeChartAsPNG(outs, chart, 800, 500,info);

			} else {
				response.setContentType("image/png");
				ChartUtilities.writeChartAsPNG(outs, chart, 800, 500, info);
			}
			outs.close();
		} catch (IOException e) {
			e.printStackTrace();
			throw new BusinessCustRegException("Error has occurred while generating the report");
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessCustRegException("Error has occurred while generating the report");
		}
	}

	public static PdfPTable tableHeader() throws BusinessCustRegException {
		System.out.println("in table");
		PdfPTable table = new PdfPTable(2);
		PdfPCell cell;
		table.setWidthPercentage(95);
		try {
			table.setWidths(new int[] { 1, 1 });
			cell = new PdfPCell(new Phrase("Total no. of Customers in NBG"));
			BusinessCustRegDAOImpl businessCustRegDaoImpl = new BusinessCustRegDAOImpl();
			int totalCust = businessCustRegDaoImpl.getTotalCust();
			cell = new PdfPCell(new Phrase("" + totalCust));
		} catch (DocumentException e) {
			throw new BusinessCustRegException("Error has occurred while generating the report");
		}
		return table;
	}

	public static PdfPTable createTable(ArrayList<ReportData> reportData) throws BusinessCustRegException {
		PdfPTable table = new PdfPTable(2);
		// int no=1;
		PdfPCell cell;
		table.setWidthPercentage(95);
		try {
			table.setWidths(new int[] { 1, 1 });
			// row1,,
			cell = new PdfPCell(new Phrase("Total no. of Customers in NBG"));
			cell.setRowspan(2);
			table.addCell(cell);

			BusinessCustRegDAOImpl businessCustRegDaoImpl = new BusinessCustRegDAOImpl();
			int totalCust = businessCustRegDaoImpl.getTotalCust();

			cell = new PdfPCell(new Phrase("" + totalCust));
			cell.setRowspan(2);
			table.addCell(cell);

			// row2
			cell = new PdfPCell(new Phrase("Country"));
			table.addCell(cell);

			cell = new PdfPCell(new Phrase("Number of Business Customers in percentage"));
			table.addCell(cell);

			int total = 0;
			double percentCount = 0.0;
			// other rows
			for (ReportData data : reportData) {
				total = total + data.getCount();
			}
			for (ReportData data : reportData) {
				cell = new PdfPCell(new Phrase("" + data.getCountry()));
				table.addCell(cell);

				percentCount = calculatePercent(data.getCount(), total);

				cell = new PdfPCell(new Phrase("" + percentCount));
				table.addCell(cell);
			}

			cell = new PdfPCell();
			table.addCell(cell);
			cell = new PdfPCell();
			table.addCell(cell);

			cell = new PdfPCell(new Phrase("Total number of customers filtered by selected criterion"));
			cell.setRowspan(2);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase("" + total));
			cell.setRowspan(2);
			table.addCell(cell);

		} catch (DocumentException e) {
			throw new BusinessCustRegException("Error has occurred while generating the report");
		}
		return table;
	}

	public static Double calculatePercent(int count, int total) {
		double percent = (double) ((count * 100) / total);
		return percent;
	}

	public List<ReportHelpdeskData> generateHelpdeskReport(int month, int year) throws BusinessCustRegException {
		businessCustRegDaoImpl = new BusinessCustRegDAOImpl();
		logger.info("Generating report");
		return (businessCustRegDaoImpl.helpdeskReport(month, year));
	}

	public static PdfPTable createHelpdeskTable(ArrayList<ReportHelpdeskData> report) throws BusinessCustRegException {
		PdfPTable table = new PdfPTable(2);
		// int no=1;
		PdfPCell cell;
		table.setWidthPercentage(95);
		try {
			table.setWidths(new int[] { 1, 1 });
			// row1,,
			/*
			 * cell = new PdfPCell(new Phrase("Total no. tickets raised"));
			 * cell.setRowspan(2); table.addCell(cell);
			 * 
			 * BusinessCustRegDAOImpl businessCustRegDaoImpl=new BusinessCustRegDAOImpl();
			 * int totalCust=businessCustRegDaoImpl.getTotalCust();
			 * 
			 * cell = new PdfPCell(new Phrase(""+totalCust)); cell.setRowspan(2);
			 * table.addCell(cell);
			 */

			// row2
			cell = new PdfPCell(new Phrase("Ticket Category"));
			table.addCell(cell);

			cell = new PdfPCell(new Phrase("Number of tickets raised"));
			table.addCell(cell);

			int total = 0;
			double percentCount = 0.0;
			// other rows
			for (ReportHelpdeskData data : report) {
				cell = new PdfPCell(new Phrase("" + data.getTitle()));
				table.addCell(cell);

				// percentCount=calculatePercent(data.getCount(),totalCust);

				cell = new PdfPCell(new Phrase("" + data.getCount()));
				table.addCell(cell);
				total = total + data.getCount();
			}

			cell = new PdfPCell();
			table.addCell(cell);
			cell = new PdfPCell();
			table.addCell(cell);

			cell = new PdfPCell(new Phrase("Total no. of tickets raised"));
			cell.setRowspan(2);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase("" + total));
			cell.setRowspan(2);
			table.addCell(cell);

		} catch (DocumentException e) {
			throw new BusinessCustRegException("Error has occurred while generating the report");
		}
		return table;

	}
}
