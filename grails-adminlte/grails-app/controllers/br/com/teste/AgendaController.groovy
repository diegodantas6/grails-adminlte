package br.com.teste

import br.com.teste.enums.NotifyType;
import br.com.teste.utils.UtilsMensagem;
import grails.converters.JSON


class AgendaController {

	def index() {
	}

	def listar() {

		def lista = Produto.createCriteria().list{ order("nome") }

		render(template: "lista", model:[produtos: lista])
	}

	def incluir() {

		render(template: "form", model:[title: "Novo", editable: true])
	}

	def alterar() {

		Produto produto = Produto.get(params.id)

		render(template: "form", model:[title: "Alterar", editable: true, produto: produto])
	}

	def visualizar() {

		Produto produto = Produto.get(params.id)

		render(template: "form", model:[title: "Visualizar", editable: false, produto: produto])
	}

	def salvar(Produto produto) {

		def retorno

		if (params.produto.id) {

			Produto old = Produto.get(params.produto.id);

			if (old.version.toLong() > params.produto.version.toLong()) {

				retorno = UtilsMensagem.getMensagem("O produto já foi alterado por outro usuário!\nFavor canecelar esta operação e tentar novamente!", NotifyType.ERROR)

				render retorno as JSON

				return
			}
		}

		produto.dataAlteracao = new Date()

		if (produto.hasErrors()) {

			retorno = UtilsMensagem.getMensagem("Não foi possível salvar!", NotifyType.ERROR, produto.errors)
		} else {

			produto.save(flush:true)

			retorno = UtilsMensagem.getMensagem("Salvo com sucesso!", NotifyType.SUCCESS)
		}

		render retorno as JSON
	}

	def excluir() {

		def retorno

		Produto produto = Produto.get(params.id)

		try {

			produto.delete(flush:true)

			retorno = UtilsMensagem.getMensagem("Excluido com sucesso!", NotifyType.SUCCESS)
		} catch(Exception e) {

			retorno = UtilsMensagem.getMensagem("Não foi possível excluir!", NotifyType.ERROR)
		}

		render retorno as JSON
	}
}
