package br.com.msystem.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.vo.NfEntradas;

@Namespace("/pages/nfEntradas")
@ResultPath(value = "/")
public class NfEntradasAction extends AbstractAction<NfEntradas> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;

	public NfEntradasAction() {
		super();
		setTituloActionListar(getText("nfEntrada.tituloLista"));
		addColuna(getText("nfEntrada.numeroNfEnt"), "numeroNfEnt");
		addColuna(getText("nfEntrada.dtemissaoNfEnt"), "dtemissaoNfEnt");
		addColuna(getText("nfEntrada.vlrTotal"), "vlrTotal");
	}

}
