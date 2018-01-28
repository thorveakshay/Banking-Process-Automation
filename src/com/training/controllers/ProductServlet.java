package com.training.controllers;

import static com.training.constants.CaoConstants.*;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import java.util.*;

import com.training.exception.ProductManagementException;
import com.training.model.*;
import com.training.services.ProductManagement;

/**
 * Servlet implementation class ProductServlet
 */
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(LoginServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductServlet() {
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
		ProductManagement pm = new ProductManagement();
		String action = request.getParameter(ACTION);

		HttpSession session = request.getSession(false);
		response.setHeader("Cache-Control", "no-cache"); // Forces caches to obtain a new copy of the page from the
															// origin server
		response.setHeader("Cache-Control", "no-store"); // Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); // Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0 backward compatibility

		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
			return;
		}

		// redirect to home page
		/*
		 * if (HOME.equals(action)) { response.sendRedirect(request.getContextPath() +
		 * "/jsp/ProductHome.jsp"); } //redirect to addproduct form with the list
		 * additional product and businesstype list else if(ABOUTUS.equals(action)) {
		 * response.sendRedirect(request.getContextPath() + "/jsp/About_Us.jsp"); }
		 */ if (ADDPRODUCT.equals(action)) {

			Product p = new Product();
			List<BusinessType> btList;
			try {
				btList = pm.viewBusinessType();
				p.setBusinessTypeList(btList);

			} catch (ProductManagementException e) {
				request.setAttribute("error", e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);

			}
			List<AdditionalProduct> apList;
			try {
				apList = pm.viewAdditionalProduct();
				p.setAdditionalProduct(apList);

			} catch (ProductManagementException e) {
				request.setAttribute("error", e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			}

			request.setAttribute("product", p);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/AddProduct.jsp");
			rd.forward(request, response);

		}
		// after submitting the details for adding product and processed to database
		else if (ADDPRODUCTDETAILS.equals(action)) {
			int productId = Integer.valueOf(request.getParameter("ProductId"));
			String productName = request.getParameter("ProductName");
			String productDesc = request.getParameter("ProductDescription");
			String accountType = request.getParameter("AccountType");
			String[] businessType = (String[]) request.getParameterValues("BusinessType");
			String status = request.getParameter("Status");
			String[] additionalProduct = (String[]) request.getParameterValues("AdditionalProduct");
			String validFrom = request.getParameter("bar");
			Product p = new Product();
			List<BusinessType> btList = new ArrayList<BusinessType>();
			if (btList != null)
				for (int i = 0; i < businessType.length; i++) {

					BusinessType bt = new BusinessType();
					bt.setBusinessName(businessType[i]);
					btList.add(bt);
				}

			List<AdditionalProduct> apList = new ArrayList<AdditionalProduct>();
			if (additionalProduct != null) // if the additional product is not available
				for (int i = 0; i < additionalProduct.length; i++) {
					AdditionalProduct ap = new AdditionalProduct();
					ap.setApId(Integer.valueOf(additionalProduct[i]));
					apList.add(ap);
				}
			p.setProductId(productId);
			p.setProductName(productName);
			p.setDescription(productDesc);
			p.setAccountType(accountType);

			p.setBusinessTypeList(btList);
			p.setAdditionalProduct(apList);
			p.setValidFrom(validFrom);

			p.setStatus(status);
			try {
				boolean flag = pm.addProduct(p);
				if (flag == true) {
					logger.info("Product is added successfully");
					request.setAttribute("product", p);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/ShowProductDetails.jsp");
					rd.forward(request, response);
				}

			} catch (ProductManagementException e) {

				logger.error("Error occured while adding a product");
				request.setAttribute("error", e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);

			}

		}
		// after the call come from upload product show that page
		else if (UPLOADPRODUCT.equals(action)) {
			response.sendRedirect(request.getContextPath() + "/jsp/UploadProduct.jsp");

		} else if (UPLOAD.equals(action)) {
			/*
			 * String fileUrl=request.getParameter("uploadfile"); ReadExcel re= new
			 * ReadExcel(fileUrl); boolean flag=false; List<Product> pList; try { pList =
			 * re.getProductList();
			 * 
			 * if(pList==null) { logger.error("Unable to upload the document");
			 * request.setAttribute("error"," Unable to upload the document");
			 * RequestDispatcher rd = request .getRequestDispatcher("/jsp/Error.jsp");
			 * rd.forward(request, response); } else{ try { flag=pm.uploadProduct(pList);
			 * if(flag==true) { logger.info("Document is uploaded successfully");
			 * request.setAttribute("success","Document is uploaded successfully");
			 * RequestDispatcher rd = request
			 * .getRequestDispatcher("/jsp/SuccessProduct.jsp"); rd.forward(request,
			 * response); }
			 * 
			 * } catch (ProductManagementException e) { // TODO Auto-generated catch block
			 * logger.error(e.getMessage());
			 * 
			 * logger.error(e.getMessage()); request.setAttribute("error", e.getMessage());
			 * RequestDispatcher rd = request .getRequestDispatcher("/jsp/Error.jsp");
			 * rd.forward(request, response);
			 * 
			 * } } } catch (ProductManagementException e1) { logger.error(e1.getMessage());
			 * request.setAttribute("error", e1.getMessage()); RequestDispatcher rd =
			 * request .getRequestDispatcher("/jsp/Error.jsp"); rd.forward(request,
			 * response);
			 * 
			 * }
			 * 
			 */

		}
		// getting the whole product list available in database
		else if (VIEWPRODUCT.equals(action)) {
			List<Product> pList = new ArrayList<Product>();

			try {
				pList = pm.viewProduct();

				if (pList.size() > 0) {
					logger.info("Displaying the list of products");
					request.setAttribute("product", pList);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewProduct.jsp");
					rd.forward(request, response);
				} else {
					logger.error("Error occured as the product does not exist");
					request.setAttribute("error", "Product does not exists");
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
					rd.forward(request, response);
				}

			} catch (ProductManagementException e) {
				logger.error("Error occured while displaying the products");

				request.setAttribute("error", e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			}

		}
		// after clicking the link of product then go to the delete update list page
		else if (DELETEORUPDATE.equals(action)) {

			String productId = request.getParameter("productId");

			List<BusinessType> totalbtList;

			List<AdditionalProduct> totalapList;

			// p.setProductId(Integer.valueOf(productId));
			Product p = new Product();

			try {
				p = pm.searchByProductId(Integer.valueOf(productId));

			} catch (ProductManagementException e1) {

				logger.error("Error occured while searching the product");
				request.setAttribute("error", e1.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);

			}

			try {
				totalbtList = pm.viewBusinessType();
				// p.setBusinessType(totalbtList);
				request.setAttribute("business", totalbtList);
			} catch (ProductManagementException e) {
				logger.error("Error occured while fetching the business type");

				request.setAttribute("error", e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			}

			try {
				totalapList = pm.viewAdditionalProduct();
				// p.setAdditionalProduct(totalapList);
				request.setAttribute("additional", totalapList);
			} catch (ProductManagementException e) {

				logger.error("Error occured while fetching the additional products list");

				request.setAttribute("error", e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			}

			request.setAttribute("product", p);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/DeleteOrUpdate.jsp");
			rd.forward(request, response);

		}
		// after the delete product is clicked
		else if (DELETE.equals(action)) {
			int pId = Integer.valueOf(request.getParameter("ProductId"));
			List<Product> pList = null;
			boolean flag = false;

			try {
				flag = pm.deleteProduct(pId);
				pList = pm.viewProduct();
			} catch (ProductManagementException e) {

				logger.error("Error occured while deleting the product");

				request.setAttribute("error", e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);
			}
			if (flag == true) {
				logger.info("The product is successfully deleted");
				request.setAttribute("product", pList);
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewProduct.jsp");
				rd.forward(request, response);

			}

		}
		// after the update product is clicked
		else if (UPDATE.equals(action)) {

			int productId = Integer.valueOf(request.getParameter("ProductId"));
			String productName = request.getParameter("ProductName");
			String productDesc = request.getParameter("ProductDescription");
			String accountType = request.getParameter("AccountType");
			String[] businessType = (String[]) request.getParameterValues("BusinessType");
			String status = request.getParameter("Status");
			String[] additionalProduct = (String[]) request.getParameterValues("AdditionalProduct");
			String validFrom = request.getParameter("bar");
			Product p = new Product();

			List<BusinessType> btList = new ArrayList<BusinessType>();
			if (btList != null)
				for (int i = 0; i < businessType.length; i++) {

					BusinessType bt = new BusinessType();
					bt.setBusinessName(businessType[i]);
					btList.add(bt);
				}

			List<AdditionalProduct> apList = new ArrayList<AdditionalProduct>();
			if (additionalProduct != null)
				for (int i = 0; i < additionalProduct.length; i++) {
					AdditionalProduct ap = new AdditionalProduct();
					ap.setApId(Integer.valueOf(additionalProduct[i]));
					apList.add(ap);
				}
			p.setProductId(productId);
			p.setProductName(productName);
			p.setDescription(productDesc);
			p.setAccountType(accountType);

			p.setBusinessTypeList(btList);
			p.setAdditionalProduct(apList);
			p.setValidFrom(validFrom);
			p.setStatus(status);
			try {
				boolean flag = pm.updateProduct(p);
				if (flag == true) {
					logger.info("The product is successfully updated");
					request.setAttribute("success", "Successfully Updated");
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/SuccessProduct.jsp");
					rd.forward(request, response);

				}

			} catch (ProductManagementException e) {
				logger.error("Error occured while updating the product");

				request.setAttribute("error", e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
				rd.forward(request, response);

			}

		}

	}

}
