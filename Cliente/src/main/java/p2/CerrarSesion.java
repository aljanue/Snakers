package p2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.http.Cookie;

/**
 * Servlet implementation class CerrarSesion
 */
@WebServlet("/cerrar-sesion.html")
public class CerrarSesion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CerrarSesion() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		    // Invalidar la sesión
		    HttpSession session = request.getSession(false);
		    if (session != null) {
		    	Integer codigo = (Integer)session.getAttribute("usuario");
		    	if(codigo!=null)
		    		session.invalidate();
		    }
		    
		    
		    // Redirigir al usuario a la página de inicio de sesión
		    response.sendRedirect("login.html");
		}
	

}
