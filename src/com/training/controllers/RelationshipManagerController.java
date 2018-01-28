package com.training.controllers;

import static com.training.constants.CaoConstants.*;

import java.io.IOException;
import java.net.URL;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.apache.log4j.Logger;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.sun.xml.internal.ws.resources.HttpserverMessages;
import com.training.dao.AssignRelationshipManagerDao;
import com.training.exception.AccountCreationException;
import com.training.exception.AssignRelationshipManagerException;
import com.training.model.Account;
import com.training.model.Branch;
import com.training.model.BusinessCustomer;
import com.training.model.CustomerAddress;
import com.training.model.RelationshipManager;
import com.training.services.AccountCreationService;
import com.training.services.AssignRelationshipManagerService;
import com.training.services.WelcomeLetterService;

//NBG Project
/**
 * Servlet implementation class RelationshipManagerController
 */
public class RelationshipManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(LoginServlet.class);
	static String rmname = null;
	static ArrayList<Branch> brlist = new ArrayList<Branch>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */

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

		AssignRelationshipManagerService armservice = new AssignRelationshipManagerService();
		WelcomeLetterService letterservice = new WelcomeLetterService();

		List<Account> accountsList = null;

		String action = request.getParameter(ACTION);

		BusinessCustomer bcust = (BusinessCustomer) request.getSession().getAttribute("bcust");
		accountsList = (ArrayList<Account>) request.getSession().getAttribute("accountsList");

		int bcustid = 0;
		int relmgrid = 0;
		String relmgrname = null;

		try {
			if (null != bcust || null != accountsList) {
				bcustid = bcust.getId();

				request.getSession().setAttribute("rmid", relmgrid);

				if (action.equals("pdf")) {
					HttpSession session;
					session = request.getSession();

					String bname = (String) session.getAttribute("custname");

					ArrayList<Account> accno;
					accno = (ArrayList<Account>) session.getAttribute("accno");

					String relmgr = (String) session.getAttribute("relmgr");

					int id = Integer.parseInt(session.getAttribute("id").toString());

					CustomerAddress custaddr = (CustomerAddress) session.getAttribute("custaddr");

					response.setContentType("application/pdf");
					response.setHeader("Content-Disposition", " attachment; filename=\"Welcome Letter.pdf\"");

					try {
						Document document = new Document();
						PdfWriter.getInstance(document, response.getOutputStream());
						document.open();

						Font fontbold = FontFactory.getFont("Arial", 13, Font.BOLD);

						Paragraph paragraph = new Paragraph("Mr.Vishal Tiwari", fontbold);
						paragraph.setAlignment(Element.ALIGN_LEFT);
						document.add(paragraph);
						fontbold = FontFactory.getFont("Arial", 13, Font.NORMAL);

						paragraph = new Paragraph(
								"Account Manager,\nNexus Banking Group,\n1 Basinghall Avenue,\nLondon, EC2V 5DD.",
								fontbold);
						paragraph.setAlignment(Element.ALIGN_LEFT);

						document.add(paragraph);
						fontbold = FontFactory.getFont("Arial", 13, Font.BOLD);

						String str = "\nDear " + bname + ",";
						paragraph = new Paragraph(str, fontbold);
						paragraph.setAlignment(Element.ALIGN_LEFT);
						document.add(paragraph);
						fontbold = FontFactory.getFont("Arial", 13, Font.NORMAL);

						str = custaddr.getBuildingNo() + ",\n" + custaddr.getStreetName() + ",\n"
								+ custaddr.getCityName() + ",\n" + custaddr.getCountry() + ".";

						paragraph = new Paragraph(str, fontbold);
						paragraph.setAlignment(Element.ALIGN_LEFT);
						document.add(paragraph);

						str = "Thank you for choosing Nexus Banking Group as your Commercial account opening partner. We are confident that you will be very satisfied with the banking services that we offer. The information enclosed will help you to make use of our banking services.";

						paragraph = new Paragraph(str, fontbold);
						paragraph.setAlignment(Element.ALIGN_JUSTIFIED);
						document.add(paragraph);

						fontbold = FontFactory.getFont("Arial", 13, Font.BOLD);

						str = "     Please call  " + relmgr + " your Relationship Manager,for any further query.";
						paragraph = new Paragraph(str, fontbold);
						paragraph.setAlignment(Element.ALIGN_JUSTIFIED);
						document.add(paragraph);

						paragraph = new Paragraph("\nYour Account Details\n\n", fontbold);
						paragraph.setAlignment(Element.ALIGN_CENTER);
						document.add(paragraph);

						PdfPTable table = new PdfPTable(3);
						table.setWidthPercentage(90);
						PdfPCell cell;

						cell = new PdfPCell(new Phrase("Account Number"));
						table.addCell(cell);

						cell = new PdfPCell(new Phrase("Product Intension"));
						table.addCell(cell);

						cell = new PdfPCell(new Phrase("Product Name"));
						table.addCell(cell);

						for (Account acc : accno) {
							cell = new PdfPCell(new Phrase("" + acc.getAccNumber()));
							table.addCell(cell);

							cell = new PdfPCell(new Phrase(acc.getProductIntension()));
							table.addCell(cell);

							cell = new PdfPCell(new Phrase(acc.getProductName()));
							table.addCell(cell);

						}

						document.add(table);

						fontbold = FontFactory.getFont("Arial", 13, Font.NORMAL);

						str = "\n     When you call,please have it in hand so that we can accelerate your requests. As your banking needs change, we will be pleased to help you assess those needs and offer you the banking services that will help you to achieve your new goals.";
						paragraph = new Paragraph(str, fontbold);
						paragraph.setAlignment(Element.ALIGN_JUSTIFIED);
						document.add(paragraph);

						str = "Your Relationship Manager can be reached during regular business hours in the following way:\nPhone: +44 (0)20 7885 8888\nWebsite:http://www.nbg.com\nEmail:nbgcontact@nbg.com";
						paragraph = new Paragraph(str, fontbold);
						paragraph.setAlignment(Element.ALIGN_JUSTIFIED);
						document.add(paragraph);

						str = "     Once again, welcome to NBG and thank you for opening an account.";

						paragraph = new Paragraph(str, fontbold);
						paragraph.setAlignment(Element.ALIGN_JUSTIFIED);
						document.add(paragraph);

						str = "\n\nSincerely,\nVishal Tiwari,\nAccount Manager.";

						paragraph = new Paragraph(str, fontbold);
						paragraph.setAlignment(Element.ALIGN_JUSTIFIED);
						document.add(paragraph);

						String host = request.getRemoteHost();
						String name = request.getContextPath();

						System.out.println("link is :http://" + host + ":8080/" + name + "/images/signature.png");
						Image image = Image
								.getInstance(new URL("http://" + host + ":8080/" + name + "/images/signature.png"));
						image.setRotationDegrees(45f);
						image.setWidthPercentage(30);

						document.add(image);

						document.close();
						System.out.println("welcome letter generated successfully ");
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if (CONFIRMDETAILS.equals(action)) {
					// set relationship manager of the business customer

					relmgrid = Integer.parseInt(request.getParameter("check"));
					logger.info("Selected rel mgr is" + relmgrid);
					boolean flag1 = false;
					try {

						flag1 = armservice.setRelationshipManager(bcust.getId(), relmgrid);
						relmgrname = armservice.getRelationshipManagerName(relmgrid);

					} catch (AssignRelationshipManagerException e) {
						e.printStackTrace();
						logger.error(e.getMessage());
						request.setAttribute("error", e.getMessage());
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
						rd.forward(request, response);
					}

					if (false != flag1) {
						rmname = relmgrname;
						request.setAttribute("selectedrm", relmgrname);
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewRelationshipManager.jsp");
						rd.forward(request, response);
					}

				} else if (CHANGENEW.equals(action)) {

					ArrayList<RelationshipManager> rmlist = new ArrayList<RelationshipManager>();
					ArrayList<Branch> brList = new ArrayList<Branch>();

					try {
						// get the list of branch

						brlist = armservice.getAllBranchDetails();

						if (null != brlist) {
							logger.info("Branch LIST: " + brList.size());
							for (Branch br : brlist) {
								logger.info("branch id is: " + br.getBranchId() + ", name is:" + br.getBranchName()
										+ "addrs:" + br.getBranchAddress());
							}
							request.setAttribute("branchlist", brlist);
							String bname = bcust.getBusinessName();
							if (null != bname) {
								request.setAttribute("bname", bname);
								RequestDispatcher rd1 = request
										.getRequestDispatcher("/jsp/ChangeRelationshipManager.jsp");
								rd1.forward(request, response);
							} // end if(bname)
						} // end if(brlist)
					} // end of try block
					catch (AssignRelationshipManagerException e) {

						e.printStackTrace();
						logger.error(e.getMessage());
						request.setAttribute("error", e.getMessage());
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
						rd.forward(request, response);
					}

				} else if (SUCCESS.equals(action)) {
					// displaying terms and conditions
					logger.info("Relationship manager successfully assigned");
					response.sendRedirect(request.getContextPath() + "/jsp/AccountHome.jsp");
				} else if (TERMSACCEPTED.equals(action)) {
					// if terms and conditions are accepted

					String check = request.getParameter("termscheck");
					if (null == check) {
						// terms and conditions not accepted hence again redirect to same page
						// response.sendRedirect(request.getContextPath()+"/jsp/TermsAndConditions.jsp");
						logger.info("terms and conditions not accepted");
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/TermsAndConditions.jsp");
						rd.forward(request, response);
					} else {
						HttpSession session1 = request.getSession();
						logger.info("terms and conditions are accepted");

						accountsList = (ArrayList<Account>) session1.getAttribute("accountsList");
						System.out.println("size of accoutnlist in TERMACCEPTED thru session in mangrservlet="
								+ accountsList.size());
						if (null != accountsList) {
							boolean[] arrayFlag = new boolean[accountsList.size()];
							int i = 0;
							System.out.println("in if size of accoutnlist in TERMACCEPTED thru session in mangrservlet="
									+ accountsList.size());
							logger.info("Account Size received:" + accountsList.size());
							long acno = 0;
							for (Account acc : accountsList) {
								System.out.println("account no in for loop ==" + acc.getAccNumber());
								acno = acc.getAccNumber();
								String acproduct = acc.getProductIntension();
								String acprodname = acc.getProductName();
								logger.info("acc prod intension" + acproduct);
								logger.info("acc prod name" + acprodname);
								logger.info("acc num: " + acno);

								// set account status as active and proceed to print welcome letter
								AccountCreationService acservice = new AccountCreationService();
								boolean flag = false;
								try {
									flag = acservice.changeStatus(acno);
									arrayFlag[i] = flag;
									i++;
								} catch (AccountCreationException e) {
									e.printStackTrace();
									logger.error(e.getMessage());
									request.setAttribute("error", e.getMessage());
									RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
									rd.forward(request, response);
								}
							} // end of for
						} // end if accslist
						else {
							logger.info("Error occured in changing status");
							System.out.println(
									"in error else parttt ===failed in completion of account creation process");
							request.setAttribute("error", "failed in completion of account creation process");
							RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
							rd.forward(request, response);

						}
						// if terms and conditions are accepted and account status has been set then
						// display the welcome letter

						logger.info("welcome letter service");

						CustomerAddress custaddr = new CustomerAddress();

						try {
							// getting Address of the Customer
							System.out.println("bcustid in search of business customer address" + bcustid);
							custaddr = letterservice.getAddress(bcustid);
							System.out.println("cust addrs" + custaddr.getCountry());
							logger.info("cust addrs" + custaddr.getCountry());

						} catch (AssignRelationshipManagerException e) {
							e.printStackTrace();
							logger.error(e.getMessage());
							request.setAttribute("error", e.getMessage());
							RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
							rd.forward(request, response);
						}
						/* Displaying Welcome Letter */
						try {
							AssignRelationshipManagerDao armdao = new AssignRelationshipManagerDao();
							String rmname = armdao.getRelationshipManager(bcustid);
							System.out.println("value of relatnmangr ==" + rmname);
							if ((null != accountsList) && (null != bcust) && (null != custaddr) && (null != rmname)) {
								request.setAttribute("accnumlist", accountsList);

								request.setAttribute("custname", bcust.getBusinessName());

								logger.info("Customer name is" + bcust.getBusinessName());
								request.setAttribute("busid", bcust.getId());

								logger.info("Customer id is " + bcust.getId());
								request.setAttribute("customeraddrs", custaddr);

								logger.info("Customer addrs " + custaddr.getBuildingNo());
								logger.info("Relationship Manager name: " + rmname);
								request.setAttribute("relmgr", rmname);
								RequestDispatcher rd = request.getRequestDispatcher("/jsp/WelcomeLetter.jsp");
								rd.forward(request, response);
							} else {
								request.setAttribute("error", "Session has been invalidated");
								RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
								rd.forward(request, response);
							}
						} catch (Exception e) {
							e.printStackTrace();
							logger.error(e.getMessage());
							request.setAttribute("error", "Session has been invalidated");
							RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
							rd.forward(request, response);
						}

					} // end of else (check terms accepted)

				} // end of terms accepted action

				else if (CLOSE.equals(action)) {
					request.getSession().setAttribute("bcust", null);
					request.getSession().setAttribute("account", null);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/AccountHome.jsp");
					rd.forward(request, response);
				} else if (CHANGE.equals(action)) {
					// display the branch list

					try {
						// get the list of branch
						int npId = bcust.getId();
						brlist = armservice.getBranchDetails(npId);
						if (null != brlist) {
							logger.info("branch details in change rm are:");
							for (Branch br : brlist) {

								logger.info("id is:" + br.getBranchId() + "name is:" + br.getBranchName() + "addrs:"
										+ br.getBranchAddress());
							}
							request.setAttribute("branchlist", brlist);
							String bname = bcust.getBusinessName();
							if (null != bname) {
								request.setAttribute("bname", bname);
								RequestDispatcher rd1 = request
										.getRequestDispatcher("/jsp/ChangeRelationshipManager.jsp");
								rd1.forward(request, response);
							} // end if(bname)
						} // end if(brlist)
					} // end of try block
					catch (AssignRelationshipManagerException e) {
						e.printStackTrace();
						logger.error(e.getMessage());
						request.setAttribute("error", e.getMessage());
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
						rd.forward(request, response);
					}

				} else if (BRANCHDETAILS.equals(action)) {
					// display the relationship manager list based on the branch that has been
					// selected

					String selbranch = request.getParameter("selbranch");
					logger.info("selected branch is " + selbranch);
					ArrayList<RelationshipManager> rmgrlist = new ArrayList<RelationshipManager>();
					try {
						rmgrlist = armservice.getDetails(selbranch);
						logger.info("rm details are:");
						for (RelationshipManager rm : rmgrlist) {
							logger.info("id is:" + rm.getId() + "name:" + rm.getName() + "branch:" + rm.getBranch());
						}

						String bname = bcust.getBusinessName();
						request.setAttribute("bname", bname);
						request.setAttribute("branchlist", brlist);
						request.setAttribute("relmgr", rmgrlist);
						request.setAttribute("msg", "result");
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/ChangeRelationshipManager.jsp");
						rd.forward(request, response);
					} // end of try block
					catch (AssignRelationshipManagerException e) {

						e.printStackTrace();
						logger.error(e.getMessage());
						request.setAttribute("error", e.getMessage());
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
						rd.forward(request, response);
					}

				}

				else if (CHANGEDETAILS.equals(action)) {
					// after selecting the relationship manager, view the selected relationship
					// manager name

					try {
						boolean flag = false;
						relmgrid = Integer.parseInt(request.getParameter("check"));
						// set the relationship manager for the customer
						flag = armservice.setRelationshipManager(bcust.getId(), relmgrid);

						relmgrname = armservice.getRelationshipManagerName(relmgrid);
						rmname = relmgrname;
					} catch (AssignRelationshipManagerException e) {
						e.printStackTrace();
						logger.error(e.getMessage());
						request.setAttribute("error", e.getMessage());
						RequestDispatcher rd1 = request.getRequestDispatcher("/jsp/Error.jsp");
						rd1.forward(request, response);
					}
					logger.info("selected rm is" + relmgrid);
					request.setAttribute("selectedrm", relmgrname);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewRelationshipManager.jsp");
					rd.forward(request, response);

					// set relationship manager of the business customer
				} else if (EXRMDETAILS.equals(action)) {
					// retaining relationship manager of the business customer

					try {
						relmgrid = armservice.getRelationshipManagerId(bcustid);
						relmgrname = armservice.getRelationshipManagerName(relmgrid);
						rmname = relmgrname;

					} catch (AssignRelationshipManagerException e) {
						e.printStackTrace();
						logger.error(e.getMessage());
						request.setAttribute("error", e.getMessage());
						RequestDispatcher rd = request.getRequestDispatcher("/jsp/Error.jsp");
						rd.forward(request, response);
					}
					request.setAttribute("selectedrm", relmgrname);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/ViewRelationshipManager.jsp");
					rd.forward(request, response);
				}
			} // end of if checking is bcustlist & acclist is null
			else if (action.equals("pdf")) {
				System.out.println("reached in servlet");

			} else {
				// if Business customer or account doesn't exists or data may be lost then it
				// throws error

				response.sendRedirect(request.getContextPath() + "/jsp/SessionError.jsp");

			}
		} // end of try block
		catch (Exception e) {
			e.printStackTrace();

		}

	}

}
