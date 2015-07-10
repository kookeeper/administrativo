package br.com.msystem.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToBeanResultTransformer;

import br.com.msystem.vo.Produtos;

public class ProdutosDao extends GenericDaoHibernate<Produtos> {

	public ProdutosDao() {
		super(Produtos.class);
	}
	
	@SuppressWarnings("unchecked")
	public List<Produtos> listarProdutoForaDaContagemBalanco(int balancoContagemSq) {
		log.debug("listando produtos que não estao no na contagem do balanco: " + balancoContagemSq);
		try {
			String sql = "select .produto_sq, p.modelo_sq, p.codigo_produto, p.descricao_produto, p.preco_unit " +
					"from produtos p " +
					"left join balanco_contagem_produto bcp on (bcp.produto_sq=p.produto_sq) " +
					"inner join balanco_contagem bc on (bc.balanco_contagem_sq = :balanco_contagem_sq)";
			
			SQLQuery query = getSessionFactory().getCurrentSession().createSQLQuery(sql);
			query.setParameter("balanco_contagem_sq", balancoContagemSq);
			query.setResultTransformer(new AliasToBeanResultTransformer(Produtos.class));
			
			return query.list();
		} catch (RuntimeException re) {
			log.error("geracao dos lancamentos falhou", re);
			throw re;
		}
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Produtos> listarDropDown(String searchTerm) {
		log.debug("listando produtos conforme termo de pesquisa: " + searchTerm);
		Criteria criteria = getSessionFactory().getCurrentSession().createCriteria(Produtos.class);
		criteria = criteria.add(Restrictions.or(Restrictions.like("codigoProduto", searchTerm), Restrictions.like("descricaoProduto", searchTerm)));
		return criteria.list();
	}
}