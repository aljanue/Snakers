<?php 
    require_once('../AdminApp.php');
    require_once('../model/AccesoBD.php');
    
    session_start();

    if (isset($_SESSION['usuario'])) {
        $marca;
        $genero;
        if($_POST['marca']==='ADIDAS')
        {
            $marca=1;
        }else if($_POST['marca']==='NIKE')
        {
            $marca=2;
        }else
        {
            $marca=3;
        }
        
        if($_POST['genero']==='HOMBRE')
        {
            $genero=1;
        
        }else
        {
            $genero=2;
        }
        if($_POST['codigo']==0){
            if (AccesoBD::insertarProducto($_POST['descripcion'],$_POST['precio'], $_POST['existencias'], $_POST['imagen'], $_POST['talla'], $_POST['color'], $marca, $genero)) {
                
                
            }
        }
        else{
            if (AccesoBD::modificarProducto($_POST['codigo'],$_POST['descripcion'],$_POST['precio'], $_POST['existencias'], $_POST['imagen'], $_POST['talla'], $_POST['color'], $marca, $genero)) {

                $_REQUEST['msg']='Producto modificado con éxito ('.$_POST['descripcion'].')';
                
            }
        }
        include_once '../control/ListarProductos.php';
           
    
    } else {
        include_once '../view/LoginForm.php';
    }
         
?>