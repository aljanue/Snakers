package p2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.InputStreamReader;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;

import java.util.ArrayList;

/**
 * Servlet implementation class tramitarPedido
 */
@WebServlet("/recoger-carrito.html")
public class RecogerCarrito extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecogerCarrito() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccesoBD acceso = AccesoBD.getInstance();
		HttpSession sesion = request.getSession(false);
		String noStock="", noStock2="";
		if(sesion!=null) {
			Integer usuario = (Integer)sesion.getAttribute("usuario");
			if(usuario!=null) {
				ArrayList <ProductoBD> carritoJSON = new ArrayList<ProductoBD>();
				JsonReader jsonReader = Json.createReader(
						new InputStreamReader(request.getInputStream()));
				JsonArray jobj = jsonReader.readArray();
				for (int i = 0; i < jobj.size(); i++) {
							JsonObject prod = jobj.getJsonObject(i);
							ProductoBD nuevo = new ProductoBD();
							nuevo.setCodigo(prod.getInt("codigo"));
							nuevo.setDescripcion(prod.getString("descripcion"));
							nuevo.setMarca(prod.getInt("marca"));
							nuevo.setColor(prod.getString("color"));
							nuevo.setGenero(prod.getInt("genero"));
							nuevo.setPrecio((float) prod.getInt("precio"));
							nuevo.setStock(prod.getInt("cantidad"));
							nuevo.setImagen(prod.getString("imagen"));
							nuevo.setTalla(prod.getInt("talla"));
							ProductoBD p = acceso.obtenerProductoBDPorIdEnPedido(nuevo.getCodigo());
							if(p.getStock() < nuevo.getStock()&&p.getStock()>0)
							{
								noStock="Se ha reducido la cantidad de algunos articulos por falta de stock";
								nuevo.setStock(p.getStock());
							}
							else if(p.getStock() ==0){
								nuevo.setStock(p.getStock());
								noStock2="Se han eliminado algunos articulos por falta de stock";
							}
							if(nuevo.getStock() > 0)
							{
							carritoJSON.add(nuevo);
							}
							
					}
				
				sesion.setAttribute("carrito", carritoJSON);
				response.sendRedirect("tramitar-pedido.html?noStock="+noStock+"&noStock2="+noStock2);
			}
			else {
				response.sendRedirect("login.html");
			}
		}else {
			response.sendRedirect("login.html");
		}
		
		
			
	}
}

		
		

