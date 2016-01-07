<table id="tabela" class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>Número</th>
			<th>Tipo</th>
			<th style="width: 50px;">Ações</th>
		</tr>
	</thead>
	<g:each in="${cliente.telefones}" var="telefone">
		<tr>
			<td>${telefone.numero}</td>
			<td>${telefone.tipo}</td>
			<td>
				<div class="btn-group btn-group-justified" role="group">
					<div class="btn-group" role="group">
						<a href="javascript: alterarTelefone(${telefone.id})"><i class="fa fa-pencil" data-toggle="tooltip" title="Alterar"></i></a>
					</div>
					<div class="btn-group" role="group">
						<a href="javascript: excluirTelefone(${telefone.id})"><i class="fa fa-minus-circle" data-toggle="tooltip" title="Excluir"></i></a>
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
