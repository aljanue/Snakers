package p2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import p2.AccesoBD;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login.html")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sesion = request.getSession();
		if(sesion != null && sesion.getAttribute("usuario")!= null){ //si ya ha iniciado sesión
			RequestDispatcher rd = request.getRequestDispatcher("inicio.html");
			rd.forward(request, response);
		}else {
		RequestDispatcher rd = request.getRequestDispatcher("jsp/login.jsp");
		rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String usr = request.getParameter("text");
		String pass = request.getParameter("pas");
		
		AccesoBD acceso = AccesoBD.getInstance();		
		
		int res = acceso.comprobarUsuarioBD(usr, pass);
		
		if (res > 0)
		{
			HttpSession sesion = request.getSession(true);
			sesion.setAttribute("usuario",res);
			RequestDispatcher rd = request.getRequestDispatcher("jsp/inicio.jsp");
			rd.forward(request, response);
			
		}
		else {
			request.setAttribute("MSG-ERROR", "Usuario y/o contrasena incorrectos");
			RequestDispatcher rd = request.getRequestDispatcher("jsp/login.jsp");
			rd.forward(request, response);
		}
		
		

	}
}
