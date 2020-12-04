package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Complaint;
import com.bean.ComplaintCategory;
import com.util.HibernateUtil;

public class ComplaintDao {

	public static void addComplaintCategory(ComplaintCategory cc) {

		Session session = HibernateUtil.getConnection();
		Transaction tr = session.beginTransaction();
		session.save(cc);
		tr.commit();
		session.close();
		
	}
	
	public static List<ComplaintCategory> getComplaintCategory()
	{
		Session session = HibernateUtil.getConnection();
		List<ComplaintCategory> cclist = session.createQuery("from ComplaintCategory").list();
		session.close();
		return cclist;
	}

	public static void addComplaint(Complaint c) {

		Session session = HibernateUtil.getConnection();
		Transaction tr = session.beginTransaction();
		session.save(c);
		tr.commit();
		session.close();
		
	}
	
	public static List<Complaint> getComplaint()
	{
		Session session = HibernateUtil.getConnection();
		List<Complaint> clist = session.createQuery("from Complaint").list();
		session.close();
		return clist;
	}

	public static Complaint getComplaintById(Complaint c) {

		Session session = HibernateUtil.getConnection();
		Complaint c2 = session.get(Complaint.class, c.getId());
		session.close();
		return c2;
	}

	public static void updateComplaint(Complaint c) {

		Session session = HibernateUtil.getConnection();
		Transaction tr = session.beginTransaction();
		session.update(c);
		tr.commit();
		session.close();
		
	}
	
	public static List<Complaint> getComplaintIfComplete(){
		
		Session session = HibernateUtil.getConnection();
		List<Complaint> clist = session.createQuery("from Complaint where status=:Complete").list();
		session.close();
		return clist;
	}

}
