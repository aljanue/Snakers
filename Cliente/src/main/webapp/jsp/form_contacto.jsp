<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<%@ page import="p2.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%MensajeBD mensaje= (MensajeBD)request.getAttribute("msj");
String titulo="";%>
<%if(mensaje!=null){ titulo="Mensaje nº"+mensaje.getId();%>
<title>Mensaje nº<%=mensaje.getId()%></title>
<%}else{ titulo="Contáctanos";%>
<title>Contacto</title>
<%}%>
</head>
<body>
	<div class="container-fluid h-100">
	<%if(mensaje==null){%>
		<div class="login-box">
			<p><%=titulo %></p>
			<form onsubmit="ProcesarForm(this, 'tramitar-mensaje.html', 'cuerpo');return false">
				<div class="user-box">
				 	<label for="asunto">Asunto</label>
					<input name="asunto" id="asunto" type="text">
				</div>
				<div class="user-box">
					<label class="text-white" for="mensaje">Descripci&oacute;n</label>
					<textarea class="txt-area" name="mensaje" id="mensaje" ></textarea>
				</div>
				
				<button type="submit"
					class="btn btn-light negrita btn-frm">Enviar</button>
			</form>
		</div>
		<% }else{%>
		<div class="login-box">
		<p><%=titulo %></p>
			<div class="user-box">
				<label for="asunto">Asunto</label>
				<input name="asunto" id="asunto" type="text" value="<%=mensaje.getAsunto() %>" disabled>
			</div>
		</div>
		<div class = "px-5">
			<div class="user-box">
				<label class="pb-2 ps-4 fw-bold" for="mensaje">Descripci&oacute;n</label>
				<textarea class="txt-area rounded-4 p-4" name="mensaje" id="mensaje" placeholder="<%=mensaje.getMensaje() %>" disabled></textarea>
				<button onclick="Cargar('mis-mensajes.html', 'cuerpo')"
					class="btn btn-dark negrita btn-frm mt-4 mb-5 mx-4">Volver a mis mensajes</button>
			</div>
			
		</div>
		<%} %>
	</div>
</body>
</html>