package com.controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComplaintCategory;
import com.bean.Customer;
import com.bean.Product;
import com.bean.ProductCategory;
import com.bean.Ticket;
import com.dao.TicketDao;


@WebServlet("/TicketController")
public class TicketController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action.equals("Submit"))
		{
			Ticket t = new Ticket();
			
			t.setTicket(new Random().nextLong());
			
			ComplaintCategory cc = new ComplaintCategory();
			cc.setId(Long.parseLong(request.getParameter("complaintCategory")));
			
			t.setCategory(cc);
			
			ProductCategory pc = new ProductCategory();
			pc.setId(Long.parseLong(request.getParameter("productCategory")));
			
			Product p = new Product();
			p.setId(Long.parseLong(request.getParameter("productName")));
			p.setCategory(pc);
			
			t.setProduct(p);
			
			Customer c = new Customer();
			c.setId(Long.parseLong(request.getParameter("customerId")));
			
			t.setCustomer(c);
			
			t.setComplaint(request.getParameter("complaint"));
			
			TicketDao.addTicket(t);
			
			
			HttpSession session = request.getSession();
			session.setAttribute("ticket", t.getTicket());
			session.setAttribute("customer", c.getId());
			response.sendRedirect("customer/complaintConfirmation.jsp");
		}
		
	}

}
