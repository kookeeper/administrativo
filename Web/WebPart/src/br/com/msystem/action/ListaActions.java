package br.com.msystem.action;

import java.util.ArrayList;
import java.util.List;

public class ListaActions {

	public static List<Campo> listaCampos = new ArrayList<Campo>();

	static {
		addColuna("Usuarios", "Codigo do usuario", "codigoUsuario");
		addColuna("Usuarios", "Nome do usuario", "nomeUsuario");
	}

	private static void addColuna(String tabela, String nomeCampo, String descricao) {
		Campo campo = new Campo();
		campo.setNomeTabela(tabela);
		campo.setNomeCampo(nomeCampo);
		campo.setDescricaoCampo(descricao);
		listaCampos.add(campo);
	}

}
