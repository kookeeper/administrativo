package br.com.msystem.bean;

import java.util.ArrayList;
import java.util.List;

public class FreteTransp {

	private static List<FreteTransp> listaFreteTransp;
	
	static {
		listaFreteTransp = new ArrayList<FreteTransp>();
		listaFreteTransp.add(new FreteTransp(0, "Emitente"));
		listaFreteTransp.add(new FreteTransp(1, "Destinatário"));
	}
	
	private Integer codigoFreteTransp;
	private String descricaoFreteTransp;
	
	public FreteTransp(Integer codigo, String descricao) {
		this.codigoFreteTransp = codigo;
		this.descricaoFreteTransp = descricao;
	}

	public Integer getCodigoFreteTransp() {
		return codigoFreteTransp;
	}

	public void setCodigoFreteTransp(Integer codigoFreteTransp) {
		this.codigoFreteTransp = codigoFreteTransp;
	}

	public String getDescricaoFreteTransp() {
		return descricaoFreteTransp;
	}

	public void setDescricaoFreteTransp(String descricaoFreteTransp) {
		this.descricaoFreteTransp = descricaoFreteTransp;
	}

	public static List<FreteTransp> getListaFreteTransp() {
		return listaFreteTransp;
	}

}
