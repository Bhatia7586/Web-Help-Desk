<%@page import="com.bean.Admin"%>
<%@page import="com.dao.TicketDao"%>
<%@page import="com.bean.Ticket"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Products Page - Dashboard Template</title>
    <!--

    Template 2108 Dashboard

	http://www.tooplate.com/view/2108-dashboard

    -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/tooplate.css">
</head>
<%

List<Ticket> tlist = TicketDao.getTickets();

Admin a2 = (Admin) session.getAttribute("admin");

if(a2 != null)
{
session.setAttribute("admin", a2);
}

%>
<body id="reportsPage">
    <div class="" id="home">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-xl navbar-light bg-light">
                        <a class="navbar-brand" href="#">
                            <i class="fas fa-3x fa-tachometer-alt tm-site-icon"></i>
                            <h1 class="tm-site-title mb-0">Dashboard</h1>
                        </a>
                        <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mx-auto">
                                <li class="nav-item">
                                    <a class="nav-link " href="adminIndex.jsp">Dashboard
                                        <span class="sr-only">(current)</span>
                                    </a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                        Branches
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="ticketsPage.jsp">Coordinator</a>
                                        <a class="dropdown-item" href="complaintsPage.jsp">Investigator</a>
                                        <a class="dropdown-item" href="closingRemarks.jsp">Closing Authority</a>
                                        <a class="dropdown-item" href="closedComplaints.jsp">Account Manager</a>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="viewProducts.jsp">Products</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="viewAccounts.jsp">Accounts</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                        Settings
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#">Profile</a>
                                    </div>
                                </li>
                                <%
                                	if(a2 != null)
                                	{
                                %>
                                	<li class="nav-item">
                                    	<h6>Welcome <%= a2.getName() %></h6>
                                	</li>
                                <%
                                	}
                                	else
                                	{
                                %>
                                	<li class="nav-item">
                                    	<h6>Welcome </h6>
                                	</li>
                                <% 
                                	}
                                		
                                %>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link d-flex" href="../AdminController?action=Logout">
                                        <i class="far fa-user mr-2 tm-logout-icon"></i>
                                        <span>Logout</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <!-- row -->
            <div class="row tm-content-row tm-mt-big">
                <div class="col-lg-12 tm-md-12 tm-sm-12 tm-col">
                    <div class="bg-white tm-block h-100">
                        <div class="row">
                            <div class="col-md-8 col-sm-12">
                                <h2 class="tm-block-title d-inline-block">Ticket Page</h2>

                            </div>
                            <div class="col-md-4 col-sm-12 text-right">
                                <a href="#" class="btn btn-small btn-primary">New Tickets</a>
                            </div>
                        </div>
                        <form action="../ComplaintController" method="post">
                        <div class="table-responsive">
                        
                            <table class="table table-hover table-striped tm-table-striped-even mt-3">
                                <thead>
                                    <tr class="tm-bg-gray">
                                        <th scope="col">&nbsp;</th>
                                        <th scope="col">Ticket Number</th>
                                        <th scope="col" class="text-center">Complaint Category</th>
                                        <th scope="col" class="text-center">Product Name</th>
                                        <th scope="col">Complaint</th>
                                        <th scope="col">&nbsp;</th>
                                        <th scope="col">&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <% 
                                	for(Ticket t : tlist)
                                	{
                                %>
                                    <tr>
                                        <th scope="row">
                                            <input type="radio" name="ticket" value="<%= t.getId()%>"><%= t.getId() %>
                                        </th>
                                        <td class="tm-product-name"><%= t.getTicket() %></td>
                                        <td class="text-center"><%= t.getCategory().getComplaintCategory() %></td>
                                        <td class="text-center"><%= t.getProduct().getName() %></td>
                                        <td class="text-center"><%= t.getComplaint() %></td>
                                        <td>Edit</td>
                                        <td><i class="fas fa-trash-alt tm-trash-icon">Delete</i></td>
                                    </tr>
                                <%
                                	 }
                                %>
                                </tbody>
                            </table>
                        </div>

                        <div class="tm-table-mt tm-table-actions-row">
                            <div class="tm-table-actions-col-left">
                                <input type="submit" name="action" class="btn btn-danger" value="Generate Complaint">
                            </div>
                            <div class="tm-table-actions-col-left">
                                <input type="submit" name="action" class="btn btn-danger" value="View Complaint">
                            </div>
                      
                            <div class="tm-table-actions-col-right">
                                <span class="tm-pagination-label">Page</span>
                                <nav aria-label="Page navigation" class="d-inline-block">
                                    <ul class="pagination tm-pagination">
                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item">
                                            <span class="tm-dots d-block">...</span>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">13</a></li>
                                        <li class="page-item"><a class="page-link" href="#">14</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>

            <footer class="row tm-mt-small">
                <div class="col-12 font-weight-light">
                    <p class="d-inline-block tm-bg-black text-white py-2 px-4">
                        Copyright &copy; 2018 Admin Dashboard . Created by
                        <a rel="nofollow" href="https://www.tooplate.com" class="text-white tm-footer-link">Tooplate</a>
                    </p>
                </div>
            </footer>
        </div>
    </div>
    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script>
        $(function () {
            $('.tm-product-name').on('click', function () {
                window.location.href = "edit-product.html";
            });
        })
    </script>
</body>

</html>