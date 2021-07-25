<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="ple"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ca">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Portal dels Interins">
<meta name="author" content="Govern de les Illes Balears.">

<!-- Scripts -->
<!-- Bootstrap JS -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
<!-- JQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- Ajax -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- DATATABLE AJAX JS -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<!-- JS externo -->
<script type="text/javascript" src="js/newLogear.js"></script>
<!-- <script type="text/javascript" src="js/Adjudicacio.js"></script> -->
<script>
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
			{data:"dataInici"},
			{data:"dataFiPrevista"},
			{data:"motiu"},
			{data:"illa"},
			{data:"municipi"},
			{data:"nomOcupant"},
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
</script>
<!-- Scripts -->
<!-- Estilos -->
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<!-- Iconos -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- DATATABLE CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
<!-- DATATABLE AJAX CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
<!-- CSS externo -->
<link rel="stylesheet" href="css/style.css">
<!-- Estilos -->
</head>
<body onLoad="buildHtmlTable('#excelDataTable')">
	<fmt:setLocale value="${param.l}" />
	<fmt:setBundle basename="m" var="i"/>
	<title><fmt:message bundle="${i}" key="TEMPLATE.TITOLFORMULARI" /></title>
	<!-- Barra Navegación -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<!-- LOGO GOIB -->
			<a class="navbar-brand" href="index.jsp"><img
				src="files\logo_caib.es.png" class="logo" /></a>
			<button class="navbar-toggler collapsed" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
				aria-controls="navbarCollapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- LOGO GOIB -->
			<!-- Items Navegación -->
			<div class="container-fluid">
				<div class="navbar-collapse collapse justify-content-end"
					id="navbarCollapse">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link active"
							href="inici.do"><fmt:message bundle="${i}" key="TEMPLATE.INICI" /></a></li>
						<li class="nav-item dropdown  active"><a
							class="nav-link dropdown-toggle active" href="#"
							id="navbarDarkDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"><fmt:message bundle="${i}" key="TEMPLATE.INTERINSDISPONIBLES" /></a>
							<ul class="dropdown-menu dropdown-menu-dark"
								aria-labelledby="navbarDarkDropdownMenuLink">
								<li><a class="dropdown-item" href="#"><fmt:message bundle="${i}" key="TEMPLATE.PERSONALNETEJA" /></a></li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle active" href="#"
							id="navbarDarkDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"><fmt:message bundle="${i}" key="TEMPLATE.UTILITATS" /></a>
							<ul class="dropdown-menu dropdown-menu-dark"
								aria-labelledby="navbarDarkDropdownMenuLink">
								<li><a class="dropdown-item" href="#"><fmt:message bundle="${i}" key="TEMPLATE.POSSESSIO" /></a></li>
								<li><a class="dropdown-item" href="#"><fmt:message bundle="${i}" key="TEMPLATE.CANVIDISPONIBILITAT" /></a></li>
								<li><a class="dropdown-item" href="#"><fmt:message bundle="${i}" key="TEMPLATE.AUTORITZACIONS" /></a></li>
								<li><a class="dropdown-item" href="#"><fmt:message bundle="${i}" key="TEMPLATE.RENUNCIES" /></a></li>
								<li><a class="dropdown-item" href="#"><fmt:message bundle="${i}" key="TEMPLATE.COMPROVATITULACIO" /></a></li>
							</ul>
						<li class="nav-item"><a class="nav-link active" href=""><fmt:message bundle="${i}" key="TEMPLATE.DADESPREVIES" /></a></li>
					</ul>
						<button
							class="m-0 text-center text-white float-right btn btn-black"
							onclick="window.location.href='Adjudicacio.jsp'"><fmt:message bundle="${i}" key="TEMPLATE.CAT" /></button>
						<span class="text-white"> | </span>
						<button
							class="m-0 text-center text-white float-right btn btn-black"
							onclick="window.location.href='Adjudicacio.jsp?l=es'"><fmt:message bundle="${i}" key="TEMPLATE.ES" /></button>
				</div>
			</div>
			<!-- Items Navegación -->
		</div>
	</nav>
	<!-- Barra Navegación -->
	<!-- Cabecera -->
	<header class="py-5 mb-5">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-12">
					<h1 class="display-4 text-white mt-5 mb-2"><fmt:message bundle="${i}" key="TEMPLATE.TITOLADJUDICACIONS" /></h1>
				</div>
			</div>
		</div>
	</header>
	<!-- Cabecera -->
	<!-- Contenido -->
	<div class="container pb-5">
		<div class="row justify-content-center">
			<p id="subtitol" class="text-center"><fmt:message bundle="${i}" key="TEMPLATE.ADJUDICACIOTEXT" /></p>
			<!-- Selección Fecha -->
			<form class="form" action="resultatsAdjudicacio.do">
				<div class="form-row pb-3">
					<label for="convocatoria" class="col-form-label col-form-label-lg"><strong><fmt:message bundle="${i}" key="TEMPLATE.CONVOCATORIA" /></strong></label>
					<select name="convocatoria" id="convocatoria"
						class="form-control form-control-lg">
						<option value="-1"><fmt:message bundle="${i}" key="TEMPLATE.ADJUDICACIOCONVOCATORIA" /></option>
						<option value="388">388 - PLACES DEL 7 AL 9 D'ABRIL DE
							2021</option>
						<option value="387">387 - PLACES DEL 19 AL 22 DE MARÇ DE
							2021</option>
						<option value="385">385 - PLACES DEL 12 AL 15 DE MARÇ DE
							2021</option>
						<option value="384">384 - PLACES DEL 5 AL 8 DE MARÇ DE
							2021</option>
						<option value="382">382 - PLACES DEL 26 DE FEBRER AL 02
							DE MARÇ DE 2021</option>
						<option value="381">381 - PLACES DEL 19 AL 22 DE FEBRER</option>
						<option value="380">380 - PLACES DEL 12 AL 15 DE FEBRER
							DE 2021</option>
						<option value="378">378 - PLACES DEL 5 AL 8 DE FEBRER DE
							2021</option>
						<option value="376">376 - PLACES DEL 29 DE GENER DE 2021
							AL 1 DE FEBRER DE 2021</option>
						<option value="374">374 - PLACES DEL 22 AL 25 DE GENER DE
							2021</option>
						<option value="372">372 - PLACES DEL 15 AL 18 DE GENER DE
							2021</option>
						<option value="371">371 - PLACES DE L´11 AL 13 DE GENER
							DE 2021</option>
						<option value="370">370 - PLACES DEL 8 A L'11 DE GENER DE
							2021</option>
						<option value="369">369 - PLACES DEL 04 AL 07 DE GENER DE
							2021</option>
						<option value="368">368 - PLACES DEL 04 AL 09 DE DESEMBRE
							DE 2020</option>
						<option value="367">367 - PLACES DEL 27 DE NOVEMBRE AL 30
							DE NOVEMBRE</option>
						<option value="366">366 - CONVOCATORIA DEL 20 AL 23 DE
							NOVEMBRE DE 2020</option>
						<option value="364">364 - CONVOCATORIA DEL 13 AL 16 DE
							NOVEMBRE DE 2020</option>
						<option value="363">363 - CONVOCATORIA DEL 6 AL 9 DE
							NOVEMBRE DE 2020</option>
						<option value="361">361 - CONVOCATORIA DEL 30 D'OCTUBRE
							AL 2 NOVEMBRE DE 2020</option>
						<option value="360">360 - CONVOCATORIA DEL 23 AL 26
							D'OCTUBRE DE 2020</option>
						<option value="358">358 - PLACES DEL 16 AL 19 D'OCTUBRE
							DE 2020</option>
						<option value="357">357 - PLACES DEL 9 AL 13 D'OCTUBRE DE
							2020</option>
						<option value="355">355 - PLACES DEL 2 D'OCTUBRE AL 5
							D'OCTUBRE</option>
						<option value="354">354 - PLACES DEL 25 DE SETEMBRE AL 28
							DE SETEMBRE</option>
						<option value="352">352 - PLACES DEL 18 DE SETEMBRE AL 21
							DE SETEMBRE</option>
						<option value="351">351 - PLACES DEL 11 DE SETEMBRE AL 14
							DE SETEMBRE</option>
						<option value="350">350 - PLACES DEL 4 DE SETEMBRE AL 7
							DE SETEMBRE</option>
						<option value="386">386 - CONVOCATÒRIA URGENT DEL 15 DE
							MARÇ DE 2021 AL 17 DE MARÇ DE 2021</option>
						<option value="383">383 - CONVOCATÒRIA URGENT DEL 3 DE
							MARÇ DE 2021 AL 4 DE MARÇ DE 2021</option>
						<option value="379">379 - CONVOCATÒRIA URGENT DEL 8 DE
							FEBRER DE 2021 AL 10 DE FEBRER DE 2021</option>
						<option value="377">377 - CONVOCATÒRIA URGENT DE L'1DE
							FEBRER DE 2021 AL 3 DE FEBRER DEL 2021</option>
						<option value="375">375 - CONVOCATÒRIA URGENT DEL 25 AL
							27 DE GENER</option>
						<option value="373">373 - CONVOCATORIA URGENT DEL 18 AL
							19 DE GENER</option>
						<option value="365">365 - CONVOCATORIA URGENT DEL 16 AL
							17 DE NOVEMBRE</option>
						<option value="362">362 - CONVOCATORIA URGENT DEL 02 DE
							NOVEMBRE A 03 DE NOVEMBRE DE 2020</option>
						<option value="359">359 - CONVOCATORIA URGENT DEL 19
							D'OCTUBRE AL 20 D'OCTUBRE</option>
						<option value="356">356 - CONVOCATORIA URGENT 5/10/2020 A
							6/10/2020</option>
						<option value="353">353 - CONVOCATÒRIA URGENT 24/09/2020
						</option>
					</select>
				</div>
				<div class="form-row pb-3">
					<input type="hidden" id="centre" value="">
					<!-- 
				    <label for="nomcentre" class="col-form-label col-form-label-lg"><strong>Centre</strong></label>
				    <input type="text" class="form-control form-control-lg" id="nomcentre" placeholder="Nom del centre"/>
			  		-->
				</div>
				<div class="form-row pb-3">
					<input type="hidden" id="funcio" value="">
					<!-- 
				    <label for="nomfuncio" class="col-form-label col-form-label-lg"><strong>Funció</strong></label>
				    <input type="text" class="form-control form-control-lg" id="nomfuncio" placeholder="Nom de la funció"/>
					-->
				</div>
				<div id="divButton" class="d-flex justify-content-center">
					<button type="button" class="btn btn-primary btn-lg"
						id="veureResultats"><fmt:message bundle="${i}" key="TEMPLATE.VEURE" /></button>
				</div>
			</form>
			<!-- Selección Fecha -->
		</div>
		<div id="textWarning" class="alert alert-warning" role="alert">
			<fmt:message bundle="${i}" key="TEMPLATE.WARNING" /></div>
		<div id="divPlacesContainer"
			class="container align-items-start text-center">
			<!-- Selección plazas -->
			<div id="divPlacesButtons" class="row align-items-start">
				<a id="a_inici"></a>
				<div id="buttonPlaces" class="col">
					<a class="badge badge-primary bg-primary" href="#placesAdjudicades"><fmt:message bundle="${i}" key="TEMPLATE.PLACESADJUDICADES" /></a>
				</div>
				<div id="buttonPlaces" class="col">
					<a class="badge badge-primary bg-primary" href="#placesDisponibles"><fmt:message bundle="${i}" key="TEMPLATE.PLACESNOADJUDICADES" /></a>
				</div>
				<div class="col">
					<a class="badge badge-primary bg-primary"
						href="#placesDisponiblesAnullades"><fmt:message bundle="${i}" key="TEMPLATE.PLACESELIMINADES" /></a>
				</div>
			</div>
			<!-- Selección plazas -->
		</div>
		<!-- Resultados -->
		<div id="classResultatsDIS" class="container pb-3">
			<table id="placesAdjudicades"
				class="table table-striped table-hover table-bordered collapse show">
				<thead class="table-primary text-muted">
					<tr>
						<th colspan="9">
							<h2>
								<small><a href="#a_inici" class="badge badge-secondary"
									title="Anar a l'inici"><i class="material-icons">vertical_align_top</i></a></small>
								<fmt:message bundle="${i}" key="TEMPLATE.RELACIOADJUDICACIONS" /> <small>(<fmt:message bundle="${i}" key="TEMPLATE.PLACESTOTALS" /> 102)</small>

							</h2>
						</th>
					</tr>
				</thead>
			</table>
			<section class="container text-center">
				<div class="row">
					<div class="col-lg-12">
						<div class="table-responsive">
							<table id="places_adjudicades" class="display">
								<thead>
									<tr>
										<th><fmt:message bundle="${i}" key="TEMPLATE.DATAADJUDICACIO" /></th>
										<th><fmt:message bundle="${i}" key="TEMPLATE.TIPUSCONTRACTE" /></th>
										<th><fmt:message bundle="${i}" key="TEMPLATE.JORNADA" /></th>
										<th><fmt:message bundle="${i}" key="TEMPLATE.INICI" /></th>
										<th><fmt:message bundle="${i}" key="TEMPLATE.FINALITZACIO" /></th>
										<th><fmt:message bundle="${i}" key="TEMPLATE.MOTIU" /></th>
										<th><fmt:message bundle="${i}" key="TEMPLATE.ILLA" /></th>
										<th><fmt:message bundle="${i}" key="TEMPLATE.MUNICIPI" /></th>
										<th><fmt:message bundle="${i}" key="TEMPLATE.ADJUDICAT" /></th>
										<th><fmt:message bundle="${i}" key="TEMPLATE.UNITAT" /></th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th><fmt:message bundle="${i}" key="TEMPLATE.DATAADJUDICACIO" /></th>
										<th><fmt:message bundle="${i}" key="TEMPLATE.TIPUSCONTRACTE" /></th>
										<th><fmt:message bundle="${i}" key="TEMPLATE.JORNADA" /></th>
										<th><fmt:message bundle="${i}" key="TEMPLATE.INICI" /></th>
										<th><fmt:message bundle="${i}" key="TEMPLATE.FINALITZACIO" /></th>
										<th><fmt:message bundle="${i}" key="TEMPLATE.MOTIU" /></th>
										<th><fmt:message bundle="${i}" key="TEMPLATE.ILLA" /></th>
										<th><fmt:message bundle="${i}" key="TEMPLATE.MUNICIPI" /></th>
										<th><fmt:message bundle="${i}" key="TEMPLATE.ADJUDICAT" /></th>
										<th><fmt:message bundle="${i}" key="TEMPLATE.UNITAT" /></th>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- Contenido -->
	<!-- Datos de contacto -->
	<section id="contactSection" class="container">
		<div class="row">
			<div class="col-md-8">
				<h3><fmt:message bundle="${i}" key="TEMPLATE.PEUDEPAGINA" /></h3>
			</div>
		</div>
		<div id="addressDiv" class="row d-flex align-items-end">
			<div class="col-md-6">
				<hr>
				<address class="d-flex align-items-start">
					<i class="material-icons text-primary">home</i>&nbsp; <fmt:message bundle="${i}" key="TEMPLATE.DIRECCIO" /> <br>&nbsp;&nbsp;<fmt:message bundle="${i}" key="TEMPLATE.LLOC" /><br>
				</address>
				<address class="d-flex align-items-start">
					<i class="material-icons text-primary">phone</i>&nbsp;<fmt:message bundle="${i}" key="TEMPLATE.PHONE" />
				</address>
			</div>
			<div class="col-md-6">
				<address class="d-flex align-items-start">
					<i class="material-icons text-primary">email</i>&nbsp;
					<fmt:message bundle="${i}" key="TEMPLATE.EXEMPLE1" />&nbsp;<a href="mailto:example@caib.es"><fmt:message bundle="${i}" key="TEMPLATE.EMAIL1" /></a>
				</address>
				<address class="d-flex align-items-start">
					<i class="material-icons text-primary">email</i>&nbsp;
					<fmt:message bundle="${i}" key="TEMPLATE.EXEMPLE2" />&nbsp;<a href="mailto:example@caib.es"><fmt:message bundle="${i}" key="TEMPLATE.EMAIL2" /></a>
				</address>
			</div>
		</div>
	</section>
	<!-- Datos de contacto -->
	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">©&nbsp;<fmt:message bundle="${i}" key="TEMPLATE.PEUDEPAGINA" /></p>
		</div>
	</footer>
	<!-- Footer -->
</body>
</html>