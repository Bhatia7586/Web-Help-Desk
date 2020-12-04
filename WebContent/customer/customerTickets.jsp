<%@page import="com.dao.TicketDao"%>
<%@page import="com.bean.Ticket"%>
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

List<Ticket> clist = TicketDao.getTickets();
List<Complaint> comlist = ComplaintDao.getComplaint();

Customer c2 = (Customer) session.getAttribute("customer");

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
      	
        	<h2>Solved Complaints</h2> 
			<p>
			Our Company Takes pride in giving A-one quality customer service.
			And Guarantee complete customer satisfaction.
			</p>        
        	<div class="cleaner h30"></div>
       <div class="col_w420 float_l">
       <center>
       <h1>Tickets Generated</h1>
      <table border="2">
    	<tr>
    		<th>Ticket No.</th>
    		<th>Complaint Category</th>
    		<th>Product Name</th>
    		<th>Complaint</th>
    	</tr>
    	
      		
				
				<%
				for(Ticket c : clist)
            	{
            		if(c.getCustomer().getId() == c2.getId())
            		{
				%>
			<tr>			
						<td><%= c.getTicket()%></td>
						<td><%= c.getCategory() %></td>
						<td><%= c.getProduct().getName() %></td>
						<td><%= c.getComplaint() %></td>		
			</tr>	
				<%
            		}
            		else if(c.getCustomer().getId() == c2.getId())
            		{
            			if(c.getCustomer() == null)
            			{
            			%>
            			Sorry no tickets Yet.
            			<% 
            			}
            		}
            	}
				%>	
					
			  
          
				<div class="cleaner"></div>
			
         </table> 
         
         
     <h1>Complaints</h1>
      <table border="2">
    	<tr>
    		<th>Ticket No.</th>
    		<th>Status</th>
    		<th>Department</th>
    		<th>Product Name</th>
    	</tr>
    	
      		
				
				<%
				for(Complaint c : comlist)
            	{
            		if(c.getTicket().getCustomer().getId() == c2.getId())
            		{
				%>
			<tr>			
						<td><%= c.getTicket().getTicket()%></td>
						<td><%= c.getStatus() %></td>
						<td><%= c.getEmployee() %></td>
						<td><%= c.getTicket().getProduct().getName() %></td>		
			</tr>	
				<%
            		}
            		else if(c.getTicket().getCustomer().getId() == c2.getId())
            		{
            			if(c.getTicket().getCustomer() == null)
            			{
            			%>
            			Sorry no tickets Yet.
            			<% 
            			}
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