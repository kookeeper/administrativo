package br.com.msystem.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.msystem.vo.PedidosItens;

public class PedidosItensDao extends GenericDaoHibernate<PedidosItens> {

	public PedidosItensDao() {
		super(PedidosItens.class);
	}
	
	@SuppressWarnings("unchecked")
	public List<PedidosItens> listarItens(int pedidoSq) {
		log.debug("listando itens do pedido: " + pedidoSq);
		try {
			Criteria criteria = getSessionFactory().getCurrentSession().createCriteria(PedidosItens.class);
			criteria = criteria.add(Restrictions.eq("pedidos.pedidoSq", pedidoSq));
			return criteria.list();
		} catch (RuntimeException re) {
			log.error("listar itens do pedido falhou", re);
			throw re;
		}
	}
}


