package br.com.msystem.bo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.transform.ResultTransformer;

import br.com.msystem.exceptions.SystemException;

public interface AbstractBo<T extends Serializable> {

	public abstract List<T> listar();

	public abstract List<T> listar(Map<String, String> ordem);

	public abstract List<T> listar(T exemplo, boolean like,
			Map<String, String> ordem);

	public abstract T buscaPorId(int id);

	public abstract void salvar(T instance) throws SystemException;

	public abstract void excluir(int id);

	public abstract List<?> dependencias() throws InstantiationException,
			IllegalAccessException, ClassNotFoundException;

	public abstract void validarRegistro(T instance) throws SystemException;

	public abstract List<?> executarQuery(String sql,
			ResultTransformer transformer);

	public abstract List<T> listar(T exemplo);

	public abstract List<T> listarDropDown(String searchTerm);
}