package br.com.msystem.util;

public enum TipoNfiscal {
	Vendas(0), Demonstracao(1), Remessa(2), Retorno(3), Importacao(4), Exportacao(5), 
	SimplesRemessa(6), Devolucao(7), NotaComplementar(8), SimplesRemessaParaTerceiros(9), 
	Outros(99);
	
	private int codigo;
	
	public int getCodigo() {
		return codigo;
	}
	
	private TipoNfiscal(int codigo) {
		this.codigo = codigo;
	}
	
	public static TipoNfiscal fromInteger(int x) {
        switch(x) {
        case 0:
            return Vendas;
        case 1:
            return Demonstracao;
        case 2:
            return Remessa;
        case 3:
            return Retorno;
        case 4:
            return Importacao;
        case 5:
            return Exportacao;
        case 6:
            return SimplesRemessa;
        case 7:
            return Devolucao;
        case 8:
            return NotaComplementar;
        case 9:
            return SimplesRemessaParaTerceiros;
        case 99:
            return Outros;
        }
        return null;
    }
}
