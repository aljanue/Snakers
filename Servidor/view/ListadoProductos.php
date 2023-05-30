<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Listado productos</title>
    </head>
	<body>
    <div class="container-fluid">
		<div class="row justify-content-center text-center py-3">
			<h1>PRODUCTOS</h1>
		</div>
		
		<div class="d-flex px-40 pt-3 justify-content-end">
				<button onclick="Cargar('<?php AdminApp::app_dir()?>/control/ObtenerFormularioProducto.php', 'cuerpo')"
					type="button" class="btn btn-secondary mb-8 ">Agregar producto</button>
			</div>
			<?php if($_REQUEST['mensaje']!=''){?>
			<div class="row justify-content-center text-center py-3">
			     <h4 class="text-secondary"><?php echo $_REQUEST['mensaje']?></h4>
		      </div>
			<?php }?>
			
		<div class="row px-4 table-responsive">
			<!-- tabla con los usuarios -->
			<table class="table">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">NOMBRE</th>
						<th scope="col">PRECIO</th>
						<th scope="col">TALLA</th>
						<th scope="col">STOCK</th>
						<th scope="col">GENERO</th>
						<th scope="col">MARCA</th>
						<th scope="col">COLOR</th>
						<th scope="col">IMAGEN</th>
						<th scope="col">ACCION</th>
						<th scope="col"></th>
					</tr>
				</thead>
    <tbody>
        
    <?php

    $productos = $_REQUEST['listado-productos'];
    $detalles = $_REQUEST['listado-detalle'];
    foreach ($productos as $producto) { 
    ?>
        <tr>
            <td><?php echo $producto['codigo'] ?></td>
            <td><?php echo $producto['descripcion'] ?></td>
            <td><?php echo $producto['precio'] ?></td>
            <td><?php echo $producto['talla'] ?></td>
            <td><?php echo $producto['existencias'] ?></td>
            <td><?php 
                    if ($producto['genero']==1) { ?>
                	HOMBRE
                <?php } else { ?>    
                	MUJER
                <?php } ?>    
            </td>
            <td><?php 
                    if ($producto['marca']==1) { ?>
                	ADIDAS
                <?php } else if($producto['marca']==2){ ?>    
                	NIKE
                <?php }else{ ?> 
                PUMA
                <?php }?>   
            </td>
            <td><?php echo $producto['color'] ?></td>
            <td><?php echo $producto['imagen'] ?></td>
            <td><a href="#"
				onclick="Cargar('<?php AdminApp::app_dir()?>/control/ObtenerFormularioProducto.php?cod=<?php echo $producto['codigo']?>' , 'cuerpo')"
				class="btn btn-dark" tabindex="-1" role="button">Modificar</a></td>
            <td>
            <?php
			$p = null;
			foreach ($detalles as $detalle) {
			    if ($detalle['codigo_producto'] == $producto['codigo']) {
			        $p = 1;
			    }
			}
			if ($p === null) {
            ?>
			<button type="button" class="btn btn-danger" onclick="Cargar('<?php AdminApp::app_dir()?>/control/EliminarProducto.php?cod=<?php echo $producto['codigo'] ?>', 'cuerpo')">Eliminar</button>	
			<?php }?></td>
            
        </tr>
	<?php
        }
    ?>      
    </tbody>
    
</table>
</div></div>
</body>
</html>