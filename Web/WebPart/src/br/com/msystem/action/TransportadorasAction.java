package br.com.msystem.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.vo.Transportadoras;

@Namespace("/pages/transportadoras")
@ResultPath(value = "/")
public class TransportadorasAction extends AbstractAction<Transportadoras> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;

	public TransportadorasAction() {
		super();
		setTituloActionListar(getText("transportadora.tituloLista"));
		addColuna(getText("transportadora.codigoTransportadora"), "codigoTransportadora");
		addColuna(getText("transportadora.nomeTransportadora"), "nomeTransportadora");
	}

}
