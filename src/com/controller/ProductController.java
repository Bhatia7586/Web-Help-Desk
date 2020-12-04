package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Product;
import com.bean.ProductCategory;
import com.dao.ProductDao;


@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action.equals("Add"))
		{
			ProductCategory pc = new ProductCategory();
			
			pc.setProductCategory(request.getParameter("productCategory"));
			
			ProductDao.addProductCategory(pc);
			
			response.sendRedirect("admin/productCategory.jsp");
		}
		else if(action.equals("View"))
		{
			response.sendRedirect("admin/viewProducts.jsp");
		}
		else if(action.equals("Add Product"))
		{
			Product p = new Product();
			
			p.setName(request.getParameter("name"));
			p.setDescription(request.getParameter("description"));
			
			ProductCategory pc = new ProductCategory();
			pc.setId(Long.parseLong(request.getParameter("category")));
			
			
			p.setCategory(pc);
			p.setLot(Long.parseLong(request.getParameter("lot")));
			p.setQuantity(Long.parseLong(request.getParameter("quantity")));
			p.setPrice(Double.parseDouble(request.getParameter("price")));
			
			ProductDao.addProduct(p);
			
			response.sendRedirect("admin/addProduct.jsp");
		}
		else if(action.equals("View Product"))
		{
			response.sendRedirect("admin/viewProducts.jsp");
		}
		
	}

}
