// Llamada al JSON
var lista = (function() {
	var json = null;
	$.ajax({
		'async': false,
		'global': false,
		'url': "files/Formulari.json",
		'dataType': "json",
		'success': function(data) {
			json = data;
		}
	});
	return json;
})();

var myList = lista.data;
//Array de inputs
var inputList = new Array();

// Funcion que crea una tabla
function buildHtmlTable(selector) {
	var columns = addAllColumnHeaders(myList, selector);

	for (var i = 0; i < myList.length; i++) {
		var row$ = $('<tr/>');
		for (var colIndex = 0; colIndex < columns.length; colIndex++) {
			var cellValue = myList[i][columns[colIndex]];
			if (cellValue == null) {
				cellValue = "";
			}
			row$.append($('<td/>').html(cellValue));
		}
		row$
			.append($('<td/>')
				.html(
					"<input type='number' class='prova' min='0' max='9' onkeypress='return (event.charCode >= 48 && event.charCode <= 57)' style=' width:100px'>"));
		$(selector).append(row$);
	}
	setFunction();
	createHiddenInputs();
}

// Función que añade un header a la tabla
function addAllColumnHeaders(myList, selector) {
	var columnSet = [];
	var headerTr$ = $('<tr/>');

	for (var i = 0; i < myList.length; i++) {
		var rowHash = myList[i];
		for (var key in rowHash) {
			console.log(key);
			if ($.inArray(key, columnSet) == -1 && key != "id") {
				columnSet.push(key);
				console.log(columnSet);
				headerTr$.append($('<th/>').html(key));
			}
		}
	}
	headerTr$.append($('<th/>').html("Modificar"));
	$(selector).append(headerTr$);

	return columnSet;
}

function buildNewHtmlTable(selector) {
	var columns = addPredefinedColumnHeaders(selector);

	for (var i = 0; i < list.length; i++) {
		var row$ = $('<tr/>');
		for (var colIndex = 1; colIndex < columns.length; colIndex++) {
			var cellValue = myList[i][columns[colIndex]];
			if (cellValue == null) {
				cellValue = "";
			}
			row$.append($('<td/>').html(cellValue));
		}
		row$
			.append($('<td/>')
				.html(
					"<input type='number' class='prova' min='0' max='9' onkeypress='return (event.charCode >= 48 && event.charCode <= 57)' style=' width:100px'>"));
		$(selector).append(row$);
	}
	setFunction();
	createHiddenInputs();
}

function addPrueba(variable){
	document.getElementById("parrafo").innerHTML= variable;
}

function addPredefinedColumnHeaders(selector) {
	var columnNames = ["Data d'Adjudicació'", "Tipus de Contracte", "Tipus de Jornada", "Data d'Inici", "Data de Finalització Prevista", "Motiu", "Illa", "Municipi", "Adjudicat a", "Unitat"];
	var headerTr = $('<tr/>');
	for (var i = 0; i < columnNames.length; i++) {
		headerTr.append($('<th/>').html(columnNames[i]));
	}
	headerTr$.append($('<th/>').html("Modificar"));
	$(selector).append(headerTr);
	return columnNames;
}

// Funcion que añade la funcion sortTable() a todos los elementos th
function setFunction() {
	var th = document.getElementsByTagName("th");
	for (i = 0; i < th.length; i++) {
		th[i].setAttribute("onclick", "sortTable(" + i + ");");
	}
}

// Función que ordena la tabla
function sortTable(n) {
	var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
	table = document.getElementById("excelDataTable");
	switching = true;
	// Orden ascendente
	dir = "asc";
	// Loop que continua hasta que hay cambio 
	while (switching) {
		switching = false;
		rows = table.rows;
		// Recorre las rows de la tabla menos la tag th
		for (i = 1; i < (rows.length - 1); i++) {
			shouldSwitch = false;
			// Toma los valores a comparar para ordenar 
			x = rows[i].getElementsByTagName("TD")[n];
			y = rows[i + 1].getElementsByTagName("TD")[n];
			// Cambia las celdas en base a si es ascendente o descendente
			if (dir == "asc") {
				if (x.innerHTML.toLowerCase() > y.innerHTML
					.toLowerCase()) {
					// Rompe el loop
					shouldSwitch = true;
					break;
				}
			} else if (dir == "desc") {
				if (x.innerHTML.toLowerCase() < y.innerHTML
					.toLowerCase()) {
					// Rompe el loop
					shouldSwitch = true;
					break;
				}
			}
		}
		if (shouldSwitch) {
			// Marca switch hecho
			rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
			switching = true;
			// Cada vez que hay un switch, suma 1
			switchcount++;
		} else {
			// Si no es ascendente
			if (switchcount == 0 && dir == "asc") {
				dir = "desc";
				switching = true;
			}
		}
	}
}
// Instrucción JQuery que recoge los valores de los inputs y los muestra por consola.
$(document).ready(
	function() {
		$("#desa").click(function() {
			var inputs = $(".prova").map(function() {
				return $(this).val();
			}).get();
			var codes = $(".place_code").map(function() {
				return $(this).val();
			}).get();
			$.fn.createNewJson(codes, inputs);
		});
		//Crea un nuevo objeto Json relacionando el orden de preferencia con los id's de las plazas.
		$.fn.createNewJson = function(codes, inputs) {
			var newJson = "[";
			for (var i = 0; i < codes.length; i++) {
				if (inputs[i] == "") {
					inputs[i] = myList[i].ordre_preferencia;
				}
				newJson += "{'" + codes[i] + "': '"
					+ inputs[i] + "'}";
				if (i != (codes.length - 1)) {
					newJson += ",";
				}
			}
			newJson += "]";
			//newJson = JSON.parse(newJson);
			console.log(newJson);
		}
	});
//Crea inputs hidden que contienen los id's de las plazas. Luego los almacena en un array.
function createHiddenInputs() {
	for (var i = 0; i < myList.length; i++) {
		var input = document.createElement("INPUT");
		input.setAttribute("type", "hidden");
		input.setAttribute("class", "place_code");
		input.setAttribute("value", myList[i].id);
		inputList.push(input);
		document.body.appendChild(input);
	}
}