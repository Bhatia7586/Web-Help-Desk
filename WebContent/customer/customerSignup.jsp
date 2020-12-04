<%@page import="com.bean.Customer"%>
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
                <li>
                <%
                	if(c2 != null)
                	{
                %>
             <a class="last">   Welcome <%= c2.getFirstname() %> </a>
                <%
                	}
                	else
                	{
                %>
              <a class="last">  Welcome </a>
                <% 
                		
                	}
                %>
                </li>
                <li><a href="../admin/customerLogin.jsp">Login</a></li>
                
            </ul>    	
        </div> <!-- end of tooplate_menu -->
    
	</div> <!-- end of forever header -->
    
    <div id="tooplate_main">
    
		<div id="tooplate_content">
        	
      		<h2>Customer Information</h2>
            <p></p>
            <div class="cleaner h40"></div>
        
           
           	<div class="col_w420 float_l">
                <div id="contact_form">
            
                    <h4>Sign Up Form</h4>
                    
                    <form method="post" name="contact" action="../CustomerController">

						<label for="firstname">First Name:</label> <input type="text" id="firstname" name="firstname" class="required input_field" />
						<div class="cleaner h10"></div>
						
						<label for="lastname">Last Name:</label> <input type="text" id="lastname" name="lastname" class="required input_field" />
						<div class="cleaner h10"></div>

						<label for="email">Email:</label> <input type="text" class="validate-email required input_field" name="email" id="email" />
						<div class="cleaner h10"></div>

						<label for="password">Password:</label> <input type="text" class="validate-subject required input_field" name="password" id="password"/>
						<div class="cleaner h10"></div>
						
						<label for="subject">Gender:</label>
						<input type="radio" name="gender" value="Male"/><img width="30" height="20" src="images/man-icon.jpg" alt="man" />
						<input type="radio" name="gender" value="Female"/><img width="30" height="20" src="images/woman-icon.jpg" alt="woman" />
						<div class="cleaner h10"></div>
						
						<label for="phone">Phone:</label> <input type="text" class="validate-subject required input_field" name="phone" id="phone"/>
						<div class="cleaner h10"></div>               

						<input type="submit" value="Sign Up" id="submit" name="action" class="submit_btn float_l" />

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