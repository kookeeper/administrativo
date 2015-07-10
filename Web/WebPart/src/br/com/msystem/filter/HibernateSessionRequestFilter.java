package br.com.msystem.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.StaleObjectStateException;

import br.com.msystem.bo.HistoricoAcessoBo;
import br.com.msystem.vo.Empresas;
import br.com.msystem.vo.Usuarios;

public class HibernateSessionRequestFilter implements Filter {

	private static Log log = LogFactory
			.getLog(HibernateSessionRequestFilter.class);

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		try {
			HttpSession sessao = ((HttpServletRequest) request).getSession(false);
		
			if (sessao == null) {
				((HttpServletResponse) response).sendRedirect("/Web/login");
			} else {
				Usuarios usuarioLogado = (Usuarios) sessao.getAttribute("usuario");
				Empresas empresa = (Empresas) sessao.getAttribute("empresa");

				String uri = ((HttpServletRequest) request).getRequestURI();

				HistoricoAcessoBo.getInstance().registraAcesso(uri, usuarioLogado,
						empresa);

				if (usuarioLogado == null) {
					((HttpServletResponse) response).sendRedirect("/Web/login");
				}
			}

			chain.doFilter(request, response);

		} catch (StaleObjectStateException staleEx) {
			log.error("Este interceptor nao implementa 'optimistic concurrency control'!");
			log.error("A applicacao nao funcionara sem 'compensation actions'!");
			throw staleEx;
		} catch (Throwable ex) {
			throw new ServletException(ex);
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
	}

	public void destroy() {
	}

}
