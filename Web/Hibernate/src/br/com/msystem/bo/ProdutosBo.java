package br.com.msystem.bo;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import br.com.msystem.dao.ProdutosDao;
import br.com.msystem.exceptions.SystemException;
import br.com.msystem.util.TipoMovimentacaoEstoque;
import br.com.msystem.vo.Kardex;
import br.com.msystem.vo.ProdutoNumeroSerie;
import br.com.msystem.vo.Produtos;
import br.com.msystem.vo.Usuarios;

@Transactional
public class ProdutosBo extends GenericBo<Produtos> {

	private AbstractBo<Kardex> kardexBo = GenericBo.getInstance(Kardex.class);

	private ProdutosBo(Class<Produtos> argClass) throws SystemException {
		super(argClass);
	}

	private static ProdutosBo instance;

	public static ProdutosBo getInstance() throws SystemException {
		if (instance == null)
			instance = new ProdutosBo(Produtos.class);
		return instance;
	}

	public void movimentarEstoque(Date dataMovimentacao, String numeroSerie,
			Integer numeroEstoque, Produtos produto, Integer qtde,
			TipoMovimentacaoEstoque tipoMovimentacaoEstoque, Usuarios usuario,
			long valor, Integer nfiscal) throws SystemException {
		Kardex movimentacao = new Kardex();

		movimentacao.setData(dataMovimentacao);
		movimentacao.setNrSerie(numeroSerie);
		movimentacao.setNumeroEstoque(numeroEstoque);
		movimentacao.setProdutos(produto);
		movimentacao.setQtde(qtde);
		movimentacao.setTipoMov(tipoMovimentacaoEstoque.toString());
		movimentacao.setUsuarios(usuario);
		movimentacao.setValor(new BigDecimal(valor));
		movimentacao.setNfiscal(nfiscal);

		kardexBo.salvar(movimentacao);
	}

	public void transferirEstoque(String numeroSerie,
			Integer numeroEstoqueSaida, Integer numeroEstoqueEntrada,
			Produtos produto, Integer qtde, Usuarios usuario, BigDecimal valor)
			throws SystemException {

		Date dataMovimentacao = Calendar.getInstance().getTime();

		movimentarEstoque(dataMovimentacao, numeroSerie,
				numeroEstoqueEntrada, produto, qtde,
				TipoMovimentacaoEstoque.Entrada, usuario, valor.longValue(),
				null);
		movimentarEstoque(dataMovimentacao, numeroSerie, numeroEstoqueSaida,
				produto, qtde, TipoMovimentacaoEstoque.Saida, usuario,
				valor.longValue(), null);

		if (produto.getControleNumeroSerie() == 1) {
			ProdutoNumeroSerieBo bo = (ProdutoNumeroSerieBo) GenericBo
					.getInstance(ProdutoNumeroSerie.class);
			bo.transferirNumeroSerieEstoque(numeroSerie, numeroEstoqueEntrada);
		}
	}

	public List<Produtos> listarProdutoForaBalanco(Integer balancoContagemSq) {
		return ((ProdutosDao) dao)
				.listarProdutoForaDaContagemBalanco(balancoContagemSq);
	}

}
