<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Datos de Usuario</title>
    </head>
	<body>
	<?php $usuario=$_REQUEST['usuario'];?>
	<div class="container-fluid vh-100">
		<div class="login-box">
			<p>Modificar datos de usuario <?php echo $usuario['codigo']?></p>   
    	
			<form  action="#" onsubmit="ProcesarForm(this, '<?php AdminApp::app_dir()?>/control/ModificarUsuario.php', 'cuerpo');return false">
				<input type="hidden" name="codigo" value="<?php echo $usuario['codigo']?>"/>
				<div class="user-box">
				 	<label for="username">Nombre de usuario (no edit)</label>
					<input name="username" id="username" type="text" value="<?php echo $usuario['usuario']?>" disabled 
					 required>
					<div class="valid-feedback">Correcto.</div>
                	<div class="invalid-feedback">Campo obligatorio.</div>
				</div>
				
				<div class="user-box">
					<label for="name">Nombre y apellidos</label>
					<input name="name" id="name" type="text" value="<?php echo $usuario['nombre']?>" required>
					<div class="valid-feedback">Correcto.</div>
                	<div class="invalid-feedback">Campo obligatorio.</div>
				</div>
				
				<div class="user-box">
					<label for="tel">N&uacute;mero de tel&eacute;fono</label>
					<input name="tel" id="tel" type="tel"  value="<?php echo $usuario['telefono']?>" required>
					<div class="valid-feedback">Correcto.</div>
                	<div class="invalid-feedback">Campo obligatorio.</div>
				</div>
				
				<div class="user-box">
					<label for="dom">Domicilio</label>
					<input name="dom" id="dom" type="text"  value="<?php echo $usuario['domicilio']?>"required>
					<div class="valid-feedback">Correcto.</div>
                	<div class="invalid-feedback">Campo obligatorio.</div>
				</div>
				
				<?php 
                        if (isset($_REQUEST['msg'])) {
                     ?>
						<p class = "text-danger"><?php echo $_REQUEST['msg']?></p>
					<?php }?>
				<button type="submit"
					class="btn btn-light negrita">Modificar</button>

			</form>

		</div>
	</div>

</body>
</html>