<!DOCTYPE html>
<html lang="es">
    <head>
    <?php 
	if(!empty($_REQUEST['producto'])){
	    $producto=$_REQUEST['producto'];?>
	    	<title>Modificar producto nº<?php echo $producto['codigo']?></title>
	<?php }else{?>
			<title>Crear producto</title>
	<?php }?>
    </head>
	<body>
	
	<div class="h-100 h-custom bg-grey">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-8 col-xl-6">
					<div class="card border-top border-bottom border-3">
						<div class="card-body p-5">
							<form method="post" onsubmit="ProcesarForm(this,'<?php AdminApp::app_dir()?>/control/CrearModificarProducto.php','cuerpo');return false">
								<input type="hidden" name="codigo" value="<?php if(!empty($producto)){ echo ($producto['codigo']); } else{ echo ('0'); }?>"/>
								<p class="lead fw-bold mb-5"><?php if(!empty($producto)){ echo ('MODIFICAR PRODUCTO'); } else{ echo ('CREAR PRODUCTO'); }?></p>
								<div class="row mb-3 align-items-center">
									<div class="col-12">
										<div class="mb-3">
											<label for="formFileSm" class="form-label">Imagen del
												producto</label> <input name="imagen"class="form-control form-control-sm"
												id="formFileSm" type="text" value="<?php if(!empty($producto)){ echo ($producto['imagen']); } else{ echo ('./images/Producto/...'); }?>" required/>
										</div>
									</div>
								</div>


								<div class="row mb-3 ">
									<div class="col-8">
										<label for="model" class="col-form-label">Modelo de
											zapatilla</label> <input name = "descripcion"type="text" id="model" class="form-control" required
											value="<?php if(!empty($producto)){ echo ($producto['descripcion']); }?>"/>
									</div>
									<div class="col-4">
										<label for="ud" class="col-form-label">Unidades</label> <input name="existencias" required
											type="number" id="ud" class="form-control" value="<?php if(!empty($producto)){ echo ($producto['existencias']); }?>"/>
									</div>
								</div>


								<div class="row mb-5">
									<div class="col-3">
										<label for="size" class="col-form-label" >Talla</label> <input name = "talla" required
											type="number" id="size" class="form-control"  value="<?php if(!empty($producto)){ echo ($producto['talla']); }?>"/>
									</div>

									<div class="col-6">
										<label for="color" class="col-form-label">Color</label> <input name = "color" required
											type="text" id="color" class="form-control" value="<?php if(!empty($producto)){ echo ($producto['color']); }?>"/>
									</div>
									<div class="col-3">
										<label for="price" class="col-form-label">Precio (€)</label> <input name="precio" required
											type="number" id="price" class="form-control" value="<?php if(!empty($producto)){ echo ($producto['precio']); }?>" />
									</div>
								</div>
								<div class="row mb-5  align-items-center">
									<div class="col-6 mx-auto">
										<div class="dropdown">
											<select name="genero" id="genero" 
											class="form-select" aria-label="Genero">
											
												<option value="HOMBRE">HOMBRE</option>
												<option value="MUJER" <?php if(!empty($producto)){ if($producto['genero']===2){ ?>selected<?php }}?>>MUJER</option>
											</select>
									</div>
									</div>
									
									<div class="col-6 mx-auto">
										<div class="dropdown">
											<select name="marca" id="marca" 
											class="form-select" aria-label="Marca">
												<option value="ADIDAS">ADIDAS</option>
												<option value="NIKE" <?php if(!empty($producto)){ if($producto['marca']===2){ ?>selected<?php }}?>>NIKE</option>
												<option value="PUMA"<?php if(!empty($producto)){ if($producto['marca']===3){ ?>selected<?php }}?>>PUMA</option>
											</select>
									</div>
									</div>
								</div>



								<div class="row text-end mt-5">
									<div class="d-grid gap-2">
										<button
											type="submit" class="btn btn-dark">Finalizar</button>
									</div>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>