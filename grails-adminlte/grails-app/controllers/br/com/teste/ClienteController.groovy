package br.com.teste

import grails.converters.JSON


class ClienteController {

	def index() {
	}

	def listar() {

		def lista = Cliente.createCriteria().list{ order("nome") }

		render(template: "lista", model:[clientes: lista])
	}

	def excluir() {

		def retorno = [:]

		Cliente cliente = Cliente.get(params.id)

		try {

			cliente.delete(flush:true)

			retorno["mensagem"] = "Excluido com sucesso!"
			retorno["type"] = "success"
			
		} catch(Exception e) {

			retorno["mensagem"] = "Não foi possível excluir!"
			retorno["type"] = "error"

		}

		render retorno as JSON
	}
}
