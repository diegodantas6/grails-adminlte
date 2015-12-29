<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="menu" />

<script type="text/javascript">
	$(document).ready(function() {
		carregarLista()
	})

	function carregarLista() {
		$("#divForm").hide()

		$.ajax({
			method : "POST",
			url : "produto/listar",
			data : {},
			success : function(data) {
				$("#divLista").html(data)
			}
		})
	}

	function excluir(id) {
		customConfirm('Deseja realmente excluir?', function() {
			$.ajax({
				method : "POST",
				url : "produto/excluir",
				data : {
					"id" : id
				},
				success : function(data) {

					$.notify(data.mensagem, data.type);

					if (data.type == "success") {
						carregarLista()
					}
				}
			})
		}, function() {
		});
	}

	function visualizar(id) {
		$.ajax({
			method : "POST",
			url : "produto/visualizar",
			data : {
				"id" : id
			},
			success : function(data) {
				$("#divFormLista").hide()
				$("#divForm").show()
				$("#divForm").html(data)
			}
		})
	}

	function alterar(id) {
		$.ajax({
			method : "POST",
			url : "produto/alterar",
			data : {
				"id" : id
			},
			success : function(data) {
				$("#divFormLista").hide()
				$("#divForm").show()
				$("#divForm").html(data)
			}
		})
	}

	function retornoSalvar(data) {
		$.notify(data.mensagem, data.type);

		if (data.type == "success") {
			carregarLista()
			$("#divFormLista").show()
		} else {
			for (i = 0; i < data.errors.errors.length; i++) {
				var text = data.errors.errors[i].message
				var field = "#div_" + data.errors.errors[i].field

				$(field).addClass("has-error");

				$(field).focusin(function() {
					$(this).removeClass("has-error");
				});

				$.notify(text, data.type);
			}
		}
	}

	function cancelar() {
		$("#divFormLista").show()
		$("#divForm").hide()
	}

	function incluir() {
		$.ajax({
			method : "POST",
			url : "produto/incluir",
			data : {},
			success : function(data) {
				$("#divFormLista").hide()
				$("#divForm").show()
				$("#divForm").html(data)
			}
		})
	}
</script>
</head>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Cadastro<small>Produto</small>
		</h1>
	</section>

	<!-- Main content -->
	<section class="content">

		<div class="box box-primary" id="divFormLista">

			<div class="box-header with-border">
				<h1 class="box-title">Produtos</h1>
				<button type="submit" onclick="javascript: incluir()"
					class="btn btn-primary pull-right">Novo</button>
			</div>

			<div class="box-body" id="divLista"></div>

		</div>

		<div class="box-body" id="divForm"></div>

	</section>
</body>
</html>
