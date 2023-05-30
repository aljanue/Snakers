package p2;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;




public final class AccesoBD {
	
	private static AccesoBD instanciaUnica = null;
	private Connection conexionBD = null;
	
	public static AccesoBD getInstance(){
		if (instanciaUnica == null){
			instanciaUnica = new AccesoBD();
		}
		return instanciaUnica;
	}
	
	private AccesoBD() {
		abrirConexionBD();
	}
	
	public void abrirConexionBD() {
		if (conexionBD == null)
		{ // daw es el nombre de la base de datos que hemos creado con anterioridad.
			String nombreConexionBD = "jdbc:mysql://localhost/bbddsnk";
			try { // root y sin clave es el usuario por defecto que crea XAMPP.
				Class.forName("com.mysql.cj.jdbc.Driver");
				conexionBD = DriverManager.getConnection(nombreConexionBD,"root","");
			}
			catch(Exception e) {
				System.err.println("No se ha podido conectar a la base de datos");
				System.err.println(e.getMessage());
				e.printStackTrace();
			}
		}
	}
	
	public void cerrarConexionBD() {
		if (conexionBD != null) {
			try {
				conexionBD.close();
				conexionBD = null;
			}
			catch(Exception e) {
				System.err.println("No se ha podido desconectar de la base de datos");
				System.err.println(e.getMessage());
				e.printStackTrace();
			}
		}
	}
	public boolean comprobarAcceso() {
		abrirConexionBD();
		boolean res = (conexionBD != null);
		cerrarConexionBD();
		return res;
	}
	
    private final static String SQL_INSERTAR_PRODUCTO = "INSERT INTO productos (codigo,descripcion,precio,existencias,imagen,talla,color,genero,marca) VALUES (NULL,?,?,?,?,?,?,?,?)";
	public boolean creaProductoBD(String descripcion, double precio, int existencias,String imagen, int talla, String color, int genero, int marca) {
        boolean creado = false;
        
        abrirConexionBD();
        
        
        try {

            PreparedStatement ps = conexionBD.prepareStatement(SQL_INSERTAR_PRODUCTO);
            
            ps.setString(1, descripcion);
            ps.setDouble(2, precio);
            ps.setInt(3, existencias);
            ps.setString(4,imagen);
            ps.setInt(5,talla);
            ps.setInt(7,genero);
            ps.setInt(8,marca);
            ps.setString(6,color);
            
            ps.execute();
            
            // En las inserciones y actualizaciones podemos obtener el 
            // número de cambios en la base de datos
            creado = (ps.getUpdateCount()>0);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        cerrarConexionBD();
        
        return creado;
    }
    
    /**
     * Sentencia SQL para obtener un producto de la base de datos a partir de su identificador
     */
    private final static String SQL_ACTUALIZA_PRODUCTO = "UPDATE productos SET descripcion = ?, precio = ?, existencias = ?, imagen = ?, genero = ?, marca = ?, talla = ?, color = ?  WHERE codigo = ?";
    
    public boolean actualizaProductoBD(int codigo, String descripcion, double precio, int existencias,String imagen, int genero, int marca, int talla, String color) {
        boolean actualizado = false;
        
        abrirConexionBD();
        
        
        try {

            PreparedStatement ps = conexionBD.prepareStatement(SQL_ACTUALIZA_PRODUCTO);
            
            ps.setString(1, descripcion);
            ps.setDouble(2, precio);
            ps.setInt(3,existencias);
            ps.setString(4,imagen);
            ps.setInt(5, genero);
            ps.setInt(6,  marca);
            ps.setInt(7, talla);
            ps.setString(8, color);
            ps.setInt(9, codigo);
            
            ps.execute();
            
            // En las inserciones y actualizaciones podemos obtener el 
            // número de cambios en la base de datos
            actualizado = (ps.getUpdateCount()>0);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        cerrarConexionBD();
        
        return actualizado;
    }
    
    private final static String SQL_BORRA_PRODUCTO = "DELETE FROM productos WHERE codigo = ?";
    public boolean borraProductoBD(int codigo) {
        boolean borrado = false;
        
        abrirConexionBD();
        
        
        try {

            PreparedStatement ps = conexionBD.prepareStatement(SQL_BORRA_PRODUCTO);
            
            ps.setInt(1, codigo);
            
            borrado = (ps.executeUpdate()==1);
                        
        } catch (Exception e) {
        	System.err.println("Error eliminando productos");
    		System.err.println(e.getMessage());
        }
        
        cerrarConexionBD();
        
        return borrado;
    }
    
	public ArrayList<ProductoBD> obtenerProductosBD() {
		abrirConexionBD();
		ArrayList<ProductoBD> productos = new ArrayList<>();
		try {
		// hay que tener en cuenta las columnas de vuestra tabla de productos
		// también se puede utilizar una consulta del tipo:
		// con = "SELECT * FROM productos";
			Statement st = conexionBD.createStatement();
			ResultSet rs = st.executeQuery("SELECT codigo,descripcion,precio,existencias,imagen,talla,color,marca,genero FROM productos WHERE existencias>0");
			while(rs.next()){
				ProductoBD producto = new ProductoBD();
				producto.setCodigo(rs.getInt("codigo"));
				producto.setDescripcion(rs.getString("descripcion"));
				producto.setPrecio(rs.getFloat("precio"));
				producto.setStock(rs.getInt("existencias"));
				producto.setImagen(rs.getString("imagen"));
				producto.setColor(rs.getString("color"));
				producto.setGenero(rs.getInt("genero"));
				producto.setTalla(rs.getInt("talla"));
				producto.setMarca(rs.getInt("marca"));
				productos.add(producto);
			}
		}
		catch(Exception e) {
		System.err.println("Error obteniendo productos");
		System.err.println(e.getMessage());
		}
		cerrarConexionBD();
		return productos;
	}
	public ArrayList<ProductoBD> obtenerProductosBDAdmin() {
		abrirConexionBD();
		ArrayList<ProductoBD> productos = new ArrayList<>();
		try {
		// hay que tener en cuenta las columnas de vuestra tabla de productos
		// también se puede utilizar una consulta del tipo:
		// con = "SELECT * FROM productos";
			Statement st = conexionBD.createStatement();
			ResultSet rs = st.executeQuery("SELECT codigo,descripcion,precio,existencias,imagen,talla,color,marca,genero FROM productos");
			while(rs.next()){
				ProductoBD producto = new ProductoBD();
				producto.setCodigo(rs.getInt("codigo"));
				producto.setDescripcion(rs.getString("descripcion"));
				producto.setPrecio(rs.getFloat("precio"));
				producto.setStock(rs.getInt("existencias"));
				producto.setImagen(rs.getString("imagen"));
				producto.setColor(rs.getString("color"));
				producto.setGenero(rs.getInt("genero"));
				producto.setTalla(rs.getInt("talla"));
				producto.setMarca(rs.getInt("marca"));
				productos.add(producto);
			}
		}
		catch(Exception e) {
		System.err.println("Error obteniendo productos");
		System.err.println(e.getMessage());
		}
		cerrarConexionBD();
		return productos;
	}
	
	public ArrayList<ProductoBD> obtenerProductosBDPorMarca(String marca) {
		abrirConexionBD();
		ArrayList<ProductoBD> productos = new ArrayList<>();
		try {
			String con = "SELECT * FROM productos WHERE marca = '" + marca + "' AND existencias > 0";
			Statement st = conexionBD.createStatement();
			ResultSet rs = st.executeQuery(con);
			while (rs.next()) {
				ProductoBD producto = new ProductoBD();
				producto.setCodigo(rs.getInt("codigo"));
				producto.setDescripcion(rs.getString("descripcion"));
				producto.setPrecio(rs.getFloat("precio"));
				producto.setStock(rs.getInt("existencias"));
				producto.setImagen(rs.getString("imagen"));
				producto.setColor(rs.getString("color"));
				producto.setGenero(rs.getInt("genero"));
				producto.setTalla(rs.getInt("talla"));
				producto.setMarca(rs.getInt("marca"));
				productos.add(producto);
			}
		} catch (Exception e) {
			System.err.println("Error obteniendo productos por genero");
			System.err.println(e.getMessage());
		}
		cerrarConexionBD();
		return productos;
	}
	
	private final static String SQL_OBTENER_PRODUCTO = "SELECT * FROM productos WHERE codigo = ? AND existencias > 0"; 
    public ProductoBD obtenerProductoBDPorId(Integer id) {
        abrirConexionBD();
        
        ProductoBD producto= null;
        
        try {

            PreparedStatement ps = conexionBD.prepareStatement(SQL_OBTENER_PRODUCTO);
            
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
            	producto = new ProductoBD();
            	// producto.setCodigo(rs.getInt("codigo"));
				producto.setDescripcion(rs.getString("descripcion"));
				producto.setPrecio(rs.getFloat("precio"));
				producto.setStock(rs.getInt("existencias"));
				producto.setImagen(rs.getString("imagen"));
				producto.setColor(rs.getString("color"));
				producto.setGenero(rs.getInt("genero"));
				producto.setTalla(rs.getInt("talla"));
				producto.setMarca(rs.getInt("marca"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        cerrarConexionBD();
        
        return producto;
    }
    
    private final static String SQL_OBTENER_PRODUCTO_PEDIDO = "SELECT * FROM productos WHERE codigo = ?"; 
    public ProductoBD obtenerProductoBDPorIdEnPedido(Integer id) {
        abrirConexionBD();
        
        ProductoBD producto= null;
        
        try {

            PreparedStatement ps = conexionBD.prepareStatement(SQL_OBTENER_PRODUCTO_PEDIDO);
            
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
            	producto = new ProductoBD();
            	// producto.setCodigo(rs.getInt("codigo"));
				producto.setDescripcion(rs.getString("descripcion"));
				producto.setPrecio(rs.getFloat("precio"));
				producto.setStock(rs.getInt("existencias"));
				producto.setImagen(rs.getString("imagen"));
				producto.setColor(rs.getString("color"));
				producto.setGenero(rs.getInt("genero"));
				producto.setTalla(rs.getInt("talla"));
				producto.setMarca(rs.getInt("marca"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        cerrarConexionBD();
        
        return producto;
    }
    private final static String SQL_OBTENER_PRODUCTO_ADMIN = "SELECT * FROM productos WHERE codigo = ?"; 
    public ProductoBD obtenerProductoBDPorIdAdmin(Integer id) {
        abrirConexionBD();
        
        ProductoBD producto= null;
        
        try {

            PreparedStatement ps = conexionBD.prepareStatement(SQL_OBTENER_PRODUCTO_ADMIN);
            
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
            	producto = new ProductoBD();
            	producto.setCodigo(rs.getInt("codigo"));
				producto.setDescripcion(rs.getString("descripcion"));
				producto.setPrecio(rs.getFloat("precio"));
				producto.setStock(rs.getInt("existencias"));
				producto.setImagen(rs.getString("imagen"));
				producto.setColor(rs.getString("color"));
				producto.setGenero(rs.getInt("genero"));
				producto.setTalla(rs.getInt("talla"));
				producto.setMarca(rs.getInt("marca"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        cerrarConexionBD();
        return producto;
    }
    
	public ArrayList<ProductoBD> obtenerProductosBDPorDescripcion(String desc) {
		abrirConexionBD();
		ArrayList<ProductoBD> productos = new ArrayList<>();
		try {
			String con = "SELECT * FROM productos WHERE descripcion LIKE '%" + desc + "%' AND existencias > 0";
			Statement st = conexionBD.createStatement();
			ResultSet rs = st.executeQuery(con);
			while (rs.next()) {
				ProductoBD producto = new ProductoBD();
				producto.setCodigo(rs.getInt("codigo"));
				producto.setDescripcion(rs.getString("descripcion"));
				producto.setPrecio(rs.getFloat("precio"));
				producto.setStock(rs.getInt("existencias"));
				producto.setImagen(rs.getString("imagen"));
				producto.setColor(rs.getString("color"));
				producto.setGenero(rs.getInt("genero"));
				producto.setTalla(rs.getInt("talla"));
				producto.setMarca(rs.getInt("marca"));
				productos.add(producto);
			}
		} catch (Exception e) {
			System.err.println("Error ejecutando la consulta a la base de datos");
			System.err.println(e.getMessage());
		}
		cerrarConexionBD();
		return productos;
	}
	
	
	
	public int comprobarUsuarioBD(String usuario, String clave) {

		abrirConexionBD();

		try {
			String con = "SELECT codigo FROM usuarios WHERE usuario=? AND clave=? AND activo=1";
			
			PreparedStatement s = conexionBD.prepareStatement(con);
			s.setString(1, usuario);
			s.setString(2, clave);
			ResultSet resultado = s.executeQuery();
			
			if (resultado.next()) { // El usuario/clave se encuentra en la BD 
				return resultado.getInt("codigo");
			}
		} catch (Exception e) { 
			e.printStackTrace();
		}
		
		cerrarConexionBD();
		
		return -1;
	}
	public int comprobarUsuarioBDAdmin(String usuario, String clave) {

		abrirConexionBD();

		try {
			String con = "SELECT codigo FROM usuarios WHERE usuario=? AND clave=? AND admin=1";
			
			PreparedStatement s = conexionBD.prepareStatement(con);
			s.setString(1, usuario);
			s.setString(2, clave);
			ResultSet resultado = s.executeQuery();
			
			if (resultado.next()) { // El usuario/clave se encuentra en la BD 
				return resultado.getInt("codigo");
			}
		} catch (Exception e) { 
			e.printStackTrace();
		}
		
		cerrarConexionBD();
		
		return -1;
	}
	
	private final static String SQL_REGISTRA_USUARIO = "INSERT INTO usuarios (codigo, activo, admin, usuario, clave, nombre, telefono, domicilio) VALUES (NULL, 1, 0, ?, ?, ?, ?, ?)";
	public boolean registraUsuarioBD(String usuario, String clave, String nombre, int telefono, String domicilio) {
		boolean creado = false;
		abrirConexionBD();
		try {
			
			PreparedStatement ps = conexionBD.prepareStatement(SQL_REGISTRA_USUARIO);
			
			ps.setString(1,  usuario);
			ps.setString(2,  clave);
			ps.setString(3,  nombre);
			ps.setInt(4, telefono);
			ps.setString(5, domicilio);
			ps.execute();
			creado = (ps.getUpdateCount()>0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		cerrarConexionBD();
		return creado;
	}

	private final static String SQL_ACTIVAR_DESACTIVAR_USUARIO = "UPDATE usuarios SET activo = ? WHERE codigo = ?";
	public boolean activarDesactivarUsuarioBD(int id, int action) {
		boolean creado = false;
		abrirConexionBD();
		try {
			
			PreparedStatement ps = conexionBD.prepareStatement(SQL_ACTIVAR_DESACTIVAR_USUARIO);
			if(action == 0)
			{
				ps.setInt(1, 1 );
			} else if(action == 1) {
				ps.setInt(1, 0);
			}
			ps.setInt(2, id);
			ps.execute();
			creado = (ps.getUpdateCount()>0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		cerrarConexionBD();
		return creado;
	}
	
	public List<UsuarioBD> obtenerUsuariosBD() {
		abrirConexionBD();
		ArrayList<UsuarioBD> usuarios = new ArrayList<>();
		try {
		// hay que tener en cuenta las columnas de vuestra tabla de productos
		// también se puede utilizar una consulta del tipo:
		// con = "SELECT * FROM productos";
			Statement st = conexionBD.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM usuarios");
			while(rs.next()){
				UsuarioBD usuario = new UsuarioBD();
				usuario.setId(rs.getInt("codigo"));
				usuario.setActivo(rs.getInt("activo"));
				usuario.setAdmin(rs.getInt("admin"));
				usuario.setUsuario(rs.getString("usuario"));
				usuario.setClave(rs.getString("clave"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setTelefono(rs.getInt("telefono"));
				usuario.setDomicilio(rs.getString("usuario"));
				usuarios.add(usuario);
			}
		}
		catch(Exception e) {
		System.err.println("Error obteniendo productos");
		System.err.println(e.getMessage());
		}
		cerrarConexionBD();
		return usuarios;
	}
	
	private final static String SQL_OBTENER_USUARIO = "SELECT * FROM usuarios WHERE codigo = ?"; 
	public UsuarioBD obtenerUsuarioBDPorId(Integer id) {
        abrirConexionBD();
        
        UsuarioBD usuario = null;
        
        try {

            PreparedStatement ps = conexionBD.prepareStatement(SQL_OBTENER_USUARIO);
            
            ps.setInt(1, id);
            
            ResultSet resultado = ps.executeQuery();
            
            if (resultado.next()) {
                usuario = new UsuarioBD();
                usuario.setId(resultado.getInt("codigo"));
                usuario.setUsuario(resultado.getString("usuario"));
                usuario.setClave(resultado.getString("clave"));
                usuario.setNombre(resultado.getString("nombre"));
                usuario.setTelefono(resultado.getInt("telefono"));
                usuario.setDomicilio(resultado.getString("domicilio"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        cerrarConexionBD();
        
        return usuario;
    }
	
	private final static String SQL_OBTENER_USUARIO_USUARIO = "SELECT * FROM usuarios WHERE usuario = ?"; 
	public UsuarioBD obtenerUsuarioBDPorUsuario(String usr) {
        abrirConexionBD();
        
        UsuarioBD usuario = null;
        
        try {

            PreparedStatement ps = conexionBD.prepareStatement(SQL_OBTENER_USUARIO_USUARIO);
            
            ps.setString(1, usr);
            
            ResultSet resultado = ps.executeQuery();
            
            if (resultado.next()) {
                usuario = new UsuarioBD();
                usuario.setId(resultado.getInt("codigo"));
                usuario.setUsuario(resultado.getString("usuario"));
                usuario.setClave(resultado.getString("clave"));
                usuario.setNombre(resultado.getString("nombre"));
                usuario.setTelefono(resultado.getInt("telefono"));
                usuario.setDomicilio(resultado.getString("domicilio"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        cerrarConexionBD();
        
        return usuario;
    }
	
	private final static String SQL_ACTUALIZA_USUARIO = "UPDATE usuarios SET clave = ?, nombre = ?, telefono = ?, domicilio = ? WHERE codigo = ?";
	public boolean actualizaUsuarioBD(int codigo, String clave, String nombre,int telefono, String domicilio) {
        boolean actualizado = false;
        
        abrirConexionBD();
        
        
        try {

            PreparedStatement ps = conexionBD.prepareStatement(SQL_ACTUALIZA_USUARIO);
            
            ps.setString(1, clave);
            ps.setString(2,nombre);
            ps.setInt(3,telefono);
            ps.setString(4, domicilio);
            ps.setInt(5, codigo);
            
            ps.execute();
            
            // En las inserciones y actualizaciones podemos obtener el 
            // número de cambios en la base de datos
            actualizado = (ps.getUpdateCount()>0);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        cerrarConexionBD();
        
        return actualizado;
    }
	
	public List<PedidoBD> obtenerPedidosBD() {
		abrirConexionBD();
		ArrayList<PedidoBD> pedidos = new ArrayList<>();
		try {
			Statement st = conexionBD.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM pedidos");
			while(rs.next()){
				PedidoBD pedido = new PedidoBD();
				pedido.setCodigo(rs.getInt("codigo"));
				pedido.setPersona(rs.getInt("persona"));
				pedido.setFecha(rs.getDate("fecha"));
				pedido.setImporte(rs.getFloat("importe"));
				pedido.setEstado(rs.getInt("estado"));
				pedido.setDireccion(rs.getString("direccion"));
				pedidos.add(pedido);
			}
		}
		catch(Exception e) {
		System.err.println("Error ejecutando la consulta a la base de datos");
		System.err.println(e.getMessage());
		}
		cerrarConexionBD();
		return pedidos;
	}
	
	public PedidoBD obtenerPedidoBDPorId(int id) {
		abrirConexionBD();
		PedidoBD pedido = new PedidoBD();
		try {
		    String con = "SELECT * FROM pedidos WHERE codigo = ?";
		    PreparedStatement st = conexionBD.prepareStatement(con);
		    st.setInt(1, id);
		    ResultSet rs = st.executeQuery();
		    if (rs.next()) {	
		        pedido.setCodigo(rs.getInt("codigo"));
		        pedido.setPersona(rs.getInt("persona"));
		        pedido.setFecha(rs.getDate("fecha"));
		        pedido.setImporte(rs.getFloat("importe"));
		        pedido.setEstado(rs.getInt("estado"));
		        pedido.setDireccion(rs.getString("direccion"));
		    }
		} catch (Exception e) {
		    System.err.println("Error ejecutando la consulta a la base de datos");
		    System.err.println(e.getMessage());
		}
		cerrarConexionBD();
		
		return pedido;
	}
	
	public ArrayList<PedidoBD> obtenerPedidosBDPorPersona(int id) {
	    abrirConexionBD();
	    ArrayList<PedidoBD> pedidos = new ArrayList<>();
	    try {
	        String con = "SELECT * FROM pedidos WHERE persona = ?";
	        PreparedStatement st = conexionBD.prepareStatement(con);
	        st.setInt(1, id);
	        ResultSet rs = st.executeQuery();
	        while (rs.next()) {
	            PedidoBD pedido = new PedidoBD();
	            pedido.setCodigo(rs.getInt("codigo"));
	            pedido.setPersona(rs.getInt("persona"));
	            pedido.setFecha(rs.getDate("fecha"));
	            pedido.setImporte(rs.getFloat("importe"));
	            pedido.setEstado(rs.getInt("estado"));
	            pedido.setDireccion(rs.getString("direccion"));
	            pedidos.add(pedido);
	        }
	    } catch (Exception e) {
	        System.err.println("Error ejecutando la consulta a la base de datos");
	        System.err.println(e.getMessage());
	    }
	        cerrarConexionBD();
	    return pedidos;
	}

	
	
	
	public int GuardarPedidoBD(int codigo, ArrayList<ProductoBD> carrito, String dom) {
		abrirConexionBD();
		int id = 0;
		SimpleDateFormat dtf = new SimpleDateFormat("yyyy/MM/dd");
		Calendar calendar = Calendar.getInstance();
	    Date dateObj = calendar.getTime();
	    String fecha = dtf.format(dateObj);
	    float importe = 0;
	    float importe_total = 0;
	    int estado = 1;
	    for(ProductoBD producto  : carrito){
			importe = producto.getPrecio()*(float)producto.getStock();
			importe_total+=importe;
	    }
	    importe_total+=5;
	    try {

	    	String con = "INSERT INTO pedidos(persona, fecha, importe, estado, direccion) VALUES(?,?,?,?, ?)";	
			PreparedStatement s = conexionBD.prepareStatement(con, Statement.RETURN_GENERATED_KEYS);
			s.setInt(1,codigo);
			s.setString(2,fecha);
			s.setFloat(3,importe_total);
			s.setInt(4,estado);
			s.setString(5, dom);
			s.executeUpdate();
			ResultSet res = s.getGeneratedKeys();
						
			if(res.next()){
				id = Math.toIntExact(res.getLong(1));
			}
			else{
				System.err.println("");
			}
		}catch(Exception e) {
	    	System.err.println("Error insertando pedido");
    		System.err.println(e.getMessage());
    	}
	    
	    for(ProductoBD producto  : carrito){
			int id_producto = producto.getCodigo();
			float precio_producto = producto.getPrecio();
			int unidades_producto = producto.getStock();
			try 
			{
				String con2 = "INSERT INTO detalle(codigo_pedido, codigo_producto, unidades, precio_unitario) VALUES(?,?,?,?)";
				PreparedStatement s = conexionBD.prepareStatement(con2);
				
				s.setInt(1,id);
				s.setInt(2,id_producto);
				s.setInt(3,unidades_producto);
				s.setFloat(4, precio_producto);
				s.executeUpdate();
			}
			catch(Exception e) 
			{
				System.err.println("Error insertando detalles del pedido");
				System.err.println(e.getMessage());
			}
			try 
			{
				String con3 = "SELECT existencias FROM productos WHERE codigo=?";
				PreparedStatement s = conexionBD.prepareStatement(con3);
				s.setInt(1, id_producto);
				ResultSet resultado = s.executeQuery();
				
				while(resultado.next())
				{
					int unidades = resultado.getInt("existencias");
					unidades = unidades - unidades_producto;
				
					try 
					{
						String con4 = "UPDATE productos SET existencias=? WHERE codigo=?";
						PreparedStatement s2 = conexionBD.prepareStatement(con4);
						s2.setInt(1, unidades);
						s2.setInt(2, id_producto);
						
						s2.executeUpdate();
					}
					catch(Exception e) 
					{	System.err.println("Error restando stock");
						System.err.println(e.getMessage());
					}
				}
			}
			catch(Exception e) 
			{
				System.err.println("Error ejecutando la consulta a la base de datos");
				System.err.println(e.getMessage());
			}
		}
	    cerrarConexionBD();
	    return id;
	}
	
	public void cambiarEstadoPedidoBD( int codigo,int estado) {
		abrirConexionBD();
		try {
			String con = "UPDATE pedidos SET estado='"+estado+"' WHERE codigo='"+codigo+"'";
			PreparedStatement s2 = conexionBD.prepareStatement(con);
			s2.executeUpdate();
		}
		catch(Exception e){
			System.err.println("Error al cambiar el estado");
			System.err.println(e.getMessage());
		}
		cerrarConexionBD();
	}
	
	public ArrayList<DetalleBD> obtenerDetallesPorPedido(int codigo) {
	    abrirConexionBD();
	    ArrayList<DetalleBD> detalles = new ArrayList<>();
	    try {
	        String con = "SELECT * FROM detalle WHERE codigo_pedido = ?";
	        PreparedStatement st = conexionBD.prepareStatement(con);
	        st.setInt(1, codigo);
	        ResultSet rs = st.executeQuery();
	        while (rs.next()) {
	            DetalleBD detalle = new DetalleBD();
	            detalle.setCodigo_pedido(codigo);
	            detalle.setCodigo_producto(rs.getInt("codigo_producto"));
	            detalle.setPrecio_unitario(rs.getFloat("precio_unitario"));
	            detalle.setUnidades(rs.getInt("unidades"));
	            detalles.add(detalle);
	        }
	    } catch (Exception e) {
	        System.err.println("Error ejecutando la consulta a la base de datos");
	        System.err.println(e.getMessage());
	    }
	        cerrarConexionBD();
	    
	    return detalles;
	}

	
	public ArrayList<MensajeBD> obtenerMensajesBD() {
	    abrirConexionBD();
	    ArrayList<MensajeBD> mensajes = new ArrayList<>();
	    try {
	        PreparedStatement st = conexionBD.prepareStatement("SELECT * FROM mensajes");
	        ResultSet rs = st.executeQuery();
	        while (rs.next()) {
	            MensajeBD mensaje = new MensajeBD();
	            mensaje.setId(rs.getInt("id"));
	            mensaje.setId_usuario(rs.getInt("id_usuario"));
	            mensaje.setAsunto(rs.getString("asunto"));
	            mensaje.setMensaje(rs.getString("mensaje"));
	            mensajes.add(mensaje);
	        }
	    } catch (Exception e) {
	        System.err.println("Error ejecutando la consulta a la base de datos");
	        System.err.println(e.getMessage());
	    }
	        cerrarConexionBD();
	
	    return mensajes;
	}

	
	public MensajeBD obtenerMensajeBDPorId(int id) {
		abrirConexionBD();
		MensajeBD mensaje = new MensajeBD();
		try {
			
			String con = "SELECT * FROM mensajes WHERE id = '" + id + "'";
			Statement st = conexionBD.createStatement();
			ResultSet rs = st.executeQuery(con);
			 if (rs.next()) {	
				mensaje.setId(rs.getInt("id"));
				mensaje.setId_usuario(rs.getInt("id_usuario"));
				mensaje.setAsunto(rs.getString("asunto"));
				mensaje.setMensaje(rs.getString("mensaje"));
			 }
		} catch (Exception e) {
			System.err.println("Error ejecutando la consulta a la base de datos");
			System.err.println(e.getMessage());
		}
		cerrarConexionBD();
		
		return mensaje;
	}
	public ArrayList<MensajeBD> obtenerMensajesBDPorUsuario(int id_usuario) {
	    abrirConexionBD();
	    ArrayList<MensajeBD> mensajes = new ArrayList<>();
	    try {
	        String con = "SELECT * FROM mensajes WHERE id_usuario = ?";
	        PreparedStatement ps = conexionBD.prepareStatement(con);
	        ps.setInt(1, id_usuario);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            MensajeBD mensaje = new MensajeBD();
	            mensaje.setId(rs.getInt("id"));
	            mensaje.setId_usuario(rs.getInt("id_usuario"));
	            mensaje.setAsunto(rs.getString("asunto"));
	            mensaje.setMensaje(rs.getString("mensaje"));
	            mensajes.add(mensaje);
	        }
	    } catch (Exception e) {
	        System.err.println("Error ejecutando la consulta a la base de datos");
	        System.err.println(e.getMessage());
	    }
	    cerrarConexionBD();
	    return mensajes;
	}


	private final static String SQL_GUARDA_MENSAJE = "INSERT INTO mensajes (id, id_usuario, asunto, mensaje) VALUES (NULL, ?, ?, ?)";
	public boolean guardarMensajeBD(int id_usuario, String asunto, String mensaje)
	{
			boolean creado = false;
			abrirConexionBD();
			try {
				
				PreparedStatement ps = conexionBD.prepareStatement(SQL_GUARDA_MENSAJE);
				
				ps.setInt(1,  id_usuario);
				ps.setString(2,  asunto);
				ps.setString(3,  mensaje);
				ps.execute();
				creado = (ps.getUpdateCount()>0);
			} catch (Exception e) {
				System.err.println("Error ejecutando la consulta a la base de datos");
				System.err.println(e.getMessage());
			}
			cerrarConexionBD();
			return creado;
		}
	}
	