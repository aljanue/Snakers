<?php 

    require_once('../AdminApp.php');
    require_once('../model/AccesoBD.php');

	session_start();

	if (isset($_SESSION['usuario'])) {
	    $codigoPedido = $_GET['cod'];
	    $pedido = AccesoBD::obtenerPedidoID($codigoPedido);
	    $detalles=AccesoBD::obtenerDetallePedido($codigoPedido);
	    
	    $_REQUEST['listado-detalles']=$detalles;
	    $_REQUEST['pedido']=$pedido;
    	include_once '../view/DetallePedido.php';
	} else {
    	header("Location: Login.php");
	}
      
?>