package br.com.msystem.bo;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import org.hibernate.PropertyValueException;
import org.hibernate.cfg.NotYetImplementedException;
import org.hibernate.transform.ResultTransformer;
import org.springframework.transaction.annotation.Transactional;

import br.com.msystem.dao.GenericDao;
import br.com.msystem.dao.GenericDaoHibernate;
import br.com.msystem.exceptions.SystemException;

@Transactional
public class GenericBo<T extends Serializable> implements AbstractBo<T> {

	protected Class<T> persistentClass;

	protected GenericDao<T> dao;

	public static <E extends Serializable> AbstractBo<E> getInstance(Class<E> className) throws SystemException {
		try {
			AbstractBo<E> bo = procuraClasseBo(className.getSimpleName());
			if (bo == null)
				bo = new GenericBo<E>(className) {};
			return bo;
		} catch (IllegalArgumentException e) {
			throw new SystemException(e);
		} catch (SecurityException e) {
			throw new SystemException(e);
		}
	}

	@SuppressWarnings("unchecked")
	private static <E extends Serializable> AbstractBo<E> procuraClasseBo(String className) throws SystemException {
		Class<?> classe;
		try {
			classe = Class.forName("br.com.msystem.bo." + className + "Bo");
		} catch (ClassNotFoundException e) {
			return null;
		}
		try {
			return (AbstractBo<E>) classe.getMethod("getInstance").invoke(null);
		} catch (IllegalArgumentException e) {
			throw new SystemException(e);
		} catch (SecurityException e) {
			throw new SystemException(e);
		} catch (IllegalAccessException e) {
			throw new SystemException(e);
		} catch (InvocationTargetException e) {
			throw new SystemException(e);
		} catch (NoSuchMethodException e) {
			throw new SystemException(e);
		}
	}

	public GenericBo(Class<T> argClass) throws SystemException {
		this.persistentClass = argClass;
		this.dao = GenericDaoHibernate.getInstance(persistentClass);
	}

	/* (non-Javadoc)
	 * @see br.com.msystem.bo.AbstractBo#listar()
	 */
	@Override
	public List<T> listar() {
		return dao.findAll(null);
	}

	/* (non-Javadoc)
	 * @see br.com.msystem.bo.AbstractBo#listar(java.util.Map)
	 */
	@Override
	public List<T> listar(Map<String, String> ordem) {
		return dao.findAll(ordem);
	}

	/* (non-Javadoc)
	 * @see br.com.msystem.bo.AbstractBo#listar(T, boolean, java.util.Map)
	 */
	@Override
	public List<T> listar(T exemplo, boolean like, Map<String, String> ordem) {
		return dao.findByExample(exemplo, like, ordem);
	}

	/* (non-Javadoc)
	 * @see br.com.msystem.bo.AbstractBo#buscaPorId(int)
	 */
	@Override
	public T buscaPorId(int id) {
		return dao.findById(id);
	}

	/* (non-Javadoc)
	 * @see br.com.msystem.bo.AbstractBo#salvar(T)
	 */
	@Override
	public void salvar(T instance) throws SystemException {
		validarRegistro(instance);
		try {
			dao.save(instance);
		} catch (PropertyValueException e) {
			throw new SystemException("O valor no elemento '" + e.getPropertyName() + "' é inválido. (" + e.getMessage() + ")");
		}
	}

	/* (non-Javadoc)
	 * @see br.com.msystem.bo.AbstractBo#excluir(int)
	 */
	@Override
	public void excluir(int id) {
		T instance = dao.findById(id);
		dao.remove(instance);
	}

	/* (non-Javadoc)
	 * @see br.com.msystem.bo.AbstractBo#dependencias()
	 */
	@Override
	public List<?> dependencias() throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		return dao.dependencias();		
	}

	/* (non-Javadoc)
	 * @see br.com.msystem.bo.AbstractBo#validarRegistro(T)
	 */
	@Override
	public void validarRegistro(T instance) throws SystemException {
		
	}
	
	/* (non-Javadoc)
	 * @see br.com.msystem.bo.AbstractBo#executarQuery(java.lang.String, org.hibernate.transform.ResultTransformer)
	 */
	@Override
	public List<?> executarQuery(String sql, ResultTransformer transformer) {
		throw new NotYetImplementedException("Método para executar query ainda não implementado.");
	}

	@Override
	public List<T> listar(T exemplo) {
		return dao.findByExample(exemplo, false);
	}

	@Override
	public List<T> listarDropDown(String searchTerm) {
		return dao.listarDropDown(searchTerm);
	}
}
