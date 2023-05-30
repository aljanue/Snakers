<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<%@ page import="p2.*" %>
<!DOCTYPE html>
<%
String error = (String)request.getAttribute("REG-ERROR");
UsuarioBD user = (UsuarioBD)request.getAttribute("persona");
boolean creacion = false;
if(user != null){
 	creacion = (user.getId()>0);
 }
%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <%
        if (!creacion) {
 %>
<title>Registro</title>
<%
        } else {
%>
<title>Modificar datos</title>   
    <%
        }
    %>
</head>
<body>

	<div class="container-fluid h-100">
		<div class="login-box">
		<%
        	if (!creacion) {
 		%>
			<p>Registrarse</p>
		<%
        	} else {
		%>
			<p>Modificar datos</p>   
    	<%
        	}
    	%>
			<form method="post" onsubmit="ProcesarForm(this,'registro.html','cuerpo');return false">
				<div class="user-box">
				 	<label for="username">Nombre de usuario</label>
					<input name="username" id="username" type="text" <%if(creacion){%>value="<%=user.getUsuario()%>" disabled 
					<%} else if(request.getParameter("username")!= null){%>value="<%= request.getParameter("username")%>"<%} %> required>
					<div class="valid-feedback">Correcto.</div>
                	<div class="invalid-feedback">Campo obligatorio.</div>
				</div>
				
				<div class="user-box">
					<label for="name">Nombre y apellidos</label>
					<input name="name" id="name" type="text" <%if(creacion){%>value="<%=user.getNombre()%>"
					<%} else if(request.getParameter("name")!= null){%>value="<%= request.getParameter("name")%>"<%} %> required>
					<div class="valid-feedback">Correcto.</div>
                	<div class="invalid-feedback">Campo obligatorio.</div>
				</div>
				
				<div class="user-box">
					<label for="tel">N&uacute;mero de tel&eacute;fono</label>
					<input name="tel" id="tel" type="tel"  <%if(creacion){%>value="<%=user.getTelefono()%>"
					<%} else if(request.getParameter("tel")!= null){%>value="<%= request.getParameter("tel")%>"<%} %>required>
					<div class="valid-feedback">Correcto.</div>
                	<div class="invalid-feedback">Campo obligatorio.</div>
				</div>
				
				<div class="user-box">
					<label for="dom">Domicilio</label>
					<input name="dom" id="dom" type="text"  <%if(creacion){%>value="<%=user.getDomicilio()%>"
					<%} else if(request.getParameter("dom")!= null){%>value="<%= request.getParameter("dom")%>"<%} %>required>
					<div class="valid-feedback">Correcto.</div>
                	<div class="invalid-feedback">Campo obligatorio.</div>
				</div>
				
				<div class="user-box">
					<label for="pass">Contrase&ntilde;a</label>
					<input name="pass" id="pass" type="password" required>
					<div class="valid-feedback">Correcto.</div>
                	<div class="invalid-feedback">Campo obligatorio.</div>
				</div>
				
				<div class="user-box">
					<label for="r-pass">Repite la contrase&ntilde;a</label>
					<input name="r-pass" id="r-pass" type="password"  required>
					<div class="valid-feedback">Correcto.</div>
                	<div class="invalid-feedback">Campo obligatorio.</div>
				</div>
				<%if(error != null) {%>
				<p class = "text-danger"><%=error%></p>
               <% }%>
				<button type="submit"
					class="btn btn-light negrita">Aceptar</button>

			</form>

		</div>
	</div>

</body>
</html>