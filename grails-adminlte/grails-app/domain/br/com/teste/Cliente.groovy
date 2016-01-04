package br.com.teste

class Cliente {

	String nome
	String cpf
	List telefones = new ArrayList()

	static hasMany = [telefones: Telefone]

	static constraints = {
		nome blank: false, nullable: false, size: 20..60
		cpf blank: false, nullable: false, unique: true, minSize: 14
	}
	
	static mapping = {
		telefones cascade: "all-delete-orphan"
	}
	
}
