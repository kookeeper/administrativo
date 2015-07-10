package br.com.msystem.bo;

import java.util.Calendar;

import br.com.msystem.exceptions.SystemException;
import br.com.msystem.vo.Empresas;
import br.com.msystem.vo.HistoricoAcesso;
import br.com.msystem.vo.Usuarios;

public class HistoricoAcessoBo extends GenericBo<HistoricoAcesso> {

	private HistoricoAcessoBo(Class<HistoricoAcesso> argClass)
			throws SystemException {
		super(argClass);
	}

	private static HistoricoAcessoBo instance;

	public static HistoricoAcessoBo getInstance() throws SystemException {
		if (instance == null)
			instance = new HistoricoAcessoBo(HistoricoAcesso.class);
		return instance;
	}

	public void registraAcesso(String localName, Usuarios usuario, Empresas empresa)
			throws SystemException {
		if (usuario == null)
			return;

		salvar(new HistoricoAcesso(usuario, empresa, Calendar.getInstance()
				.getTime(), localName));
	}

}
