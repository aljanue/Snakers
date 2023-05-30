package p2;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MensajesUsuario
 */
@WebServlet("/mis-mensajes.html")
public class MensajesUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MensajesUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccesoBD acceso = AccesoBD.getInstance();
		HttpSession sesion = request.getSession(false);
		if(sesion!=null)
		{
			Integer usr = (Integer)sesion.getAttribute("usuario");
			
			if(usr!=null)
			{
				ArrayList<MensajeBD> mensajes = acceso.obtenerMensajesBDPorUsuario(usr);
				
				request.setAttribute("mensajes", mensajes);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/mis-mensajes.jsp");
	            rd.forward(request, response);
			}
		}
		else
		{
			response.sendRedirect("login.html");
		}
	}

}
