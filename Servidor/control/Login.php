<?php 
    require_once('../AdminApp.php');
    require_once('../model/AccesoBD.php');
    
    session_start();

    if (isset($_SESSION['usuario'])) {
        include_once '../view/ZonaPrivada.php';
    } elseif (isset($_POST['p_usuario']) && isset($_POST['p_clave'])) {
        
        if (AccesoBD::comprobarUsuarioAdmin($_POST['p_usuario'],$_POST['p_clave'])) {
       
            $_SESSION['usuario']=$_POST['p_usuario'];
            include_once '../view/ZonaPrivada.php';
            
        } else {
            $_REQUEST['msg']='Usuario no autorizado y/o datos incorrectos';
            $_REQUEST['a_usuario']=$_POST['p_usuario'];
            include_once '../view/LoginForm.php';
        }
    
    } else {
        include_once '../view/LoginForm.php';
    }
         
?>