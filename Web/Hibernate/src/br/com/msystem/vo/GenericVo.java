package br.com.msystem.vo;

import java.io.Serializable;

public class GenericVo {

	private Serializable registro;
	
	private boolean editavel=true;
	
	private boolean excluivel=true;

	private String nomeTabela;
	
	private String tituloTabela;
	
	public boolean isEditavel() {
		return editavel;
	}

	public void setEditavel(boolean editavel) {
		this.editavel = editavel;
	}

	public boolean isExcluivel() {
		return excluivel;
	}

	public void setExcluivel(boolean excluivel) {
		this.excluivel = excluivel;
	}

	public String getNomeTabela() {
		return nomeTabela;
	}

	public void setNomeTabela(String nomeTabela) {
		this.nomeTabela = nomeTabela;
	}

	public String getTituloTabela() {
		return tituloTabela;
	}

	public void setTituloTabela(String tituloTabela) {
		this.tituloTabela = tituloTabela;
	}

	public Serializable getRegistro() {
		return registro;
	}

	public void setRegistro(Serializable registro) {
		this.registro = registro;
	}

}
