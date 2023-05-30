<?php 

    require_once('../AdminApp.php');
    require_once('../model/AccesoBD.php');

	session_start();

	if (isset($_SESSION['usuario'])) {
	    if(isset($_GET['cod'])){
	        $producto=AccesoBD::obtenerProductoID($_GET['cod']);
	        $_REQUEST['producto']=$producto;
	    }
	    
    	include_once '../view/FormularioProducto.php';
	} else {
    	header("Location: Login.php");
	}
      
?>