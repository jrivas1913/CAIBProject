<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="ple"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<html>
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
<!-- JS externo -->
<script type="text/javascript" src="js/newLogear.js"></script>
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
<!-- CSS externo -->
<link rel="stylesheet" href="css/style.css">
<!-- Estilos -->
</head>
<body onLoad="buildHtmlTable('#excelDataTable')">
	<fmt:setLocale value="${param.l}" />
	<fmt:setBundle basename="m" var="i"/>
	<title><fmt:message bundle="${i}" key="TEMPLATE.PORTALNETEJA"/></title>
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
							onclick="window.location.href='Portal.jsp'"><fmt:message bundle="${i}" key="TEMPLATE.CAT" /></button>
						<span class="text-white"> | </span>
						<button
							class="m-0 text-center text-white float-right btn btn-black"
							onclick="window.location.href='Portal.jsp?l=es'"><fmt:message bundle="${i}" key="TEMPLATE.ES" /></button>
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
					<h1 class="display-4 text-white mt-5 mb-2"><fmt:message bundle="${i}" key="TEMPLATE.INDEXTITOL" /></h1>
					<p id="subtitolPortal" class="lead mb-5">
						<em><fmt:message bundle="${i}" key="TEMPLATE.INDEXSUBTITOL" /></em>
					</p>
				</div>
			</div>
		</div>
	</header>
	<!-- Cabecera -->
	<!-- Contenido -->
	<div class="container">
		<div class="row pb-5">
			<div class="card-deck">
				<!-- Convocatòries setmanals -->
				<div id="cardContainer" class="card text-center">
					<img id="calendar" src="files/6.png" class="rounded"
						alt="Convocatòria setmanal de places">
					<div id="cardBody" class="card-body text-center">
						<h4 class="card-title"><fmt:message bundle="${i}" key="TEMPLATE.CONVOCATORIASETMANALPLACES" /></h4>
						<p class="card-text"><fmt:message bundle="${i}" key="TEMPLATE.PORTALTEXT" /></p>
					</div>
					<div class="card-footer">
						<a href="ConvocatoriesServlet"
							class="btn btn-primary btn-lg btn-block position-relative"
							role="button"><fmt:message bundle="${i}" key="TEMPLATE.VEURECONVOCATORIES" /></a>
					</div>
				</div>
				<!-- Convocatòries places COVID (diàries) -->
			</div>
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