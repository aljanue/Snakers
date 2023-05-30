<?php 

    require_once('../AdminApp.php');
    require_once('../model/AccesoBD.php');

    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }

	if (isset($_SESSION['usuario'])) {
    
	    $productos = AccesoBD::obtenerListadoProductos();
	    $mensaje='';
        $detalle = AccesoBD::obtenerDetallePedidoTablaEntera();
        if(isset( $_REQUEST['msg'])){
            $mensaje=$_REQUEST['msg'];
        }
        $_REQUEST['mensaje']=$mensaje;
	    $_REQUEST['listado-productos']=$productos;
	    $_REQUEST['listado-detalle']=$detalle;
    
    	include_once '../view/ListadoProductos.php';
	} else {
    	header("Location: Login.php");
	}
      
?>