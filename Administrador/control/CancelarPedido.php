<?php 

    require_once('../AdminApp.php');
    require_once('../model/AccesoBD.php');

	session_start();

	if (isset($_SESSION['usuario'])) {
	    $codigoPedido = $_GET['cod'];
	    AccesoBD::cancelarPedido($codigoPedido);
	    $detalles=AccesoBD::obtenerDetallePedido($codigoPedido);
	    foreach($detalles as $detalle){
	        AccesoBD::devolverStock($detalle['codigo_producto'], $detalle['unidades']+$detalle['existencias']);
	    }
	    
    	include_once '../control/ListarPedidos.php';
	} else {
    	header("Location: Login.php");
	}
      
?>