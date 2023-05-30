<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
    <%@ page import="p2.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mis pedidos</title>
</head>
<body>
	<% List<PedidoBD> mis_pedidos = (List<PedidoBD>)request.getAttribute("pedidos-persona");%>
	<div class="container-fluid">
		<div class = "cont">
		<%if(mis_pedidos.size()!=0){ %>
			<div class="row negrita centrar">
				<h1>MIS PEDIDOS</h1>
			</div>
			<div class="row px-4 table-responsive">
				<!-- tabla con los usuarios -->
				<table class="table">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">FECHA</th>
							<th scope="col">PRECIO TOTAL</th>
							<th scope="col">ESTADO</th>
							<th scope="col">DETALLES</th>
							<th scope="col">ACCI&Oacute;N</th>
						</tr>
					</thead>
					<tbody>
					<%for(int i = 0; i < mis_pedidos.size(); i++) {
						String estado="";
						switch(mis_pedidos.get(i).getEstado())
						{
						case 1:
							estado = "PROCESADO";
							break;
						case 2:
							estado = "ENVIADO";
							break;
						case 3:
							estado = "ENTREGADO";
							break;
						case 4:
							estado = "CANCELADO";
						}
					%>
						<tr>
							<th scope="row"><%=mis_pedidos.get(i).getCodigo()%></th>
							<td><%=mis_pedidos.get(i).getFecha()%></td>
							<td><%=mis_pedidos.get(i).getImporte()%> €</td>
							<td <%if (mis_pedidos.get(i).getEstado()==5) {%> class = "text-danger" <%} %>><%= estado%></td>
							<td><button
									onclick="Cargar('order-details.html?cod=<%=mis_pedidos.get(i).getCodigo() %>' , 'cuerpo')"
									type="button" class="btn btn-dark">Ver detalles</button></td>
							<%if(mis_pedidos.get(i).getEstado() == 4){ %>
								<td class= "mx-3  text-danger">Cancelado</td>
							<%}else if (mis_pedidos.get(i).getEstado() == 1){ %>
								<td class= "mx-3"><button
										onclick="Cargar('cancelar-pedido.html?cod=<%=mis_pedidos.get(i).getCodigo() %>' , 'cuerpo')"
										type="button" class="btn btn-danger">Cancelar</button></td>
							<%}else{ %>
								<td class= "mx-3 text-muted">No se puede cancelar</td>
							<%} %>
						</tr>
						<%} %>
					</tbody>
				</table>
			</div>
			<%} else {%>
				<div class = "row text-center my-5">
					<h1>NO EXISTEN PEDIDOS</h1>
					<div class = "row justify-content-center py-3">
						<div class = "col-3">
							<button type="button" class="btn btn-dark mx-3" onclick = "Cargar('all-products.html', 'cuerpo')">Ir a comprar</button>
						</div>
					</div>
				</div>
			
			<%}%>
		</div>
	</div>
</body>
</html>