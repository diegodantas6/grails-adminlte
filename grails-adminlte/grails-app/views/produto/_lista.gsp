<%@page import="java.text.SimpleDateFormat"%>
<table id="tabela" class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>Nome</th>
			<th>Unidade</th>
			<th>Preço</th>
			<th>Custo</th>
			<th>Quantidade</th>
			<th>Data Alteração</th>
			<th style="width: 75px;">Ações</th>
		</tr>
	</thead>
	<g:each in="${produtos}" var="produto">
		<tr>
			<td>${produto.nome}</td>
			<td>${produto.unidade}</td>
			<td><g:formatNumber number="${produto.preco}" type="currency" /></td>
			<td><g:formatNumber number="${produto.custo}" type="currency" /></td>
			<td><g:formatNumber number="${produto.quantidade}" type="number" /></td>
			<td>${new SimpleDateFormat( "dd/MM/yyyy HH:mm:ss" ).format( produto.dataAlteracao )}</td>
			<td>
				<div class="btn-group btn-group-justified" role="group">
					<div class="btn-group" role="group">
						<a href="javascript: visualizar(${produto.id})"><i class="fa fa-eye" data-toggle="tooltip" title="Visualizar"></i></a>
					</div>
					<div class="btn-group" role="group">
						<a href="javascript: alterar(${produto.id})"><i class="fa fa-pencil" data-toggle="tooltip" title="Alterar"></i></a>
					</div>
					<div class="btn-group" role="group">
						<a href="javascript: excluir(${produto.id})"><i class="fa fa-minus-circle" data-toggle="tooltip" title="Excluir"></i></a>
					</div>
				</div>
			</td>
		</tr>
	</g:each>
</table>

<!-- page script -->
<script>
	$(function() {

		$('#tabela').DataTable();

	});
</script>
