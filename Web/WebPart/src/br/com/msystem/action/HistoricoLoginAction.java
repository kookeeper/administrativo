package br.com.msystem.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.vo.HistoricoLogin;

@Namespace("/pages/historicoLogin")
@ResultPath(value = "/")
public class HistoricoLoginAction extends AbstractAction<HistoricoLogin> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;

	public HistoricoLoginAction() {
		super();
		setTituloActionListar(getText("historicoLogin.tituloLista"));
		addColuna(getText("historicoLogin.usuarios.nomeUsuario"), "usuarios.nomeUsuario");
		addColuna(getText("historicoLogin.dataLogin"), "dataLogin");
		addOrder("dataLogin", "desc");
	}

}
