package br.com.msystem.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.exceptions.SystemException;
import br.com.msystem.json.ComboGrid;
import br.com.msystem.vo.CondPagto;

@Namespace("/pages/condPagto")
@ResultPath(value = "/")
public class CondPagtoAction extends AbstractAction<CondPagto> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;
	private ComboGrid<CondPagto> listaRegistro;

	public CondPagtoAction() {
		super();
		setTituloActionListar(getText("condPagto.tituloLista"));
		addColuna(getText("condPagto.codigoCondPagto"), "codigoCondPagto");
		addColuna(getText("condPagto.descricaoCondPagto"), "descricaoCondPagto");
		addColuna(getText("condPagto.parcelas"), "parcelas");
	}


	@Action(value = "listar", results = { @Result(type = "json", params = {
			"root", "listaRegistro" }) })
	public String listar() throws SystemException {
		String searchTerm = request.getParameter("searchTerm");
		List<CondPagto> lista = getDefaultBo().listarDropDown(searchTerm);

		listaRegistro = new ComboGrid<CondPagto>();
		listaRegistro.setPage(1);
		listaRegistro.setRecords(lista.size());
		listaRegistro.setTotal(lista.size());
		listaRegistro.getRows().clear();
		
		
		for (CondPagto registro: lista) {
			listaRegistro.getRows().add(registro);
		}

		return SUCCESS;
	}
}
