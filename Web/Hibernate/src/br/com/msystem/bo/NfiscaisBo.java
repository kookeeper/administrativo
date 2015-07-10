package br.com.msystem.bo;

import java.math.BigDecimal;
import java.util.List;

import br.com.msystem.dao.NfiscaisDao;
import br.com.msystem.exceptions.SystemException;
import br.com.msystem.util.Calculos;
import br.com.msystem.util.TipoMovimentacaoEstoque;
import br.com.msystem.util.TipoNfiscal;
import br.com.msystem.vo.Duplicatas;
import br.com.msystem.vo.Empresas;
import br.com.msystem.vo.Estado;
import br.com.msystem.vo.EstadoIva;
import br.com.msystem.vo.Naturezas;
import br.com.msystem.vo.Nfiscais;
import br.com.msystem.vo.NfiscaisItens;
import br.com.msystem.vo.NfiscaisItensSerie;
import br.com.msystem.vo.Pedidos;
import br.com.msystem.vo.PedidosItens;
import br.com.msystem.vo.PedidosItensSerie;
import br.com.msystem.vo.ProdutoNumeroSerie;
import br.com.msystem.vo.Produtos;

public class NfiscaisBo extends GenericBo<Nfiscais> {

	private NfiscaisBo(Class<Nfiscais> argClass) throws SystemException {
		super(argClass);
	}

	private static NfiscaisBo instance;

	public static NfiscaisBo getInstance() throws SystemException {
		if (instance == null)
			instance = new NfiscaisBo(Nfiscais.class);
		return instance;
	}

	public void finalizar(Nfiscais instance) throws SystemException {
		if (instance.getConcluida().equals("S"))
			return;

		if (instance.getPedidos().getBaixouEstoque() == 'S')
			return;

		if (instance.getNaturezasByNaturezaSq().getEntSai().equals(""))
			return;

		boolean entrada = instance.getNaturezasByNaturezaSq().getEntSai()
				.equals("E");
		ProdutoNumeroSerieBo produtoNumeroSerieBo = (ProdutoNumeroSerieBo) GenericBo
				.getInstance(ProdutoNumeroSerie.class);
		ProdutosBo produtoBo = (ProdutosBo) GenericBo
				.getInstance(Produtos.class);

		for (NfiscaisItens item : instance.getNfiscaisItenses()) {
			Integer numeroEstoque = item.getNumeroEstoque();

			if (numeroEstoque == 0) {
				if (entrada) {
					numeroEstoque = instance.getNaturezasByNaturezaSq()
							.getNumeroEstoqueEntrada();
				} else {
					numeroEstoque = instance.getNaturezasByNaturezaSq()
							.getNumeroEstoqueSaida();
				}
			}

			if (item.getProdutos().getControleNumeroSerie() == 1) {
				for (NfiscaisItensSerie itemSerie : item
						.getNfiscaisItensSeries()) {
					TipoMovimentacaoEstoque tipoMovimentacao = TipoMovimentacaoEstoque
							.valueOf(instance.getNaturezasByNaturezaSq()
									.getEntSai());

					produtoNumeroSerieBo.movimentarEstoque(itemSerie
							.getProdutoNumeroSerie().getNumeroSerie(),
							tipoMovimentacao, item.getProdutos(),
							numeroEstoque, instance.getNumeroNfiscal(), null,
							item.getVlrTotalItem());
					/*
					 * produtoNumeroSerieBo.registrarSaida(itemSerie
					 * .getProdutoNumeroSerie().getNumeroSerie(),
					 * instance.getDtemissaoNfiscal(), item
					 * .getVlrTotalItem().longValue(),
					 * instance.getNumeroNfiscal());
					 */

					/*
					 * produtoNumeroSerieBo.registrarEntrada(itemSerie
					 * .getProdutoNumeroSerie().getNumeroSerie(), item
					 * .getProdutos(), numeroEstoque, instance
					 * .getDtemissaoNfiscal(), instance .getNumeroNfiscal(),
					 * item.getVlrTotalItem() .longValue());
					 */
				}
			} else {
				produtoBo.movimentarEstoque(instance.getDtemissaoNfiscal(),
						item.getNrSerieItem(), numeroEstoque, item
								.getProdutos(), item.getQtdeItem(),
						TipoMovimentacaoEstoque.valueOf(instance
								.getNaturezasByNaturezaSq().getEntSai()), null,
						item.getVlrTotalItem().longValue(), instance
								.getNumeroNfiscal());
			}

			// transferencia de produto
			if ((TipoMovimentacaoEstoque.valueOf(instance
					.getNaturezasByNaturezaSq().getEntSai())
					.equals(TipoMovimentacaoEstoque.Saida))
					&& (instance.getNaturezasByNaturezaSq()
							.getNumeroEstoqueEntrada() > 0)) {
				produtoBo.movimentarEstoque(instance.getDtemissaoNfiscal(),
						item.getNrSerieItem(), instance
								.getNaturezasByNaturezaSq()
								.getNumeroEstoqueEntrada(), item.getProdutos(),
						item.getQtdeItem(), TipoMovimentacaoEstoque.Entrada,
						null, item.getVlrTotalItem().longValue(), instance
								.getNumeroNfiscal());
			}

			// transferencia de produto
			if ((TipoMovimentacaoEstoque.valueOf(instance
					.getNaturezasByNaturezaSq().getEntSai())
					.equals(TipoMovimentacaoEstoque.Entrada))
					&& (instance.getNaturezasByNaturezaSq()
							.getNumeroEstoqueSaida() > 0)) {
				produtoBo.movimentarEstoque(instance.getDtemissaoNfiscal(),
						item.getNrSerieItem(), instance
								.getNaturezasByNaturezaSq()
								.getNumeroEstoqueSaida(), item.getProdutos(),
						item.getQtdeItem(), TipoMovimentacaoEstoque.Saida,
						null, item.getVlrTotalItem().longValue(), instance
								.getNumeroNfiscal());
			}
		}

		instance.setConcluida("S");
		instance.setCancelada("N");

		salvar(instance);
	}

	public void atualizarItens(Nfiscais instance) throws SystemException {
		for (NfiscaisItens item : instance.getNfiscaisItenses()) {
			long valorUnitarioSemIpi = 0;
			long valorTotal = 0;
			long porcentagemDesconto = 0;
			long porcentagemJuros = 0;
			long valorFrete = 0;
			long valorSeguro = 0;
			long valorDespAcess = 0;
			Long aliqIcmsItem = 0l;
			Long aliqIpiItem = 0l;
			Long vlrIpiItem = 0l;
			Long vlrIcmsItem = 0l;
			Long baseIcmsSubstItem = 0l;
			Long vlrIcmsSubstItem = 0l;
			Long baseIcmsItem = 0l;
			Long vlrTotalItem = 0l;

			Calculos.atualizaItem(instance.getClientes(), item.getProdutos(),
					instance.getNaturezasByNaturezaSq(), instance
							.getCondPagto(), item.getVlrUnitItem().longValue(),
					0l, instance.getCotacaoDolar().longValue(), item
							.getQtdeItem().longValue(), aliqIcmsItem,
					aliqIpiItem, vlrIpiItem, valorUnitarioSemIpi, valorTotal,
					vlrTotalItem, porcentagemDesconto, vlrIcmsItem,
					porcentagemJuros, baseIcmsSubstItem, vlrIcmsSubstItem,
					baseIcmsItem, 0l, valorFrete, valorSeguro, valorDespAcess);

			item.setBaseIcmsItem(new BigDecimal(baseIcmsItem));
			item.setAliqIcmsItem(new BigDecimal(aliqIcmsItem));
			item.setVlrIcmsItem(new BigDecimal(vlrIcmsItem));
			item.setAliqIpiItem(new BigDecimal(aliqIpiItem));
			item.setVlrIpiItem(new BigDecimal(vlrIpiItem));
			item.setVlrTotalItem(new BigDecimal(vlrTotalItem));
			item.setBaseIcmsSubstItem(new BigDecimal(baseIcmsSubstItem));
			item.setVlrIcmsSubstItem(new BigDecimal(vlrIcmsSubstItem));
		}
	}

	public void totalizarNfiscal(Nfiscais instance) throws SystemException {
		if (instance.getConcluida().equals("S"))
			return;

		atualizarItens(instance);

		Long aliquotaIcms = 0l;
		Long baseIcms = 0l;
		Long valorIcms = 0l;
		Long valorIpi = 0l;
		Long valorProdutos = 0l;
		Long pesoBruto = 0l;
		Long pesoLiquido = 0l;
		Long baseIcmsSubst = 0l;
		Long valorIcmsSubst = 0l;
		Long valorFrete = 0l;
		Long valorSeguro = 0l;
		Long valorDespAcess = 0l;
		Long valorII = 0l;
		long aliquotaIvaMenor = 0;

		AbstractBo<EstadoIva> estadoIvaBo = GenericBo
				.getInstance(EstadoIva.class);
		DuplicatasBo duplicataBo = (DuplicatasBo) GenericBo
				.getInstance(Duplicatas.class);

		for (NfiscaisItens item : instance.getNfiscaisItenses()) {

			Estado estado = new Estado();
			estado.setCodigoEstado(instance.getClientes().getEstado());
			EstadoIva exemplo = new EstadoIva(item.getProdutos().getNbm(),
					estado);
			EstadoIva estadoIva = estadoIvaBo.listar(exemplo, false, null).get(
					0);

			if ((aliquotaIvaMenor == 0)
					|| (aliquotaIvaMenor > estadoIva.getAliqIva().longValue())) {
				aliquotaIvaMenor = estadoIva.getAliqIva().longValue();
			}
			if (item.getAliqIcmsItem().longValue() > aliquotaIcms) {
				aliquotaIcms = item.getAliqIcmsItem().longValue();
			}

			baseIcms += item.getBaseIcmsItem().longValue();
			valorIcms += item.getVlrIcmsItem().longValue();
			valorIpi += item.getVlrIpiItem().longValue();
			valorProdutos += item.getVlrTotalItem().longValue();
			pesoBruto += item.getPesoBruto().longValue();
			pesoLiquido += item.getPesoLiquido().longValue();
			baseIcmsSubst += item.getBaseIcmsSubstItem().longValue();
			valorIcmsSubst += item.getVlrIcmsSubstItem().longValue();
			valorFrete += item.getVlrFreteItem().longValue();
			valorSeguro += item.getVlrSeguroItem().longValue();
			valorDespAcess += item.getVlrDespAcessItem().longValue();
			valorII += item.getVlrIiItem().longValue();

		}

		instance.setBaseIcms(new BigDecimal(baseIcms));
		instance.setVlrIcms(new BigDecimal(valorIcms));
		instance.setBaseIcmsSubst(new BigDecimal(baseIcmsSubst));
		instance.setVlrIcmsSubst(new BigDecimal(valorIcmsSubst));
		instance.setVlrIpi(new BigDecimal(valorIpi));
		instance.setVlrProdutos(new BigDecimal(valorProdutos));
		instance.setVlrTotal(new BigDecimal(valorProdutos + valorFrete
				+ valorSeguro + valorIpi + valorDespAcess + valorIcmsSubst));
		instance.setPbrutoTransp(pesoBruto.toString());
		instance.setPliquidoTransp(pesoLiquido.toString());
		instance.setVlrFrete(new BigDecimal(valorFrete));
		instance.setVlrSeguro(new BigDecimal(valorSeguro));
		instance.setVlrDespAcess(new BigDecimal(valorDespAcess));
		instance.setVlrIi(new BigDecimal(valorII));

		duplicataBo.atualizarCondicaoPagamento(instance
				.getNaturezasByNaturezaSq().getTipoNfiscal(), instance
				.getCondPagto(), instance.getNumeroNfiscal(), instance
				.getVlrTotal().longValue(), instance.getDtemissaoNfiscal(),
				instance.getDiasDemonstracao());
	}

	public Nfiscais importarPedido(Pedidos pedido) throws SystemException {
		Empresas empresa = GenericBo.getInstance(Empresas.class).buscaPorId(1);
		Nfiscais instance = new Nfiscais();
		instance.setPedidos(pedido);
		instance.setClientes(pedido.getClientes());
		instance.setCondPagto(pedido.getCondPagto());
		instance.setNaturezasByNaturezaSq(pedido.getNaturezas());
		instance.setTransportadoras(pedido.getTransportadoras());
		instance.setVendedores(pedido.getVendedores());
		instance.setMensagem(pedido.getObservacaoNf());
		instance.setCotacaoDolar(pedido.getCotacaoDolar());
		instance.setFreteTransp(pedido.getFreteTransp());
		instance.setDiasDemonstracao(pedido.getDiasDemonstracao());
		instance.setPbrutoTransp(pedido.getPesoBruto().toString());
		instance.setPliquidoTransp(pedido.getPesoLiquido().toString());

		for (PedidosItens pedidoItem : pedido.getPedidosItenses()) {
			NfiscaisItens item = new NfiscaisItens();
			int qtdeItem = 0;

			Integer qtdeFaturada = ((NfiscaisDao) dao).quantidadeFaturada(
					pedido.getPedidoSq(), pedidoItem.getProdutos()
							.getProdutoSq());

			if (pedidoItem.getQtdePedidoItem() <= qtdeFaturada) {
				continue;
			}

			item.setProdutos(pedidoItem.getProdutos());
			item.setQtdeItem(qtdeItem);
			item.setVlrUnitItem(pedidoItem.getPrecoUnit()
					.add(pedidoItem.getVlrJuros())
					.subtract(pedidoItem.getVlrDesc()));
			item.setStribut(empresa.getStribut());
			item.setAliqIcmsItem(pedidoItem.getAliqIcmsItem());
			item.setAliqIpiItem(pedidoItem.getAliqIpiItem());

			if (qtdeFaturada > 0) {
				item.setVlrIcmsItem(pedidoItem.getVlrIcmsItem());
				item.setVlrIpiItem(pedidoItem.getVlrIpiItem());
				item.setVlrTotalItem(pedidoItem.getVlrTotalItem());
			}

			item.setNrSerieItem(pedidoItem.getNrSerieItem());
			item.setPesoBruto(pedidoItem.getPesoBruto());
			item.setPesoLiquido(pedidoItem.getPesoLiquido());

			item.setOrigemMercadoria(pedidoItem.getProdutos()
					.getOrigemMercadoria());

			if (instance.getNfiscaisItenses().size() == 0) {
				item.setVlrFreteItem(pedido.getVlrFrete());
				item.setVlrSeguroItem(pedido.getVlrSeguro());
			}

			item.setNumeroEstoque(pedidoItem.getNumeroEstoque());

			for (PedidosItensSerie pedidoItemSerie : pedidoItem
					.getPedidosItensSeries()) {
				NfiscaisItensSerie itemSerie = new NfiscaisItensSerie(
						pedidoItemSerie.getProdutoNumeroSerie(), null);
				item.getNfiscaisItensSeries().add(itemSerie);
			}
			instance.getNfiscaisItenses().add(item);
		}
		return instance;
	}

	@Override
	public void validarRegistro(Nfiscais instance) throws SystemException {
		if (!instance.getUfPlacaTransp().equals("")) {
			Estado exemplo = new Estado(instance.getUfPlacaTransp(), null,
					null, 0, null);
			if (GenericBo.getInstance(Estado.class)
					.listar(exemplo, false, null).size() == 0) {
				throw new SystemException("Estado inválido.");
			}
		}

		if (TipoNfiscal.fromInteger(
				instance.getNaturezasByNaturezaSq().getTipoNfiscal()).equals(
				TipoNfiscal.Demonstracao)) {
			if ((instance.getDiasDemonstracao() == null)
					|| (instance.getDiasDemonstracao() == 0)) {
				throw new SystemException(
						"Dias em demonstração: Informação obrigatória para esta natureza.");
			}
		}

		if (instance.getClientes() == null) {
			throw new SystemException("Cliente não selecionado.");
		}

		if (instance.getCondPagto() == null) {
			throw new SystemException("Condição de pagamento não selecionada.");
		}

		if (instance.getNaturezasByNaturezaSq() == null)
			throw new SystemException("Natureza da Operação não selecionada.");

		if (instance.getTransportadoras() == null)
			throw new SystemException("Transportadora não selecionada.");

		if (instance.getVendedores() == null)
			throw new SystemException("Vendedor não selecionado.");

		NaturezasBo naturezaBo = (NaturezasBo) GenericBo
				.getInstance(Naturezas.class);
		naturezaBo.verificarEstado(instance.getNaturezasByNaturezaSq(),
				instance.getClientes().getEstado());

		if (instance.getNfiscalSqReferencia() != null) {
			if (instance.getNfiscalSqReferencia().equals(
					instance.getNfiscalSq())) {
				throw new SystemException("Nota fiscal referência inválida.");
			}

			Nfiscais exemplo = new Nfiscais();
			exemplo.setNumeroNfiscal(instance.getNfiscalSqReferencia());
			List<Nfiscais> lista = listar(exemplo, false, null);
			if (lista.size() == 0) {
				throw new SystemException("Nota fiscal referência não existe.");
			}
		}

		for (int i = 0; i < instance.getPlacaTransp().length(); i++) {
			char c = instance.getPlacaTransp().charAt(i);
			if (((c >= 65) && (c <= 90)) || ((c >= 48) && (c <= 57))) {
				throw new SystemException(
						"Caracter inválido na placa da transportadora ("
								+ Character.toString(c) + ").");
			}
		}
	}
}
