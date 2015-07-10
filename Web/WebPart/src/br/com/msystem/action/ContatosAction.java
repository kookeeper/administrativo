package br.com.msystem.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.vo.Contatos;

@Namespace("/pages/contatos")
@ResultPath(value = "/")
public class ContatosAction extends AbstractAction<Contatos> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;

	public ContatosAction() {
		super();
		setTituloActionListar(getText("contato.tituloLista"));
		addColuna(getText("contato.dataContato"), "dataContato");
		addColuna(getText("contato.observacao"), "observacao");
	}

}
