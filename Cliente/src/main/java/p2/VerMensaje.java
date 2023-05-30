package p2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class VerMensaje
 */
@WebServlet({"/contacto.html", "/mensaje.html"})
public class VerMensaje extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerMensaje() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession(false);
		MensajeBD mensaje=null;
		if(sesion!=null)
		{	
			Integer codigo_usuario = (Integer)sesion.getAttribute("usuario");
			if(codigo_usuario!=null)
			{
				AccesoBD acceso = AccesoBD.getInstance();
				String cod = (String)request.getParameter("cod");
				if(cod!=null) {
					Integer codigo = Integer.parseInt(cod);
					mensaje=acceso.obtenerMensajeBDPorId(codigo);
				}
				request.setAttribute("msj", mensaje);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/form_contacto.jsp");
		        rd.forward(request, response);
            }
			else {
				RequestDispatcher rd = request.getRequestDispatcher("login.html");
	            rd.forward(request, response);
			}
		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("login.html");
            rd.forward(request, response);
		}
	}

}
