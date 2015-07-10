package br.com.msystem.bo;

import java.util.Calendar;
import java.util.List;

import br.com.msystem.exceptions.SystemException;
import br.com.msystem.util.StatusContagemBalanco;
import br.com.msystem.vo.Balanco;
import br.com.msystem.vo.BalancoContagem;
import br.com.msystem.vo.BalancoContagemProduto;
import br.com.msystem.vo.Produtos;

public class BalancoBo extends GenericBo<Balanco> {

	private BalancoBo(Class<Balanco> argClass) throws SystemException {
		super(argClass);
	}

	private static BalancoBo instance;

	public static BalancoBo getInstance() throws SystemException {
		if (instance == null)
			instance = new BalancoBo(Balanco.class);
		return instance;
	}

	public void verificarContagemAnterior(BalancoContagem contagem,
			StatusContagemBalanco status) throws SystemException {
		for (BalancoContagem registro : contagem.getBalanco()
				.getBalancoContagems()) {
			if ((registro.getNumeroContagem() < contagem.getNumeroContagem())
					&& ((registro.getStatusContagem() == StatusContagemBalanco.Pendente
							.codigo()) || (registro.getStatusContagem() == StatusContagemBalanco.Andamento
							.codigo()))) {
				throw new SystemException("A contagem "
						+ registro.getNumeroContagem() + " está com status '"
						+ StatusContagemBalanco.fromInteger(registro.getStatusContagem())
						+ "'. Não é possível altera o status da contagem "
						+ contagem.getNumeroContagem() + ".");
			}
		}
	}
	
	public void iniciarContagem(BalancoContagem contagem) throws SystemException {
		if (contagem.getStatusContagem() != StatusContagemBalanco.Andamento.codigo()) {
			verificarContagemAnterior(contagem, StatusContagemBalanco.Andamento);
			contagem.setStatusContagem(StatusContagemBalanco.Andamento.codigo());
			contagem.setDataInicioContagem(Calendar.getInstance().getTime());
		}
		
		ProdutosBo produtoBo = (ProdutosBo) GenericBo.getInstance(Produtos.class);
		List<Produtos> lista = produtoBo.listarProdutoForaBalanco(contagem.getBalancoContagemSq());
		for (Produtos produto: lista) {
			BalancoContagemProduto registro = new BalancoContagemProduto(produto, contagem);
			contagem.getBalancoContagemProdutos().add(registro);
		}
	}

	public void finalizarContagem(BalancoContagem contagem) throws SystemException {
		verificarContagemAnterior(contagem, StatusContagemBalanco.Finalizada);
		contagem.setStatusContagem(StatusContagemBalanco.Finalizada.codigo());
		contagem.setDataTerminoContagem(Calendar.getInstance().getTime());
	}
	
	public void iniciarBalanco(Balanco balanco) {
		balanco.getBalancoContagems().clear();
		for (int i = 1; i <= balanco.getQtdeContagem(); i++) {
			BalancoContagem contagem = new BalancoContagem(balanco, i, StatusContagemBalanco.Pendente.codigo());
			balanco.getBalancoContagems().add(contagem);
		}
		balanco.setDataInicioBalanco(Calendar.getInstance().getTime());
	}
	
	public boolean temContagemAberta(Balanco balanco) {
		for (BalancoContagem contagem: balanco.getBalancoContagems()) {
			if (contagem.getStatusContagem() != StatusContagemBalanco.Finalizada.codigo()) {
				return true;
			}
		}
		
		return false;
	}
	
	public boolean temContagemEmAndamento(Balanco balanco) {
		for (BalancoContagem contagem: balanco.getBalancoContagems()) {
			if (contagem.getStatusContagem() == StatusContagemBalanco.Andamento.codigo()) {
				return true;
			}
		}
		
		return false;
	}
}
