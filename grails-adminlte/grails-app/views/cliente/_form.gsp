<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">
			${title}
		</h3>
	</div>
	<form>
		<input type="hidden" id="id">

		<div class="box-body">

			<div class="col-sm-6 form-group">
				<label>Nome</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="text" class="form-control" id="nome">
				</div>
			</div>

			<div class="col-sm-6 form-group">
				<label>CPF</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="text" class="form-control" id="cpf"
						data-inputmask="'mask': '999.999.999-99'" data-mask>
				</div>
			</div>

		</div>
		<!-- /.box-body -->

		<div class="box-footer">
			<button type="reset" class="btn btn-danger"
				onclick="javascript: cancelar()">Cancelar</button>

			<button type="submit" class="btn btn-primary pull-right"
				onclick="javascript: salvar()">Salvar</button>
		</div>
	</form>
</div>
<!-- /.box -->

<!-- Page script -->
<script>
	$(function() {
		$("[data-mask]").inputmask();
	});
</script>
