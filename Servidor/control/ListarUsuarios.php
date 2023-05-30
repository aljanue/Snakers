<?php 

    require_once('../AdminApp.php');
    require_once('../model/AccesoBD.php');
    
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }

	if (isset($_SESSION['usuario'])) {
    
    	$usuarios = AccesoBD::obtenerListadoUsuarios();
        $pedidos = AccesoBD::obtenerListadoPedidos();
        if(isset ($pedidos)){
            $_REQUEST['listado-pedidos']=$pedidos;
        }
    	$_REQUEST['listado-usuarios']=$usuarios;
    	
    	include_once '../view/ListadoUsuarios.php';
	} else {
    	header("Location: Login.php");
	}
      
?>