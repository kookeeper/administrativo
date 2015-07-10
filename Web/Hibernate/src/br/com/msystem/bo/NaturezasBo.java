package br.com.msystem.bo;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.DecimalFormat;

import br.com.msystem.exceptions.SystemException;
import br.com.msystem.vo.Naturezas;

public class NaturezasBo extends GenericBo<Naturezas> {

	private NaturezasBo(Class<Naturezas> argClass) throws SystemException {
		super(argClass);
	}

	private static NaturezasBo instance;

	public static NaturezasBo getInstance() throws SystemException {
		if (instance == null)
			instance = new NaturezasBo(Naturezas.class);
		return instance;
	}

	public void verificarEstado(Naturezas instance, String estado)
			throws SystemException {
		boolean semEstadoCadastrado = true;
		DecimalFormat df = new DecimalFormat("00");
		try {
			for (int i = 1; i < 30; i++) {

				Method metodo = instance.getClass().getMethod(
						"getUf" + df.format(i), new Class<?>[0]);
				String retorno = (String) metodo.invoke(instance, new Object[0]);
				
				if (retorno == null) {
					continue;
				}
				
				if (retorno.equals(estado))
					return;

				if (!retorno.equals(""))
					semEstadoCadastrado = false;
			}
			
			if (!semEstadoCadastrado) 
				throw new SystemException("Natureza inválida para este estado.");

		} catch (SecurityException e) {
			throw new SystemException(e);
		} catch (NoSuchMethodException e) {
			throw new SystemException(e);
		} catch (IllegalArgumentException e) {
			throw new SystemException(e);
		} catch (IllegalAccessException e) {
			throw new SystemException(e);
		} catch (InvocationTargetException e) {
			throw new SystemException(e);
		}
	}

}
