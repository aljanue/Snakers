package p2;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
	
/**
 * Servlet implementation class Login
 */
@WebServlet("/pedidos-usuario.html")
public class PedidosUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PedidosUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
		AccesoBD acceso = AccesoBD.getInstance();
		
        HttpSession sesion =  request.getSession(false);

        if (sesion !=null ) {
        		Integer codigoUsr = (Integer) sesion.getAttribute("usuario");

        		if (codigoUsr != null) {
        			List<PedidoBD> lista = acceso.obtenerPedidosBDPorPersona(codigoUsr);
        			request.setAttribute("pedidos-persona", lista);
        			RequestDispatcher rd = request.getRequestDispatcher("jsp/my-orders.jsp");
        			rd.forward(request, response);
        		} else {
        			RequestDispatcher rd = request.getRequestDispatcher("jsp/login.jsp");
        			rd.forward(request, response);
        		}
        }
        else {
        	RequestDispatcher rd = request.getRequestDispatcher("jsp/login.jsp");
    		rd.forward(request, response);
        }
    }

}
