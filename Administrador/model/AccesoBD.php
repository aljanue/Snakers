<?php

class AccesoBD
{
    private static function conectar()
    {
       $bbdd = mysqli_connect("localhost","root","","bbddsnk");
       if (mysqli_connect_error()) {
          printf("Error conectando a la base de datos: %s\n",mysqli_connect_error());
          exit();
       }
       return $bbdd;
    }
    
    private static function desconectar($bbdd)
    {
       mysqli_close($bbdd);
    }
    
    public static function comprobarUsuarioAdmin($login,$clave) {
        $bbdd = AccesoBD::conectar();
        $result = FALSE;
        
        if ($st = mysqli_prepare($bbdd, "SELECT * FROM usuarios WHERE usuario=? and clave=? and admin=1")) {
            mysqli_stmt_bind_param($st,"ss",$login,$clave);
            mysqli_stmt_execute($st);
           
            $result=mysqli_stmt_fetch($st);
         
            AccesoBD::desconectar($bbdd);
        }
        
        return $result;
    }
    
    public static function obtenerListadoUsuarios() {
        
        $bbdd = AccesoBD::conectar();
         
        $usuarios= [];
        
        if ($resultado = mysqli_query($bbdd,"SELECT codigo, usuario, activo, admin, clave, nombre, telefono FROM usuarios")) {
            while ($fila = mysqli_fetch_array($resultado)) {
                array_push($usuarios, $fila);
            }
            
        }
        
        AccesoBD::desconectar($bbdd);
        
       return $usuarios;
    }
    public static function modificarEstadoUsuario($codigo, $estado) {
        
        $bbdd = AccesoBD::conectar();
        $result = FALSE;
        
        if ($st = mysqli_prepare($bbdd, "UPDATE usuarios SET activo = ? WHERE codigo = ?")) {
            mysqli_stmt_bind_param($st,"ii",$estado,$codigo);
            mysqli_stmt_execute($st);
            
            $result=$st->affected_rows > 0;
            
            AccesoBD::desconectar($bbdd);
        }
        
        return $result;
    } 
    
    public static function obtenerUsuario($codigoUsuario) {
        $usuario = null;
        
        $bbdd = AccesoBD::conectar();
        
        $stmt = mysqli_prepare($bbdd, "SELECT * FROM usuarios WHERE codigo=?");
        
        mysqli_stmt_bind_param($stmt, "i", $codigoUsuario);
        
        mysqli_stmt_execute($stmt);
        
        $result = mysqli_stmt_get_result($stmt);
        
        if ($fila = mysqli_fetch_array($result)) {
            $usuario = $fila;
        }
        
        AccesoBD::desconectar($bbdd);
        
        return $usuario;
    }
    public static function modificarUsuario($codigo, $name, $tel, $dom){
        $bbdd = AccesoBD::conectar();
        $result = FALSE;
        
        if ($st = mysqli_prepare($bbdd, "UPDATE usuarios SET nombre=?, telefono=?, domicilio=? WHERE codigo = ?")) {
            mysqli_stmt_bind_param($st,"sisi",$name, $tel, $dom, $codigo);
            mysqli_stmt_execute($st);
            
            $result=$st->affected_rows > 0;
            
            
            AccesoBD::desconectar($bbdd);
        }
        
        return $result;
    }
    
    public static function borrarUsuario($codigo) {
        
        $bbdd = AccesoBD::conectar();
        $result = FALSE;
        if ($st = mysqli_prepare($bbdd, "DELETE FROM usuarios WHERE codigo = ?")) {
            mysqli_stmt_bind_param($st,"i", $codigo);
            mysqli_stmt_execute($st);
            
            $result=$st->affected_rows > 0;
            
            AccesoBD::desconectar($bbdd);
        }
        
        return $result;
    } 
    
    
    public static function obtenerListadoProductos() {
        
        $bbdd = AccesoBD::conectar();
        
        $productos= [];
        
        if ($resultado = mysqli_query($bbdd,"SELECT * FROM productos")) {
            while ($fila = mysqli_fetch_array($resultado)) {
                array_push($productos, $fila);
            }
            
        }
        
        AccesoBD::desconectar($bbdd);
        
        return $productos;
    }
    
    
    public static function obtenerProductoID($cod){
        $producto = null;
        
        $bbdd = AccesoBD::conectar();
        
        $stmt = mysqli_prepare($bbdd, "SELECT * FROM productos WHERE codigo=?");
        
        mysqli_stmt_bind_param($stmt, "i", $cod);
        
        mysqli_stmt_execute($stmt);
        
        $result = mysqli_stmt_get_result($stmt);
        
        if ($fila = mysqli_fetch_array($result)) {
            $producto = $fila;
        }
        
        AccesoBD::desconectar($bbdd);
        
        return $producto;
    }
    public static function borrarProducto($codigo) {
        
        $bbdd = AccesoBD::conectar();
        $result = FALSE;
        if ($st = mysqli_prepare($bbdd, "DELETE FROM productos WHERE codigo = ?")) {
            mysqli_stmt_bind_param($st,"i", $codigo);
            mysqli_stmt_execute($st);
            
            $result=$st->affected_rows > 0;
            
            AccesoBD::desconectar($bbdd);
        }
        
        return $result;
    } 
    
    
    public static function insertarProducto($descripcion,$precio,$existencias,$imagen, $talla, $color, $marca, $genero) {
    
    
        $bbdd = AccesoBD::conectar();
        $result = FALSE;
        
        if ($st = mysqli_prepare($bbdd, "INSERT INTO productos (codigo,descripcion,precio,existencias,imagen, talla, color, marca, genero) VALUES (NULL,?,?,?,?,?,?,?,?)")) {
            mysqli_stmt_bind_param($st,"sdisisii",$descripcion,$precio,$existencias,$imagen,$talla, $color, $marca, $genero);
            mysqli_stmt_execute($st);
    
            $result=$st->affected_rows > 0;
         
            AccesoBD::desconectar($bbdd);
        } 
        
        return $result;
    }
    
    public static function modificarProducto($codigo, $descripcion,$precio,$existencias,$imagen, $talla, $color, $marca, $genero) {
        
        $bbdd = AccesoBD::conectar();
        $result = FALSE;
        if ($st = mysqli_prepare($bbdd, "UPDATE productos SET descripcion=?,precio=?,existencias=?,imagen=?, talla=?, color=?, marca=?, genero=? WHERE codigo = ?")) {
            mysqli_stmt_bind_param($st,"sdisisiii",$descripcion,$precio,$existencias,$imagen,$talla, $color, $marca, $genero, $codigo);
            mysqli_stmt_execute($st);
            
            $result=$st->affected_rows > 0;
            
            AccesoBD::desconectar($bbdd);
        }
        
        return $result;
    } 
    
    public static function obtenerListadoPedidos() {
        
        $bbdd = AccesoBD::conectar();
        
        $pedidos= [];
        
        if ($resultado = mysqli_query($bbdd,"SELECT pedidos.codigo, pedidos.persona, pedidos.fecha, pedidos.importe, pedidos.estado, pedidos.direccion, usuarios.usuario FROM pedidos JOIN usuarios ON pedidos.persona=usuarios.codigo")) {
            while ($fila = mysqli_fetch_array($resultado)) {
                array_push($pedidos, $fila);
            }
            
        }
        
        AccesoBD::desconectar($bbdd);
        
        return $pedidos;
    }
    
    public static function obtenerListadoPedidosPorUsuario($user){
        $bbdd = AccesoBD::conectar();
        
        $pedidos= [];
        
        if ($stmt = mysqli_prepare($bbdd, "SELECT pedidos.codigo, pedidos.persona, pedidos.fecha, pedidos.importe, pedidos.estado, pedidos.direccion, usuarios.usuario FROM pedidos JOIN usuarios ON pedidos.persona=usuarios.codigo WHERE usuarios.usuario=?")) {
            mysqli_stmt_bind_param($stmt, "s", $user);
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);
            
            while ($fila = mysqli_fetch_array($result)) {
                array_push($pedidos, $fila);
            }
        }
        
        AccesoBD::desconectar($bbdd);
        
        return $pedidos;
    }
    
    
    public static function obtenerListadoPedidosPorFecha($fecha){
        $bbdd = AccesoBD::conectar();
        
        $pedidos= [];
        
        if ($stmt = mysqli_prepare($bbdd, "SELECT pedidos.codigo, pedidos.persona, pedidos.fecha, pedidos.importe, pedidos.estado, pedidos.direccion, usuarios.usuario FROM pedidos JOIN usuarios ON pedidos.persona=usuarios.codigo WHERE pedidos.fecha=?")) {
            mysqli_stmt_bind_param($stmt, "s", $fecha);
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);
            
            while ($fila = mysqli_fetch_array($result)) {
                array_push($pedidos, $fila);
            }
        }
        
        AccesoBD::desconectar($bbdd);
        
        return $pedidos;
    }
    
    public static function obtenerListadoPedidosPorProducto($prod){
        $bbdd = AccesoBD::conectar();
        
        $pedidos= [];
        
        if ($stmt = mysqli_prepare($bbdd, "SELECT pedidos.codigo, pedidos.persona, pedidos.fecha, pedidos.importe, pedidos.estado, pedidos.direccion, usuarios.usuario FROM pedidos JOIN usuarios ON pedidos.persona=usuarios.codigo JOIN detalle ON detalle.codigo_pedido=pedidos.codigo JOIN productos on detalle.codigo_producto=productos.codigo WHERE productos.descripcion like ?")) {
            mysqli_stmt_bind_param($stmt, "s", $prod);
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);
            
            while ($fila = mysqli_fetch_array($result)) {
                array_push($pedidos, $fila);
            }
        }
        
        AccesoBD::desconectar($bbdd);
        
        return $pedidos;
    }
    
    
    
    public static function obtenerPedidoId($id_pedido) {
        $pedido = null;
        
        $bbdd = AccesoBD::conectar();
        
        $stmt = mysqli_prepare($bbdd, "SELECT * FROM pedidos WHERE codigo=?");
        
        mysqli_stmt_bind_param($stmt, "i", $id_pedido);
        
        mysqli_stmt_execute($stmt);
        
        $result = mysqli_stmt_get_result($stmt);
        
        if ($fila = mysqli_fetch_array($result)) {
            $pedido = $fila;
        }
        
        AccesoBD::desconectar($bbdd);
        
        return $pedido;
    }
    
    
    public static function modificarEstadoPedido($codigo, $estado) {
        
        $bbdd = AccesoBD::conectar();
        $result = FALSE;
        if ($st = mysqli_prepare($bbdd, "UPDATE pedidos SET estado = ? WHERE codigo = ?")) {
            mysqli_stmt_bind_param($st,"ii",$estado,$codigo);
            mysqli_stmt_execute($st);
            
            $result=$st->affected_rows > 0;
            
            AccesoBD::desconectar($bbdd);
        }
        
        return $result;
    } 
    
    public static function cancelarPedido($codigo) {
        
        $bbdd = AccesoBD::conectar();
        $result = FALSE;
        
        if ($st = mysqli_prepare($bbdd, "UPDATE pedidos SET estado = 4 WHERE codigo = ? AND estado=1")) {
            mysqli_stmt_bind_param($st,"i",$codigo);
            mysqli_stmt_execute($st);
             
            $result=$st->affected_rows > 0;
            
            
            AccesoBD::desconectar($bbdd);
        }
        
        return $result;
    }
    
    public static function devolverStock($codigo, $unidades) {
        
        $bbdd = AccesoBD::conectar();
        $result = FALSE;
        
        if ($st = mysqli_prepare($bbdd, "UPDATE productos SET existencias = ? WHERE codigo = ?")) {
            mysqli_stmt_bind_param($st,"ii", $unidades, $codigo);
            mysqli_stmt_execute($st);
            
            $result=$st->affected_rows > 0;
            
            
            AccesoBD::desconectar($bbdd);
        }
        
        return $result;
    }
    
    public static function borrarPedido($codigo) {
        $bbdd = AccesoBD::conectar();
        $result = FALSE;
        
        // Eliminar los registros de la tabla "detalle"
        if ($stmt = mysqli_prepare($bbdd, "DELETE FROM detalle WHERE codigo_pedido = ?")) {
            mysqli_stmt_bind_param($stmt, "i", $codigo);
            mysqli_stmt_execute($stmt);
            mysqli_stmt_close($stmt);
        }
        
        // Eliminar el registro de la tabla "pedidos"
        if ($stmt = mysqli_prepare($bbdd, "DELETE FROM pedidos WHERE codigo = ? AND estado=4")) {
            mysqli_stmt_bind_param($stmt, "i", $codigo);
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_affected_rows($stmt) > 0;
            mysqli_stmt_close($stmt);
        }
        
        AccesoBD::desconectar($bbdd);
        return $result;
    }
    
    
    public static function obtenerDetallePedido($codigo_pedido) {
        $detalles=[];
        
        $bbdd = AccesoBD::conectar();
        
        $stmt = mysqli_prepare($bbdd, "SELECT * FROM detalle JOIN productos ON detalle.codigo_producto=productos.codigo WHERE detalle.codigo_pedido=?");
        
        mysqli_stmt_bind_param($stmt, "i", $codigo_pedido);
        
        mysqli_stmt_execute($stmt);
        
        $result = mysqli_stmt_get_result($stmt);
        
        while ($fila = mysqli_fetch_array($result)) {
            array_push($detalles, $fila);
        }
        
        
        AccesoBD::desconectar($bbdd);
        
        return $detalles;
    }
    
    public static function obtenerDetallePedidoTablaEntera() {
        $detalles=[];
        
        $bbdd = AccesoBD::conectar();
        
        if ($st = mysqli_query($bbdd,"SELECT * FROM detalle")) {
            while ($fila = mysqli_fetch_array($st)) {
                array_push($detalles, $fila);
            }
            
        }
        
        AccesoBD::desconectar($bbdd);
        
        return $detalles;
        
        
    }
    public static function obtenerListadoMensajes(){
        $bbdd = AccesoBD::conectar();
        
        $mensajes= [];
        
        if ($resultado = mysqli_query($bbdd,"SELECT * FROM mensajes JOIN usuarios ON mensajes.id_usuario=usuarios.codigo")) {
            while ($fila = mysqli_fetch_array($resultado)) {
                array_push($mensajes, $fila);
            }
            
        }
        
        AccesoBD::desconectar($bbdd);
        
        return $mensajes;
    }
    
    public static function obtenerMensajeId($id) {
        $mensaje = null;
        
        $bbdd = AccesoBD::conectar();
        
        $stmt = mysqli_prepare($bbdd, "SELECT * FROM mensajes WHERE id=?");
        
        mysqli_stmt_bind_param($stmt, "i", $id);
        
        mysqli_stmt_execute($stmt);
        
        $result = mysqli_stmt_get_result($stmt);
        
        if ($fila = mysqli_fetch_array($result)) {
            $mensaje = $fila;
        }
        
        AccesoBD::desconectar($bbdd);
        
        return $mensaje;
    }
}


?>
