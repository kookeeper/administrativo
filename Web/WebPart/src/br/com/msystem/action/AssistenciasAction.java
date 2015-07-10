package br.com.msystem.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.vo.Assistencias;

@Namespace("/pages/assistencias")
@ResultPath(value = "/")
public class AssistenciasAction extends AbstractAction<Assistencias> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;

	public AssistenciasAction() {
		super();
		setTituloActionListar(getText("assistencia.tituloLista"));
		addColuna(getText("assistencia.numeroAssistencia"), "numeroAssistencia");
		addColuna(getText("assistencia.dataChamado"), "dataChamado");
		addColuna(getText("assistencia.dataAssistencia"), "dataAssistencia");
	}

}
