package br.com.msystem.bo;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import br.com.msystem.exceptions.SystemException;
import br.com.msystem.vo.Usuarios;

@Transactional
public class UsuariosBo extends GenericBo<Usuarios> {

	private UsuariosBo(Class<Usuarios> argClass) throws SystemException {
		super(argClass);
	}

	private static UsuariosBo instance;
	
	public static UsuariosBo getInstance() throws SystemException {
		if (instance==null)
			instance = new UsuariosBo(Usuarios.class);
		return instance;
	}
	
	public Usuarios validaLogin(String codigoUsuario, String senha) throws SystemException {
		Usuarios example = new Usuarios(codigoUsuario, null);
		List<Usuarios> retorno = dao.findByExample(example, false);
		if (retorno.size() != 1)
			throw new SystemException("Nao foi possivel encontrar um usuario com este nome");
		if (!retorno.get(0).getSenhaUsuario().equals(senha))
			throw new SystemException("password.invalid");
		return retorno.get(0);
	}

}
