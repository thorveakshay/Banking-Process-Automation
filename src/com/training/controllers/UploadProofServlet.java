package com.training.controllers;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

import com.training.exception.BusinessCustRegException;
import com.training.model.Contact;
import com.training.model.NonPersonalCustomer;
import com.training.model.Proof;
import com.training.services.CustomerManagementService;

/**
 * Servlet implementation class UploadProofServlet
 */
public class UploadProofServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadProofServlet() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// setting the file inputs
		boolean isMultipart;
		// non personal customer details
		NonPersonalCustomer nonPersonalCustomer = new NonPersonalCustomer();
		HttpSession session = request.getSession();
		nonPersonalCustomer = (NonPersonalCustomer) session.getAttribute("customer");
		int w_areaCode = 000;
		int w_countryCode = 000;
		long phone_no = 000000;
		int f_areaCode = 000;
		long fax_no = 000;
		int f_countryCode = 000;
		String emailId = null;
		String idProof = null;
		String addressProof = null;
		byte[] idProofDoc = null;
		byte[] addressProofDoc = null;
		String formSelect = null;

		// filePath="C:/Documents and
		// Settings/664488/workspace/NexusBankingGroup/src/com/tvm/ilp/t154/cao/uploaddocuments";
		isMultipart = ServletFileUpload.isMultipartContent(request);
		response.setContentType("text/html");

		if (!isMultipart) {
			return;
		}

		DiskFileItemFactory factory = new DiskFileItemFactory();

		ServletFileUpload upload = new ServletFileUpload(factory);

		try {
			// Parse the request to get file items.
			List fileItems = upload.parseRequest(request);

			// Process the uploaded file items
			Iterator i = fileItems.iterator();
			int fileCount = 0;
			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();

				if (!fi.isFormField()) {
					/*
					 * // Get the uploaded file parameters // String fieldName = fi.getFieldName();
					 * String fileName = fi.getName(); // String contentType = fi.getContentType();
					 * // logger.info(fi.getName()); // boolean isInMemory = fi.isInMemory(); //
					 * long sizeInBytes = fi.getSize(); // Write the file if(
					 * fileName.lastIndexOf("\\") >= 0 ){ file = new File( filePath +
					 * fileName.substring( fileName.lastIndexOf("\\"))) ; }else{ file = new File(
					 * filePath + fileName.substring(fileName.lastIndexOf("\\")+1)) ; }
					 * 
					 * fi.write( file ); if(fileCount==0) { idProofDoc=new File(fi.getName());
					 * fileCount++; logger.info("idProof"+file); } else { addressProofDoc=new
					 * File(fi.getName()); fileCount=0; logger.info("Address "+file); }
					 * 
					 * // logger.info(file.getAbsolutePath()); // logger.info("deleted"+filePath);
					 * 
					 * //Thread.sleep(4000); // file.delete();
					 * 
					 * 
					 * 
					 * 
					 */
					BufferedImage bf = ImageIO.read(fi.getInputStream());
					String name = fi.getFieldName();
					String contenttype = fi.getContentType();

					if (contenttype.equals("image/jpeg") || contenttype.equals("image/pjpeg")) {

						ByteArrayOutputStream bos = new ByteArrayOutputStream();
						ImageIO.write(bf, "jpeg", bos);
						byte[] image = bos.toByteArray();
						if (fileCount == 0) {
							idProofDoc = image;
							fileCount++;
							logger.info("idProof is uploading");
						} else {
							addressProofDoc = image;
							logger.info("Address Proof is uploading");

						}

					}

				} else {
					logger.info(fi.getFieldName() + "\t" + fi.getString());
					if ("sendUpdatedForm6".equals(fi.getString())) {
						formSelect = "sendUpdatedForm6";
					}
					if ("w_countryCode".equals(fi.getFieldName())) {
						w_countryCode = Integer.parseInt(fi.getString());
					} else if ("w_areaCode".equals(fi.getFieldName())) {
						w_areaCode = Integer.parseInt(fi.getString());
					} else if ("phone_no".equals(fi.getFieldName())) {
						phone_no = Long.parseLong(fi.getString());
					} else if ("f_countryCode".equals(fi.getFieldName())) {
						f_countryCode = Integer.parseInt(fi.getString());
					} else if ("f_areaCode".equals(fi.getFieldName())) {
						f_areaCode = Integer.parseInt(fi.getString());
					} else if ("fax_no".equals(fi.getFieldName())) {
						fax_no = Long.parseLong(fi.getString());
					} else if ("emailId".equals(fi.getFieldName())) {
						emailId = fi.getString();
					} else if ("idProof".equals(fi.getFieldName())) {
						idProof = fi.getString();
					} else if ("addProof".equals(fi.getFieldName())) {
						addressProof = fi.getString();
					}

				}

			}
			Contact contactW = new Contact();
			contactW.setAreaCode(w_areaCode);
			contactW.setCountryCode(w_countryCode);
			contactW.setContactNumber(phone_no);
			contactW.setContactType("Work");
			Contact contactF = new Contact();
			contactF.setAreaCode(f_areaCode);
			contactF.setCountryCode(f_countryCode);
			contactF.setContactNumber(fax_no);
			contactF.setContactType("Fax");
			// String details;
			// nonPersonalCustomer.setAdditionalDetails(details);
			nonPersonalCustomer.setEmailId(emailId);
			Proof proofId = new Proof();
			proofId.setDocument(idProof);
			proofId.setDocumentType("ID");
			proofId.setDocumentProof(idProofDoc);
			Proof proofAdd = new Proof();

			proofAdd.setDocument(addressProof);
			proofAdd.setDocumentType("Address");
			proofAdd.setDocumentProof(addressProofDoc);
			nonPersonalCustomer.addContact(contactF);
			nonPersonalCustomer.addContact(contactW);

			nonPersonalCustomer.addProof(proofId);
			nonPersonalCustomer.addProof(proofAdd);

			if ("sendUpdatedForm6".equals(formSelect)) {
				session = request.getSession();
				session.setAttribute("cust", nonPersonalCustomer);
				RequestDispatcher rd = request.getRequestDispatcher("/CustomerManagementServlet?action=updateconfirm");
				rd.forward(request, response);
			} else {
				try {
					CustomerManagementService cmservice = new CustomerManagementService();
					cmservice.registerAllDetails(nonPersonalCustomer);
					session = request.getSession();
					session.setAttribute("cust", nonPersonalCustomer);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/BusinessCustAddSuccess.jsp");
					rd.forward(request, response);
				} catch (BusinessCustRegException e) {
					request.setAttribute("msg", "An error has occurred.");
					RequestDispatcher rd = request.getRequestDispatcher("jsp/Error.jsp");
					rd.forward(request, response);
				}
			}
		} catch (Exception ex) {
			logger.info(ex);
		}
	}

}
