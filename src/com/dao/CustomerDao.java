package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Customer;
import com.util.HibernateUtil;

public class CustomerDao {

	public static void updateCustomer(Customer c) {

		Session session = HibernateUtil.getConnection();
		Transaction tr = session.beginTransaction();
		session.saveOrUpdate(c);
		tr.commit();
		session.close();
		
	}

	public static Customer getCustomerByEmail(String email) {

		Session session = HibernateUtil.getConnection();
		Customer c2 = session.get(Customer.class, email);
		session.close();
		return c2;
	}

	public static Customer getCustomerById(long l) {
		
		Session session = HibernateUtil.getConnection();
		Customer c2 = session.get(Customer.class, l);
		session.close();
		return c2;
	}

	public static void addCustomer(Customer c) {

		Session session = HibernateUtil.getConnection();
		Transaction tr = session.beginTransaction();
		session.saveOrUpdate(c);
		tr.commit();
		session.close();
		
	}

	public static Customer login(Customer c) {

		Session session = HibernateUtil.getConnection();
		List<Customer> clist = session.createQuery("from Customer").list();
		session.close();
		
		Customer c2 = null;
		
		for(Customer cus : clist)
		{
			if(cus.getEmail().equals(c.getEmail()) && cus.getPassword().equals(c.getPassword()))
			{
				c2 = new Customer();
				c2.setId(cus.getId());
				c2.setFirstname(cus.getFirstname());
				c2.setLastname(cus.getLastname());
				c2.setEmail(cus.getEmail());
				c2.setPassword(cus.getPassword());
				c2.setGender(cus.getGender());
				c2.setPhone(cus.getPhone());
			}
		}
		System.out.println(clist);
		System.out.println(c2.getFirstname());
		return c2;
		
	}

}
