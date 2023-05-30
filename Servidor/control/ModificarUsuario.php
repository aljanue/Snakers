<?php 
    require_once('../AdminApp.php');
    require_once('../model/AccesoBD.php');
    
    session_start();

    if (isset($_SESSION['usuario'])) {
        if (preg_match('/^\d{9}$/', $_POST['tel'])) {
            AccesoBD::modificarUsuario($_POST['codigo'],$_POST['name'], $_POST['tel'], $_POST['dom']);
       
                include_once '../control/ListarUsuarios.php';
            
        } else {
            $_REQUEST['msg']='Número de teléfono no válido';
            $usuario = array(
                "codigo" => $_POST['codigo'],
                "usuario" => $_POST['username'],
                "nombre" => $_POST['name'],
                "telefono" => $_POST['tel'],
                "domicilio" => $_POST['dom']
            );
            $_REQUEST['usuario']=$usuario;
            
            include_once '../view/DatosUsuario.php';
        }
    
    } else {
        include_once '../view/LoginForm.php';
    }
         
?>