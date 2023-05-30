package p2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class Login
 */
@WebServlet("/details.html")
public class DetalleProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetalleProducto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
		AccesoBD acceso = AccesoBD.getInstance();
		
        String pCodigo = request.getParameter("cod");
        int codigo = Integer.parseInt(pCodigo);
        ProductoBD p = acceso.obtenerProductoBDPorId(codigo);
        request.setAttribute("producto", p);
		RequestDispatcher rd = request.getRequestDispatcher("jsp/product_details.jsp");
		rd.forward(request, response);
    }

}
