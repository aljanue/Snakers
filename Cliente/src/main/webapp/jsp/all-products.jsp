<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
    
<%@ page import="p2.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todos los productos</title>
</head>
<body>
<%
ArrayList<ProductoBD> productos = (ArrayList<ProductoBD>)request.getAttribute("listado-productos");
String titulo = (String)request.getAttribute("titulo");
String resultado = (String)request.getAttribute("resultado");
%>

<div class="container-fluid">
		
		<div class="row cabecera-all">
			<div class = "col-4"><h1 class="centrar">
				<a class="negrita text-decoration-none color-all" href="#"
					onclick="Cargar('all-products.html?marca=1', 'cuerpo')">ADIDAS</a>
			</h1></div>
			<div class = "col-4"><h1 class="centrar">
				<a class="negrita color-all text-decoration-none" href="#"
					onclick="Cargar('all-products.html?marca=2', 'cuerpo')">NIKE</a>
			</h1></div>
			<div class = "col-4"><h1 class="centrar">
				<a class="negrita color-all text-decoration-none" href="#"
					onclick="Cargar('all-products.html?marca=3', 'cuerpo')">PUMA</a>
			</h1></div>
		</div>
						<div class = "row d-flex text-center margen"><h1 class = "fw-bold"><%=titulo%></h1></div>
			
			<form class="input-group" onsubmit="ProcesarForm(this, 'busqueda', 'cuerpo');return false">
  				<input type="search" name="busqueda"class="form-control rounded" placeholder="Buscar producto" aria-label="Search" aria-describedby="search-addon" />
  				<button type="submit" class="btn btn-outline-dark">Buscar</button>
			</form>
<div class="row py-20">
			<%if(productos.size()==0){%>
				<div class = "row text-center my-5">
					<h3>No existen productos con resultado: <span class="text-muted"><%=resultado %></span></h3>
				</div>
			
			<%}else {%>
			<%
                    for (int i=0;productos!=null && i<productos.size();i++) {
                    	
	                    	ProductoBD producto = productos.get(i);
	                        int codigo = producto.getCodigo();
	                        String descripcion = producto.getDescripcion();
	                        int existencias = producto.getStock();
	                        int talla = producto.getTalla();
	                        int genero = producto.getGenero();
	                        int marca = producto.getMarca();
	                        String imagen = producto.getImagen();
	                        float precio = producto.getPrecio();
	                        String color = producto.getColor();
	                        String m = "";
	                        switch(marca)
	                        {
	                        case 1:
	                        	m = "ADIDAS";
	                        	break;
	                        case 2:
	                        	m = "NIKE";
	                        	break;
	                        case 3:
	                        	m = "PUMA";
	                        	break;
	                        }
                      	
                        
			%>
			
				<div class="col-xxl-2 col-lg-3 col-md-6 col-sm-12">
					<div class="card tam-card margen">
						<img onclick="Cargar('details.html?cod=<%=codigo%>' , 'cuerpo')"
							src="<%=imagen%>"
							class="card-img-top" alt="imagen de producto">
						<div class="card-body">
							<h5 class="card-title"><%=descripcion%></h5>
							<p class="card-text"><%=m%></p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">Talla: <%=talla%></li>
							<li class="list-group-item">Color: <%=color%></li>
							<li class="list-group-item">Precio: <%=precio%></li>
						</ul>
						<div class="card-body">
							<a href="#" onclick="Cargar('details.html?cod=<%=codigo%>' , 'cuerpo')"
								class="card-link color-snk ">Detalles</a>
							<button onclick="addCarrito(<%=codigo%>, '<%=descripcion%>', <%=talla%>, <%=precio%>, '<%=imagen%>', '<%=color%>', <%=genero %>,<%=marca %>)"
								type="button" class="btn btn-secondary bg-color-snk btn-buy" name="liveToastBtn">Comprar</button>
						</div>
					</div>
				</div>
				
			
			<%}} %>
			</div>
	</div>
	<div class="toast-container position-fixed bottom-0 end-0 p-3">
  <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
      <strong class="me-auto">Snakers</strong>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
      Producto a&ntilde;adido al carrito.
    </div>
  </div>
</div>
<script>cargarPopup()</script>
</body>
</html>