<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
    <%@ page import="p2.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mis pedidos</title>
</head>
<body>
	<% List<ProductoBD> productos = (List<ProductoBD>)request.getAttribute("productos-pedido");
	PedidoBD pedido = (PedidoBD) request.getAttribute("pedido");%>
	<div class="h-100 h-custom bck-gris">
		<div class = "cont">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-8 col-xl-6">
					<div class="card border-top border-bottom border-3">
						<div class="card-body p-5">

							<p class="lead fw-bold mb-5">Detalles del pedido</p>

							<div class="row">
								<div class="col mb-3">
									<p class="small text-muted mb-1">Fecha</p>
									<p><%=pedido.getFecha() %></p>
								</div>
								<div class="col mb-3">
									<p class="small text-muted mb-1">Codigo del pedido</p>
									<p><%=pedido.getCodigo() %></p>
								</div>
							</div>
							<div class="row">
								
									<p class="small text-muted mb-1">Direcci&oacute;n de entrega:</p>
									<p><%=pedido.getDireccion() %></p>
							</div>	

							<div class="mx-n5 px-3 py-4 bck-gris">
								<div>
								<%for (int i = 0; i < productos.size(); i++){%>
								<div class="row">
							
									<div class="row d-flex align-items-center pe-0">
									<div class="col-md-2 col-lg-2">
										<img class="img-fluid" src="<%=productos.get(i).getImagen() %>" alt = "producto"></img>
									</div>
									<div class="col-md-6 col-lg-6">
										<p class="m-0"><%=productos.get(i).getDescripcion() %></p>
									</div>
									<div class="col-md-1 col-lg-1">
										<p class = "mb-0"><%=productos.get(i).getStock() %></p>
									</div>
									<div class="col-md-3 col-lg-3  pe-0">
										<p class = "mb-0"><%=productos.get(i).getStock() * productos.get(i).getPrecio()%> €</p>
									</div>
								</div>
								</div>
								
									<%} %>
								</div>
								
							</div>
							<%DecimalFormat redondeo = new DecimalFormat("#.##"); %>
							<div class="row my-4 text-end">
								
									<p class="mb-0">Gastos de env&iacute;o: <%=5 %> €</p>
							</div>
							<div class="row my-4 text-end">
								<div>
									<p class="lead fw-bold mb-0"><%=pedido.getImporte() %> €</p>
								</div>
							</div>

							<p class="lead fw-bold mb-4 pb-2 text-start">Estado del pedido</p>

							<div class="row">
								<div class="col-lg-12">
									<%if (pedido.getEstado() == 4){ %>
									<p class="py-1 px-2 rounded text-danger ">Cancelado</p>
									<%}else{ %>
									
									<div class="horizontal-timeline">

										<ul class="list-inline items d-flex justify-content-between">
											<li class="list-inline-item items-list">
												<p class="py-1 px-2 rounded  ">Procesado</p>
											</li>
											<li class="list-inline-item items-list">
												<p class="py-1 px-2 rounded <%if(pedido.getEstado()==1){%>text-muted opacity-50<%} %>" >Enviado</p>
											</li>
											<li class="list-inline-item items-list">
												<p class="py-1 px-2 rounded <%if(pedido.getEstado()==1 ||pedido.getEstado()==2 ){%>text-muted opacity-50<%} %> ">Entregado</p>
										</ul>

									</div>
									<%} %>
								</div>
							</div>

							<p class="mt-4 pt-2 mb-0 text-end">
								Necesitas ayuda? <a href="#"
									onclick="Cargar('contacto.html' , 'cuerpo')"
									class="color-snk">Cont&aacute;ctanos </a>
							</p>

						</div>
					</div>
				</div>
			</div>
		</div></div>
	</div>
</body>
</html>