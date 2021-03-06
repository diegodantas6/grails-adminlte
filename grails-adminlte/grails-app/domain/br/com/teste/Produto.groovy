package br.com.teste

import br.com.teste.enums.Unidade

class Produto {
	
	String nome
	Unidade unidade
	Date dataCriacao = new Date()
	Date dataAlteracao = new Date()
	Integer quantidade
	BigDecimal preco
	BigDecimal custo

    static constraints = {
		nome blank: false, nullable: false, size: 20..60
		unidade nullable: false, blank: false
		quantidade min: 0
    }
}
