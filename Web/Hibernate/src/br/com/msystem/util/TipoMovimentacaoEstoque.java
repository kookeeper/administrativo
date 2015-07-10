/**
 * 
 */
package br.com.msystem.util;

/**
 * @author Administrador
 * 
 */
public enum TipoMovimentacaoEstoque {

	Entrada("E"), Saida("S");
	/**
	 * @param text
	 */
	private TipoMovimentacaoEstoque(final String text) {
		this.text = text;
	}

	private final String text;

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Enum#toString()
	 */
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return text;
	}
}