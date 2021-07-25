$(document).ready(function(){
	load_data();
});

function load_data(){
	var data={act: "show"};
	$("#places_adjudicades").DataTable({
		ajax:{
			url:"${pageContext.request.contextPath}/AdjudicacioServlet",
			type: "get",
			data:data,
			dataSrc:"result"
		},
		columns :[
			{data:"dataAdjudicacio"},
			{data:"tipusContracte"},
			{data:"tipusJornada"},
			{data:"itinerant"},
			{data:"dataInici"},
			{data:"dataFiPrevista"},
			{data:"motiu"},
			{data:"illa"},
			{data:"municipi"},
			{data:"nomOcupant"},
			{data:"sexeOcupant"},
			{data:"unitat"}
		],"language": {
	            "processing": "Processant...",
	            "lengthMenu": "Mostra _MENU_ registres",
	            "zeroRecords": "No s'han trobat registres",
	            "emptyTable": "No hi ha registres disponible en aquesta taula",
	            "info": "Mostrant del _START_ al _END_ d'un total de _TOTAL_ registres",
	            "infoEmpty": "No hi ha registres disponibles",
	            "infoFiltered": "(filtrat de _MAX_ registres)",
	            "search": "Cerca:",
	            "infoThousands": ".",
	            "decimal": ",",
	            "loadingRecords": "Carregant...",
	            "paginate": {
	                "first": "Primer",
	                "previous": "Anterior",
	                "next": "Següent",
	                "last": "Últim"
	            },
	            "aria": {
	                "sortAscending": ": Activa per ordenar la columna de manera ascendent",
	                "sortDescending": ": Activa per ordenar la columna de manera descendent"
	            },
	            "buttons": {
	                "print": "Imprimeix",
	                "copy": "Copia",
	                "colvis": "Columnes",
	                "copyTitle": "Copia al portapapers",
	                "copySuccess": {
	                    "_": "%d files copiades",
	                    "1": "1 fila copiada"
	                },
	                "pageLength": {
	                    "-1": "Mostra totes les files",
	                    "_": "Mostra %d files"
	                },
	                "pdf": "PDF"
	            },
	            "select": {
	                "rows": {
	                    "_": "%d files seleccionades",
	                    "0": "Cap fila seleccionada",
	                    "1": "1 fila seleccionada"
	                }
	            },
	            "autoFill": {
	                "cancel": "Cancel·lar"
	            },
	            "thousands": ".",
	            "datetime": {
	                "hours": "Hora",
	                "minutes": "Minut",
	                "seconds": "Segons",
	                "unknown": "Desconegut",
	                "amPm": [
	                    "am",
	                    "pm"
	                ]
	            },
	            "editor": {
	                "close": "Tancar"
	            }
	        }
	});
}