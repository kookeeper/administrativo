package br.com.msystem.dao;

import org.hibernate.SQLQuery;

import br.com.msystem.vo.Nfiscais;

public class NfiscaisDao extends GenericDaoHibernate<Nfiscais> {

	public NfiscaisDao() {
		super(Nfiscais.class);
	}
	
	public Integer quantidadeFaturada(int pedidoSq, int produtoSq) {
		log.debug("somar total faturado de um determinado pedido/produto: " + pedidoSq + "/" + produtoSq);
		try {
			String sql = "select sum(ni.qtde_item) qtde_faturado from nfiscais_itens ni " +
					"inner join nfiscais n on (n.nfiscal_sq = ni.nfiscal_sq) " +
					"where n.pedido_sq = :pedidoSq and n.cancelada <> 'S' and ni.produto_sq = :produtoSq";
			
			SQLQuery query = getSessionFactory().getCurrentSession().createSQLQuery(sql);
			query.setParameter("pedidoSq", pedidoSq);
			query.setParameter("produtoSq", produtoSq);

			return (Integer) query.uniqueResult();
		} catch (RuntimeException re) {
			log.error("geracao dos lancamentos falhou", re);
			throw re;
		}
	}
}
