package br.com.msystem.bean;

import java.util.Date;

public class LancamentoContaPagar {

	private int conta_pagar_auto_sq;
	private int conta_pagar_sq;
	private int fornecedor_sq;
	private int numero_duplicata;
	private double valor_duplicata;
	private Date dtcadastro_duplicata;
	private Date dtvencimento_duplicata;
	private String observacao;
	private int referencia_auto;
	public int getConta_pagar_auto_sq() {
		return conta_pagar_auto_sq;
	}
	public void setConta_pagar_auto_sq(int conta_pagar_auto_sq) {
		this.conta_pagar_auto_sq = conta_pagar_auto_sq;
	}
	public int getConta_pagar_sq() {
		return conta_pagar_sq;
	}
	public void setConta_pagar_sq(int conta_pagar_sq) {
		this.conta_pagar_sq = conta_pagar_sq;
	}
	public int getFornecedor_sq() {
		return fornecedor_sq;
	}
	public void setFornecedor_sq(int fornecedor_sq) {
		this.fornecedor_sq = fornecedor_sq;
	}
	public int getNumero_duplicata() {
		return numero_duplicata;
	}
	public void setNumero_duplicata(int numero_duplicata) {
		this.numero_duplicata = numero_duplicata;
	}
	public double getValor_duplicata() {
		return valor_duplicata;
	}
	public void setValor_duplicata(double valor_duplicata) {
		this.valor_duplicata = valor_duplicata;
	}
	public Date getDtcadastro_duplicata() {
		return dtcadastro_duplicata;
	}
	public void setDtcadastro_duplicata(Date dtcadastro_duplicata) {
		this.dtcadastro_duplicata = dtcadastro_duplicata;
	}
	public Date getDtvencimento_duplicata() {
		return dtvencimento_duplicata;
	}
	public void setDtvencimento_duplicata(Date dtvencimento_duplicata) {
		this.dtvencimento_duplicata = dtvencimento_duplicata;
	}
	public String getObservacao() {
		return observacao;
	}
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	public int getReferencia_auto() {
		return referencia_auto;
	}
	public void setReferencia_auto(int referencia_auto) {
		this.referencia_auto = referencia_auto;
	}

}
