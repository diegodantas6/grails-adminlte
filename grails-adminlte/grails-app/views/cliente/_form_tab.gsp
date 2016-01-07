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
				<button type="submit" onclick="javascript: incluirTelefone()"
					class="btn btn-primary pull-right">Novo</button>
			</div>

			<g:render template="lista_telefone"></g:render>
			
		</div>
		
		<div class="box-body" id="divFormTelefone"></div>

	</div>
</div>

<!-- criar tabs -->
<script>
	$("#tabs").tabs();
</script>
