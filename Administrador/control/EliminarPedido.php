<?php 

    require_once('../AdminApp.php');
    require_once('../model/AccesoBD.php');

	session_start();

	if (isset($_SESSION['usuario'])) {
	    $codigoPedido = $_GET['cod']; 
	    AccesoBD::borrarPedido($codigoPedido);
    	include_once '../control/ListarPedidos.php';
	} else {
    	header("Location: Login.php");
	}
      
?>