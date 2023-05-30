<!DOCTYPE html>
<html lang="es">
    <head>
    
        <title>Zona Administraci&oacute;n</title>
        <link rel="icon" type="image/ico" href="<?php AdminApp::app_dir()?>/images/Marca/FABICON.ico"
	sizes="64x64">
        <script src="<?php AdminApp::app_dir()?>/js/libCapas2223.js"></script>
		<link rel="stylesheet" href="<?php AdminApp::app_dir()?>/css/login.css" type="text/css">
		<link rel="stylesheet" href="<?php AdminApp::app_dir()?>/css/styles.css" type="text/css">
		<link
        	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
        	rel="stylesheet"
        	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
        	crossorigin="anonymous">
	</head>
    <body>
    <?php
        if (isset($_REQUEST['a_usuario'])) {
            $a_usuario = $_REQUEST['a_usuario'];
        } else {
             $a_usuario = '';
        }   
        ?>
    	<div class="container-fluid">
		<div class="login-2">
		
			<div class="login-box">
				<p>Iniciar sesi&oacute;n</p>
				<form name="" method="POST" action="<?php AdminApp::app_dir()?>/control/Login.php" autocomplete="off">
					<div class="user-box">
						<label for=name>Nombre de usuario</label>
						<input name="p_usuario" id="p_usuario" type="text" value="<?php echo $a_usuario ?>" required> 
					</div>
					<div class="user-box">
						<label
							for="pas">Contrase&ntilde;a</label>
						<input name="p_clave" id="p_clave" type="password" required> 
					</div>
					 <?php 
                        if (isset($_REQUEST['msg'])) {
                     ?>
						<p class = "text-danger"><?php echo $_REQUEST['msg']?></p>
					<?php }?>

					<button class="btn btn-light negrita" type="submit">Iniciar
						sesi&oacute;n</button>

				</form>
				
			</div>
		</div>
	</div>
</body>
</html>