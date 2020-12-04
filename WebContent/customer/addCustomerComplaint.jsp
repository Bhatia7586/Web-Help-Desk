<%@page import="com.dao.CustomerDao"%>
<%@page import="com.bean.Customer"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="com.dao.ComplaintDao"%>
<%@page import="com.bean.ComplaintCategory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Service Box - Contact</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="tooplate_style.css" rel="stylesheet" type="text/css" />
<!--   Free Website Template by t o o p l a t e . c o m   -->
<link rel="stylesheet" type="text/css" href="css/jquery.lightbox-0.5.css" />    
    
<!-- Arquivos utilizados pelo jQuery lightBox plugin -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.lightbox-0.5.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery.lightbox-0.5.css" media="screen" />
<!-- / fim dos arquivos utilizados pelo jQuery lightBox plugin -->

<!-- Ativando o jQuery lightBox plugin -->
<script type="text/javascript">
$(function() {
    $('#map a').lightBox();
});
</script>
</head>
<%

List<ComplaintCategory> cclist = ComplaintDao.getComplaintCategory();
List<Product> plist = ProductDao.getProduct();
Customer c2 = new Customer();
c2 = (Customer) session.getAttribute("customer");

if(c2 != null)
{
	session.setAttribute("customer", c2);
}
else
{
	response.sendRedirect("website.jsp");	
}
%>
<body>

<div id="tooplate_wrapper">
	<div id="tooplate_header">
        <div id="site_title"><h1><a href="index.jsp">Service Box Home</a></h1></div>
        
        <div id="tooplate_menu">
            <ul>
            	<li><a href="closedComplaints" class="current">Solved</a></li>
            	<li><a href="addCustomerComplaint.jsp">Complaint</a></li>
                <li><a href="customerTickets.jsp" >Tickets</a></li>
                <li><a href="customerEdit.jsp">Customer Info</a></li>
                <li>
                <%
                	if(c2 != null)
                	{
                %>
             <a>   Welcome <%= c2.getFirstname() %> </a>
                <%
                	}
                	else
                	{
                %>
              <a>  Welcome </a>
                <% 
                		
                	}
                %>
                </li>
                <li><a href="../CustomerController?action=Logout" class="last">Logout</a></li>
            </ul>    	
        </div> <!-- end of tooplate_menu -->
    
	</div> <!-- end of forever header -->
    
    <div id="tooplate_main">
    
		<div id="tooplate_content">
        	
      		<h2>Complaint Form</h2>
            <p>In ac libero urna. Suspendisse sed odio ut mi auctor blandit. Duis luctus nulla metus, a vulputate mauris. Integer sed nisi sapien, ut gravida mauris. Nam et tellus libero. Cras purus libero, dapibus nec rutrum in, dapibus nec risus. Ut interdum mi sit amet magna feugiat auctor. Validate <a href="http://validator.w3.org/check?uri=referer" rel="nofollow"><strong>XHTML</strong></a> and <a href="http://jigsaw.w3.org/css-validator/check/referer" rel="nofollow"><strong>CSS</strong></a>.</p>
            <div class="cleaner h40"></div>
        
           
           	<div class="col_w420 float_l">
                <div id="contact_form">
            
                    <h4>Complaint</h4>
                    
                    <form method="post" name="contact" action="../TicketController">

						<label for="complaintCategory">Complaint:</label> <select id="complaintCategory" name="complaintCategory" class="required input_field" >
							<option selected>Select one</option>
							<%
								for(ComplaintCategory cc : cclist)
								{
							%>
							<option value="<%= cc.getId() %>"><%= cc.getComplaintCategory() %></option>
							<%
								}
							%>
						</select>
						<div class="cleaner h10"></div>

						<label for="productCategory">Product Category:</label> <select class="validate-email required input_field" name="productCategory" id="productCategory">
							<option selected>Select one</option>
							<%
								for(Product p : plist)
								{
							%>
							<option value="<%= p.getCategory().getId()%>"><%= p.getCategory().getProductCategory() %></option>
							<%
								}
							%>
						</select>
						<div class="cleaner h10"></div>

						<label for="productName">Product Name:</label> <select class="validate-subject required input_field" name="productName" id="productName">
							<option selected>Select one</option>
							<%
								for(Product p : plist)
								{
							%>
							<option value="<%= p.getId()%>"><%= p.getName() %></option>
							<%
								}
							%>
						</select>
						<div class="cleaner h10"></div>
						
						<label for="customerId">Customer Name:</label> <input type="text" class="validate-email required input_field" name="customerId" id="customerId" value="<%= c2.getId()%>"><%= c2.getFirstname() %></input>
						<div class="cleaner h10"></div>

						<label for="complaint">Complaint:</label> <textarea id="text" name="complaint" rows="0" cols="0" class="required"></textarea>
						<div class="cleaner h10"></div>                

						<input type="submit" value="Submit" id="submit" name="action" class="submit_btn float_l" />

						<input type="reset" value="Reset" id="reset" name="reset" class="submit_btn float_r" />

					</form>
    
                </div> 
            </div>
            
            <div class="col_w420 float_r">
                <h4>Our Location</h4>
                
				<div id="map">
                    <a href="images/map_big.jpg" title="Map">
                        <img width="300" height="200" src="images/map_thumb.jpg" alt="Map" />
                    </a>
			  </div>                
                
				<div class="cleaner h30"></div>
                
                <h4>Mailing Address</h4>
                <h6><strong>Company Name</strong></h6>
                151-929 Duis lacinia dictum, <br />
                Vestibulum auctor, 11550 <br />
				Diam a mollis tempor<br /><br />
                Tel: 082-050-8800<br />
				Fax: 022-350-0660
            </div>
            
            <div class="cleaner"></div>
        </div> <!-- end of content -->
        
    </div> <!-- end of main -->
    
    <div id="tooplate_footer">
    	Copyright © 2048 <a href="#">Company Name</a>
	</div> <!-- end of footer -->
    
</div> <!-- end of wrapper -->
<!--   Free Website Template by t o o p l a t e . c o m   -->
</body>
</html>