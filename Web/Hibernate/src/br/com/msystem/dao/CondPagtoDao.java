package br.com.msystem.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import br.com.msystem.vo.CondPagto;

public class CondPagtoDao extends GenericDaoHibernate<CondPagto> {

	public CondPagtoDao() {
		super(CondPagto.class);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<CondPagto> listarDropDown(String searchTerm) {
		log.debug("listando condicao de pagamento conforme termo de pesquisa: "
				+ searchTerm);
		Criteria criteria = getSessionFactory()
				.getCurrentSession()
				.createCriteria(CondPagto.class, "condPagto")
				.setProjection(
						Projections
								.projectionList()
								.add(Projections
										.property("condPagto.condPagtoSq"))
								.add(Projections
										.property("condPagto.codigoCondPagto"))
								.add(Projections
										.property("condPagto.descricaoCondPagto")))
				.add(Restrictions.or(
						Restrictions.like("codigoCondPagto", searchTerm),
						Restrictions.like("descricaoCondPagto", searchTerm)));
		return criteria.list();
	}
}