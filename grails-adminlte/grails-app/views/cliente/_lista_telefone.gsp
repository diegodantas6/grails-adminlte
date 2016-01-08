<table id="tabela" class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>Tipo</th>
			<th>Número</th>

			<g:if test="${editable}">
				<th style="width: 50px;">Ações</th>
			</g:if>
		</tr>
	</thead>
	<g:each in="${telefones}" var="telefone">
		<tr>
			<td>
				${telefone.tipoTelefone}
			</td>
			<td>
				${telefone.numero}
			</td>
			<g:if test="${editable}">
				<td>
					<div class="btn-group btn-group-justified" role="group">
						<div class="btn-group" role="group">
							<a href="javascript: alterarTelefone(${telefone.id})"><i
								class="fa fa-pencil" data-toggle="tooltip" title="Alterar"></i></a>
						</div>
						<div class="btn-group" role="group">
							<a href="javascript: excluirTelefone(${telefone.id})"><i
								class="fa fa-minus-circle" data-toggle="tooltip" title="Excluir"></i></a>
						</div>
					</div>
				</td>
			</g:if>
		</tr>
	</g:each>
</table>

<!-- page script -->
<script>
	$(function() {

		$('#tabela').DataTable();

	});
</script>
