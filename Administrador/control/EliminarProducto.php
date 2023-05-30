<?php 

    require_once('../AdminApp.php');
    require_once('../model/AccesoBD.php');

	session_start();

	if (isset($_SESSION['usuario'])) {
	    $codigoProducto = $_GET['cod']; 
	    AccesoBD::borrarProducto($codigoProducto);
    	include_once '../control/ListarProductos.php';
	} else {
    	header("Location: Login.php");
	}
      
?>