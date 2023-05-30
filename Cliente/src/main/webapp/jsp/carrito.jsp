<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<%@ page import="p2.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrito</title>
<style>
.w-imag {
	width: 65px;
}
</style>
</head>

<body>
<section>
  <div class="container h-100 py-5" id = "carrito">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-10">

        <div class="d-flex justify-content-between align-items-center mb-4">
          <h3 class="fw-normal mb-0 text-black">Tu carrito</h3>
        </div>
        
        <div id = "productos">
	        
		</div> <!-- cierre -->

        <div class="card">
          <div class="card-body">
          <div class = "row mx-4">
          <%
          session =  request.getSession(false);
          if(session != null && (Integer) session.getAttribute("usuario") != null) {
          %>
           <button type="button" class="btn btn-dark btn-block btn-lg" onclick = "EnviarCarrito('recoger-carrito.html', 'cuerpo')">Pagar</button>
          <%} else{ %>
            <button type="button" class="btn btn-dark btn-block btn-lg" onclick = "Cargar('login.html', 'cuerpo')">Pagar</button>
          <%} %></div></div>
        </div>

      </div>
    </div>
  </div>
</section>
	<script>mostrarCarrito()</script>
</body>
</html>