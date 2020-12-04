<%@page import="com.dao.ComplaintDao"%>
<%@page import="com.bean.Complaint"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%

List<Complaint> clist = ComplaintDao.getComplaint();

Customer c2 = (Customer) session.getAttribute("customer");

if(c2 != null)
{
session.setAttribute("customer", c2);
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
      	
        	<h2>Solved Complaints</h2> 
			<p>
			Our Company Takes pride in giving A-one quality customer service.
			And Guarantee complete customer satisfaction.
			</p>        
        	<div class="cleaner h30"></div>
       <div class="col_w420 float_l">
       <center>
       <h1>Solved Complaints</h1>
      <table border="2">
    	<tr>
    		<th>Product Name</th>
    		<th>Remarks</th>
    		<th>Complaint</th>
    		<th>Customer Name</th>
    	</tr>
    	
      		
				
				<%
				for(Complaint c : clist)
            	{
            		if(c.getStatus().equals("Complete") && (c.getRemarks() == null))
            		{
				%>
			<tr>			
						<td><%= c.getTicket().getProduct().getName()%></td>
						<td><%= c.getRemarks() %></td>
						<td><%= c.getTicket().getComplaint() %></td>
						<td><%= c.getTicket().getCustomer().getFirstname() %></td>		
			</tr>	
				<%
            		}
            	}
				%>	
					
			  
          
				<div class="cleaner"></div>
			
         </table> 
        </center>  
        </div>
        </div> <!-- end of content -->
    </div> <!-- end of main -->
    
    <div id="tooplate_footer">
    	Copyright © 2048 <a href="#">Company Name</a> - Designed by <a href="http://www.tooplate.com" target="_parent">Website Templates</a>
	</div> <!-- end of footer -->
    
</div> <!-- end of wrapper -->
<!--   Free Website Template by t o o p l a t e . c o m   -->
</body>
</html>