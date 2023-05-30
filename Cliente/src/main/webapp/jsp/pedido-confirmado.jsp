<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<%@ page import="p2.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pedido confirmado</title>
</head>
<body>
	<div class="h-100 container-fluid">
		<div class = "row text-center py-5">
			<h1>PEDIDO REALIZADO CON EXITO</h1>
			<h2>C&oacute;digo de pedido: <span class="text-muted"><%=(Integer)request.getAttribute("codigo_pedido") %></span></h2>
			<div class = "row justify-content-center py-5">
				<div class = "col-3">
					<button type="button" class="btn btn-outline-dark mx-6" onclick = "Cargar('inicio.html', 'cuerpo')">Ir a inicio</button>
				</div>
				<div class = "col-3">
					<button type="button" class="btn btn-dark mx-6" onclick = "Cargar('pedidos-usuario.html', 'cuerpo')">Ir a Mis Pedidos</button>
				</div>
			</div>
		</div>
	</div>
	<script>resetCarrito();</script>
</body>
</html>