package br.com.msystem.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.vo.ContasPagarAuto;

@Namespace("/pages/contasPagarAuto")
@ResultPath(value = "/")
public class ContasPagarAutoAction extends AbstractAction<ContasPagarAuto> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;

	public ContasPagarAutoAction() {
		super();
		setTituloActionListar(getText("contaPagarAuto.tituloLista"));
		addColuna(getText("contaPagarAuto.valor"), "valor");
		addColuna(getText("contaPagarAuto.dataInicial"), "dataInicial");
		addColuna(getText("contaPagarAuto.parcelas"), "parcelas");
		addColuna(getText("contaPagarAuto.observacao"), "observacao");
	}

}
