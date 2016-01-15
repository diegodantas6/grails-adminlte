<!DOCTYPE html>
<html>
<head>

<!--CSS-->
<!--FullCalendar-->
<link rel="stylesheet"
	href="${createLink(uri: '/adminlte/plugins/fullcalendar-2.6.0/fullcalendar.min.css')}">
<link rel="stylesheet" media="print"
	href="${createLink(uri: '/adminlte/plugins/fullcalendar-2.6.0/fullcalendar.print.css')}">

<!--jQueryUI-->
<link rel="stylesheet"
	href="${createLink(uri: '/adminlte/plugins/jQueryUI/jquery-ui.min.css')}">
<link rel="stylesheet"
	href="${createLink(uri: '/adminlte/plugins/jQueryUI/jquery-ui.theme.min.css')}">

<!--JS-->
<!--FullCalendar-->
<script
	src="${createLink(uri: '/adminlte/plugins/fullcalendar-2.6.0/lib/moment.min.js')}"></script>
<%--<script--%>
<%--	src="${createLink(uri: '/adminlte/plugins/fullcalendar-2.6.0/lib/jquery.min.js')}"></script>--%>
<script
	src="${createLink(uri: '/adminlte/plugins/fullcalendar-2.6.0/fullcalendar.min.js')}"></script>
<script
	src="${createLink(uri: '/adminlte/plugins/fullcalendar-2.6.0/lang-all.js')}"></script>

<%--<!--jQueryUI-->--%>
<%--<script--%>
<%--	src="${createLink(uri: '/adminlte/plugins/jQueryUI/jquery-ui.min.js')}"></script>--%>

<meta name="layout" content="menu" />

<script>
	$(document).ready(function() {

		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay'
			},
			defaultDate : '2016-01-12',
			lang : 'pt-br',
			selectable : true,
			selectHelper : true,
			select : function(start, end) {
				//				var title = prompt('Event Title:');
				//				var eventData;
				//				if (title) {
				//					eventData = {
				//						title: title,
				//						start: start,
				//						end: end
				//					};
				//					$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
				//				}
				//				$('#calendar').fullCalendar('unselect');

				var event = {
					start : start,
					end : end
				};

				$("#btn_salvar_incluir").unbind("click");

				$("#btn_salvar_incluir").click(function() {
					salvarIncluir(event);
				});

				$("#titulo_incluir").val("");
				$("#data_ini_incluir").val(start.format());
				$("#data_fim_incluir").val(end.format());

				$("#dialog_incluir").dialog({
					modal : true,
					title : 'Incluir Evento',
					width : 'auto',
					resizable : false
				});

			},
			eventClick : function(calEvent, jsEvent, view) {
				//alert(calEvent.title + " was clicked on " + calEvent.start.format());

				$("#btn_salvar").unbind("click");

				$("#btn_salvar").click(function() {
					salvar(calEvent);
				});

				$("#btn_excluir").unbind("click");

				$("#btn_excluir").click(function() {
					excluir(calEvent.id);
				});

				$("#titulo").val(calEvent.title);
				$("#data_ini").val(calEvent.start.format());

				if (calEvent.end == null) {
					$("#data_fim").val("");
				} else {
					$("#data_fim").val(calEvent.end.format());
				}

				$("#dialog_alterar").dialog({
					modal : true,
					title : 'Alterar Evento',
					width : 'auto',
					resizable : false
				});

			},
			eventDrop : function(event, delta, revertFunc) {
				alert(event.title + " was dropped on " + event.start.format());

				if (!confirm("Are you sure about this change?")) {
					revertFunc();
				}
			},
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			events : [ {
				id : 1,
				title : 'All Day Event',
				start : '2016-01-01',
				color : 'rgb(200,100,100)'
			}, {
				id : 2,
				title : 'Long Event',
				start : '2016-01-07',
				end : '2016-01-10',
				color : 'rgb(100,200,100)'
			}, {
				id : 3,
				title : 'Repeating Event',
				start : '2016-01-09T16:00:00',
				color : 'rgb(100,100,200)'
			}, {
				id : 3,
				title : 'Repeating Event',
				start : '2016-01-16T16:00:00'
			}, {
				id : 4,
				title : 'Conference',
				start : '2016-01-11',
				end : '2016-01-13'
			}, {
				id : 5,
				title : 'Meeting',
				start : '2016-01-12T10:30:00',
				end : '2016-01-12T12:30:00'
			}, {
				id : 6,
				title : 'Lunch',
				start : '2016-01-12T12:00:00'
			}, {
				id : 7,
				title : 'Meeting',
				start : '2016-01-12T14:30:00'
			}, {
				id : 8,
				title : 'Happy Hour',
				start : '2016-01-12T17:30:00'
			}, {
				id : 9,
				title : 'Dinner',
				start : '2016-01-12T20:00:00'
			}, {
				id : 10,
				title : 'Birthday Party',
				start : '2016-01-13T07:00:00'
			}, {
				id : 11,
				title : 'Click for Google',
				url : 'http://google.com/',
				start : '2016-01-28'
			} ]
		});

	});

	function cancelar() {
		$("#dialog_alterar").dialog("close");
	}

	function cancelarIncluir() {
		$("#dialog_incluir").dialog("close");
	}

	function excluir(id) {
		$('#calendar').fullCalendar('removeEvents', id);

		cancelar();
	}

	function salvar(event) {
		var title = $("#titulo").val();
		var start = $("#data_ini").val();
		var end = $("#data_fim").val();

		event.title = title;
		event.start = start;
		event.end = end;

		$('#calendar').fullCalendar('updateEvent', event);

		cancelar();
	}

	function salvarIncluir(event) {
		var title = $("#titulo_incluir").val();
		var color = $("#color_incluir").val();

		if (title) {
			event.title = title;
			event.color = color;

			$('#calendar').fullCalendar('renderEvent', event, true); // stick? = true

			$('#calendar').fullCalendar('unselect');

			cancelarIncluir();
		} else {
			alert("Favor preencher o titulo!");
		}
	}
</script>

<style>
#calendar {
	max-width: 900px;
	margin: 0 auto;
}

.dialog {
	display: none;
	position: relative;
}
</style>

</head>
<body>

	<!-- Main content -->
	<section class="content">

		<div id='calendar'></div>

		<div id="dialog_alterar" class="dialog">
			<p>
				<input id="titulo" type="text" />
			</p>
			<p>
				<input id="data_ini" type="text" />
			</p>
			<p>
				<input id="data_fim" type="text" />
			</p>

			<input type="button" onclick="cancelar();" value="Cancelar" /> <input
				type="button" id="btn_excluir" value="Excluir" /> <input
				type="button" id="btn_salvar" value="Salvar" />
		</div>

		<div id="dialog_incluir" class="dialog">
			<p>
				<input id="titulo_incluir" type="text" placeholder="Titulo" />
			</p>
			<p>
				<input id="color_incluir" type="text" value="rgb(200,200,200)" />
			</p>
			<p>
				<input id="data_ini_incluir" type="text" disabled />
			</p>
			<p>
				<input id="data_fim_incluir" type="text" disabled />
			</p>

			<input type="button" onclick="cancelarIncluir();" value="Cancelar" />
			<input type="button" id="btn_salvar_incluir" value="Salvar" />
		</div>

	</section>

</body>
</html>
