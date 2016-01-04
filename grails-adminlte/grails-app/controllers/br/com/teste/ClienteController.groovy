package br.com.teste

import br.com.teste.enums.NotifyType;
import br.com.teste.utils.UtilsMensagem;
import grails.converters.JSON


class ClienteController {

	def index() {
	}

	def listar() {

		def lista = Cliente.createCriteria().list{ order("nome") }

		render(template: "lista", model:[clientes: lista])
	}

	def incluir() {
		
		render(template: "form", model:[title: "Novo", editable: true])
		
	}
	
	def alterar() {
		
		Cliente cliente = Cliente.get(params.id)
		
		render(template: "form", model:[title: "Alterar", editable: true, cliente: cliente])
		
	}

	def visualizar() {
		
		Cliente cliente = Cliente.get(params.id)
		
		render(template: "form", model:[title: "Visualizar", editable: false, cliente: cliente])
		
	}

	def salvar(Cliente cliente) {

		def retorno

		if (cliente.hasErrors()) {
			
			retorno = UtilsMensagem.getMensagem("Não foi possível salvar!", NotifyType.ERROR, cliente.errors)
			
		} else {
		
			cliente.save(flush:true)
		
			retorno = UtilsMensagem.getMensagem("Salvo com sucesso!", NotifyType.SUCCESS)
		}
		
		render retorno as JSON
		
	}
	
	def excluir() {

		def retorno

		Cliente cliente = Cliente.get(params.id)

		try {

			cliente.delete(flush:true)

			retorno = UtilsMensagem.getMensagem("Excluido com sucesso!", NotifyType.SUCCESS)
			
		} catch(Exception e) {

			retorno = UtilsMensagem.getMensagem("Não foi possível excluir!", NotifyType.ERROR)

		}

		render retorno as JSON
	}
}
