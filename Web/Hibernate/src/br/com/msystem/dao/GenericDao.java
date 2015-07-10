package br.com.msystem.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.transform.ResultTransformer;

public interface GenericDao<T> {
	/**
	 * @param instance
	 */
	public void save(T instance);

	/**
	 * @param id
	 * @return
	 */
	public T findById(Integer id);

	/**
	 * @return
	 */
	public List<T> findAll(Map<String, String> ordem);

	/**
	 * @param begin
	 * @param end
	 * @return
	 */
	public List<T> findAll(Integer begin, Integer end);

	/**
	 * @param example
	 * @return
	 */
	public List<T> findByExample(T example, boolean like);

	/**
	 * @param example
	 * @return
	 */
	public List<T> findByExample(T example, boolean like,
			Map<String, String> ordem);

	/**
	 * @param example
	 * @param begin
	 * @param end
	 * @return
	 */
	public List<T> findByExample(T example, boolean like, Integer begin,
			Integer end, Map<String, String> ordem);

	/**
	 * @param isntance
	 */
	public void remove(T isntance);

	public List<?> dependencias() throws InstantiationException, IllegalAccessException, ClassNotFoundException;
	
	public List<?> executarQuery(String sql, ResultTransformer transformer);

	List<?> executarQuery(String sql);

	public List<T> listarDropDown(String searchTerm);

}