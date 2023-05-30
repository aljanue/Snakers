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
        <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
	</head>

<body onload="Cargar('<?php AdminApp::app_dir()?>/control/ListarUsuarios.php','cuerpo')">

	<header>
		<nav class="navbar navbar-dark navbar-expand-sm bg-dark">
			<div class="container-fluid ">
				<span class="navbar-brand mb-0 h1 ">ADMIN</span>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-sm-0">
						<li class="nav-item"><a class="nav-link " aria-current="page"
							href="#" onclick="Cargar('<?php AdminApp::app_dir()?>/control/ListarUsuarios.php', 'cuerpo')">Usuarios</a></li>
						<li class="nav-item"><a class="nav-link " href="#"
							onclick="Cargar('<?php AdminApp::app_dir()?>/control/ListarProductos.php', 'cuerpo')">Productos</a></li>
						<li class="nav-item "><a class="nav-link " href="#"
							onclick="Cargar('<?php AdminApp::app_dir()?>/control/ListarPedidos.php','cuerpo')">Pedidos</a></li>
						<li class="nav-item "><a class="nav-link " href="#"
							onclick="Cargar('<?php AdminApp::app_dir()?>/control/ListarMensajes.php','cuerpo')">Mensajes</a></li>
					</ul>
					<ul class="navbar-nav mb-2 mb-sm-0 ">
						<li class="nav-item "><a class="nav-link " href="<?php AdminApp::app_dir()?>/control/Logout.php">Cerrar sesi&oacute;n</a></li>
					</ul>

				</div>
			</div>
		</nav>
	</header>

	<div id="cuerpo" class="body"></div>
	
	<footer class="bg-dark fixed-bottom">
  <div class="container-fluid d-flex justify-content-center">
    <div class="row">
      <div class="col-12 text-light">
        <span class="text-white">&copy;2023 - SNAKERS</span>
      </div>
    </div>
  </div>
</footer>
</body>
</html>
