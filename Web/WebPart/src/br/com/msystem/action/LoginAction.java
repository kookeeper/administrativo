package br.com.msystem.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import br.com.msystem.bo.GenericBo;
import br.com.msystem.bo.UsuariosBo;
import br.com.msystem.vo.Empresas;
import br.com.msystem.vo.Usuarios;

@Namespace("/")
@ResultPath(value="/")
@InterceptorRef(value="defaultStack", params = {"validation.excludeMethods", "execute,logout"})
public class LoginAction extends AbstractAction<Usuarios> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8284952554788985438L;

	private Usuarios usuario;

	@Action(value="login", results={
			@Result(name="success",location="login.jsp")
		})
	@Override
	public String execute() {
		return SUCCESS;
	}

	@Action(value="efetuarLogin", results={
			@Result(name="success", location="pages/principal.jsp"),
			@Result(name="input", location="login.jsp")
	})
	public String efetuarLogin() {
		try {
			usuario = verificaLogin();
			Empresas empresa = buscarEmpresa();
			getSession().setAttribute("usuario", usuario);
			getSession().setAttribute("empresa", empresa);
		} catch (Exception e) {
			addActionError(getText(e.getMessage()));
			return INPUT;
		}
		
		return SUCCESS;
	}

	@Action(value="logout", results={
			@Result(name="success",location="login.jsp")
	})
	public String logout() {
		getSession().removeAttribute("usuario");
		getSession().removeAttribute("empresa");
		getSession().invalidate();
		return SUCCESS;
	}

	public void validate() {
		if (isInvalid(getUsername()))
			addFieldError("username", getText("username.required"));

		if (isInvalid(getPassword()))
			addFieldError("password", getText("password.required"));
	}

	private Empresas buscarEmpresa() throws Exception {
		return GenericBo.getInstance(Empresas.class).buscaPorId(1);
	}
	
	private Usuarios verificaLogin() throws Exception {
		return UsuariosBo.getInstance().validaLogin(getUsername(),
				getPassword());
	}

	private boolean isInvalid(String value) {
		return (value == null || value.length() == 0);
	}

	private String username;

	private String password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}