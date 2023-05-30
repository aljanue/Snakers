package p2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet({"/registro.html", "/modifica-datos.html"})
public class CreaModificaUsuario extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
		System.out.println("Crea/modifica usuario");
		HttpSession sesion = request.getSession(false);
		UsuarioBD u = null;
		if(sesion != null) {
	        Integer codigo = (Integer) sesion.getAttribute("usuario");
	        
	        
	        if (codigo != null) {
	            
	            u = AccesoBD.getInstance().obtenerUsuarioBDPorId(codigo);
	
	            
	        }  
		}
		
        if (u==null)  {
            u = new UsuarioBD();
            u.setActivo(0);
            u.setAdmin(0);
            u.setUsuario("");
            u.setClave("");
            u.setNombre("");
            u.setTelefono(000000000);
            u.setId(0);
            u.setDomicilio("");
        }
        
        request.setAttribute("persona", u);
        request.getRequestDispatcher("jsp/form_usuario.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        boolean resultado;
        
        HttpSession sesion = request.getSession(false);
		Integer codigo = (Integer)sesion.getAttribute("usuario");
        String uUsuario = request.getParameter("username");
        String uClave = request.getParameter("pass");
        String uNombre = request.getParameter("name");
        String uTelefono = request.getParameter("tel");
        String uDomicilio = request.getParameter("dom");
        int telefono = 0;
        
        	
        if(!uClave.equals(request.getParameter("r-pass"))) {
        	request.setAttribute("REG-ERROR", "La contraseña no coincide.");
            RequestDispatcher rd = request.getRequestDispatcher("jsp/form_usuario.jsp");
            rd.forward(request, response);
	    }
        else {
        	if(!uTelefono.matches("[0-9]{9}")) {
        		request.setAttribute("REG-ERROR", "Número de teléfono no válido");
                RequestDispatcher rd = request.getRequestDispatcher("jsp/form_usuario.jsp");
                rd.forward(request, response);
        	}
        	else {
        		telefono = Integer.parseInt(uTelefono);
		        if (codigo==null) { // Nuevo usuario
			            if(!AccesoBD.getInstance().registraUsuarioBD(uUsuario, uClave, uNombre, telefono, uDomicilio)) {
			            	request.setAttribute("REG-ERROR", "El nombre de usuario ya existe.");
			            	RequestDispatcher rd = request.getRequestDispatcher("jsp/form_usuario.jsp");       
			                rd.forward(request, response);
			            }
			            else {
			            	response.sendRedirect("login.html");
			            }
			            
			    } else { // Edicion de usuario
			        	
				            resultado = AccesoBD.getInstance().actualizaUsuarioBD(codigo, uClave, uNombre, telefono, uDomicilio);
				            response.sendRedirect("inicio.html");
			            
			    }
        	}
        }
        
    }

}