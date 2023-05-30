<?php 

    require_once('../AdminApp.php');
    require_once('../model/AccesoBD.php');

	session_start();

	if (isset($_SESSION['usuario'])) {
	    $codigoUsuario = $_GET['cod'];
	    $usuario = AccesoBD::obtenerUsuario($codigoUsuario);
	    $_REQUEST['usuario']=$usuario;
    	include_once '../view/DatosUsuario.php';
	} else {
    	header("Location: Login.php");
	}
      
?>