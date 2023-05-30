<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="p2.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tramitar pedido</title>
</head>
<body>
<%
UsuarioBD user = (UsuarioBD)request.getAttribute("user");
String error = (String)request.getAttribute("ERROR");
String stock1 = (String)request.getAttribute("noStock");
String stock2 = (String)request.getAttribute("noStock2");
ArrayList<ProductoBD> carrito = (ArrayList<ProductoBD>)session.getAttribute("carrito");
float total = 0;
%>
	<div class="h-100 h-custom ">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-8 col-xl-6">
					<form class="card border-top border-bottom border-3" <%if (carrito.size()>0) {%> action="#" onsubmit="ProcesarForm(this, 'tramitar-pedido.html', 'cuerpo');return false" <%} %>>
						<div class="card-body p-5">

							<p class="lead fw-bold mb-5">Detalles de la compra</p>
							<%if (carrito.size()>0) {%>
							<div class="row mb-3">
								
									<input type="text" id="nom" name = "nom" class="form-control" value="<%if(request.getParameter("nom")!= null){ %><%= request.getParameter("nom")%><%} else {%><%=user.getNombre() %><%} %>"required/> <label
										for="nom" class="col-form-label">Nombre y apellidos </label>
							</div>
							
							<div class="row mb-3">
								<input type="text" id="dom" name = "dom" class="form-control" value="<%if(request.getParameter("dom")!= null){ %><%= request.getParameter("dom")%><%} else {%><%=user.getDomicilio() %><%} %>" required/> <label
									for="dom" class="col-form-label"> Domicilio</label>
							</div>
							
							<div class="row mb-3">
								<input type="email" id="e-mail" name = "e-mail" class="form-control" value="<%if(request.getParameter("e-mail")!= null){ %><%= request.getParameter("e-mail")%><%} %>" required/> <label
									for="e-mail" class="col-form-label"> Correo electrónico</label>
							</div>
							<%} %>
							
							<div id = "prod_pago"class="mx-n5 px-3 py-4 bck-gris">
								<%for (ProductoBD prodCarrito : carrito){%>
								<div class="row">
							
									<div class="row d-flex align-items-center">
									<div class="col-md-2 col-lg-2">
										<img class="img-fluid" src="<%=prodCarrito.getImagen() %>" alt = "producto"></img>
									</div>
									<div class="col-md-6 col-lg-6">
										<p class="m-0"><%=prodCarrito.getDescripcion() %></p>
									</div>
									<div class="col-md-1 col-lg-1">
										<p class = "mb-0"><%=prodCarrito.getStock() %></p>
									</div>
									<div class="col-md-3 col-lg-3">
										<p class = "mb-0"><%=prodCarrito.getStock() * prodCarrito.getPrecio()%> €</p>
									</div>
								</div>
								</div>
								<%total += prodCarrito.getStock() * prodCarrito.getPrecio();%>
								<% }%>	
								
							</div>
							<%if(stock1!=null){ %>
							<p class = "text-danger"><%=stock1 %></p>
							<% }%>	
							<%if(stock2!=null){ %>
							<p class = "text-danger"><%=stock2 %></p>
							<% }%>
							
							<%if(carrito.size()>0) {%>		
							<div class="text-end pt-4 pb-3">
								<p class="mb-0">Gastos de env&iacute;o: <%=5 %> €</p>
							</div>
							

							<div class="text-end">
								<p class="lead fw-bold mb-0"><%=total+5 %> €</p>
							</div>
							 
							<p class="lead fw-bold mb-4 pb-2">Datos de la tarjeta</p>

							<div class="row mb-3">
								<div class="col-5">
									<input type="text" id="nombre" name = "t-nom"class="form-control" value="<%if(request.getParameter("t-nom")!= null){ %><%= request.getParameter("t-nom")%><%} %>" required /> <label
										for="nombre" class="col-form-label">Nombre </label>

								</div>
								<div class="col-7">
									<input type="text" id="apellidos" name = "t-apell"class="form-control" value="<%if(request.getParameter("t-apell")!= null){ %><%= request.getParameter("t-apell")%><%} %>" required/> <label
										for="apellidos" class="col-form-label"> Apellidos</label>

								</div>
							</div>
							<div class="row mb-3">
								<input type="text" id="t-num" name="t-num"
									placeholder="XXXXXXXXXXXXXXXX" class="form-control" required/>
                				<label for="t-num" class="col-form-label"> Numero de tarjeta</label>
							</div>
							<div class="row mb-3">
								<div class="col-6">
									<input type="text" id="cvv" name = "t-cvv" class="form-control" required
										placeholder="XXX" /> <label for="cvv" class="col-form-label">CVV
									</label>

								</div>
								<div class="col-6">
									<input type="text" id="date" name ="t-date"class="form-control" required
										placeholder="XX/YY" /> <label for="date"
										class="col-form-label"> Fecha de vencimiento</label>

								</div>
							</div>
							<%if(error != null) {%>
								<p class = "text-danger"><%=error%></p>
               				<% }%>
							<div class="row text-end mt-5">
								<div class="d-grid gap-2">
									<button type="submit" class="btn btn-dark">
										Continuar</button>
								</div>
							</div>
							<%} else{%>
							<p class = "text-danger">NO HAY ARTICULOS DISPONIBLES</p>
							<div class="row text-end mt-5">
								<div class="d-grid gap-2">
									<button type="submit" class="btn btn-dark" onclick="Cargar('inicio.html', 'cuerpo')">
										Ir a inicio</button>
								</div>
							</div>
							<%} %>
						</div>



					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>