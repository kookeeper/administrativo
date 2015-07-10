package br.com.msystem.bo;

import java.util.List;

import br.com.msystem.dao.PedidosItensDao;
import br.com.msystem.exceptions.SystemException;
import br.com.msystem.vo.PedidosItens;

public class PedidosItensBo extends GenericBo<PedidosItens> {

	private PedidosItensBo(Class<PedidosItens> argClass) throws SystemException {
		super(argClass);
	}

	private static PedidosItensBo instance;

	public static PedidosItensBo getInstance() throws SystemException {
		if (instance == null)
			instance = new PedidosItensBo(PedidosItens.class);
		return instance;
	}

	public List<PedidosItens> listarItens(int pedidoSq) {
		return ((PedidosItensDao)dao).listarItens(pedidoSq);
	}
}