<?php 
    require_once('../AdminApp.php');
    require_once('../model/AccesoBD.php');
    
    session_start();

    if (isset($_SESSION['usuario'])) {
        if(!empty($_POST['producto'])){
            $pedidos = AccesoBD::obtenerListadoPedidosPorProducto($_POST['producto']);
            
            if (!empty($pedidos)){
                $detalle=[];
                foreach($pedidos as $pedido){
                    $detalle=AccesoBD::obtenerDetallePedido($pedido['codigo']);
                }
                $_REQUEST['listado-productos']=$detalle;
            }
            $_REQUEST['listado-pedidos']=$pedidos;
            include_once '../view/ListadoPedidos.php';
        }
        else{
            $productos = AccesoBD::obtenerListadoProductos();
            
            $detalle = AccesoBD::obtenerDetallePedidoTablaEntera();
            $_REQUEST['listado-productos']=$productos;
            $_REQUEST['listado-detalle']=$detalle;
            include_once '../Control/ListarPedidos.php';
        }
        
            
       
    
    } else {
        include_once '../view/LoginForm.php';
    }
         
?>