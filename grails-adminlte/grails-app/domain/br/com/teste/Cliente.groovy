package br.com.teste

class Cliente {

	String nome
	String cpf

	static constraints = {
		nome blank: false, nullable: false, size: 20..60
		cpf blank: false, nullable: false, unique: true, minSize: 14
	}
}
