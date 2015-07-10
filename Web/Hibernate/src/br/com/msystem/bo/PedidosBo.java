package br.com.msystem.bo;

import java.math.BigDecimal;
import java.util.List;

import br.com.msystem.exceptions.SystemException;
import br.com.msystem.util.Calculos;
import br.com.msystem.util.TipoMovimentacaoEstoque;
import br.com.msystem.util.TipoNfiscal;
import br.com.msystem.vo.Clientes;
import br.com.msystem.vo.CondPagto;
import br.com.msystem.vo.Empresas;
import br.com.msystem.vo.Estado;
import br.com.msystem.vo.EstadoIva;
import br.com.msystem.vo.Naturezas;
import br.com.msystem.vo.Nbm;
import br.com.msystem.vo.Pedidos;
import br.com.msystem.vo.PedidosItens;
import br.com.msystem.vo.Produtos;
import br.com.msystem.vo.Transportadoras;
import br.com.msystem.vo.Vendedores;

public class PedidosBo extends GenericBo<Pedidos> {

	private PedidosBo(Class<Pedidos> argClass) throws SystemException {
		super(argClass);
	}

	private static PedidosBo instance;

	public static PedidosBo getInstance() throws SystemException {
		if (instance == null)
			instance = new PedidosBo(Pedidos.class);
		return instance;
	}

	public void totalizarPedido(Pedidos instance) throws SystemException {

		double valorJuros = 0;
		double valorDesconto = 0;
		double baseIcms = 0;
		double valorIcms = 0;
		double valorIpi = 0;
		double valorProduto = 0;
		double porcentagemJuros = 0;
		double porcentagemDesconto = 0;
		double pesoBruto = 0;
		double pesoLiquido = 0;
		double baseIcmsSubst = 0;
		double valorIcmsSubst = 0;
		double baseAdicional = 0;
		double valorAdicional = 0;
		double aliquotaIva = 0;
		double aliquotaIvaMenor = 0;
		double aliquotaIcms = 0;

		for (PedidosItens item : instance.getPedidosItenses()) {
			Nbm nbm = item.getProdutos().getNbm();

			Estado estado = new Estado(instance.getClientes().getEstado(),
					null, null, 0);
			estado = GenericBo.getInstance(Estado.class)
					.listar(estado, false, null).get(0);

			EstadoIva exemplo = new EstadoIva(nbm, estado);
			aliquotaIva = GenericBo.getInstance(EstadoIva.class)
					.listar(exemplo, false, null).get(0).getAliqIva()
					.doubleValue();

			if ((aliquotaIvaMenor == 0) || (aliquotaIvaMenor > aliquotaIva)) {
				aliquotaIvaMenor = aliquotaIva;
			}

			if (item.getAliqIcmsItem().doubleValue() > aliquotaIcms) {
				aliquotaIcms = item.getAliqIcmsItem().doubleValue();
			}

			valorDesconto += item.getVlrDesc().doubleValue();
			valorJuros += item.getVlrJuros().doubleValue();
			baseIcms += item.getVlrTotalItem().doubleValue();
			baseIcmsSubst += item.getBaseIcmsSubstItem().doubleValue();
			valorIcms += item.getVlrIcmsItem().doubleValue();
			valorIcmsSubst += item.getVlrIcmsSubstItem().doubleValue();
			valorIpi += item.getVlrIpiItem().doubleValue();
			valorProduto += item.getVlrTotalItem().doubleValue();
			pesoBruto += item.getPesoBruto().doubleValue();
			pesoLiquido += item.getPesoLiquido().doubleValue();

			if (instance.getClientes().getTipoCliente().getTipoClienteSq() == 1) {
				baseIcms += item.getVlrIpiItem().doubleValue();
			}
		}

		baseAdicional = instance.getVlrFrete().doubleValue()
				+ instance.getVlrSeguro().doubleValue();

		baseIcms += baseAdicional;
		valorIcms += baseAdicional * aliquotaIcms / 100;

		porcentagemDesconto = 0;
		porcentagemJuros = 0;

		if (valorProduto != 0) {
			porcentagemDesconto = 100 * valorDesconto / valorProduto;
			porcentagemJuros = 100 * valorJuros / valorProduto;
		}

		if (!instance.getNaturezas().getCfoSubst().equals("")) {
			valorAdicional = baseAdicional * (1 + (aliquotaIvaMenor / 100))
					* aliquotaIcms / 100;
			valorAdicional -= baseAdicional * aliquotaIcms / 100;
			baseIcmsSubst += baseAdicional * (1 + (aliquotaIvaMenor / 100));
			valorIcmsSubst += valorAdicional;
		}

		instance.setVlrDesc(new BigDecimal(valorDesconto));
		instance.setVlrJuros(new BigDecimal(valorJuros));
		instance.setBaseIcms(new BigDecimal(baseIcms));
		instance.setBaseIcmsSubst(new BigDecimal(baseIcmsSubst));
		instance.setVlrIcms(new BigDecimal(valorIcms));
		instance.setVlrIcmsSubst(new BigDecimal(valorIcmsSubst));
		instance.setVlrIpi(new BigDecimal(valorIpi));
		instance.setVlrProdutos(new BigDecimal(valorProduto));
		instance.setVlrTotal(new BigDecimal(valorProduto + valorIpi
				+ instance.getVlrSeguro().doubleValue()
				+ instance.getVlrFrete().doubleValue() + valorIcmsSubst));
		instance.setPctDesc(new BigDecimal(porcentagemDesconto));
		instance.setPctJuros(new BigDecimal(porcentagemJuros));
		instance.setPesoBruto(new BigDecimal(pesoBruto));
		instance.setPesoLiquido(new BigDecimal(pesoLiquido));
	}

	public void atualizarItens(Pedidos instance) throws SystemException {

		long valorUnitario = 0;
		Long valorTotal = 0l;
		Long valorTotalSemIpi = 0l;
		Long valorJuros = 0l;
		long valorDesconto = 0;
		Long porcentagemJuros = 0l;
		Long porcentagemDesconto = 0l;
		long valorDolar = 0;
		Long aliquotaIcms = 0l;
		Long aliquotaIpi = 0l;
		Long valorUnitarioSemIpi = 0l;
		Long valorIcms = 0l;
		Long valorIpi = 0l;
		Long baseIcmsSubst = 0l;
		Long valorIcmsSubst = 0l;
		Long baseIcms = 0l;
		int quantidade;

		valorDolar = instance.getCotacaoDolar().longValue();

		for (PedidosItens item : instance.getPedidosItenses()) {
			valorDesconto = item.getVlrDesc().longValue();
			valorUnitario = item.getPrecoUnit().longValue();
			quantidade = item.getQtdePedidoItem();
			valorJuros = item.getVlrJuros().longValue();

			if (instance.getNaturezas() == null) {
				throw new SystemException(
						"Por favor, selecione uma natureza da operação.");
			}

			Calculos.atualizaItem(instance.getClientes(), item.getProdutos(),
					instance.getNaturezas(), instance.getCondPagto(),
					valorUnitario, valorDesconto, valorDolar, quantidade,
					aliquotaIcms, aliquotaIpi, valorIpi, valorUnitarioSemIpi,
					valorTotal, valorTotalSemIpi, porcentagemDesconto,
					valorIcms, porcentagemJuros, baseIcmsSubst, valorIcmsSubst,
					baseIcms, valorJuros, 0l, 0l, 0l);

			item.setQtdePedidoItem(quantidade);
			item.setPrecoUnit(new BigDecimal(valorUnitario));
			item.setVlrDesc(new BigDecimal(valorDesconto));
			item.setPctDesc(new BigDecimal(porcentagemDesconto));
			item.setVlrIcmsItem(new BigDecimal(valorIcms));
			item.setVlrIpiItem(new BigDecimal(valorIpi));
			item.setVlrTotalItem(new BigDecimal(valorTotalSemIpi));
			item.setAliqIcmsItem(new BigDecimal(aliquotaIcms));
			item.setAliqIpiItem(new BigDecimal(aliquotaIpi));
			item.setVlrJuros(new BigDecimal(valorJuros));
			item.setPctJuros(new BigDecimal(porcentagemJuros));
			item.setBaseIcmsSubstItem(new BigDecimal(baseIcmsSubst));
			item.setVlrIcmsSubstItem(new BigDecimal(valorIcmsSubst));
		}
		totalizarPedido(instance);
	}

	@Override
	public void validarRegistro(Pedidos instance) throws SystemException {
		if ((instance.getClientes() == null) || (instance.getClientes().getClienteSq() == 0))
			throw new SystemException("cliente.nulo");
		
		if (instance.getClientes().getCodigoCliente() == null)
			instance.setClientes(GenericBo.getInstance(Clientes.class).buscaPorId(instance.getClientes().getClienteSq()));

		if ((instance.getCondPagto() == null) || (instance.getCondPagto().getCondPagtoSq() == 0))
			throw new SystemException("condPagto.nulo");

		if (instance.getCondPagto().getCodigoCondPagto() == 0)
			instance.setCondPagto(GenericBo.getInstance(CondPagto.class).buscaPorId(instance.getCondPagto().getCondPagtoSq()));

		if ((instance.getNaturezas() == null) || (instance.getNaturezas().getNaturezaSq() == 0))
			throw new SystemException("natureza.nulo");

		if (instance.getNaturezas().getCodigoNatureza() == 0)
			instance.setNaturezas(GenericBo.getInstance(Naturezas.class).buscaPorId(instance.getNaturezas().getNaturezaSq()));

		if ((instance.getTransportadoras() == null) || (instance.getTransportadoras().getTransportadoraSq() == 0))
			throw new SystemException("transportadora.nulo");

		if (instance.getTransportadoras().getCodigoTransportadora() == null)
			instance.setTransportadoras(GenericBo.getInstance(Transportadoras.class).buscaPorId(instance.getTransportadoras().getTransportadoraSq()));

		if ((instance.getVendedores() == null) || (instance.getVendedores().getVendedorSq() == 0))
			throw new SystemException("vendedor.nulo");

		if (instance.getVendedores().getCodigoVendedor() == 0)
			instance.setVendedores(GenericBo.getInstance(Vendedores.class).buscaPorId(instance.getVendedores().getVendedorSq()));

		NaturezasBo naturezaBo = (NaturezasBo) GenericBo
				.getInstance(Naturezas.class);
		naturezaBo.verificarEstado(instance.getNaturezas(), instance
				.getClientes().getEstado());

		if ((TipoNfiscal.fromInteger(instance.getNaturezas().getTipoNfiscal())
				.equals(TipoNfiscal.Demonstracao))
				&& (instance.getDiasDemonstracao() == 0))
			throw new SystemException(
					"Dias em demonstração: Informação obrigatória para esta natureza.");

		AbstractBo<Empresas> empresaBo = GenericBo.getInstance(Empresas.class);
		while (instance.getNumeroPedido() == null) {
			Empresas empresa = empresaBo.buscaPorId(1);

			if (empresa.getNumeroPedido() == null)
				empresa.setNumeroPedido(1);

			Pedidos exemplo = new Pedidos();
			exemplo.setNumeroPedido(empresa.getNumeroPedido());
			List<Pedidos> lista = listar(exemplo, false, null);
			if (lista.size() > 0) {
				empresa.setNumeroPedido(empresa.getNumeroPedido() + 1);
				empresaBo.salvar(empresa);
			} else {
				instance.setNumeroPedido(empresa.getNumeroPedido());
			}
		}
	}

	public void cancelarPedido(Pedidos instance) throws SystemException {
		instance.setStatus('C');

		salvar(instance);
	}

	public void finalizarPedido(Pedidos instance) throws SystemException {
		ProdutosBo produtoBo = (ProdutosBo) GenericBo
				.getInstance(Produtos.class);

		for (PedidosItens item : instance.getPedidosItenses()) {
			produtoBo.movimentarEstoque(instance.getDataPedido(), item
					.getNrSerieItem(), instance.getNaturezas()
					.getNumeroEstoqueSaida(), item.getProdutos(), item
					.getQtdePedidoItem(), TipoMovimentacaoEstoque.Saida, null,
					item.getVlrTotalItem().longValue(), null);

			// retorno de produto
			if ((item.getQtdeProdutoRetorno() != null)
					&& (item.getProdutos().getProdutos() != null)) {
				produtoBo.movimentarEstoque(instance.getDataPedido(), null,
						instance.getNaturezas().getNumeroEstoqueSaida(), item
								.getProdutos().getProdutos(), item
								.getQtdeProdutoRetorno().intValue(),
						TipoMovimentacaoEstoque.Entrada, null, 0, null);
			}

		}

		instance.setBaixouEstoque('S');
		salvar(instance);
	}
}