<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="menu" />
	
	<script type="text/javascript">

		$(document).ready(function(){
			carregarLista()
		})

		function carregarLista(){
			$.ajax({
			  method: "POST",
			  url: "cliente/listar",
			  data: { },
			  success: function(data){
				  $("#divLista").html(data)
			  }
			})
		}

		function excluir(id){
			if (confirm("Deseja realmente excluir?")){
				$.ajax({
				  method: "POST",
				  url: "cliente/excluir",
				  data: { "id": id },
				  success: function(data) {

					  $.notify(data.mensagem, data.type);
					  
					  if (data.type == "success") {
						  carregarLista()
					  }
				  }
				})
			}
		}

		function visualizar(id){
			$.notify("Access granted", "success");
		}

		function alterar(id){

		}


		
	</script>
</head>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Cadastro<small>Cliente</small>
		</h1>
	</section>

	<!-- Main content -->
	<section class="content">

		<div class="box box-primary">

			<div class="box-header with-border">
				<h1 class="box-title">Clientes</h1>
				<button type="submit" class="btn btn-primary pull-right">Novo</button>
			</div>
			
			<div class="box-body" id="divLista"></div>

		</div>
	</section>
</body>
</html>
