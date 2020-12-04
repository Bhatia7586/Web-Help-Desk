package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Admin;
import com.util.HibernateUtil;

public class AdminDao {

	public static void addAdmin(Admin a) {

		Session session = HibernateUtil.getConnection();
		Transaction tr = session.beginTransaction();
		session.save(a);
		tr.commit();
		session.close();
		
	}

	public static Admin login(Admin a) {

		Session session = HibernateUtil.getConnection();
		List<Admin> alist = session.createQuery("from Admin").list();
		session.close();
		Admin a2 = null;
		for(Admin admin : alist)
		{
			if(admin.getEmail().equals(a.getEmail()) && admin.getPassword().equals(a.getPassword()))
			{
				a2 = new Admin();
				a2.setId(admin.getId());
				a2.setName(admin.getName());
				a2.setEmail(admin.getEmail());
				a2.setPassword(admin.getPassword());
			}
		}
		return a2;
	}

}
