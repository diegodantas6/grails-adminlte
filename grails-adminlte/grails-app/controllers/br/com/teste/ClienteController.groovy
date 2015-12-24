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
	
	def salvar() {
		
		
		
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
