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
 * Servlet implementation class ListadoProductos
 */
@WebServlet("/all-products.html")
public class ListadoProductos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListadoProductos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Listado de productos");
		String g = request.getParameter("marca");
		ArrayList<ProductoBD> productos = AccesoBD.getInstance().obtenerProductosBD();
		String titulo = "TODOS LOS PRODUCTOS";
		if (g != null && (g.equals("1") || g.equals("2") || g.equals("3"))){
			productos = AccesoBD.getInstance().obtenerProductosBDPorMarca(g);
			
				switch (g)
				{
				case "1":
					titulo = "ADIDAS";
					break;
				case "2":
					titulo = "NIKE";
					break;
				case "3":
					titulo = "PUMA";
					break;
				}
		}
        request.setAttribute("listado-productos",productos);
        request.setAttribute("titulo", titulo);
        
        RequestDispatcher rd = request.getRequestDispatcher("jsp/all-products.jsp");
        rd.forward(request, response);
    }

}
