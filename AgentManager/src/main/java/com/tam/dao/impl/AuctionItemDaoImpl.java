package com.tam.dao.impl;
// default package
// Generated Oct 8, 2015 9:11:51 AM by Hibernate Tools 4.3.1.Final

import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tam.dao.IAuctionItemDao;
import com.tam.model.AuctionItem;

/**
 * Home object for domain model class AuctionItem.
 * @see .AuctionItem
 * @author Hibernate Tools
 */

@Repository("auctionItem")
public class AuctionItemDaoImpl implements IAuctionItemDao {

	private static final Logger log = LoggerFactory.getLogger(AuctionItemDaoImpl.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void add(AuctionItem transientInstance) {
		log.debug("persisting AuctionItem instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	@Override
	public void update(AuctionItem instance) {
		log.debug("attaching dirty AuctionItem instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(AuctionItem instance) {
		log.debug("attaching clean AuctionItem instance");
		try {
			sessionFactory.getCurrentSession().load(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(AuctionItem persistentInstance) {
		log.debug("deleting AuctionItem instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public AuctionItem merge(AuctionItem detachedInstance) {
		log.debug("merging AuctionItem instance");
		try {
			AuctionItem result = (AuctionItem) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	@Override
	public AuctionItem get(java.lang.Integer id) {
		log.debug("getting AuctionItem instance with id: " + id);
		try {
			AuctionItem instance = (AuctionItem) sessionFactory.getCurrentSession().get("AuctionItem", id);
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
