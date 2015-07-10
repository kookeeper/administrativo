package br.com.msystem.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import sun.reflect.generics.reflectiveObjects.ParameterizedTypeImpl;
import br.com.msystem.bo.AbstractBo;
import br.com.msystem.bo.GenericBo;
import br.com.msystem.dao.GenericDaoHibernate;
import br.com.msystem.exceptions.SystemException;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@ParentPackage("json-default")
@InterceptorRef(value="defaultStack", params = {"validation.excludeMethods", "*", "validation.includeMethods", "salvar"})
public abstract class AbstractAction<T extends Serializable> extends ActionSupport
		implements ModelDriven<T>, Preparable, ParameterAware,
		ServletRequestAware, ServletResponseAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5832483401279127228L;

	private String tituloActionListar;

	private List<T> registros;

	protected T registro;

	private Map<String, String> colunas;

	private Map<String, String> ordem;

	private int id;

	protected HttpServletRequest request;

	protected HttpSession session;

	protected Map<String, String[]> parameters;

	protected HttpServletResponse response;

	private AbstractBo<T> bo;

	private Map<String, String> filtros;
	
	private List<?> dependencias;

	@SuppressWarnings("rawtypes")
	private Class clazz;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	protected AbstractAction() {
		colunas = new LinkedHashMap<String, String>();
		ordem = new LinkedHashMap<String, String>();
		filtros = new TreeMap<String, String>();
		clazz = (Class) ((ParameterizedTypeImpl) this.getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
		try {
			registro = (T) Class.forName(clazz.getName()).newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public String getTituloActionListar() {
		return tituloActionListar;
	}

	public void setTituloActionListar(String tituloActionListar) {
		this.tituloActionListar = tituloActionListar;
	}

	public void setDependencias() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SystemException {
		this.dependencias = getDefaultBo().dependencias();
	}
	
	public List<?> getDependencias() {
		return dependencias;
	}

	public List<T> getRegistros() {
		return registros;
	}

	public void setRegistros(List<T> registros) {
		this.registros = registros;
	}

	public T getRegistro() {
		return registro;
	}

	public void setRegistro(T registro) {
		this.registro = registro;
	}

	public Map<String, String> getColunas() {
		return colunas;
	}

	public void addColuna(String key, String value) {
		this.colunas.put(key, value);
	}

	public Map<String, String> getOrdem() {
		return ordem;
	}

	public void addOrder(String key, String value) {
		this.ordem.put(key, value);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public HttpSession getSession() {
		return session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
		session = request.getSession();
	}

	@Override
	public void setParameters(Map<String, String[]> arg0) {
		parameters = arg0;
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		response = arg0;
	}

	@SuppressWarnings("unchecked")
	public AbstractBo<T> getDefaultBo() throws SystemException {
		if (bo == null) {
			setDefaultBo((AbstractBo<T>) GenericBo.getInstance(clazz));
		}
		return bo;
	}

	public void setDefaultBo(AbstractBo<T> defaultBo) throws SystemException {
		this.bo = defaultBo;
		try {
			setDependencias();
		} catch (InstantiationException e) {
			throw new SystemException(e);
		} catch (IllegalAccessException e) {
			throw new SystemException(e);
		} catch (ClassNotFoundException e) {
			throw new SystemException(e);
		}
	}

	public T getModel() {
		return getRegistro();
	}

	public Map<String, String> getFiltros() {
		return filtros;
	}

	public void setFiltros(Map<String, String> filtros) {
		this.filtros = filtros;
	}

	public String getIdColumnName(Class<T> clazz) {
		Field idField = findIdField(clazz);
		return (idField == null) ? null : getColumnName(idField);
	}

	private Field findIdField(Class<T> clazz) {
		Field idField = null;
		Field[] fieldList = clazz.getDeclaredFields();
		int cursor = 0;
		boolean needSearch = (fieldList.length > 0);
		while (needSearch) {
			Field field = fieldList[cursor++];
			if (field.isAnnotationPresent(Id.class))
				idField = field;
			needSearch = (idField == null && cursor < fieldList.length);
		}
		return idField;
	}

	private String getColumnName(Field field) {
		return field.isAnnotationPresent(Column.class) ? field.getAnnotation(
				Column.class).name() : field.getName();
	}

	@Action(value = "listar*", results = {
			@Result(name = "success", location = "../listarRegistros.jsp")
		})
	public String listar() throws SystemException {
		try {
			T exemplo = criaExemplo();

			if (exemplo == null) {
				setRegistros(getDefaultBo().listar(ordem));
			} else {
				setRegistros(getDefaultBo().listar(exemplo, true, ordem));
			}
		} catch (InstantiationException e) {
			throw new SystemException(e);
		} catch (IllegalAccessException e) {
			throw new SystemException(e);
		} catch (SecurityException e) {
			throw new SystemException(e);
		} catch (NoSuchMethodException e) {
			throw new SystemException(e);
		} catch (IllegalArgumentException e) {
			throw new SystemException(e);
		} catch (InvocationTargetException e) {
			throw new SystemException(e);
		} catch (ClassNotFoundException e) {
			throw new SystemException(e);
		}
		return SUCCESS;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	protected T criaExemplo() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			SecurityException, InvocationTargetException,
			NoSuchMethodException, ClassNotFoundException {
		T exemplo = null;
		Enumeration<String> e = request.getParameterNames();
		while (e.hasMoreElements()) {
			String parametro = e.nextElement();
			if (parametro.startsWith("filtro")) {
				getFiltros().put(parametro.substring(6),
						request.getParameter(parametro));
			}
		}

		Iterator<String> it = getFiltros().keySet().iterator();
		while (it.hasNext()) {
			if (exemplo == null)
				exemplo = (T) clazz.newInstance();

			String campo = it.next();
			String valor = getFiltros().get(campo);
			String nomeMetodo;

			if (campo.indexOf(".") < 0) {
				nomeMetodo = "set" + campo.substring(0, 1).toUpperCase()
						+ campo.substring(1);
				exemplo.getClass().getMethod(nomeMetodo, String.class).invoke(
						exemplo, valor);
			} else {
				String classe = campo.substring(0, campo.indexOf("."));
				classe = classe.substring(0, 1).toUpperCase()
						+ classe.substring(1);
				nomeMetodo = campo.substring(campo.indexOf(".") + 1);
				nomeMetodo = "set" + nomeMetodo.substring(0, 1).toUpperCase()
						+ nomeMetodo.substring(1);
				Class vo = Class.forName("br.com.msystem.vo." + classe), bo = Class
						.forName("br.com.msystem.bo." + classe + "Bo");

				Object voInst = vo.newInstance();
				Method[] methods = voInst.getClass().getMethods();

				for (int i = 0; i < methods.length; i++) {
					if (methods[i].getName().equals(nomeMetodo)) {
						if (methods[i].getParameterTypes()[0].getName().equals(
								"java.lang.Integer")) {
							AbstractBo boInst = (AbstractBo) bo.getMethod(
									"getInstance").invoke(null);
							voInst = boInst.buscaPorId(Integer.valueOf(valor));
							break;
						} else {
							methods[i].invoke(voInst, valor);
						}
					}
				}

				exemplo.getClass().getMethod("set" + classe, vo).invoke(
						exemplo, voInst);
			}
		}
		return exemplo;
	}

	public void prepareListar() {
		request.setAttribute("clazz", clazz.getSimpleName());
	}

	@SuppressWarnings("unchecked")
	public void prepareIncluir() throws SystemException {
		setId(0);
		try {
			setRegistro((T) clazz.newInstance());
		} catch (InstantiationException e) {
			throw new SystemException(e);
		} catch (IllegalAccessException e) {
			throw new SystemException(e);
		}
//		carregaListas();
		try {
			clazz.getMethod("set" + GenericDaoHibernate.findIdMethod(clazz).getName().substring(3), Integer.class).invoke(getRegistro(), 0);
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

	@Action(value = "incluir*", results = {
			@Result(name = "success", location = "../editar{1}.jsp")
		})
	public String incluir() {
		return SUCCESS;
	}

	public void prepareEditar() throws SystemException { 
		setId(Integer.parseInt(request.getParameter("id")));
		setRegistro(getDefaultBo().buscaPorId(getId()));
	}

	@Action(value = "editar*", results = {
			@Result(name = "success", location = "../editar{1}.jsp")
		})
	public String editar() {
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public void prepareSalvar() throws SystemException {
		setId(Integer.parseInt(request.getParameter("id")));
		if (getId()==0) {
			try {
				setRegistro((T) clazz.newInstance());
			} catch (InstantiationException e) {
				throw new SystemException(e);
			} catch (IllegalAccessException e) {
				throw new SystemException(e);
			}
		} else {
			setRegistro(getDefaultBo().buscaPorId(getId()));
		}
	}
	
/*
	@SuppressWarnings("rawtypes")
	private void carregaListas() throws SystemException {
		for (Method m : clazz.getMethods()) {
			if (m.isAnnotationPresent(JoinColumn.class)) {
				try {
					String classeVo = m.getReturnType().getSimpleName();
					@SuppressWarnings("unchecked")
					AbstractBo objetoBo = GenericBo.getInstance((Class)m.getReturnType());
					this.getClass()
							.getMethod("setLista" + classeVo, List.class)
							.invoke(this, objetoBo.listarParaTela());
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
		}
	}
*/
	@Action(value = "salvar*", results = {
			@Result(name = "error", location = "/errorPage.jsp"),
			@Result(name = "input", location = "../editar{1}.jsp"),
			@Result(name = "success", type = "redirectAction", location = "listar{1}")
			})
	public String salvar() throws SystemException {
		try {
			getDefaultBo().salvar(getRegistro());
		} catch (Exception e) {
			addActionError(e.getMessage());
			if (e.getCause() != null) {
				addActionError(e.getCause().getMessage());
				if (e.getCause().getCause() != null) {
					addActionError(e.getCause().getCause().getMessage());
				}
			}
			return INPUT;
		}
		return SUCCESS;
	}

	@Action(value = "excluir*", results = {
			@Result(name = "error", location = "/errorPage.jsp"),
			@Result(name = "success", type = "redirectAction", location = "listar{1}")
		})
	public String excluir() {
		try {
			getDefaultBo().excluir(getId());
		} catch (Exception e) {
			addActionError(e.getMessage());
			if (e.getCause() != null) {
				addActionError(e.getCause().getMessage());
				if (e.getCause().getCause() != null) {
					addActionError(e.getCause().getCause().getMessage());
				}
			}
			return ERROR;
		}
		return SUCCESS;
	}

	public void validate() {
		try {
			getDefaultBo().validarRegistro(getRegistro());	
		} catch (SystemException e) {
			addActionError(e.getMessage());
		}
	}
	
	private InputStream inputStream;
	public InputStream getInputStream() {return inputStream;}

	@Action(value = "validarRegistro", results = { @Result(type = "stream", params = {
			"contentType","text/html","inputName","inputStream"}) })
	public String validarRegistro() {
		try {
			getDefaultBo().validarRegistro(getRegistro());
			inputStream = new ByteArrayInputStream(new byte[0]);
		} catch (SystemException e) {
			inputStream = new ByteArrayInputStream(getText(e.getMessage()).getBytes());
		}
		return SUCCESS;
	}


	@Override
	public void prepare() throws Exception {
	}
}
