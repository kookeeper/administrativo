package br.com.msystem.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.vo.Kardex;

@Namespace("/pages/kardex")
@ResultPath(value = "/")
public class KardexAction extends AbstractAction<Kardex> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;

	public KardexAction() {
		super();
		setTituloActionListar(getText("kardex.tituloLista"));
		addColuna(getText("kardex.usuarios.nomeUsuario"), "usuarios.nomeUsuario");
		addColuna(getText("kardex.data"), "data");
		addColuna(getText("kardex.produtos.descricaoProduto"), "produtos.descricaoProduto");
		addOrder("data", "desc");
	}

}
