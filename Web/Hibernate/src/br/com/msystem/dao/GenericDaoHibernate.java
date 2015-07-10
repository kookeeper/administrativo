package br.com.msystem.dao;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.NotYetImplementedException;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.transform.ResultTransformer;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.ClassPathScanningCandidateComponentProvider;
import org.springframework.core.type.filter.AnnotationTypeFilter;
import org.springframework.dao.DataAccessException;
import org.springframework.util.Assert;

import br.com.msystem.exceptions.SystemException;
import br.com.msystem.util.HibernateUtil;
import br.com.msystem.vo.GenericVo;

public class GenericDaoHibernate<T> implements GenericDao<T> {

	protected static final Log log = LogFactory.getLog(GenericDaoHibernate.class);
	protected final Class<T> typeClass;

	public static <E> GenericDao<E> getInstance(Class<E> className) throws SystemException {
		try {
			GenericDaoHibernate<E> dao = procuraClasseDao(className.getSimpleName());
			if (dao == null)
				dao = new GenericDaoHibernate<E>(className) {};
			return dao;
		} catch (IllegalArgumentException e) {
			throw new SystemException(e);
		} catch (SecurityException e) {
			throw new SystemException(e);
		}
	}

	@SuppressWarnings("unchecked")
	private static <E> GenericDaoHibernate<E> procuraClasseDao(String simpleName) throws SystemException {
		Class<?> classe;
		try {
			classe = Class.forName("br.com.msystem.dao." + simpleName + "Dao");
		} catch (ClassNotFoundException e) {
			return null;
		}
		try {
			return (GenericDaoHibernate<E>) classe.getConstructor(new Class[0]).newInstance(new Object[0]);
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
		} catch (InstantiationException e) {
			throw new SystemException(e);
		}
	}

	protected GenericDaoHibernate(Class<T> argClass) {
		typeClass = argClass;
	}

	protected SessionFactory getSessionFactory() {
		return HibernateUtil.getSessionFactory();
	}

	public void save(T instance) {
		log.debug("saving " + instance.getClass().getName() + " instance");
		try {
			getSessionFactory().openSession().saveOrUpdate(instance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}

	}

	@SuppressWarnings("unchecked")
	public T findById(Integer id) {
		log.debug("getting " + typeClass + " instance with id: " + id);
		try {
			T instance = (T) getSessionFactory().openSession().get(
					typeClass, id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll(Map<String, String> ordem) {
		log.debug("finding all " + typeClass.getName() + " instances");
		try {
			Criteria criteria = getSessionFactory().openSession()
					.createCriteria(typeClass);
			carregarOrdem(ordem, criteria);

			List<T> results = (List<T>) criteria.list();
			log.debug("findAll successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("findAll failed", re);
			throw re;
		}
	}

	private void carregarOrdem(Map<String, String> ordem, Criteria criteria) {
		if ((ordem != null) && (!ordem.isEmpty())) {
			Iterator<String> it = ordem.keySet().iterator();
			while (it.hasNext()) {
				String campo = it.next();
				if (ordem.get(campo).equals("asc"))
					criteria.addOrder(Order.asc(campo));
				else
					criteria.addOrder(Order.desc(campo));
			}
		}
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll(Integer begin, Integer end) {
		log.debug("finding all " + typeClass.getName() + " instances from: "
				+ begin + " to: " + end);
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(typeClass);

			Criteria executableCriteria = criteria
					.getExecutableCriteria(getSessionFactory()
							.openSession());
			if (begin >= 0) {
				executableCriteria.setFirstResult(begin);
			}
			if (end > 0) {
				executableCriteria.setMaxResults(end);
			}

			List<T> results = (List<T>) executableCriteria.list();

			log.debug("findAll successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("findAll failed", re);
			throw re;
		}
	}

	public List<T> findByExample(T example, boolean like) {
		return findByExample(example, like, -1, -1,
				new LinkedHashMap<String, String>());
	}

	public List<T> findByExample(T example, boolean like,
			Map<String, String> ordem) {
		return findByExample(example, like, -1, -1, ordem);
	}

	@SuppressWarnings("unchecked")
	public List<T> findByExample(T example, boolean like, Integer begin,
			Integer end, Map<String, String> ordem) throws DataAccessException {
		log.debug("finding " + example.getClass().getName()
				+ " instance by example from: " + begin + " to: " + end);
		try {
			Assert.notNull(example, "Example entity must not be null");

			Criteria executableCriteria = getSessionFactory().openSession().createCriteria(example.getClass());

			Example exemplo = Example.create(example);
			if (like)
				exemplo = exemplo.enableLike(MatchMode.ANYWHERE);
			exemplo = exemplo.excludeZeroes();

			executableCriteria.add(exemplo);

			/* Cria as subCriterias se o exemplo tiver subclasses */
			Field[] fields = example.getClass().getDeclaredFields();
			for (int i = 0; i < fields.length; i++) {
				if (fields[i].getType().getName().startsWith(
						"br.com.msystem.vo")) {
					String field = fields[i].getName();
					String metodo = "get" + field.substring(0, 1).toUpperCase()
							+ field.substring(1);
					Object obj = example.getClass().getMethod(metodo).invoke(
							example);
					if (obj != null) {
						Example ex = Example.create(obj);
						if (like)
							ex = ex.enableLike(MatchMode.ANYWHERE);
						ex = ex.excludeZeroes();

						executableCriteria.createCriteria(field).add(ex);
					}
				}
			}
			/* fim */

			if (begin >= 0) {
				executableCriteria.setFirstResult(begin);
			}
			if (end > 0) {
				executableCriteria.setMaxResults(end);
			}

			carregarOrdem(ordem, executableCriteria);

			List<T> results = (List<T>) executableCriteria.list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		} catch (IllegalAccessException e) {
			log.error("find by example failed", e);
			throw new RuntimeException(e);
		} catch (NoSuchMethodException e) {
			log.error("find by example failed", e);
			throw new RuntimeException(e);
		} catch (InvocationTargetException e) {
			log.error("find by example failed", e);
			throw new RuntimeException(e);
		}
	}

	public void remove(T instance) {
		log.debug("deleting " + instance.getClass().getName() + " instance");
		try {
			getSessionFactory().openSession().delete(instance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public List<?> dependencias() throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		String tabela = typeClass.getAnnotation(Table.class).name()
				.toLowerCase();
		String coluna = getIdColumnName(typeClass).toLowerCase();

		List<?> lista = getSessionFactory().openSession().createSQLQuery(
				"select table_name "
						+ "from information_schema.key_column_usage "
						+ "where table_schema='handy' "
						+ "and lower(column_name)='" + coluna + "' "
						+ "and lower(referenced_table_name)='" + tabela + "'")
				.list();

		ClassPathScanningCandidateComponentProvider scan = new ClassPathScanningCandidateComponentProvider(
				false);
		scan.addIncludeFilter(new AnnotationTypeFilter(Id.class));
		Set<BeanDefinition> comp = scan
				.findCandidateComponents("br.com.msystem.vo");

		List<GenericVo> resultado = new ArrayList<GenericVo>();

		Iterator<?> it1 = lista.iterator();
		while (it1.hasNext()) {
			Object linha = it1.next();
			Iterator<BeanDefinition> it2 = comp.iterator();
			while (it2.hasNext()) {
				BeanDefinition item = it2.next();
				tabela = item.getBeanClassName().substring(
						item.getBeanClassName().lastIndexOf(".") + 1);
				linha = ((String) linha).replace("_", "");
				if (tabela.equalsIgnoreCase((String) linha)) {
					GenericVo itemResultado = new GenericVo();
					itemResultado.setRegistro((Serializable) Class.forName(item.getBeanClassName()).newInstance());
					itemResultado.setNomeTabela(tabela);
					resultado.add(itemResultado);
					break;
				}
			}
		}
		return resultado;
	}

	public static int getIdColumnValue(Object obj, Class<?> clazz)
			throws NumberFormatException, IllegalArgumentException,
			IllegalAccessException, InvocationTargetException {
		Method idMethod = findIdMethod(clazz);
		return (idMethod == null) ? null : getColumnValue(obj, idMethod);
	}

	public static Method findIdMethod(Class<?> clazz) {
		Method idMethod = null;
		Method[] methodList = clazz.getDeclaredMethods();
		int cursor = 0;
		boolean needSearch = (methodList.length > 0);
		while (needSearch) {
			Method method = methodList[cursor++];
			if (method.isAnnotationPresent(Id.class))
				idMethod = method;
			needSearch = (idMethod == null && cursor < methodList.length);
		}
		return idMethod;
	}

	public static int getColumnValue(Object obj, Method method)
			throws NumberFormatException, IllegalArgumentException,
			IllegalAccessException, InvocationTargetException {
		return Integer.parseInt(String.valueOf(method.invoke(obj,
				new Object[] {})));
	}

	public static String getColumnName(Class<?> clazz, String columnAlias) throws SystemException {
		Method metodo = null;
		Method[] methodList = clazz.getDeclaredMethods();
		int cursor = 0;
		boolean needSearch = (methodList.length > 0);
		while (needSearch) {
			Method method = methodList[cursor++];
			if (method.getName().equalsIgnoreCase("get" + columnAlias))
				metodo = method;
			needSearch = (metodo == null && cursor < methodList.length);
		}
		
		if (metodo == null) {
			throw new SystemException ("O método 'get" + columnAlias + "' não foi encontrado.");
		}
		
		return metodo.getAnnotation(Column.class).name();
	}
	
	public static String getIdColumnName(Class<?> clazz) {
		Method id = findIdMethod(clazz);
		Column pers = id.getAnnotation(Column.class);
		return pers.name();
	}
	
	public static String getTableName(Class<?> clazz) {
		return clazz.getAnnotation(Table.class).name();
	}
	
	@Override
	public List<?> executarQuery(String sql) {
		return executarQuery(sql, null);
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<?> executarQuery(String sql, ResultTransformer transformer) {
		SQLQuery query = getSessionFactory().openSession().createSQLQuery(sql);
		if (transformer != null) {
			query.setResultTransformer(transformer);
		}
		List retorno = query.list();
		return retorno;
	}

	@Override
	public List<T> listarDropDown(String searchTerm) {
		throw new NotYetImplementedException("Método para pesquisar registros não implementado");
	}
}