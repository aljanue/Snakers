<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<%@ page import="p2.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detalles</title>
</head>
<body>
<%
String g = request.getParameter("cod");
// String m = request.getParameter("mar");
AccesoBD acc = AccesoBD.getInstance();
int cod = Integer.parseInt(g); 
ProductoBD prod = acc.obtenerProductoBDPorId(cod);
String desc = prod.getDescripcion();
float prec = prod.getPrecio();
String img = prod.getImagen();
int talla = prod.getTalla();
int pMarca = prod.getMarca();
int pGenero = prod.getGenero();
String marca = "";
switch(pMarca){
	case 1:
		marca = "ADIDAS";
		break;
	case 2:
		marca = "NIKE";
		break;
	case 3:
		marca = "PUMA";
		break;
}
String color = prod.getColor();
%>
<div class="container mt-5 mb-5">
		<div class="card">
			<div class="row g-0">
				<div class="col-md-6 border-end">
					<div class="d-flex flex-column justify-content-center">
						<div class="main_image">
							<img
								src="<%=img%>"
								id="main_product_image" width="350" alt="superstar">
						</div>

					</div>
				</div>
				<div class="col-md-6">
					<div class="p-3 right-side">
						<div class="d-flex justify-content-between align-items-center">
							<h3 class="fw-bold"><%=desc%></h3>
							<span class="heart"><i class='bx bx-heart'></i></span>
						</div>
						<div>
						<h4><%=marca%></h4>
						</div>
						<div class="mt-2 pr-3 content">
							<p>A este producto no se le aplican descuentos ni ofertas
								promocionales.</p>
						</div>
						<h3><%=prec%>€</h3>
						

						<div class="mt-5">
							<span class="fw-bold">Color: </span><%=color%>
						</div>
						<div class="mt-1">
							<span class="fw-bold">Talla: </span><%=talla%>
						</div>
						<div class="buttons d-flex flex-row mt-5 gap-3">
							<button onclick="addCarrito(<%=cod%>, '<%=desc%>\n', <%=talla%>, <%=prec%>, '<%=img%>', '<%=color%>', <%=pGenero %>,<%=pMarca %>)"
								class="btn btn-dark"name="liveToastBtn">Comprar</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="toast-container position-fixed bottom-0 end-0 p-3">
  <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
      <strong class="me-auto">Snakers</strong>
      <button type="button"  class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
      Producto a&ntilde;adido al carrito.
    </div>
  </div>
</div>


<script>cargarPopup()</script>
</body>
</html>