package br.com.teste.enums;

public enum TipoTelefone {

	C("Casa"), T("Trabalho"), E("Celular");

	private String descricao;

	public String getDescricao() {
		return descricao;
	}
	
	private TipoTelefone(String descricao) {
		this.descricao = descricao;
	}

}
