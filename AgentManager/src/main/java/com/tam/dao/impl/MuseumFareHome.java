// default package
// Generated Oct 8, 2015 9:11:51 AM by Hibernate Tools 4.3.1.Final

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class MuseumFare.
 * @see .MuseumFare
 * @author Hibernate Tools
 */
public class MuseumFareHome {

	private static final Log log = LogFactory.getLog(MuseumFareHome.class);

	private final SessionFactory sessionFactory = getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext().lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException("Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(MuseumFare transientInstance) {
		log.debug("persisting MuseumFare instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(MuseumFare instance) {
		log.debug("attaching dirty MuseumFare instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(MuseumFare instance) {
		log.debug("attaching clean MuseumFare instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(MuseumFare persistentInstance) {
		log.debug("deleting MuseumFare instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public MuseumFare merge(MuseumFare detachedInstance) {
		log.debug("merging MuseumFare instance");
		try {
			MuseumFare result = (MuseumFare) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public MuseumFare findById(java.lang.Integer id) {
		log.debug("getting MuseumFare instance with id: " + id);
		try {
			MuseumFare instance = (MuseumFare) sessionFactory.getCurrentSession().get("MuseumFare", id);
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

	public List findByExample(MuseumFare instance) {
		log.debug("finding MuseumFare instance by example");
		try {
			List results = sessionFactory.getCurrentSession().createCriteria("MuseumFare").add(Example.create(instance))
					.list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
