package br.com.msystem.bo;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import br.com.msystem.exceptions.SystemException;
import br.com.msystem.util.Calculos;
import br.com.msystem.util.TipoMovimentacaoEstoque;
import br.com.msystem.vo.Kardex;
import br.com.msystem.vo.NfEntradas;
import br.com.msystem.vo.NfEntradasItens;
import br.com.msystem.vo.ProdutoNumeroSerie;
import br.com.msystem.vo.Produtos;

public class NfEntradasBo extends GenericBo<NfEntradas> {

	private AbstractBo<Kardex> kardexBo = GenericBo.getInstance(Kardex.class);
	private ProdutosBo produtoBo = (ProdutosBo) GenericBo.getInstance(Produtos.class);
	private ProdutoNumeroSerieBo produtoNumeroSerieBo = (ProdutoNumeroSerieBo) GenericBo.getInstance(ProdutoNumeroSerie.class);
	
	private NfEntradasBo(Class<NfEntradas> argClass) throws SystemException {
		super(argClass);
	}

	private static NfEntradasBo instance;

	public static NfEntradasBo getInstance() throws SystemException {
		if (instance == null)
			instance = new NfEntradasBo(NfEntradas.class);
		return instance;
	}

	public void entradaEstoque(NfEntradas instance) throws SystemException {
		Date dataMovimentacao = Calendar.getInstance().getTime();
		
		if (!instance.getNaturezas().getEntSai().equals("E")) {
			throw new SystemException("A natureza da nota fiscal não é de entrada. Impossível transferir a nota.");
		}
		
		for (NfEntradasItens item: instance.getNfEntradasItenses()) {
			if (item.getProdutos().getControleNumeroSerie() == 0) {
				Kardex exemplo = new Kardex();
				exemplo.setProdutos(item.getProdutos());
				exemplo.setTipoMov(TipoMovimentacaoEstoque.Entrada.toString());
				exemplo.setNfiscal(instance.getNumeroNfEnt());
				exemplo.setData(dataMovimentacao);
				
				List<Kardex> listaMovimentacao = GenericBo.getInstance(Kardex.class).listar(exemplo, false, null);
				if (listaMovimentacao.size() == 0) {
					produtoBo.movimentarEstoque(dataMovimentacao, new String(item.getNrSerieItem()), item.getNumeroEstoque(), item.getProdutos(), item.getQtdeItem(), TipoMovimentacaoEstoque.Entrada, null, item.getVlrTotalItem().longValue(), null);
				}
			} else {
				String[] listaNumeroSerie = new String(item.getNrSerieItem()).split(",");
				for (String numeroSerie: listaNumeroSerie) {
					produtoNumeroSerieBo.movimentarEstoque(numeroSerie, TipoMovimentacaoEstoque.Entrada, item.getProdutos(), item.getNumeroEstoque(), instance.getNumeroNfEnt(), null, item.getVlrTotalItem());
				}
			}
		}
		instance.setTransferida("S");
		instance.setDtEntrada(dataMovimentacao);
		salvar(instance);
	}
	
	public void totalizarNotaFiscal(NfEntradas instance) {
		//Só calcula o item se nao deu entrada na nota.
		if (instance.getDtEntrada() != null)
			return;
		
		long aliqIcms = 0;
		long baseIcms = 0;
		long vlrIcms  = 0;
		long vlrIpi   = 0;
		long vlrProd  = 0;

		for (NfEntradasItens item: instance.getNfEntradasItenses()) {
			if (item.getAliqIcmsItem().longValue() > aliqIcms) {
				aliqIcms = item.getAliqIcmsItem().longValue();
			}
			baseIcms += item.getVlrTotalItem().longValue();
			vlrIcms  += item.getVlrIcmsItem().longValue();
			vlrIpi   += item.getVlrIpiItem().longValue();
			vlrProd  += item.getVlrTotalItem().longValue();
		}

		long vlrTotal = vlrProd + vlrIpi + instance.getVlrFrete().longValue() + instance.getVlrSeguro().longValue() + instance.getVlrDespAcess().longValue();
		
		instance.setBaseIcms(new BigDecimal(baseIcms));
		instance.setVlrIcms(new BigDecimal(vlrIcms));
		instance.setVlrIpi(new BigDecimal(vlrIpi));
		instance.setVlrProdutos(new BigDecimal(vlrProd));
		instance.setVlrTotal(new BigDecimal(vlrTotal));
	}
	
	public void atualizaListaItem(NfEntradas instance) throws SystemException {
		//Só calcula o item se nao deu entrada na nota.
		if (instance.getDtEntrada() != null)
			return;

		for (NfEntradasItens item: instance.getNfEntradasItenses()) {
			Long aliquotaIcms = 0l;
			Long aliquotaIpi = 0l;
			Long valorIpi = 0l;
			Long valorUnitarioSemIpi = 0l;
			Long valorTotal = 0l;
			Long valorTotalSemIpi = 0l;
			Long porcentagemDesconto = 0l;
			Long valorIcms = 0l;
			Long porcentagemJuros = 0l;
			Long baseIcmsSubst = 0l;
			Long valorIcmsSubst = 0l;
			Long baseIcms = 0l;
			Long valorJuros = 0l;
			
			Calculos.atualizaItem(instance.getClientes(), item.getProdutos(), instance.getNaturezas(), null,
					item.getVlrUnitItem().longValue(), 0l, 1l, item.getQtdeItem().longValue(), aliquotaIcms,
					aliquotaIpi, valorIpi, valorUnitarioSemIpi, valorTotal, valorTotalSemIpi, porcentagemDesconto,
					valorIcms, porcentagemJuros, baseIcmsSubst, valorIcmsSubst, baseIcms, valorJuros, 0l, 0l, 0l);

			item.setAliqIcmsItem(new BigDecimal(aliquotaIcms));
			item.setVlrIcmsItem(new BigDecimal(valorIcms));
			item.setAliqIpiItem(new BigDecimal(aliquotaIpi));
			item.setVlrIpiItem(new BigDecimal(valorIpi));
			item.setVlrTotalItem(new BigDecimal(valorTotalSemIpi));
		}
		totalizarNotaFiscal(instance);
	}
	
	public void cancelaEntrada(NfEntradas instance) throws SystemException {
		for (NfEntradasItens item: instance.getNfEntradasItenses()) {
			Kardex exemplo = new Kardex();
			exemplo.setProdutos(item.getProdutos());
			exemplo.setTipoMov(TipoMovimentacaoEstoque.Entrada.toString());
			exemplo.setNfiscal(instance.getNumeroNfEnt());
			exemplo.setData(instance.getDtEntrada());
			List<Kardex> listaMovimentacao = kardexBo.listar(exemplo , false, null);
			
			if (listaMovimentacao.size() == 0) {
				continue;
			}
			
			if (item.getProdutos().getControleNumeroSerie() == 0) {
				produtoBo.movimentarEstoque(Calendar.getInstance().getTime(), new String(item.getNrSerieItem()), 
						item.getNumeroEstoque(), item.getProdutos(), item.getQtdeItem() * -1, TipoMovimentacaoEstoque.Entrada, null, item.getVlrTotalItem().longValue(), null);
			} else {
				String[] listaNumeroSerie = new String(item.getNrSerieItem()).split(",");
				for (String numeroSerie: listaNumeroSerie) {
					produtoBo.movimentarEstoque(Calendar.getInstance().getTime(), numeroSerie, 
					item.getNumeroEstoque(), item.getProdutos(), -1, TipoMovimentacaoEstoque.Entrada, null, item.getVlrTotalItem().longValue() / item.getQtdeItem(), null);
					produtoNumeroSerieBo.excluir(produtoNumeroSerieBo.buscarNumeroSerieEstoque(numeroSerie).getProdutoNumeroSerieSq());
				}
			}
		}
		instance.setTransferida("N");
		instance.setDtEntrada(null);
		salvar(instance);
	}
}
