package com.tam.dao.impl;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tam.dao.PaxDao;
import com.tam.model.Pax;

@Repository("PaxDao")
public class PaxDoaImpl implements PaxDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Pax getPax(Integer id) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Pax where id = :id ");
		query.setParameter("id", id);
		Pax pax =  (Pax)query.list().get(0);
		return pax;
	}

	@Override
	public void addPax(Pax pax) {
		sessionFactory.getCurrentSession().save(pax);
	}

	@Override
	public void updatePax(Pax pax) {
		sessionFactory.getCurrentSession().update(pax);
	}

}
