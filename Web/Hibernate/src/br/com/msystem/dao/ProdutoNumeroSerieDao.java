package br.com.msystem.dao;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.msystem.vo.ProdutoNumeroSerie;

public class ProdutoNumeroSerieDao extends GenericDaoHibernate<ProdutoNumeroSerie> {

	public ProdutoNumeroSerieDao() {
		super(ProdutoNumeroSerie.class);
	}
	
	public ProdutoNumeroSerie buscarNumeroSerieEstoque(String numeroSerie) {
		log.debug("getting " + typeClass + " instance em estoque with numeroSerie: " + numeroSerie);
		try {
			Criteria criteria = getSessionFactory().getCurrentSession().createCriteria(ProdutoNumeroSerie.class);
			criteria.add(Restrictions.eq("numeroSerie", numeroSerie));
			criteria.add(Restrictions.isNull("dataUltimaSaida"));
			
			return (ProdutoNumeroSerie) criteria.uniqueResult();
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public ProdutoNumeroSerie buscarNumeroSerie(String numeroSerie) {
		log.debug("getting " + typeClass + " instance with numeroSerie: " + numeroSerie);
		try {
			Criteria criteria = getSessionFactory().getCurrentSession().createCriteria(ProdutoNumeroSerie.class);
			criteria.add(Restrictions.eq("numeroSerie", numeroSerie));
			
			return (ProdutoNumeroSerie) criteria.uniqueResult();
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
