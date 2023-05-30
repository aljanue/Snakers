<?php 

    require_once('../AdminApp.php');
    require_once('../model/AccesoBD.php');

    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }

	if (isset($_SESSION['usuario'])) {
	    $pedidos = AccesoBD::obtenerListadoPedidos();
	    if (!empty($pedidos)){
    	        foreach($pedidos as $pedido){
    	        $detalle=AccesoBD::obtenerDetallePedido($pedido['codigo']);
	       }
	       $_REQUEST['listado-productos']=$detalle;
	    }
	    
	    
	    $_REQUEST['listado-pedidos']=$pedidos;
    
    	include_once '../view/ListadoPedidos.php';
	} else {
    	header("Location: Login.php");
	}
      
?>