package br.com.msystem.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.transform.AliasToBeanResultTransformer;

import br.com.msystem.bean.LancamentoContaPagar;
import br.com.msystem.vo.ContasPagarAuto;

public class ContaPagarAutoDao extends GenericDaoHibernate<ContasPagarAuto> {

	public ContaPagarAutoDao() {
		super(ContasPagarAuto.class);
	}
	
	@SuppressWarnings("unchecked")
	public List<LancamentoContaPagar> gerarLancamento(int referencia) {
		log.debug("gerando lancamento no contas a pagar da referencia: " + referencia);
		try {
			String sql = "select conta_pagar_sq, fornecedor_sq, numero_duplicata, valor_duplicata, dtcadastro_duplicata, " +
					"dtvencimento_duplicata, observacao, conta_pagar_auto_sq, referencia_auto " +
					"from contas_pagar " +
					"where referencia_auto = :anomes " +
					"union " +
					"select null, fornecedor_sq, null, valor, now(), date(concat(\":ano-:mes-\", day(data_inicial))), observacao, " +
					"conta_pagar_auto_sq, :anomes " +
					"from contas_pagar_auto " +
					"where YEAR(data_inicial)*100+MONTH(data_inicial) <= :anomes " +
					"and year(date_add(data_inicial, interval parcelas month))*100 + MONTH(date_add(data_inicial, interval parcelas month)) >= :anomes";
			
			SQLQuery query = getSessionFactory().getCurrentSession().createSQLQuery(sql);
			query.setParameter("ano", Math.floor(referencia / 100));
			query.setParameter("mes", referencia % 100);
			query.setParameter("anomes", referencia);
			query.setResultTransformer(new AliasToBeanResultTransformer(LancamentoContaPagar.class));
			
			return query.list();
		} catch (RuntimeException re) {
			log.error("geracao dos lancamentos falhou", re);
			throw re;
		}
	}
}


