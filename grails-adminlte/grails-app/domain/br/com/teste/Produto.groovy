package br.com.teste

import br.com.teste.enums.Unidade

class Produto {
	
	String nome
	Unidade unidade
	Double preco
	Double custo

    static constraints = {
		nome blank: false, nullable: false, size: 20..60
		//unidade nullable: false, blank: false, inList: ["L","ML","CX"]
		//unidade nullable: false, blank: false, inList: Arrays.asList(Unidade.values())
		unidade nullable: false, blank: false
		preco min: new Double(0)
		custo min: new Double(0)
    }
}
