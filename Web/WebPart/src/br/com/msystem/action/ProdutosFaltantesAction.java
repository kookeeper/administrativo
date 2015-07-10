package br.com.msystem.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.vo.ProdutosFaltantes;

@Namespace("/pages/produtosFaltantes")
@ResultPath(value = "/")
public class ProdutosFaltantesAction extends AbstractAction<ProdutosFaltantes> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;

	public ProdutosFaltantesAction() {
		super();
		setTituloActionListar(getText("produtoFaltante.tituloLista"));
		addColuna(getText("produtoFaltante.qtde"), "qtdeProdutoFaltante");
		addColuna(getText("produtoFaltante.data"), "dataProdutoFaltante");
	}

}
