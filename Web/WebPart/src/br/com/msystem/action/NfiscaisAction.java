package br.com.msystem.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.vo.Nfiscais;

@Namespace("/pages/nfiscais")
@ResultPath(value = "/")
public class NfiscaisAction extends AbstractAction<Nfiscais> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;

	public NfiscaisAction() {
		super();
		setTituloActionListar(getText("nfiscal.tituloLista"));
		addColuna(getText("nfiscal.numeroNfe"), "numeroNfe");
		addColuna(getText("nfiscal.dtemissaoNfiscal"), "dtemissaoNfiscal");
		addColuna(getText("nfiscal.vlrProdutos"), "vlrProdutos");
		addColuna(getText("nfiscal.vlrTotal"), "vlrTotal");
	}

}
