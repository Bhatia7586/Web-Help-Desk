package com.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


import com.bean.Admin;
import com.bean.Complaint;
import com.bean.ComplaintCategory;
import com.bean.Customer;
import com.bean.Designation;
import com.bean.Employee;
import com.bean.Product;
import com.bean.ProductCategory;
import com.bean.Ticket;


public class HibernateUtil {
	
	public static Session getConnection()
	{
		Session s = null;
		SessionFactory sf = null;
		sf = new Configuration()
				.addAnnotatedClass(Admin.class)
				.addAnnotatedClass(Customer.class)
				.addAnnotatedClass(ProductCategory.class)
				.addAnnotatedClass(Product.class)
				.addAnnotatedClass(ComplaintCategory.class)
				.addAnnotatedClass(Ticket.class)
				.addAnnotatedClass(Designation.class)
				.addAnnotatedClass(Employee.class)
				.addAnnotatedClass(Complaint.class)
				.configure()
				.buildSessionFactory();
		s = sf.openSession();
		return s;
	}

}
