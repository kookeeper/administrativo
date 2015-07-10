package br.com.msystem.decorator;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;

import org.displaytag.decorator.TableDecorator;

import br.com.msystem.dao.GenericDaoHibernate;
import br.com.msystem.vo.Acessos;
import br.com.msystem.vo.Agenda;
import br.com.msystem.vo.GenericVo;

public class Wrapper extends TableDecorator {

	/**
	 * Cria um novo Wrapper decorator que ira reformatar alguns dados
	 */
	public Wrapper() {
		super();
	}

	public String getBotoes() {
		int id = 0;
		String html;
		boolean editavel = true, excluivel = true, realizarAgenda = false;
		try {
			id = GenericDaoHibernate.getIdColumnValue(this.getCurrentRowObject(), this.getCurrentRowObject().getClass());
			if (this.getCurrentRowObject() instanceof GenericVo) {
				editavel = ((GenericVo)this.getCurrentRowObject()).isEditavel();
				excluivel = ((GenericVo)this.getCurrentRowObject()).isExcluivel();
				
				if (this.getCurrentRowObject() instanceof Agenda) {
					realizarAgenda = !((Agenda)this.getCurrentRowObject()).getRealizado().equalsIgnoreCase("S");
				}
			} else {
				editavel = isEditavel(this.getCurrentRowObject());
				excluivel = isExcluivel(this.getCurrentRowObject());
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		String path = ((HttpServletRequest)getPageContext().getRequest()).getContextPath();
		
		html = (editavel || excluivel || realizarAgenda) ? "<center>" +
				"		<s:property value=\"idColumnName\"/>" + 
				((editavel) ? " <a href=\"editar" + this.getCurrentRowObject().getClass().getSimpleName() + "?id=" + id + "\" target=\"conteudo\">" +
						" <img alt=\"Editar\" src=\"" + path + "/imagens/edit.gif\" border=\"0\" height=\"23\" style=\"background-color: transparent;\" title=\"Editar\"/>" +
						" </a>" : "") +
				((editavel && excluivel) ? "&nbsp;&nbsp;&nbsp;" : "") + 
				((excluivel) ? " <a href=\"excluir" + this.getCurrentRowObject().getClass().getSimpleName() + "?id=" + id + "\" >" +
						" <img alt=\"Excluir\" src=\"" + path + "/imagens/excluir.gif\" border=\"0\" height=\"23\" title=\"Excluir\" />" +
						" </a>" : "") +
				(((editavel || excluivel) && realizarAgenda) ? "&nbsp;&nbsp;&nbsp;" : "") + 
				((realizarAgenda) ? " <a href=\"realizarAgenda?id=" + id + "\">" +
						" <img alt=\"RealizarAgenda\" src=\"" + path + "/imagens/Salvar.png\" border=\"0\" height=\"23\" title=\"Realizar Agenda\" />" +
						" </a>" : "") +
				"		</center>" : "";
		return html;
	}

	private boolean isEditavel(Object currentRowObject) {
		return true;
	}

	private boolean isExcluivel(Object currentRowObject) {
		if (currentRowObject instanceof Acessos)
			return false;
		return true;
	}

}
