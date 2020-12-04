<%@page import="com.bean.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Service Box Template</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="tooplate_style.css" rel="stylesheet" type="text/css" />
<!--   Free Website Template by t o o p l a t e . c o m   -->
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
                <li><a href="../admin/customerLogin.jsp">Customer Login</a></li>
            	<li><a href="../admin/adminLogin.jsp">Employee Login</a></li>
            </ul>    	
        </div> <!-- end of tooplate_menu -->
    
	</div> <!-- end of forever header -->
    
    <div id="tooplate_main">
		
        <div id="tooplate_middle">
        	<div class="mid_box">
            	<h2>Step 1</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="mid_box">
            	<h2>Step 2</h2>
                <p>Donec felis elit, pellentesque eu lobortis eu, volutpat ut nisi. </p>
            </div>
            <div class="main_box">
				<div class="main_box_title">Best Solution <span>for Your Business</span></div>
                <p>Curabitur mattis, est id ultricies iaculis, nulla odio ornare est, vel tristique velit sapien et nulla. Aenean id enim urna.</p>
                <a class="learn_here" href="#">Learn Here</a>
            </div>
            <div class="cleaner"></div>
        </div>
        
        <div id="tooplate_content">
        	
            <div class="col_w900">
            	<div class="col_allw280 fp_service_box">
                	<div class="con_tit_01">Introduction</div>
                    <img src="images/onebit_08.png" alt="Image 08" />
                    <p>Service Box is a <a rel="nofollow" href="http://www.tooplate.com">free website template</a> for everyone. You can use this template for any purpose.</p>
					<a class="more" href="#">Detail</a>
                </div>
				
				<div class="col_allw280 fp_service_box">
                	<div class="con_tit_01">Marketing</div>
                    <img src="images/onebit_15.png" alt="Image 15" />
                    <p>Credit goes to <a rel="nofollow" href="http://www.icojoy.com">icojoy.com</a> for Onebit icons. tooplate provides free HTML CSS templates for everyone.</p>
                    <a class="more" href="#">Detail</a>
                </div>
                
				<div class="col_allw280 fp_service_box col_last">
                	<div class="con_tit_01">Advertising</div>
                    <img src="images/onebit_16.png" alt="Image 16" />
                    <p>Curabitur sed lectus id erat viverra consectetur nec in sapien. Etiam vitae. Validate <a href="http://validator.w3.org/check?uri=referer" rel="nofollow"><strong>XHTML</strong></a> and <a href="http://jigsaw.w3.org/css-validator/check/referer" rel="nofollow"><strong>CSS</strong></a>.</p>
                    <a class="more" href="#">Detail</a>
                </div>
                
				<div class="cleaner h60"></div>
				
				<div class="col_allw280 fp_service_box">
                	<div class="con_tit_01">
                		<a href="addCustomerComplaint.jsp"><h1>Support</h1></a>
                	</div>
                    <img src="images/onebit_17.png" alt="Image 17" />
                    <p>Nullam vel sodales leo. Nam sollicitudin tincidunt eros ac eleifend. Integer gravida elementum sem. </p>
                    <a class="more" href="#">Detail</a>
                </div>
				
				<div class="col_allw280 fp_service_box">
                	<div class="con_tit_01">Network</div>
                    <img src="images/onebit_18.png" alt="Image 18" />
                    <p>Vivamus sollicitudin euismod massa, non feugiat nulla egestas ut. Pellentesque facilisis tempus porta.</p>
                    <a class="more" href="#">Detail</a>
                </div>
				
				<div class="col_allw280 fp_service_box col_last">
                	<div class="con_tit_01">Worldwide</div>
                    <img src="images/onebit_19.png" alt="Image 19" />
                    <p>Suspendisse metus felis, varius at euismod eu, egestas eu elit ante ipsum primis in orci luctus.</p>
                    <a class="more" href="#">Detail</a>
                </div>
                
                <div class="cleaner"></div>
            
			</div>
            
            <div class="col_w900 col_w900_last">
            	<div class="con_tit_02">Latest Projects</div>
                
				<div class="col_allw280 lp_box">
                    <a href="#"><img src="images/tooplate_image_01.jpg" alt="Image 01" /></a>
                    <p>Etiam ut nibh et urna cursus ultricies nec vel nunc. In hac habitasse platea dictumst. </p>
                    <a class="more" href="#">More</a>
            	</div>
                
				<div class="col_allw280 lp_box">
                    <a href="#"><img src="images/tooplate_image_02.jpg" alt="Image 02" /></a>
                    <p>Donec ullamcorper feugiat nunc ut tempus. Sed sodales, nibh ut ultricies pulvinar.</p>
                    <a class="more" href="#">More</a>
            	</div>
				
				<div class="col_allw280 lp_box col_last">
                    <a href="#"><img src="images/tooplate_image_03.jpg" alt="Image 03" /></a>
                    <p>Praesent auctor quam quis libero venenatis dapibus. Donec feugiat nunc ut tempus.</p>
                    <a class="more" href="#">More</a>
                </div>
                
				<div class="cleaner"></div>
            </div>
            
        </div> <!-- end of content -->
        
    </div> <!-- end of main -->
    
    <div id="tooplate_footer">
    	Copyright � 2048 <a href="#">Company Name</a>
	</div> <!-- end of footer -->
    
</div> <!-- end of wrapper -->
<!--   Free Website Template by t o o p l a t e . c o m   -->
</body>
</html>