package p2;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class busqueda
 */
@WebServlet("/busqueda")
public class Busqueda extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Busqueda() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccesoBD acceso = AccesoBD.getInstance();
		String busqueda = request.getParameter("busqueda");
		request.setAttribute("resultado", busqueda);
		ArrayList<ProductoBD> productos = acceso.obtenerProductosBDPorDescripcion(busqueda);
		request.setAttribute("listado-productos", productos);
		String titulo="Resultados de la búsqueda";
		request.setAttribute("titulo", titulo);
		
		RequestDispatcher rd = request.getRequestDispatcher("jsp/all-products.jsp");
		rd.forward(request, response);
	}

}
