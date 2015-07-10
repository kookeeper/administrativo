package br.com.msystem.bo;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;

import br.com.msystem.dao.ProdutoNumeroSerieDao;
import br.com.msystem.exceptions.SystemException;
import br.com.msystem.util.TipoMovimentacaoEstoque;
import br.com.msystem.vo.ProdutoNumeroSerie;
import br.com.msystem.vo.Produtos;
import br.com.msystem.vo.Usuarios;

public class ProdutoNumeroSerieBo extends GenericBo<ProdutoNumeroSerie> {

	private ProdutoNumeroSerieBo(Class<ProdutoNumeroSerie> argClass)
			throws SystemException {
		super(argClass);
	}

	private static ProdutoNumeroSerieBo instance;

	public static ProdutoNumeroSerieBo getInstance() throws SystemException {
		if (instance == null)
			instance = new ProdutoNumeroSerieBo(ProdutoNumeroSerie.class);
		return instance;
	}

	public ProdutoNumeroSerie buscarNumeroSerieEstoque(String numeroSerie) {
		return ((ProdutoNumeroSerieDao) dao)
				.buscarNumeroSerieEstoque(numeroSerie);
	}

	public ProdutoNumeroSerie buscarNumeroSerie(String numeroSerie) {
		return ((ProdutoNumeroSerieDao) dao).buscarNumeroSerie(numeroSerie);
	}

	public void transferirNumeroSerieEstoque(String numeroSerie,
			Integer numeroEstoqueEntrada) throws SystemException {
		ProdutoNumeroSerie registro = ((ProdutoNumeroSerieDao) dao)
				.buscarNumeroSerieEstoque(numeroSerie);
		registro.setNumeroEstoque(numeroEstoqueEntrada);
		salvar(registro);
	}

	public void movimentarEstoque(String numeroSerie,
			TipoMovimentacaoEstoque tipoMovimentacao, Produtos produto,
			int numeroEstoque, Integer numeroNf, Usuarios usuario,
			BigDecimal valor) throws SystemException {
		
		Date dataMovimentacao = Calendar.getInstance().getTime();

		if (tipoMovimentacao.equals(TipoMovimentacaoEstoque.Entrada)) {
			registrarEntrada(numeroSerie, produto, numeroEstoque, dataMovimentacao, numeroNf, valor.longValue());
		} else if (tipoMovimentacao.equals(TipoMovimentacaoEstoque.Saida)) {
			registrarSaida(numeroSerie, dataMovimentacao, valor.longValue(), numeroNf);
		}
	}

	private void registrarSaida(String numeroSerie, Date dataSaida,
			long valorSaida, Integer numeroNfiscal) throws SystemException {
		ProdutoNumeroSerie registro = buscarNumeroSerieEstoque(numeroSerie);

		registro.setDataUltimaSaida(dataSaida);
		salvar(registro);

		ProdutosBo produtoBo = (ProdutosBo) GenericBo
				.getInstance(Produtos.class);

		produtoBo.movimentarEstoque(dataSaida, numeroSerie,
				registro.getNumeroEstoque(), registro.getProdutos(), 1,
				TipoMovimentacaoEstoque.Saida, null, valorSaida, numeroNfiscal);

	}

	private void registrarEntrada(String numeroSerie, Produtos produto,
			int numeroEstoque, Date dataEntrada, Integer numeroNfEnt,
			long valorEntrada) throws SystemException {
		ProdutoNumeroSerie registro = buscarNumeroSerie(numeroSerie);
		
		if (registro != null) {
			if (registro.getDataUltimaSaida() == null) {
				throw new SystemException("O número de série informado já está no estoque.");
			} else {
				registro.setDataUltimaSaida(null);
			}
		} else {
			registro = new ProdutoNumeroSerie();
			registro.setProdutos(produto);
			registro.setNumeroSerie(numeroSerie);
			registro.setNumeroEstoque(numeroEstoque);
		}

		registro.setDataUltimaEntrada(dataEntrada);
		registro.setNumeroNfEnt(numeroNfEnt);

		salvar(registro);

		ProdutosBo produtoBo = (ProdutosBo) GenericBo
				.getInstance(Produtos.class);

		produtoBo.movimentarEstoque(dataEntrada, numeroSerie,
				registro.getNumeroEstoque(), registro.getProdutos(), 1,
				TipoMovimentacaoEstoque.Entrada, null, valorEntrada,
				numeroNfEnt);

	}
}
