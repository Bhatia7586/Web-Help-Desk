package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.bean.Admin;
import com.dao.AdminDao;


@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String action = request.getParameter("action");
		
		if(action.equals("Logout"))
		{
			HttpSession session = request.getSession();
			session.invalidate();
			
			response.sendRedirect("admin/adminLogin.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action.equals("Sign Up"))
		{
			Admin a = new Admin();
			a.setName(request.getParameter("name"));
			a.setEmail(request.getParameter("email"));
			a.setPassword(request.getParameter("password"));
			
			AdminDao.addAdmin(a);
			
			response.sendRedirect("login/adminSignup.jsp");
			
		}
		else if(action.equals("Login"))
		{
			Admin a = new Admin();
			
			a.setEmail(request.getParameter("email"));
			a.setPassword(request.getParameter("password"));
			
			Admin a2 = AdminDao.login(a);
			
			if(a2 != null)
			{
				HttpSession session = request.getSession();
				session.setAttribute("admin", a2);
				response.sendRedirect("admin/adminIndex.jsp");
			}
			else
			{
				HttpSession session = request.getSession();
				session.setAttribute("admin", a);
				request.getRequestDispatcher("admin/adminLogin.jsp").include(request, response);
			}
		}
		
	}

}
