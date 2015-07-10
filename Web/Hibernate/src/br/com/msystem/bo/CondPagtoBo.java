package br.com.msystem.bo;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.DecimalFormat;

import br.com.msystem.exceptions.SystemException;
import br.com.msystem.vo.CondPagto;

public class CondPagtoBo extends GenericBo<CondPagto> {

	private CondPagtoBo(Class<CondPagto> argClass) throws SystemException {
		super(argClass);
	}

	private static CondPagtoBo instance;

	public static CondPagtoBo getInstance() throws SystemException {
		if (instance == null)
			instance = new CondPagtoBo(CondPagto.class);
		return instance;
	}

	public Integer buscarPercentual(CondPagto instance, int indice)
			throws SystemException {

		DecimalFormat df = new DecimalFormat("00");
		try {
			Method metodo = instance.getClass().getMethod(
					"getP" + df.format(indice), new Class<?>[0]);
			return (Integer) metodo.invoke(instance, new Object[0]);

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

	public Integer buscarDias(CondPagto instance, int indice)
			throws SystemException {

		DecimalFormat df = new DecimalFormat("00");
		try {
			Method metodo = instance.getClass().getMethod(
					"getD" + df.format(indice), new Class<?>[0]);
			return (Integer) metodo.invoke(instance, new Object[0]);

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
