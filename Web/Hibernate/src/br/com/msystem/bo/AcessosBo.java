package br.com.msystem.bo;

import java.util.List;

import org.hibernate.transform.ResultTransformer;

import br.com.msystem.exceptions.SystemException;
import br.com.msystem.vo.Acessos;
import br.com.msystem.vo.Usuarios;

public class AcessosBo extends GenericBo<Acessos> {

	private AcessosBo(Class<Acessos> argClass) throws SystemException {
		super(argClass);
	}

	private static AcessosBo instance;

	public static AcessosBo getInstance() throws SystemException {
		if (instance == null)
			instance = new AcessosBo(Acessos.class);
		return instance;
	}

	@SuppressWarnings("unchecked")
	public List<Acessos> listarUsuario() {
		String sql = "select distinct u.usuario_sq, u.nome_usuario " +
				"from acessos a " +
				"right join usuarios u on (u.usuario_sq=a.usuario_sq)";
		
		ResultTransformer transformer = new ResultTransformer() {
			
			/**
			 * 
			 */
			private static final long serialVersionUID = -2975825881219018843L;

			@Override
			public Object transformTuple(Object[] valores, String[] alias) {
				Usuarios usuario = new Usuarios(null, valores[1].toString());
				Acessos registro = new Acessos(usuario, null);
				registro.setAcessoSq((Integer)valores[0]);
				return registro;
			}
			
			@Override
			public List<?> transformList(@SuppressWarnings("rawtypes") List arg0) {
				return arg0;
			}
		};
		
		return (List<Acessos>) dao.executarQuery(sql, transformer);
	}
}
