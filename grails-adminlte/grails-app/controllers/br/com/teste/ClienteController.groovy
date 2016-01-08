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

	def listarTelefone() {

		Cliente cliente = Cliente.get(params.id)

		def lista = cliente.telefones

		render(template: "lista_telefone", model:[telefones: lista, editable: params.editable])
	}

	def incluir() {

		//render(template: "form", model:[title: "Novo", editable: true])

		render(template: "form_tab", model:[title: "Novo", editable: true])
	}

	def incluirTelefone() {

		render(template: "form_telefone", model:[editable: true])
	}


	def alterar() {

		Cliente cliente = Cliente.get(params.id)

		//render(template: "form", model:[title: "Alterar", editable: true, cliente: cliente])

		render(template: "form_tab", model:[title: "Alterar", editable: true, cliente: cliente])
	}

	def visualizar() {

		Cliente cliente = Cliente.get(params.id)

		//render(template: "form", model:[title: "Visualizar", editable: false, cliente: cliente])

		render(template: "form_tab", model:[title: "Visualizar", editable: false, cliente: cliente])
	}

	def salvar(Cliente cliente) {

		def retorno

		if (params.cliente.id) {

			Cliente old = Cliente.get(params.cliente.id);

			if (old.version.toLong() > params.cliente.version.toLong()) {

				retorno = UtilsMensagem.getMensagem("O cliente já foi alterado por outro usuário!\nFavor canecelar esta operação e tentar novamente!", NotifyType.ERROR)

				render retorno as JSON

				return
			}
		}

		if (cliente.hasErrors()) {

			retorno = UtilsMensagem.getMensagem("Não foi possível salvar!", NotifyType.ERROR, cliente.errors)
		} else {

			cliente.save(flush:true)

			retorno = UtilsMensagem.getMensagem("Salvo com sucesso!", NotifyType.SUCCESS)
		}

		render retorno as JSON
	}

	def salvarTelefone(Telefone telefone) {

		def retorno

		if (params.telefone.id) {

			Telefone old = Telefone.get(params.telefone.id);

			if (old.version.toLong() > params.telefone.version.toLong()) {

				retorno = UtilsMensagem.getMensagem("O telefone já foi alterado por outro usuário!\nFavor canecelar esta operação e tentar novamente!", NotifyType.ERROR)

				render retorno as JSON

				return
			}
		}

		if (telefone.hasErrors()) {

			retorno = UtilsMensagem.getMensagem("Não foi possível salvar!", NotifyType.ERROR, telefone.errors)
		} else {

			telefone.save(flush:true)

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

	def excluirTelefone() {

		def retorno

		Telefone telefone = Telefone.get(params.id)

		try {

			telefone.delete(flush:true)

			retorno = UtilsMensagem.getMensagem("Excluido com sucesso!", NotifyType.SUCCESS)
		} catch(Exception e) {

			retorno = UtilsMensagem.getMensagem("Não foi possível excluir!", NotifyType.ERROR)
		}

		render retorno as JSON
	}
}
