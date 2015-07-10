package br.com.msystem.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.vo.Classificacao;

@Namespace("/pages/classificacao")
@ResultPath(value = "/")
public class ClassificacaoAction extends AbstractAction<Classificacao> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;

	public ClassificacaoAction() {
		super();
		setTituloActionListar(getText("classificacao.tituloLista"));
		addColuna(getText("classificacao.codigoClassificacao"), "codigoClassificacao");
		addColuna(getText("classificacao.limiteMinimo"), "limiteMinimo");
		addColuna(getText("classificacao.limiteMaximo"), "limiteMaximo");
	}

}
