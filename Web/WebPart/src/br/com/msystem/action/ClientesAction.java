package br.com.msystem.action;

import java.util.Date;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.exceptions.SystemException;
import br.com.msystem.vo.Clientes;
import br.com.msystem.vo.Usuarios;

@Namespace("/pages/clientes")
@ResultPath(value = "/")
public class ClientesAction extends AbstractAction<Clientes> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;

	public ClientesAction() {
		super();
		setTituloActionListar(getText("cliente.tituloLista"));
		addColuna(getText("cliente.codigoCliente"), "codigoCliente");
		addColuna(getText("cliente.nomeCliente"), "nomeCliente");
	}

	public String salvar() throws SystemException {
		getRegistro().setUsuarios((Usuarios)session.getAttribute("usuario"));
		getRegistro().setDataAlt(new Date());
		return super.salvar();
	}

}
