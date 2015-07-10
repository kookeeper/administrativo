package br.com.msystem.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.vo.HistAlteracoes;

@Namespace("/pages/histAlteracoes")
@ResultPath(value = "/")
public class HistAlteracoesAction extends AbstractAction<HistAlteracoes> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;

	public HistAlteracoesAction() {
		super();
		setTituloActionListar(getText("histAlteracao.tituloLista"));
		addColuna(getText("histAlteracao.usuarios.nomeUsuario"), "usuarios.nomeUsuario");
		addColuna(getText("histAlteracao.dataAlteracao"), "dataAlteracao");
		addColuna(getText("histAlteracao.nomeTabela"), "nomeTabela");
		addColuna(getText("histAlteracao.tipoAlteracaoDescricao"), "tipoAlteracaoDescricao");
		addColuna(getText("histAlteracao.observacao"), "observacao");
		addOrder("dataAlteracao", "desc");
	}

}
