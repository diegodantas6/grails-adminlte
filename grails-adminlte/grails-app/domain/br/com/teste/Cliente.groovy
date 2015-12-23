package br.com.teste

class Cliente {

	String nome
	String cpf

	static constraints = {
		nome blank: false, nullable: false
		cpf blank: false, nullable: false, unique: true
	}
}
