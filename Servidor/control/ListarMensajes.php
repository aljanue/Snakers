<?php 

    require_once('../AdminApp.php');
    require_once('../model/AccesoBD.php');
    
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }

	if (isset($_SESSION['usuario'])) {
    
	    $mensajes = AccesoBD::obtenerListadoMensajes();
	    
        $_REQUEST['listado-mensajes']=$mensajes;
    	
    	include_once '../view/ListadoMensajes.php';
	} else {
    	header("Location: Login.php");
	}
      
?>