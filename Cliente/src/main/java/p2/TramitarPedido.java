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
import javax.json.stream.JsonParsingException;

import java.util.ArrayList;

/**
 * Servlet implementation class tramitarPedido
 */
@WebServlet("/tramitar-pedido.html")
public class TramitarPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TramitarPedido() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccesoBD acceso = AccesoBD.getInstance();
		HttpSession sesion = request.getSession(false);
		Integer codigo = (Integer)sesion.getAttribute("usuario");
		UsuarioBD user = acceso.obtenerUsuarioBDPorId(codigo);
		request.setAttribute("user", user);
		request.setAttribute("noStock", request.getParameter("noStock"));
		request.setAttribute("noStock2", request.getParameter("noStock2"));
		RequestDispatcher rd = request.getRequestDispatcher("jsp/tramitar-pedido.jsp");
        rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccesoBD acceso = AccesoBD.getInstance();
		HttpSession sesion = request.getSession(false);
		Integer codigo = (Integer)sesion.getAttribute("usuario");
		String dom = request.getParameter("dom");
		String num_tarjeta = request.getParameter("t-num");
		String cvv_tarjeta = request.getParameter("t-cvv");
		String date_tarjeta = request.getParameter("t-date");
		if(!num_tarjeta.matches("[0-9]{16}") || !date_tarjeta.matches("^[0-9]{2}\\/[0-9]{2}$") || !cvv_tarjeta.matches("[0-9]{3}")) {
			request.setAttribute("ERROR", "Datos de la tarjeta incorrectos.");
			RequestDispatcher rd = request.getRequestDispatcher("jsp/tramitar-pedido.jsp");
            rd.forward(request, response);
		}else {
			ArrayList <ProductoBD> carritoJSON = (ArrayList<ProductoBD>)sesion.getAttribute("carrito");
			boolean valido = true;
			for(int i = 0; i < carritoJSON.size(); i++) {
				if(carritoJSON.get(i).getStock()>acceso.obtenerProductoBDPorIdEnPedido(carritoJSON.get(i).getCodigo()).getStock() ) {
					valido = false;
					break;
				}
			}
			if(valido) {
				int id_pedido = acceso.GuardarPedidoBD(codigo, carritoJSON, dom);
				request.setAttribute("codigo_pedido", id_pedido);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/pedido-confirmado.jsp");
	            rd.forward(request, response);
			}
			else {
				response.sendRedirect("html/pedido-no-confirmado.html");
			}
		}
		
	}
}

		
		

