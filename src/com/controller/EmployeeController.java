package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Designation;
import com.bean.Employee;
import com.dao.EmployeeDao;


@WebServlet("/EmployeeController")
public class EmployeeController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action.equals("Add Job"))
		{
			Designation d = new Designation();
			
			d.setDesignation(request.getParameter("jobCategory"));
			
			EmployeeDao.addJob(d);
			
			response.sendRedirect("admin/designation.jsp");
		}
		else if(action.equals("Add Employee"))
		{
			Designation d = new Designation();
			d.setId(Long.parseLong(request.getParameter("designation")));
			
			Employee e = new Employee();
			
			e.setName(request.getParameter("name"));
			e.setDesignation(d);
			e.setEmail(request.getParameter("email"));
			e.setPassword(request.getParameter("password"));
			
			EmployeeDao.addEmployee(e);
			
			response.sendRedirect("admin/addEmployee.jsp");
		}
		
	}

}
