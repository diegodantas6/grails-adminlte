<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="menu" />

<script type="text/javascript">
	function excluir(id) {
		$.confirm({
			confirmButton : 'Confirmar',
			cancelButton : 'Cancelar',
			confirmButtonClass : 'btn-primary',
			cancelButtonClass : 'btn-danger',
			keyboardEnabled : true,
			//theme : 'supervan',
			title : 'Sistema Template',
			icon : 'glyphicon glyphicon-heart',
			content : 'Deseja realmente excluir?',

			confirm : function() {
				console.log('excluir: ' + id)
			}
		});
	}

	function teste() {

		var obj = getConfirm()

		obj.setContent('text to set')

		obj.confirm(function() {
			alert('vaiiiii')
		})
	}

	function getConfirm() {
		var obj = $.confirm({
			theme : 'supervan'
		});

		return obj;
	}
</script>

</head>
<body>

	<p>
		<a href="javascript: excluir(1)"><i class="fa fa-minus-circle"
			data-toggle="tooltip" title="Excluir"></i></a>
	</p>
	<p>
		<a href="javascript: excluir(2)"><i class="fa fa-minus-circle"
			data-toggle="tooltip" title="Excluir"></i></a>
	</p>
	<p>
		<a href="javascript: excluir(3)"><i class="fa fa-minus-circle"
			data-toggle="tooltip" title="Excluir"></i></a>
	</p>
	<p>
		<a href="javascript: teste()">VAI</a>
	</p>
</body>
</html>
