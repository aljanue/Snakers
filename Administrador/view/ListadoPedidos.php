<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Listado pedidos</title>
    </head>
<?php 
$pedidos = $_REQUEST['listado-pedidos'];
if(!empty($pedidos)){
    $productos = $_REQUEST['listado-productos'];
}

?>
	<body>
    <div class="container-fluid">
		<div class="row justify-content-center text-center py-3">
			<h1>PEDIDOS</h1>
		</div>
	<div class="row">
		<div class = "col-md-3 col-sm-12 px-3 my-2">
			<form class = "d-flex" action="#" onsubmit="ProcesarForm(this, '<?php AdminApp::app_dir()?>/control/BuscarUsuario.php', 'cuerpo');return false">
                <input class="form-control mr-sm-2 form-control-lg" type="text" name="username" id="username"
                    placeholder='Usuarios' aria-label="Filtro" list="usuarios"
                    autocomplete="off" 
                    value="">
                <button class="btn btn-dark my-2 my-sm-0" type="submit">Filtrar</button>

                <datalist id="usuarios" autocomplete="off">
                <?php foreach($pedidos as $pedido){ ?>
                	<option>
                       <?php echo $pedido['usuario']?>
                    </option>
                <?php }?>
                
                </datalist>
		</form></div>
		
		<div class = "col-md-4 col-sm-12 px-3 my-2">
			<form class = "d-flex" action="#" onsubmit="ProcesarForm(this, '<?php AdminApp::app_dir()?>/control/BuscarProducto.php', 'cuerpo');return false">
                <input class="form-control mr-sm-2 form-control-lg" type="text" name="producto" id="producto"
                    placeholder='Productos' aria-label="Filtro" list="productos"
                    autocomplete="off" 
                    value="">
                <button class="btn btn-dark my-2 my-sm-0" type="submit">Filtrar</button>

                <datalist id="productos" autocomplete="off">
                <?php foreach($productos as $producto){ ?>
                	<option>
                       <?php echo $producto['descripcion']?>
                    </option>
                <?php }?>
                </datalist>
		</form></div>
		<div class = "col-md-3 col-sm-12 px-3 my-2">
			<form class = "d-flex" action="#" onsubmit="ProcesarForm(this, '<?php AdminApp::app_dir()?>/control/BuscarFecha.php', 'cuerpo');return false">
                <input class="form-control mr-sm-2 form-control-lg" type="date" name="fecha" id="fecha"
                    placeholder='Productos' aria-label="Filtro" list="fechas"
                    autocomplete="off" 
                    value="">
                <button class="btn btn-dark my-2 my-sm-0" type="submit">Filtrar</button>

                <datalist id="fechas" autocomplete="off">
                <?php foreach($pedidos as $pedido){ ?>
                	<option>
                       <?php echo $pedido['fecha']?>
                    </option>
                <?php }?>
                </datalist>
		</form></div>
	
    	<div class = "col-md-2 col-sm-12 px-3 my-2">
        	<div>
        		<button class="btn btn-outline-dark btn-lg my-2 my-sm-0" type="button" onclick = "Cargar('<?php AdminApp::app_dir()?>/control/ListarPedidos.php', 'cuerpo')">Limpiar filtros</button>
        	</div>
        </div>
	</div>
		
		<div class="row px-4 table-responsive">
			<!-- tabla con los usuarios -->
			<table class="table">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">USUARIO</th>
						<th scope="col">FECHA</th>
						<th scope="col">IMPORTE</th>
						<th scope="col">DIRECCION</th>
						<th scope="col">ESTADO</th>
						<th scope="col">DETALLES</th>
						<th scope="col">ACCION</th>
						<th scope="col"></th>
						<th scope="col"></th>
						
					</tr>
				</thead>
    <tbody>
        
    <?php

    
    
    foreach ($pedidos as $pedido) { 
    ?>
        <tr>
            <td><?php echo $pedido['codigo'] ?></td>
            <td><?php echo $pedido['usuario'] ?></td>
            <td><?php echo $pedido['fecha'] ?></td>
            <td><?php echo $pedido['importe'] ?></td>
            <td><?php echo $pedido['direccion'] ?></td>
            <td><?php 
                    if ($pedido['estado']==1) { ?>
                	PROCESADO
                <?php } else if($pedido['estado']==2){ ?>    
                	ENVIADO
                 <?php } else if($pedido['estado']==3){ ?>  
                 	<span class="text-muted">ENTREGADO</span>  
                <?php }else{ ?> 
                	<span class="text-danger">CANCELADO</span>
                <?php }?>   
            </td>
            <td>
            	<button type="button" class="btn btn-dark" onclick="Cargar('<?php AdminApp::app_dir()?>/control/VerDetalle.php?cod=<?php echo $pedido['codigo'] ?>', 'cuerpo')">Ver</button>	
			</td>
			<td>
            <?php 
                    if ($pedido['estado']==1) { ?>
                	<button type="button" class="btn btn-secondary" onclick="Cargar('<?php AdminApp::app_dir()?>/control/ModificarEstadoPedido.php?cod=<?php echo $pedido['codigo'] ?>&state=2', 'cuerpo')">Enviar</button>	
                <?php } else if($pedido['estado']==2){ ?>    
                	<button type="button" class="btn btn-secondary" onclick="Cargar('<?php AdminApp::app_dir()?>/control/ModificarEstadoPedido.php?cod=<?php echo $pedido['codigo'] ?>&state=3', 'cuerpo')">Entregar</button>	
                <?php }else if ($pedido['estado']==4) { ?>
             	<button type="button" class="btn btn-danger" onclick="Cargar('<?php AdminApp::app_dir()?>/control/EliminarPedido.php?cod=<?php echo $pedido['codigo'] ?>', 'cuerpo')">Eliminar</button>	
             <?php }?> 
             </td>
             <td><?php 
             if ($pedido['estado']==1) { ?>
             	<button type="button" class="btn btn-danger" onclick="Cargar('<?php AdminApp::app_dir()?>/control/CancelarPedido.php?cod=<?php echo $pedido['codigo'] ?>', 'cuerpo')">Cancelar</button>	
             <?php } ?>
             </td>
        </tr>
	<?php
        }
    ?>      
    </tbody>
    
</table>
</div></div>
</body>
</html>