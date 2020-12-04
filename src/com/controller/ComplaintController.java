package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.valves.rewrite.RewriteCond;

import com.bean.Complaint;
import com.bean.ComplaintCategory;
import com.bean.Employee;
import com.bean.Ticket;
import com.dao.ComplaintDao;
import com.dao.TicketDao;


@WebServlet("/ComplaintController")
public class ComplaintController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action.equals("Add Category"))
		{
			ComplaintCategory cc = new ComplaintCategory();
			
			cc.setComplaintCategory(request.getParameter("complaintCategory"));
			
			ComplaintDao.addComplaintCategory(cc);
			
			response.sendRedirect("admin/complaintCategory.jsp");
		}
		if(action.equals("Generate Complaint"))
		{
			Ticket t = new Ticket();
			
			t.setId(Long.parseLong(request.getParameter("ticket")));
			
			Ticket t2 = TicketDao.getTicketById(t.getId());
			
			Employee e = new Employee();
			e.setId(1L);
			
			Complaint c = new Complaint();
			
			c.setTicket(t2);
			c.setEmployee(e);
			
			ComplaintDao.addComplaint(c);
			
			response.sendRedirect("admin/ticketsPage.jsp");
			
		}
		
		if(action.equals("Update Complaint"))
		{
			Complaint c = new Complaint();
			
			c.setId(Long.parseLong(request.getParameter("complaint")));
			
			Complaint c2 = new Complaint();
			
			c2 = ComplaintDao.getComplaintById(c);
			
			
			
			Ticket t = new Ticket();
			t.setId(c2.getTicket().getId());
			
			c.setTicket(t);
			
			c.setStatus(request.getParameter("status"));
			
			
			Employee e = new Employee();
			if(c.getStatus().equals("Investigationg"))
			{
			e.setId(2L);
			}
			else if(c.getStatus().equals("Complete"))
			{
				e.setId(3L);
			}
			
			c.setEmployee(e);
			
			ComplaintDao.updateComplaint(c);
			
			response.sendRedirect("admin/complaintsPage.jsp");
		}
		else if(action.equals("Close Complaint"))
		{
		
			Complaint c = new Complaint();
			
			c.setId(Long.parseLong(request.getParameter("complaint")));
			
			Complaint c2 = new Complaint();
			
			c2 = ComplaintDao.getComplaintById(c);
			
			Employee e = new Employee();
			e.setId(4L);
			
			c.setEmployee(e);
			
			Ticket t = new Ticket();
			t.setId(c2.getTicket().getId());
			
			c.setTicket(t);
			c.setStatus(request.getParameter("status"));
			c.setRemarks(request.getParameter("remarks"));
			
			ComplaintDao.updateComplaint(c);
			
			response.sendRedirect("admin/closingRemarks.jsp");
			
		}
		else if(action.equals("View Complaint"))
		{
			response.sendRedirect("admin/complaintsPage.jsp");
		}
		else if(action.equals("Closing Authority"))
		{
			response.sendRedirect("admin/closingRemarks.jsp");
		}
		else if(action.equals("View closed Complaint"))
		{
			response.sendRedirect("admin/closedComplaints.jsp");
		}
		
	}

}
