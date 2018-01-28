package com.training.controllers;

//CAO+NBG
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.*;
import org.apache.log4j.Logger;

import com.training.exception.ProductManagementException;
import com.training.model.Product;
import com.training.model.ReadExcel;
import com.training.services.ProductManagement;

public class UploadServlet extends HttpServlet {
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	private boolean isMultipart;
	private String filePath;
	private int maxFileSize = 1000 * 1024;
	private int maxMemSize = 4 * 1024;
	private File file;

	public void init() {
		// Get the file location where it would be stored.
		filePath = getServletContext().getInitParameter("file-upload");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		// Check that we have a file upload request
		isMultipart = ServletFileUpload.isMultipartContent(request);
		response.setContentType("text/html");
		java.io.PrintWriter out = response.getWriter();
		if (!isMultipart) {
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet upload</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<p>No file uploaded</p>");
			out.println("</body>");
			out.println("</html>");
			return;
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// maximum size that will be stored in memory
		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		// maximum file size to be uploaded.
		upload.setSizeMax(maxFileSize);

		try {
			// Parse the request to get file items.
			List fileItems = upload.parseRequest(request);

			// Process the uploaded file items
			Iterator i = fileItems.iterator();

			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet upload</title>");
			out.println("</head>");
			out.println("<body>");
			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();
				if (!fi.isFormField()) {
					// Get the uploaded file parameters
					String fieldName = fi.getFieldName();
					String fileName = fi.getName();
					String contentType = fi.getContentType();
					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();

					// Write the file
					if (fileName.lastIndexOf("\\") >= 0) {
						file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\")));
					} else {
						file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\") + 1));
					}
					fi.write(file);
					String fileUrl = file.getAbsolutePath();
					ReadExcel re = new ReadExcel(fileUrl);
					ProductManagement pm = new ProductManagement();
					boolean flag = false;
					boolean flag1 = false;
					List<Product> pList;
					String errorMessage = null;
					boolean canUpload = false;
					try {
						pList = re.getProductList();
						HttpSession session;
						session = request.getSession();
						ProductManagement validate = new ProductManagement();

						for (Product p : pList) {
							canUpload = false;

							// if not in database then return true
							Integer temp = p.getProductId();
							String tempString = temp.toString();
							System.out.println("length of id in servlet ::" + tempString.length());
							if (tempString.length() == 4) {
								flag1 = validate.validateProductId(p.getProductId());
							} else {
								logger.info("product id format is incorrect");
								errorMessage = "Product Id " + p.getProductId()
										+ " :Please enter a four digit product Id";
								break;
							}

							if (flag1) {
								/*-----validating the content of product ID----*/

								/*--------------------------------------------*/
								System.out.println("product name ==" + p.getProductName());
								if (!((p.getProductName() == null) || p.getProductName().equals("")
										|| p.getProductName().length() == 0)) {
									String tmp = p.getProductName();
									// ^[a-zA-Z][0-9a-zA-Z\s,&']+$ "^[a-zA-Z0-9]*$" "(!(\\d))(\\w.*)"
									if (tmp.charAt(0) >= 48 && tmp.charAt(0) <= 57) {
										logger.info("\n  Name cannot starts with a digit");
										errorMessage = "Product Id " + p.getProductId()
												+ " :Name cannot starts with a digit";
										break;
									}
									if (!((tmp.charAt(0) >= 97 && tmp.charAt(0) <= 122)
											|| (tmp.charAt(0) >= 65 && tmp.charAt(0) <= 90))) {
										logger.info("\n Product name must start with an alphabet only");
										errorMessage = "Product Id " + p.getProductId()
												+ ":Product name must start with an alphabet only";
										break;
									}

									if (tmp.matches("^[a-zA-Z0-9',. -]*$")) {
										logger.info("\n Regex Matches");
									} else {
										logger.info("\n Regex not Matches");
										errorMessage = "Product Id " + p.getProductId()
												+ ":Only alphanumeric characters are allowed including some special characters";
										break;
									}

									if (!(p.getAccountType() == null || p.getAccountType().equals(""))) {

										if ((p.getAccountType().toLowerCase().equals("savings account"))
												|| (p.getAccountType().toLowerCase().equals("current account"))) {

										} else {
											logger.info("Account type is incorrect");
											errorMessage = "Product Id " + p.getProductId()
													+ ":Please enter correct Account Type";
											break;

										}
										if (!(p.getValidFrom() == null || p.getValidFrom().equals("")
												|| p.getValidFrom().length() == 0)) {
											/*--validating the date---*/

											SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yyyy");
											String inputStr = p.getValidFrom();

											// dd=(0?[1-9]|[12][0-9]|3[01])[-/]
											// mm=(0?[1-9]|1[012])[-/]
											// yyyy=(19[\\d]{2}|20[\\d]{2}|2100)$";
											String exp2 = "(0?[1-9]|[12][0-9]|3[01])[-/]?(0?[1-9]|1[012])[-/]?(19[\\d]{2}|20[\\d]{2}|2100)$";
											inputStr = inputStr.replaceAll("\\s", "");
											// String exp =
											// "^(0?[1-9]|1[012])[-/]?(0?[1-9]|[12][0-9]|3[01])[-/]?(19[\\d]{2}|20[\\d]{2}|2100)$";
											Pattern pattern = Pattern.compile(exp2, Pattern.CASE_INSENSITIVE);
											Matcher matcher = pattern.matcher(inputStr);
											if (matcher.matches()) {
												logger.info("Valid date entered");

											} else {
												logger.info("Invalid date entered");
												errorMessage = "Product Id " + p.getProductId()
														+ ":Please enter valid date in (dd/mm/yyyy) format";
												break;

											}

											/*-------------------------*/

											if (!(p.getStatus() == null || p.getStatus().equals(""))) {
												if (p.getStatus().equalsIgnoreCase("active")
														|| p.getStatus().equalsIgnoreCase("inactive")) {
													canUpload = true;
												} else {
													logger.info("Status is not appropriate");
													errorMessage = "Product Id " + p.getProductId()
															+ ":Please enter valid product status";
													break;
												}

											} // checking for account status
											else {
												logger.info("Invalid account status");
												errorMessage = "Product Id " + p.getProductId()
														+ ":Please enter Account status";
												break;

											}
										} // checking null for date
										else {
											logger.info("Invalid Validfrom date ");
											errorMessage = "Product Id " + p.getProductId()
													+ ":Please enter Validfrom Date";
											break;
										}

									} // checking for account type
									else

									{

										logger.info("Invalid account type");
										errorMessage = "Product Id " + p.getProductId() + ":Please enter Account Type";
										break;
									}

								} // checking for product name
								else {
									logger.info("Please enter product name");
									errorMessage = "Product Id " + p.getProductId() + ":Please enter Product name";
									break;

								}

							} else {
								logger.info("Please select a unique Product Id");
								errorMessage = "Product Id " + p.getProductId() + ":Please enter a unique Product Id";
								break;
							}
							// System.out.println("pro id is "+p.getProductId());

						} // checking for product Id exists in db or not
						if (pList == null) {
							logger.error("Unable to upload the document");
							request.setAttribute("error", " Unable to upload the document");
							RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
							rd.forward(request, response);
						} else {
							if (errorMessage != null) {
								request.setAttribute("error", errorMessage);
								RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
								rd.forward(request, response);
							}

							try {
								if (canUpload) {
									flag = pm.uploadProduct(pList);
								}
								if (flag == true) {
									logger.info("Document is uploaded successfully");
									request.setAttribute("success", "Document is uploaded successfully");
									RequestDispatcher rd = request.getRequestDispatcher("/jsp/SuccessProduct.jsp");
									rd.forward(request, response);
								}

							} catch (ProductManagementException e) {
								// TODO Auto-generated catch block
								logger.error(e.getMessage());

								logger.error(e.getMessage());
								request.setAttribute("error", e.getMessage());
								RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
								rd.forward(request, response);

							}
						}
					} catch (ProductManagementException e1) {
						logger.error(e1.getMessage());
						request.setAttribute("error", e1.getMessage());
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
						rd.forward(request, response);

					}

					// out.println("Uploaded Filename: " + fileName + "<br>");
				}
			}
			out.println("</body>");
			out.println("</html>");
		} catch (Exception ex) {
			logger.error(ex.getMessage());
			request.setAttribute("error", "Error Occured While Uploading file");
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
			rd.forward(request, response);
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		throw new ServletException("GET method used with " + getClass().getName() + ": POST method required.");
	}
}