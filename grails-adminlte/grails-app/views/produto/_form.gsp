<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">
			${title}
		</h3>
	</div>
	<g:formRemote name="form" url="[action: 'salvar']"
		onSuccess="retornoSalvar(data)">

		<input type="hidden" name="produto.id" value="${produto?.id}">

		<input type="hidden" name="produto.version"
			value="${produto?.version}">

		<div class="box-body">

			<div class="col-sm-6 form-group" id="div_nome">
				<label>* Nome</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="text" class="form-control" name="produto.nome"
						id="nome" value="${produto?.nome}">
				</div>
			</div>

			<div class="col-sm-6 form-group" id="div_unidade">
				<label>* Unidade</label>

				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>

					<g:select class="form-control select2" style="width: 100%;"
						noSelection="${['null':'Select One...']}" name="produto.unidade"
						from="${br.com.teste.enums.Unidade?.values()}"
						value="${produto?.unidade}" />
				</div>

			</div>

			<div class="col-sm-6 form-group" id="div_preco">
				<label>* Preço</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="text" class="form-control" name="produto.preco"
						value="${produto?.preco}">
				</div>
			</div>

			<div class="col-sm-6 form-group" id="div_custo">
				<label>* Custo</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="text" class="form-control" name="produto.custo"
						value="${produto?.custo}">
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
		$(".select2").select2();

		$("[data-mask]").inputmask();

		$("#nome").focus();
	});
</script>
