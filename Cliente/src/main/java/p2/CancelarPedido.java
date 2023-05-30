package p2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CancelarPedido
 */
@WebServlet("/cancelar-pedido.html")
public class CancelarPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelarPedido() {
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
		acceso.cambiarEstadoPedidoBD(codigo, 4);
		response.sendRedirect("pedidos-usuario.html");
	}

	

}
