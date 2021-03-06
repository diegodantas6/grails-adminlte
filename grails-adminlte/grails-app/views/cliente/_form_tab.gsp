<div id="tabs">
	<ul>
		<li><a href="#tabCliente">Cliente</a></li>
		<li><a href="#tabTelefone">Telefones</a></li>
	</ul>

	<div id="tabCliente">
		<g:render template="form"></g:render>
	</div>

	<div id="tabTelefone">

		<div class="box box-primary" id="divFormListaTelefone">

			<div class="box-header with-border">
				<h1 class="box-title">Telefones</h1>

				<g:if test="${editable}">
					<button type="submit" onclick="javascript: incluirTelefone()"
						class="btn btn-primary pull-right">Novo</button>
				</g:if>
			</div>

			<div class="box-body" id="divListaTelefone"></div>

		</div>

		<div class="box-body" id="divFormTelefone"></div>

	</div>
</div>

<!-- criar tabs -->
<script>
	$("#tabs").tabs();
</script>
