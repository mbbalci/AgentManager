package com.tam.dao.impl;
// Generated Oct 8, 2015 9:11:51 AM by Hibernate Tools 4.3.1.Final

import java.util.List;
import javax.naming.InitialContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.tam.model.AuctionPayment;

/**
 * Home object for domain model class AuctionPayment.
 * @see .AuctionPayment
 * @author Hibernate Tools
 */
public class AuctionPaymentImpl {

	private static final Logger log = LoggerFactory.getLogger(AuctionPaymentImpl.class);

	private final SessionFactory sessionFactory = getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext().lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException("Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(AuctionPayment transientInstance) {
		log.debug("persisting AuctionPayment instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(AuctionPayment instance) {
		log.debug("attaching dirty AuctionPayment instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(AuctionPayment instance) {
		log.debug("attaching clean AuctionPayment instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(AuctionPayment persistentInstance) {
		log.debug("deleting AuctionPayment instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public AuctionPayment merge(AuctionPayment detachedInstance) {
		log.debug("merging AuctionPayment instance");
		try {
			AuctionPayment result = (AuctionPayment) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public AuctionPayment findById(java.lang.Integer id) {
		log.debug("getting AuctionPayment instance with id: " + id);
		try {
			AuctionPayment instance = (AuctionPayment) sessionFactory.getCurrentSession().get("AuctionPayment", id);
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

	public List findByExample(AuctionPayment instance) {
		log.debug("finding AuctionPayment instance by example");
		try {
			List results = sessionFactory.getCurrentSession().createCriteria("AuctionPayment")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
