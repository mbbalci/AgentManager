package com.tam.dao.impl;
// default package
// Generated Oct 8, 2015 9:11:51 AM by Hibernate Tools 4.3.1.Final

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.tam.model.HotelReservation;

/**
 * Home object for domain model class HotelReservation.
 * @see .HotelReservation
 * @author Hibernate Tools
 */
public class HotelReservationDaoImpl extends GenericDaoImpl<HotelReservationDaoImpl,Integer> {

	
	public void save(HotelReservation transientInstance) {
		log.debug("persisting HotelReservation instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(HotelReservation instance) {
		log.debug("attaching dirty HotelReservation instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(HotelReservation instance) {
		log.debug("attaching clean HotelReservation instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(HotelReservation persistentInstance) {
		log.debug("deleting HotelReservation instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public HotelReservation merge(HotelReservation detachedInstance) {
		log.debug("merging HotelReservation instance");
		try {
			HotelReservation result = (HotelReservation) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public HotelReservation findById(java.lang.Integer id) {
		log.debug("getting HotelReservation instance with id: " + id);
		try {
			HotelReservation instance = (HotelReservation) sessionFactory.getCurrentSession().get("HotelReservation",
					id);
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

	public List findByExample(HotelReservation instance) {
		log.debug("finding HotelReservation instance by example");
		try {
			List results = sessionFactory.getCurrentSession().createCriteria("HotelReservation")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
