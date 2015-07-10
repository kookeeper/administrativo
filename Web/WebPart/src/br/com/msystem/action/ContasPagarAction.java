package br.com.msystem.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.vo.ContasPagar;

@Namespace("/pages/contasPagar")
@ResultPath(value = "/")
public class ContasPagarAction extends AbstractAction<ContasPagar> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;

	public ContasPagarAction() {
		super();
		setTituloActionListar(getText("contaPagar.tituloLista"));
		addColuna(getText("contaPagar.numeroDuplicata"), "numeroDuplicata");
		addColuna(getText("contaPagar.dtvencimentoDuplicata"), "dtvencimentoDuplicata");
		addColuna(getText("contaPagar.valorDuplicata"), "valorDuplicata");
	}

}
