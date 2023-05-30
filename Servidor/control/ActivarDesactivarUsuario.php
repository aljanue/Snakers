<?php 

    require_once('../AdminApp.php');
    require_once('../model/AccesoBD.php');

	session_start();

	if (isset($_SESSION['usuario'])) {
	    $codigoUsuario = $_GET['cod'];
	    $estadoUsuario = $_GET['state'];
	    AccesoBD::modificarEstadoUsuario($codigoUsuario, $estadoUsuario);
    	include_once '../control/ListarUsuarios.php';
	} else {
    	header("Location: Login.php");
	}
      
?>