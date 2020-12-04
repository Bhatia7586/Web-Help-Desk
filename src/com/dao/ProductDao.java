package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Product;
import com.bean.ProductCategory;
import com.util.HibernateUtil;

public class ProductDao {

	public static void addProductCategory(ProductCategory pc) {

		Session session = HibernateUtil.getConnection();
		Transaction tr = session.beginTransaction();
		session.save(pc);
		tr.commit();
		session.close();
		
	}
	
	public static List<ProductCategory> getProductCategory()
	{
		Session session = HibernateUtil.getConnection();
		List<ProductCategory> pclist = session.createQuery("from ProductCategory").list();
		session.close();
		return pclist;
	}

	public static void addProduct(Product p) {

		Session session = HibernateUtil.getConnection();
		Transaction tr = session.beginTransaction();
		session.save(p);
		tr.commit();
		session.close();
		
	}
	
	public static List<Product> getProduct()
	{
		Session session = HibernateUtil.getConnection();
		List<Product> plist = session.createQuery("from Product").list();
		session.close();
		return plist;
	}

}
