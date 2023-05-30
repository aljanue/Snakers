<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Detalles del mensaje nº<?php echo $_REQUEST['mensaje']['id']?></title>
    </head>

	<body>
	<?php  $mensaje = $_REQUEST['mensaje'];
	?>
		<div class="container-fluid h-100">
	
		<div class="login-box">
		<p>MENSAJE nº <?php echo $mensaje['id']?></p>
			<div class="user-box">
				<label for="asunto">Asunto</label>
				<input name="asunto" id="asunto" type="text" value="<?php echo $mensaje['asunto']?>" disabled>
			</div>
		</div>
		<div class = "px-5">
			<div class="user-box">
				<label class="pb-2 ps-4 fw-bold" for="mensaje">Descripci&oacute;n</label>
				<textarea class="txt-area rounded-4 p-4" name="mensaje" id="mensaje" placeholder="<?php echo $mensaje['mensaje']?>" disabled></textarea>
				<button onclick="Cargar('<?php AdminApp::app_dir()?>/control/ListarMensajes.php', 'cuerpo')"
					class="btn btn-dark negrita btn-frm mt-4 mb-5 mx-4">Volver a mensajes</button>
			</div>
			
		</div>
	</div>
</body>
</html>