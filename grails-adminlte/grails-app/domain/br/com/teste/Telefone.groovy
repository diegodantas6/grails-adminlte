package br.com.teste

import br.com.teste.enums.TipoTelefone;

class Telefone {

	String numero
	TipoTelefone tipoTelefone
	boolean deleted

	static transients = ['deleted']
	static belongsTo = [Cliente]

	static constraints = {
		numero blank: false, nullable: false
		tipoTelefone blank: false, nullable: false
	}
}
