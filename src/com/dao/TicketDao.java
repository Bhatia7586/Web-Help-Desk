package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Ticket;
import com.util.HibernateUtil;

public class TicketDao {

	public static void addTicket(Ticket t) {

		Session session = HibernateUtil.getConnection();
		Transaction tr = session.beginTransaction();
		session.save(t);
		tr.commit();
		session.close();
		
	}
	
	public static List<Ticket> getTickets()
	{
		Session session = HibernateUtil.getConnection();
		List<Ticket> tlist = session.createQuery("from Ticket").list();
		session.close();
		return tlist;
	}

	public static Ticket getTicketById(long id) {

		Session session = HibernateUtil.getConnection();
		Ticket t2 = session.get(Ticket.class, id);
		session.close();
		return t2;
	}

}
