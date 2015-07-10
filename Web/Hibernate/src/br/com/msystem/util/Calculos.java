package br.com.msystem.util;

import br.com.msystem.bo.GenericBo;
import br.com.msystem.exceptions.SystemException;
import br.com.msystem.vo.Clientes;
import br.com.msystem.vo.CondPagto;
import br.com.msystem.vo.Empresas;
import br.com.msystem.vo.Estado;
import br.com.msystem.vo.EstadoIva;
import br.com.msystem.vo.Naturezas;
import br.com.msystem.vo.Produtos;

public class Calculos {

	public static void atualizaItem(Clientes cliente, Produtos produto, Naturezas natureza,
			CondPagto condicaoPagamento, long valorUnitario, long valorDesconto, 
			long valorDolar, long quantidade, Long aliquotaIcms, Long aliquotaIpi, 
			Long valorIpi, Long valorUnitarioSemIpi, Long valorTotal, Long valorTotalSemIpi,
			Long porcentagemDesconto, Long valorIcms, Long porcentagemJuros,
			Long baseIcmsSubst, Long valorIcmsSubst, Long baseIcms, Long valorJuros,
			Long valorFrete, Long valorSeguro, Long valorDespAcess) throws SystemException {

		Empresas empresa = GenericBo.getInstance(Empresas.class).buscaPorId(1);

		aliquotaIpi = produto.getNbm().getAliqIpi().longValue();
		aliquotaIcms = produto.getNbm().getAliqIcms().longValue();

		Estado exemploEstado = new Estado();
		exemploEstado.setCodigoEstado(cliente.getEstado());
		Estado estado = GenericBo.getInstance(Estado.class).listar(exemploEstado, false, null).get(0);

		EstadoIva exemploEstadoIva = new EstadoIva(produto.getNbm(), estado);
		Long aliquotaIva = GenericBo.getInstance(EstadoIva.class).listar(exemploEstadoIva, false, null).get(0).getAliqIva().longValue();
		
		valorIpi = 0L;
		valorIcms = 0L;
		valorIcmsSubst = 0L;
		valorTotal = 0L;
		porcentagemDesconto = 0l;
		porcentagemJuros = 0l;
//		long valorIpiUnitario = 0l;
		valorUnitarioSemIpi = 0l;
		valorTotalSemIpi = 0l;
		long valorUnitarioReal = Math.round(valorUnitario * valorDolar * 100) / 100;
		baseIcms = 0l;
		long baseIpi = 0l;
		baseIcmsSubst = 0l;

		if (valorUnitarioReal * quantidade == 0)
			return;
		
		porcentagemDesconto = (valorDesconto * 100) / (valorUnitarioReal * quantidade);
		porcentagemJuros = (valorJuros * 100) / (valorUnitarioReal * quantidade);
		
		if (natureza.getTipoNfiscal() != TipoNfiscal.Importacao.getCodigo()) {
			if (cliente.getInscrEstadual().equals("") || 
					(cliente.getTipoCliente().getTipoClienteSq() == 1) || 
					(cliente.getInscrEstadual().toUpperCase().contains("ISENT"))) {
				// Tanto CNPF quanto CPF devem ser conforme ISENTO (11/09/09)
				if (produto.getTipoProduto() == 1) {
					aliquotaIcms = empresa.getAliqIcmsProd1().longValue();
				} else if (produto.getTipoProduto() == 2) {
					aliquotaIcms = empresa.getAliqIcmsPec1().longValue();
				}
			} else {
				if (cliente.getEstado().equals(empresa.getEstado())) {
					aliquotaIcms = produto.getNbm().getAliqIcms().longValue(); //Pessoa F/J do estado
				} else {
					aliquotaIcms = natureza.getAliqIcms().longValue(); // Pessoa F/J fora do estado
				}
			}
		}
		
		if (natureza.getIsencaoIcms().equals("S")) {
			aliquotaIcms = 0l;
		}
		
		if (natureza.getIsencaoIpi().equals("S")) {
			aliquotaIpi = 0l;
		}
		
		valorTotal = (valorUnitarioReal * quantidade) + valorJuros - valorDesconto;
		baseIpi = valorTotal;
		long valorIpiProduto = Math.round(100 * baseIpi * aliquotaIpi / (100 + aliquotaIpi)) / 100;
		long valorIpiOutros = Math.round((valorFrete + valorSeguro + valorDespAcess) * aliquotaIpi) / 100;
		
		//DECRETO Nº 7.212, DE 15 DE JUNHO DE 2010
		//Frete, Seguro e Desp Acess entram na base de calculo no IPI
		baseIpi += valorFrete + valorSeguro + valorDespAcess;
		valorIpi = valorIpiProduto + valorIpiOutros;

		if (empresa.getCodigoRegimeTributario() < 3) {
			baseIcms = 0l;
		} else {
			if (cliente.getTipoCliente().getTipoClienteSq() == 1) {
				baseIcms = baseIpi + valorIpiOutros;
			} else {
				baseIcms = baseIpi - valorIpiProduto;
			}
		}
		
		/* Base de Calculo do ICMS deve ser 0 (zero) para os isentos de pagamento que abrangem: 
		 * Simples remessa, retorno de armazem, remessa de armazem, demonstraçao e outras saidas.
		 * Tanto de SP como para outros Estados. 12/08/2011
		 */

		// isento de pagamentos
		if ((condicaoPagamento != null) && (condicaoPagamento.getParcelas() == 0)) {
			TipoNfiscal tipoNfiscal = TipoNfiscal.fromInteger(natureza.getTipoNfiscal());
			if (tipoNfiscal.equals(TipoNfiscal.SimplesRemessa)) {
				baseIcms = 0l;
			} else if (tipoNfiscal.equals(TipoNfiscal.SimplesRemessa)) {
				baseIcms = 0l;
			} else if (tipoNfiscal.equals(TipoNfiscal.Retorno)) {
				baseIcms = 0l;
			} else if (tipoNfiscal.equals(TipoNfiscal.Remessa)) {
				baseIcms = 0l;
			} else if (tipoNfiscal.equals(TipoNfiscal.Demonstracao)) {
				baseIcms = 0l;
			} else if (tipoNfiscal.equals(TipoNfiscal.Outros)) {
				baseIcms = 0l;
			} 
		}

		valorIcms = (long) (Math.round(baseIcms * aliquotaIcms) / 100);
//		valorIpiUnitario = Math.round(100 * valorIpiProduto / quantidade) / 100;
		valorTotalSemIpi = valorTotal - valorIpiProduto;
		
		if ((!natureza.getCfoSubst().equals("")) && (aliquotaIva > 0)) {
			baseIcmsSubst = (valorTotal + valorFrete + valorSeguro + valorDespAcess + valorIpiOutros) * (1 + (aliquotaIva / 100));
			valorIcmsSubst = baseIcmsSubst * estado.getAliqIcmsIntra().longValue() / 100 - valorIcms;
			if (valorIcmsSubst < 0) {
				valorIcmsSubst = 0l;
			}
		}
	}
}
