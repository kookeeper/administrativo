package br.com.msystem.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.bo.AcessosBo;
import br.com.msystem.exceptions.SystemException;
import br.com.msystem.vo.Acessos;

@Namespace("/pages/acessos")
@ResultPath(value = "/")
public class AcessosAction extends AbstractAction<Acessos> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;
	
	public AcessosAction() {
		super();
		setTituloActionListar(getText("acesso.tituloLista"));
		addColuna(getText("acesso.usuarios.nomeUsuario"), "usuarios.nomeUsuario");
	}

	@Action(value = "listar*", results = {
			@Result(name = "success", location = "../listarRegistros.jsp")
		})
	public String listar() throws SystemException {
		setRegistros(((AcessosBo)getDefaultBo()).listarUsuario());
		return SUCCESS;
	}
	
	public void prepareEditar() throws SystemException {
		super.prepareEditar();
		Acessos exemplo = new Acessos();
		exemplo.setAcessoSq(getId());
		List<Acessos> lista = getDefaultBo().listar(exemplo);
		setRegistros(lista);
	}

	public void prepareSalvar() throws SystemException {
		super.prepareSalvar();
		Acessos exemplo = new Acessos();
		exemplo.setAcessoSq(getId());
		List<Acessos> lista = getDefaultBo().listar(exemplo);
		setRegistros(lista);
	}

}
