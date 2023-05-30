<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<%@ page import="p2.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inicio</title>
<style>
.col-lg-6 img, .col-sm-12 img {
	height: 100%;
	width: 100%;
}

.col-lg-3 img, .col-sm-6 img {
	height: auto;
	width: 100%;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<img
			class="img-fluid w-100 d-flex justify-content-center" src="./images/index/portada_snakers.png"
					alt="PUMA">
					
		<div class="row my-5">
			<div class="col-4">
				<a href="#"
					onclick="Cargar('all-products.html?marca=1' , 'cuerpo')">
					<img class="img-fluid" src="./images/index/adidas.png"
					alt="ADIDAS">
				</a>
			</div>
			
			<div class="col-4">
				<a href="#"
					onclick="Cargar('all-products.html?marca=2' , 'cuerpo')">
					<img class="img-fluid" src="./images/index/nike.png"
					alt="NIKE">
				</a>
			</div>
			<div class="col-4">
				<a href="#"
					onclick="Cargar('all-products.html?marca=3' , 'cuerpo')"><img
					class="img-fluid" src="./images/index/puma.png"
					alt="PUMA"></a>
			</div>
		</div>
	</div>
	<%if(session != null && session.getAttribute("usuario") != null){ %>
	<script>menuConectado()</script>
	<%} else {%>
	<script>menuDesconectado()</script>
	<%} %>
</body>
</html>