package com.tam.dao.impl;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tam.model.User;

@Repository("userDao")
public class UserDaoImpl extends GenericDaoImpl<User, Integer> {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public User getUser(String userName) {
		Query query = sessionFactory.getCurrentSession().createQuery("from User where userName = :username ");
		query.setParameter("username", userName);
		User user =  (User)query.list().get(0);
		return user;
	}
	
	public void addUser(User user) {
		sessionFactory.getCurrentSession().persist(user); 
	}
	
	public void updateUser(User user) {
		sessionFactory.getCurrentSession().update(user); 
	}

}
