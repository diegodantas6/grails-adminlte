<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">
			${title}
		</h3>
	</div>
	<g:formRemote name="form" url="[action: 'salvar']" onSuccess="retornoSalvar(data)">
		
		<input type="hidden" name="cliente.id" value="${cliente?.id}">
		
		<input type="hidden" name="cliente.version" value="${cliente?.version}">

		<div class="box-body">

			<div class="col-sm-6 form-group" id="div_nome">
				<label>Nome</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="text" class="form-control" name="cliente.nome" id="nome" value="${cliente?.nome}">
				</div>
			</div>

			<div class="col-sm-6 form-group" id="div_cpf">
				<label>CPF</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="text" class="form-control" name="cliente.cpf" value="${cliente?.cpf}"
						data-inputmask="'mask': '999.999.999-99'" data-mask>
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
	$(function() {
		$("[data-mask]").inputmask();

		$("#nome").focus();
	});
</script>
