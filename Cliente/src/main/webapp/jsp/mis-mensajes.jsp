<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<%@ page import="p2.*" %>
<%@ page import="p2_admin.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mis mensajes</title>
</head>
<body>
<% ArrayList<MensajeBD> mis_mensajes = (ArrayList<MensajeBD>)request.getAttribute("mensajes");%>

	<div class="container-fluid">
		<div class = "cont">
		<%if(mis_mensajes.size()!=0){ %>
			<div class="row negrita centrar">
				<h1>MIS MENSAJES</h1>
			</div>
			<div class="row px-4 table-responsive">
				<!-- tabla con los usuarios -->
				<table class="table">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">ASUNTO</th>
							<th scope="col">MENSAJE</th>
						</tr>
					</thead>
					<tbody>
					<%for(int i = 0; i < mis_mensajes.size(); i++) {
						
					%>
						<tr>
							<th scope="row"><%=mis_mensajes.get(i).getId()%></th>
							<td><%=mis_mensajes.get(i).getAsunto()%></td>
							<td><button href ="#" onclick="Cargar('mensaje.html?cod=<%=mis_mensajes.get(i).getId()%>', 'cuerpo')"type="button" class="btn btn-dark">
  							Ver mensaje</button></td>
						</tr>
						<%} %>
					</tbody>
				</table>
			</div>
			<%} else {%>
				<div class = "row text-center my-5">
					<h1>NO EXISTEN MENSAJES</h1>
					<div class = "row justify-content-center py-3">
						<div class = "col-3">
							<button type="button" class="btn btn-dark mx-3" onclick = "Cargar('inicio.html', 'cuerpo')">Ir a inicio</button>
						</div>
					</div>
				</div>
			
			<%}%>
		</div>
	</div>
</body>
</html>