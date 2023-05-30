<?php 

    require_once('../AdminApp.php');
    require_once('../model/AccesoBD.php');

	session_start();

	if (isset($_SESSION['usuario'])) {
	    $codigoPedido = $_GET['cod'];
	    
	    $estadoPedido = $_GET['state'];
	    AccesoBD::modificarEstadoPedido($codigoPedido, $estadoPedido);
	    
    	include_once '../control/ListarPedidos.php';
	} else {
    	header("Location: Login.php");
	}
      
?>