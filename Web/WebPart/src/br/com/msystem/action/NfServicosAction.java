package br.com.msystem.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.vo.NfServicos;

@Namespace("/pages/nfServicos")
@ResultPath(value = "/")
public class NfServicosAction extends AbstractAction<NfServicos> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;

	public NfServicosAction() {
		super();
		setTituloActionListar(getText("nfServico.tituloLista"));
		addColuna(getText("nfServico.numeroNfServico"), "numeroNfServico");
		addColuna(getText("nfServico.dataNfServico"), "dataNfServico");
		addColuna(getText("nfServico.ttlNfServico"), "ttlNfServico");
	}

}
