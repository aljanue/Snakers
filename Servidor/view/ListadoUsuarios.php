<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Listado usuarios</title>
    </head>
	<body>
<div class="container-fluid">
		<div class="row text-center py-3">
			<h1>USUARIOS</h1>
		</div>
		
		<div class="row px-4 table-responsive">
			<!-- tabla con los usuarios -->
			<table class="table">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">USUARIO</th>
						<th scope="col">ACTIVO</th>
						<th scope="col">ADMIN</th>
						<th scope="col">CLAVE</th>
						<th scope="col">NOMBRE</th>
						<th scope="col">TELEFONO</th>
						<th scope="col">ACCIONES</th>
						<th scope="col"></th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
	<?php

    $usuarios = $_REQUEST['listado-usuarios'];
    $pedidos = $_REQUEST['listado-pedidos'];
    foreach ($usuarios as $usuario) { 
    ?>
        <tr>
            <td><?php echo $usuario['codigo'] ?></td>
            <td><?php echo $usuario['usuario'] ?></td>
            <td><?php 
                    if ($usuario['activo']==1) { ?>
                	SI
                <?php } else if($usuario['activo']==0){ ?>    
                	NO
                <?php } ?>    
            </td>
            <td><?php 
                    if ($usuario['admin']==1) { ?>
                		SI
                <?php } else if($usuario['admin']==0) { ?>    
                		NO
                <?php } ?>    
            </td>
            <td><?php echo $usuario['clave'] ?></td>
            <td><?php echo $usuario['nombre'] ?></td>
            <td><?php echo $usuario['telefono'] ?></td>
            <?php if($usuario['activo']==1) {?>
							<td><button class="btn btn-secondary" type="button" onclick="Cargar('<?php AdminApp::app_dir()?>/control/ActivarDesactivarUsuario.php?cod=<?php echo $usuario['codigo'] ?>&state=0', 'cuerpo')">Desactivar</button>
						<?php } else { ?>
							<td><button type="button" class="btn btn-secondary" onclick="Cargar('<?php AdminApp::app_dir()?>/control/ActivarDesactivarUsuario.php?cod=<?php echo $usuario['codigo'] ?>&state=1', 'cuerpo')" >Activar</button></td>						
						<?php }?>
			<td><button type="button" class="btn btn-dark" onclick="Cargar('<?php AdminApp::app_dir()?>/control/ObtenerDatosUsuario.php?cod=<?php echo $usuario['codigo'] ?>', 'cuerpo')">Modificar</button></td>
			<td><?php
			$p = null;
			foreach ($pedidos as $pedido) {
			    if ($pedido['persona'] == $usuario['codigo']) {
			        $p = 1;
			    }
			}
			if ($p === null) {
            ?>
			<button type="button" class="btn btn-danger" onclick="Cargar('<?php AdminApp::app_dir()?>/control/EliminarUsuario.php?cod=<?php echo $usuario['codigo'] ?>', 'cuerpo')">Eliminar</button>	
			<?php }?>
			</td>
        </tr>
	<?php
        }
    ?>      
    </tbody>
    
</table></div></div>
</body>
</html>

