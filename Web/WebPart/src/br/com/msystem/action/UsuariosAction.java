package br.com.msystem.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.vo.Usuarios;

@Namespace("/pages/usuarios")
@ResultPath(value = "/")
public class UsuariosAction extends AbstractAction<Usuarios> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;

	public UsuariosAction() {
		super();
		setTituloActionListar(getText("usuario.tituloLista"));
		addColuna(getText("usuario.codigoUsuario"), "codigoUsuario");
		addColuna(getText("usuario.nomeUsuario"), "nomeUsuario");
	}

}
