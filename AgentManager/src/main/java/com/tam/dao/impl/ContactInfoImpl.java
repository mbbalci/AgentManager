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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tam.dao.IContactInfoDao;
import com.tam.model.ContactInfo;

/**
 * Home object for domain model class ContactInfo.
 * @see .ContactInfo
 * @author Hibernate Tools
 */
@Repository("contactInfoDao")
public class ContactInfoImpl implements IContactInfoDao {

	private static final Log log = LogFactory.getLog(ContactInfoImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void add(ContactInfo transientInstance) {
		log.debug("persisting ContactInfo instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	@Override
	public void update(ContactInfo instance) {
		log.debug("attaching dirty ContactInfo instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ContactInfo instance) {
		log.debug("attaching clean ContactInfo instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(ContactInfo persistentInstance) {
		log.debug("deleting ContactInfo instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ContactInfo merge(ContactInfo detachedInstance) {
		log.debug("merging ContactInfo instance");
		try {
			ContactInfo result = (ContactInfo) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	@Override
	public ContactInfo get(java.lang.Integer id) {
		log.debug("getting ContactInfo instance with id: " + id);
		try {
			ContactInfo instance = (ContactInfo) sessionFactory.getCurrentSession().get("ContactInfo", id);
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

	public List findByExample(ContactInfo instance) {
		log.debug("finding ContactInfo instance by example");
		try {
			List results = sessionFactory.getCurrentSession().createCriteria("ContactInfo")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
