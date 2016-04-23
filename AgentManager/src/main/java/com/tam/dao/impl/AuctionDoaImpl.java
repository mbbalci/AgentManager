package com.tam.dao.impl;
// default package
// Generated Sep 30, 2015 8:15:03 AM by Hibernate Tools 4.3.1.Final
// Edited for spring by mb 

import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tam.dao.IAuctionDoa;
import com.tam.model.Auction;

/**
 * Home object for domain model class Auction.
 * @see .Auction
 * @author Hibernate Tools
 */
@Repository("auctionDoa")
public class AuctionDoaImpl implements IAuctionDoa {

	private static final Logger log = LoggerFactory.getLogger(AuctionDoaImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void add(Auction transientInstance) {
		log.debug("persisting Auction instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	@Override
	public void update(Auction instance) {
		log.debug("attaching dirty Auction instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Auction instance) {
		log.debug("attaching clean Auction instance");
		try {
			sessionFactory.getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Auction persistentInstance) {
		log.debug("deleting Auction instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Auction merge(Auction detachedInstance) {
		log.debug("merging Auction instance");
		try {
			Auction result = (Auction) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	@Override
	public Auction get(java.lang.Integer id) {
		log.debug("getting Auction instance with id: " + id);
		try {
			Auction instance = (Auction) sessionFactory.getCurrentSession().get("Auction", id);
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

	public List findByExample(Auction instance) {
		log.debug("finding Auction instance by example");
		try {
			List results = sessionFactory.getCurrentSession().createCriteria("Auction").add(Example.create(instance))
					.list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
