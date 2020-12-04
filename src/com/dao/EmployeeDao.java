package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Designation;
import com.bean.Employee;
import com.util.HibernateUtil;

public class EmployeeDao {

	public static void addJob(Designation d) {

		Session session = HibernateUtil.getConnection();
		Transaction tr = session.beginTransaction();
		session.save(d);
		tr.commit();
		session.close();
		
	}

	public static List<Designation> getDesignation()
	{
		Session session = HibernateUtil.getConnection();
		List<Designation> dlist = session.createQuery("from Designation").list();
		session.close();
		return dlist;
	}

	public static void addEmployee(Employee e) {

		Session session = HibernateUtil.getConnection();
		Transaction tr = session.beginTransaction();
		session.save(e);
		tr.commit();
		session.close();
		
	}
	
	public static List<Employee> getEmployee()
	{
		Session session = HibernateUtil.getConnection();
		List<Employee> dlist = session.createQuery("from Employee").list();
		session.close();
		return dlist;
	}
	
}
