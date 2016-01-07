<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">Telefone</h3>
	</div>
	<g:formRemote name="formTelefone" url="[action: 'salvarTelefone']"
		onSuccess="retornoSalvarTelefone(data)">

		<input type="hidden" name="cliente.telefone.id"
			value="${cliente?.telefone?.id}">

		<input type="hidden" name="cliente.telefone.version"
			value="${cliente?.telefone?.version}">

		<div class="box-body">

			<div class="col-sm-6 form-group" id="div_tipoTelefone">
				<label>Tipo</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="text" class="form-control"
						name="cliente.telefone.tipoTelefone"
						value="${cliente?.telefone?.tipoTelefone}">
				</div>
			</div>

			<div class="col-sm-6 form-group" id="div_numero">
				<label>Numero</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="text" class="form-control"
						name="cliente.telefone.numero" id="numero"
						value="${cliente?.telefone?.numero}">
				</div>
			</div>

		</div>
		<!-- /.box-body -->

		<div class="box-footer">
			<button type="reset" class="btn btn-danger"
				onclick="javascript: cancelarTelefone()">Cancelar</button>

			<button type="submit" class="btn btn-primary pull-right"
				onclick="javascript: salvarTelefone()">Salvar</button>
		</div>
	</g:formRemote>
</div>
<!-- /.box -->

<!-- Page script -->
<script>
	$(document).ready(function() {
		$("#numero").inputmask({
			mask : "(99) 9999-9999"
		});
	});
</script>
