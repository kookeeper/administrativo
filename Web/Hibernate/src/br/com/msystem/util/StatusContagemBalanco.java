package br.com.msystem.util;

public enum StatusContagemBalanco {


	Pendente(0), Andamento(1), Finalizada(2);
	/**
	 * @param codigo
	 */
	private StatusContagemBalanco(final int codigo) {
		this.codigo = codigo;
	}

	private final int codigo;

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Enum#toString()
	 */
	public int codigo() {
		// TODO Auto-generated method stub
		return codigo;
	}
	
	public static StatusContagemBalanco fromInteger(int x) {
        switch(x) {
        case 0:
            return Pendente;
        case 1:
            return Andamento;
        case 2:
            return Finalizada;
        }
        return null;
    }
}
