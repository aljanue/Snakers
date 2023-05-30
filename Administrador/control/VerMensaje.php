<?php 

    require_once('../AdminApp.php');
    require_once('../model/AccesoBD.php');

	session_start();

	if (isset($_SESSION['usuario'])) {
	    $codigo = $_GET['cod'];
	    $mensaje = AccesoBD::obtenerMensajeID($codigo);
	    
	    $_REQUEST['mensaje']=$mensaje;
    	include_once '../view/DetalleMensaje.php';
	} else {
    	header("Location: Login.php");
	}
      
?>