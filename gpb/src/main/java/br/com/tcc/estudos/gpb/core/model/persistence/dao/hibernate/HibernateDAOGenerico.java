package br.com.tcc.estudos.gpb.core.model.persistence.dao.hibernate;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.criterion.Criterion;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import br.com.tcc.estudos.gpb.core.model.persistence.dao.GenericDAO;

//Adicionando herança ao HibernateDaoSupport tempos diversas funcionalidades do Spring  
//junto ao Hibernate, implementamos também nosso DAO generico para ter mobilidade.  
public class HibernateDAOGenerico<T, ID extends Serializable> extends
		HibernateDaoSupport implements GenericDAO<T, ID> {

	private static Log LOG = LogFactory.getLog(HibernateDAOGenerico.class);

	// Nosso construtor vai setar automaticamente via Reflection qual classe
	// estamos tratando.
	@SuppressWarnings("unchecked")
	public HibernateDAOGenerico() {
		this.persistentClass = (Class<T>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}

	// Classe que será persistida.
	private Class<T> persistentClass;

	public Class<T> getPersistentClass() {
		return this.persistentClass;
	}

	public void delete(T entity) {
		try {
			this.getHibernateTemplate().delete(entity);
		} catch (final HibernateException ex) {
			HibernateDAOGenerico.LOG.error(ex);
			throw convertHibernateAccessException(ex);
		}
	}

	@SuppressWarnings("unchecked")
	public T findById(ID id) {
		try {
			return (T) this.getHibernateTemplate()
					.get(getPersistentClass(), id);
		} catch (final HibernateException ex) {
			HibernateDAOGenerico.LOG.error(ex);
			throw convertHibernateAccessException(ex);
		}
	}

	public List<T> listAll() {
		try {
			return this.getHibernateTemplate().loadAll(getPersistentClass());
		} catch (final HibernateException ex) {
			HibernateDAOGenerico.LOG.error(ex);
			throw convertHibernateAccessException(ex);
		}
	}

	public T save(T entity) {
		try {
			this.getHibernateTemplate().save(entity);
			return entity;
		} catch (final HibernateException ex) {
			HibernateDAOGenerico.LOG.error(ex);
			throw convertHibernateAccessException(ex);
		}
	}

	protected List<T> findByCriteria(Criterion... criterion) {
		try {
			Criteria crit = this.getHibernateTemplate().getSessionFactory()
					.getCurrentSession().createCriteria(getPersistentClass());
			for (Criterion c : criterion) {
				crit.add(c);
			}
			return crit.list();
		} catch (final HibernateException ex) {
			HibernateDAOGenerico.LOG.error(ex);
			throw convertHibernateAccessException(ex);
		}
	}
}