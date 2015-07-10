package br.com.msystem.action;

import java.util.Calendar;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.exceptions.SystemException;
import br.com.msystem.vo.Agenda;
import br.com.msystem.vo.Usuarios;

@Namespace("/pages/agenda")
@ResultPath(value = "/")
public class AgendaAction extends AbstractAction<Agenda> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;

	public AgendaAction() {
		super();
		setTituloActionListar(getText("agenda.tituloLista"));
		addColuna(getText("agenda.clientes.nomeCliente"), "clientes.nomeCliente");
		addColuna(getText("agenda.vendedores.nomeVendedor"), "vendedores.nomeVendedor");
		addColuna(getText("agenda.dataAgenda"), "dataAgenda");
		addColuna(getText("agenda.observacao"), "observacao");
	}

	public void prepareIncluir() throws SystemException {
		super.prepareIncluir();
		getRegistro().setDataAgenda(Calendar.getInstance().getTime());
		getRegistro().setUsuarioPaiSq(((Usuarios)session.getAttribute("usuario")).getUsuarioSq());
	}
	
	@Action(value = "realizarAgenda", results = {
			@Result(name = "error", location = "/errorPage.jsp"),
			@Result(name = "success", type = "redirectAction", location = "listarAgenda")
		})
	public String realizarAgenda() throws SystemException {
		int id = Integer.parseInt(request.getParameter("id"));
		setRegistro(getDefaultBo().buscaPorId(id));
		
		getRegistro().setRealizado("S");
		
		getDefaultBo().salvar(getRegistro());
		
		return SUCCESS;
		
	}

}
