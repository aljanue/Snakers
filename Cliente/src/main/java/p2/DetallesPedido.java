package p2;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MisProductos
 */
@WebServlet("/order-details.html")
public class DetallesPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetallesPedido() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccesoBD acceso = AccesoBD.getInstance();
		String pCodigo = request.getParameter("cod");
        int codigo = Integer.parseInt(pCodigo);
		ArrayList<DetalleBD> detalles = (ArrayList<DetalleBD>)acceso.obtenerDetallesPorPedido(codigo);
		PedidoBD pedido = acceso.obtenerPedidoBDPorId(codigo);
		ArrayList<ProductoBD> productos=new ArrayList<>();
		for(int i = 0; i < detalles.size(); i++)
		{
			ProductoBD producto = new ProductoBD();
			producto = acceso.obtenerProductoBDPorIdEnPedido(detalles.get(i).getCodigo_producto());
			producto.setStock(detalles.get(i).getUnidades());
			productos.add(producto);
		}
		request.setAttribute("pedido", pedido);
		request.setAttribute("productos-pedido", productos);
		request.getRequestDispatcher("jsp/order-details.jsp").forward(request, response);
	}


}
