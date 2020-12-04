<%@page import="com.dao.CustomerDao"%>
<%@page import="com.bean.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Service Box - About</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="tooplate_style.css" rel="stylesheet" type="text/css" />
<!--   Free Website Template by t o o p l a t e . c o m   -->
</head>
<%

long ticket = (long) session.getAttribute("ticket");
long l = (long) session.getAttribute("customer");
Customer c2 = CustomerDao.getCustomerById(l);

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
            	<li><a href="closedComplaints.jsp" class="current">Solved</a></li>
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
        	
      		<div class="col_w900">
            	<h2>About Us</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ipsum felis, consectetur non tincidunt quis, posuere sit amet odio. Suspendisse urna metus, sodales eget sagittis sed, pharetra at lorem. Maecenas eget ante eu magna porttitor commodo. Curabitur sagittis quam ac ante laoreet aliquet.</p>
                
				<div class="cleaner h30"></div>
                
				<img class="image_wrapper image_fl" src="images/tooplate_image_03.jpg" alt="Image 03" />
                
				<h2>Complaint Registered</h2>
                <p> by <%= c2.getFirstname() %> </p>
                
				<ul class="tooplate_list">
                    <li>Pellentesque ligula tortor, feugiat non sollicitudin a, tristique non magna. </li>
                    <li>Cras massa urna, imperdiet vehicula rutrum id, sodales vitae dolor.</li>
                    <li>Cras bibendum pharetra orci, sed iaculis tellus sollicitudin eget.</li>
                    <li>Vestibulum odio mi, mattis non fermentum et, porttitor ac mauris.</li>
                </ul>
                
                <div class="cleaner"></div>
            </div>
            
            <div class="col_w900 col_w900_last">
            	<div class="con_tit_02">Ticket</div>
                
				<div class="col_allw280 lp_box">
                    <a href="#"><img src="images/tooplate_image_01.jpg" alt="Image 01" /></a>
                    <p><%= ticket %> </p>
                    <a class="more" href="#">More</a>
            	</div>
                
				<div class="cleaner"></div>
            </div>
            
        </div> <!-- end of content -->
        
    </div> <!-- end of main -->
    
    <div id="tooplate_footer">
    	Copyright © 2048 <a href="#">Company Name</a>
	</div> <!-- end of footer -->
    
</div> <!-- end of wrapper -->
<!--   Free Website Template by t o o p l a t e . c o m   -->
</body>
</html>