<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Listado mensajes</title>
    </head>
	<body>
<div class="container-fluid">
		<div class="row text-center py-3">
			<h1>MENSAJES</h1>
		</div>
		
		<div class="row px-4 table-responsive">
			<!-- tabla con los usuarios -->
			<table class="table">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">USUARIO</th>
						<th scope="col">ASUNTO</th>
						<th scope="col">MENSAJES</th>
					</tr>
				</thead>
				<tbody>
	<?php

    $mensajes = $_REQUEST['listado-mensajes'];
    foreach ($mensajes as $mensaje) { 
    ?>
        <tr>
            <td><?php echo $mensaje['id'] ?></td>
            <td><?php echo $mensaje['usuario'] ?></td>
            
            <td><?php echo $mensaje['asunto'] ?></td>
            <td>
			<button type="button" class="btn btn-dark" onclick="Cargar('<?php AdminApp::app_dir()?>/control/VerMensaje.php?cod=<?php echo $mensaje['id'] ?>', 'cuerpo')">Ver mensaje</button>	
			
			</td>
        </tr>
	<?php
        }
    ?>      
    </tbody>
    
</table></div></div>
</body>
</html>

