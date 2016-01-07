<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">
			${title}
		</h3>
	</div>
	<g:formRemote name="form" url="[action: 'salvar']"
		onSuccess="retornoSalvar(data)">

		<input type="hidden" name="cliente.id" value="${cliente?.id}">

		<input type="hidden" name="cliente.version"
			value="${cliente?.version}">

		<div class="box-body">

			<div class="col-sm-6 form-group" id="div_nome">
				<label>* Nome</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="text" class="form-control" name="cliente.nome"
						id="nome" <g:if test="${!editable}">disabled</g:if>
						value="${cliente?.nome}">
				</div>
			</div>

			<div class="col-sm-6 form-group" id="div_cpf">
				<label>* CPF</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="text" class="form-control" name="cliente.cpf" id="cpf"
						<g:if test="${!editable}">disabled</g:if> value="${cliente?.cpf}">
				</div>
			</div>

		</div>
		<!-- /.box-body -->

		<div class="box-footer">

			<g:if test="${editable}">
				<button type="reset" class="btn btn-danger"
					onclick="javascript: cancelar()">Cancelar</button>

				<button type="submit" class="btn btn-primary pull-right"
					onclick="javascript: salvar()">Salvar</button>
			</g:if>
			<g:else>
				<button type="reset" class="btn btn-primary pull-right"
					onclick="javascript: cancelar()">Voltar</button>
			</g:else>
		</div>
	</g:formRemote>
</div>
<!-- /.box -->

<!-- Page script -->
<script>
	$(document).ready(function() {
		$("#nome").focus();

		$("#cpf").inputmask({
			mask : "999.999.999-99",
			clearIncomplete : true
		});
	});
</script>
