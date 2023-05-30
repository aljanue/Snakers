
<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Iniciar sesi&oacute;n</title>
</head>
<body>
<%
String mensaje = (String)request.getAttribute("MSG-ERROR");
%>
	<div class="container-fluid">
		<div class="cont">
			<div class="login-box">
				<p>Iniciar sesi&oacute;n</p>
				<form action="#" onsubmit="ProcesarForm(this, 'login.html', 'cuerpo');return false">
					<div class="user-box">
						<label for=name>Nombre de usuario</label>
						<input name="text" id="name" type="text" required> 
					</div>
					<div class="user-box">
						<label
							for="pas">Contrase&ntilde;a</label>
						<input name="pas" id="pas" type="password" required> 
					</div>
					<%if (mensaje != null) {%>
						<p class = "text-danger"><%=mensaje %></p>
					<%}%>

					<button class="btn btn-light negrita" type="submit">Iniciar
						sesi&oacute;n</button>

				</form>
				<br>
				<p>
					¿No tienes cuenta? <a href="#"
						onclick="Cargar('registro.html', 'cuerpo')" class="a2">¡Reg&iacute;strate!</a>
				</p>
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