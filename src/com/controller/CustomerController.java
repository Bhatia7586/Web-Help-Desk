package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Customer;
import com.dao.CustomerDao;


@WebServlet("/CustomerController")
public class CustomerController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String action = request.getParameter("action");
		
		if(action.equals("Logout"))
		{
			HttpSession session = request.getSession();
			session.invalidate();
			
			response.sendRedirect("customer/website.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action.equals("Update"))
		{
			Customer c = new Customer();
			c.setFirstname(request.getParameter("firstname"));
			c.setLastname(request.getParameter("lastname"));
			c.setEmail(request.getParameter("email"));
			c.setPassword(request.getParameter("password"));
			c.setGender(request.getParameter("gender"));
			c.setPhone(Long.parseLong(request.getParameter("phone")));
			
			
			CustomerDao.updateCustomer(c);
			
			Customer c2 = new Customer();
			c2 = CustomerDao.getCustomerById(1L);
			
			HttpSession session = request.getSession();
			session.setAttribute("customer", c2);
			response.sendRedirect("customer/index.jsp");
		}
		else if(action.equals("Sign Up"))
		{
			Customer c = new Customer();
			c.setFirstname(request.getParameter("firstname"));
			c.setLastname(request.getParameter("lastname"));
			c.setEmail(request.getParameter("email"));
			c.setPassword(request.getParameter("password"));
			c.setGender(request.getParameter("gender"));
			c.setPhone(Long.parseLong(request.getParameter("phone")));
			
			
			CustomerDao.addCustomer(c);
			response.sendRedirect("customer/index.jsp");
		}
		else if(action.equals("Login"))
		{
			Customer c = new Customer();
			
			c.setEmail(request.getParameter("email"));
			c.setPassword(request.getParameter("password"));
			
			
			Customer c2 = new Customer();
			c2 = CustomerDao.login(c);
			
			HttpSession session = request.getSession();
			if(c2 != null)
			{
				
				session.setAttribute("customer", c2);
				response.sendRedirect("customer/index.jsp");
			}
			else
			{
				session.setAttribute("customer", c);
				response.sendRedirect("admin/customerLogin.jsp");
			}
		}
		else if(action.equals("Sign Up"))
		{
			response.sendRedirect("customer/customerSignup.jsp");
		}
		
	}

}
