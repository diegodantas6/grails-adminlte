<table id="tabela" class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>Nome</th>
			<th>CPF</th>
			<th style="width: 50px;">Ações</th>
		</tr>
	</thead>
	<g:each in="${clientes}" var="cliente">
		<tr>
			<td>${cliente.nome}</td>
			<td>${cliente.cpf}</td>
			<td>
				<a href="javascript: visualizar(${cliente.id})"><i class="fa fa-eye" data-toggle="tooltip" title="Visualizar"></i></a>
				<a href="javascript: alterar(${cliente.id})"><i class="fa fa-pencil" data-toggle="tooltip" title="Alterar"></i></a>
				<a href="javascript: excluir(${cliente.id})"><i class="fa fa-minus-circle" data-toggle="tooltip" title="Excluir"></i></a>
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
