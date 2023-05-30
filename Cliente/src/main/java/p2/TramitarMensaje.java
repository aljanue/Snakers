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
 * Servlet implementation class TramitarMensaje
 */
@WebServlet("/tramitar-mensaje.html")
public class TramitarMensaje extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TramitarMensaje() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession(false);
		if(sesion!=null)
		{
			boolean band=true;
			AccesoBD acceso=AccesoBD.getInstance();
			Integer codigo = (Integer)sesion.getAttribute("usuario");
			if(codigo!=null)
			{
				String asunto=request.getParameter("asunto");
				String mensaje=request.getParameter("mensaje");
				band=acceso.guardarMensajeBD(codigo, asunto, mensaje);
				if(band)
					System.out.println("VERDAD!!!");
				else
					System.out.println("MENTIRA!!!");
					
				
			}
			
		}
		RequestDispatcher rd = request.getRequestDispatcher("jsp/inicio.jsp");
        rd.forward(request, response);
		
		
	}

}
