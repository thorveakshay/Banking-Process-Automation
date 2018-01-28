<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
	    <%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
if(request.getSession()==null || request.getSession().getAttribute("user")==null){
     response.sendRedirect(request.getContextPath()+"/jsp/index.jsp");
     return;
}
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Terms And Conditions</title>
<script>
function termsValidation()
{
	var x=document.getElementById('termscheck');
	
	if(!(x.checked))
	{
		alert("Please accept Terms and Conditions for successfull Account creation");
		return false;
	}
	return true;
}
</script>
<!--  <script type="text/javascript" language="javascript" src="<%=request.getContextPath() %> /js/TermsValidation.js">
</script>-->
</head>
<body>
<jsp:include page="layout/Header.jsp"></jsp:include>
<h2 style="font-size:20px; font-name:arial;" align="center">NEXUS BANKING GROUP TERMS AND CONDITIONS</h2><br>

<div style="font-size:13px">
<p>These terms and conditions apply to and regulate the operation of the Current and Savings Account(s) offered by Nexus Bank. 
These terms and conditions shall be in addition to any other terms as stipulated by Nexus Bank from time to time. </p>
<p><b>1. Definitions</b><br>
In these terms and conditions, the following words and phrases have the meaning stated here under unless indicated otherwise: 
<br>a)"Customer" refers to any person holding an Account with Nexus Bank. 
<br>b)"Services" shall mean the services provided by Nexus Bank in connection with the Saving Account and more particularly described in these Terms. 
<br>c)"Website" refers to the website owned, established and maintained by Nexus Bank on the URL www.nbg.com.
<br>d)"Nexus Bank 24-Hour Customer Care Centre" refers to Nexus Bank - Phone Banking Service provided by Nexus Bank to the Customer. </p>

<p><b>2. Applicability of Terms:</b> <br>
These terms and conditions form the contract between the Customer and Nexus Bank. The Customer shall apply to Nexus Bank in the prescribed form for operation of the Account and availing of the related Services. 
By applying for opening the Account, the Customer acknowledges that he / she has /have read understood and accepted these terms and conditions. </p>
<p><b>3.Definitions And Interpretation</b></p>
<p>In these Terms and Conditions, unless the context otherwise
requires.</p>
<p>
3.1 Words importing the plural shall include the singular and vice
versa.<br>
3.2 References to any gender shall include references to all
genders.<br>
3.3 "Account" shall mean the account opened by the Customer
with the Bank in acceptance of the Terms and Conditions<br>
3.4 "Authorized Signatory(ies)" means the persons appointed by
the Customer for the purpose of giving instructions on behalf of
the Customer to the Bank.<br>
3.5 "NexusBank" or "Bank" shall mean Nexus Banking Group<br>

</p>
<p><b>4. Account Opening:</b><br>
The account opening formalities are governed by the policies of Nexus Bank and may be revised from time to time. It may require customer(s) to submit duly filled application form(s) along with the prescribed set of documents stipulated.
<br></br>
I/we am/are aware that in connection with the Nexus
Banking Facility, the Bank shall ask for my/our details as the
case may be, for verification of my/our identity, after which I/we
am/are entitled to information pertaining to the account creation.
I/we understand and accept that the instructions
given through the Nexus Banking Facility may also include
instructions to change my/our demographic details such as
residence and or mailing address, residence and or office
telephone number, mobile phone number, e-mail address or any
other personal details as decided by the Bank from time to time.
I/we understand and acknowledge that I/we shall be able to
perform transactions through any channel other than the
Nexus Banking Facility and/or Nexus bank Online Internet
Banking Facility. I/we hereby confirm that I/we am/are fully
conversant with the procedures, as explained to me/us, which
are required to be complied with and I/we further confirm that
I/we shall comply with the same.
</p>
</div>
<form name="termsform" action="/NexusBankingGroup/RelationshipManagerController" onSubmit="return termsValidation();" method="post">
<input type="hidden" name="action" value="TermsAccepted"></input>
<br><b>By submitting, I accept the terms and conditions laid down by the Nexus Banking Group.</b><br>
I accept<input type="checkbox" name="termscheck" id=termscheck></input>
<div align="center">
<input type="submit" value="Submit" id="button"></input>
<input type="button" value="Cancel" id="button" onclick=" window.close()"></input>
</div>

</form>

<jsp:include page="layout/Footer.jsp"></jsp:include>
</body>
</html>