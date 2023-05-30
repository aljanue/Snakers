<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Detalles del pedido nº<?php echo $_REQUEST['pedido']['codigo']?></title>
    </head>
	<body>
	<?php  $pedido = $_REQUEST['pedido'];
	       $detalles = $_REQUEST['listado-detalles'];
	?>
		<div class="h-100 h-custom bck-gris">
		<div class = "cont">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-8 col-xl-6">
					<div class="card border-top border-bottom border-3">
						<div class="card-body p-5">

							<p class="lead fw-bold mb-5">Detalles del pedido</p>

							<div class="row">
								<div class="col mb-3">
									<p class="small text-muted mb-1">Fecha</p>
									<p><?php echo $pedido['fecha']?></p>
								</div>
								<div class="col mb-3">
									<p class="small text-muted mb-1">Codigo del pedido</p>
									<p><?php echo $pedido['codigo']?></p>
								</div>
							</div>
							<div class="row">
								
									<p class="small text-muted mb-1">Direcci&oacute;n de entrega:</p>
									<p><?php echo $pedido['direccion']?></p>
							</div>	

							<div class="mx-n5 px-3 py-4 bck-gris">
								<div>
								<?php foreach ($detalles as $detalle){?>
    								<div class="row">
    							
    									<div class="row d-flex align-items-center pe-0">
    									<div class="col-md-2 col-lg-2">
    										<img class="img-fluid" src=".<?php echo $detalle['imagen']?>" alt = "producto"></img>
    									</div>
    									<div class="col-md-6 col-lg-6">
    										<p class="m-0"><?php echo $detalle['descripcion']?></p>
    									</div>
    									<div class="col-md-1 col-lg-1">
    										<p class = "mb-0"><?php echo $detalle['unidades']?></p>
    									</div>
    									<div class="col-md-3 col-lg-3  pe-0">
    										<p class = "mb-0"><?php echo $detalle['unidades']* $detalle['precio'] ?> €</p>
    									</div>
    								</div>
    								</div>
								<?php } ?>
								
								
									
								</div>
								
							</div>
							<div class="row my-4 text-end">
								
									<p class="mb-0">Gastos de env&iacute;o: 5 €</p>
							</div>
							<div class="row my-4 text-end">
								<div>
									<p class="lead fw-bold mb-0"><?php echo $pedido['importe']?> €</p>
								</div>
							</div>

							<p class="lead fw-bold mb-4 pb-2 text-start">Estado del pedido</p>

							<div class="row">
								<div class="col-lg-12">
									<?php if($pedido['estado']===4){?>
									<p class="py-1 px-2 rounded text-danger ">Cancelado</p>
									<?php }else{ ?>
									
									<div class="horizontal-timeline">

										<ul class="list-inline items d-flex justify-content-between">
											<li class="list-inline-item items-list">
												<p class="py-1 px-2 rounded  ">Procesado</p>
											</li>
											<li class="list-inline-item items-list">
												<p class="py-1 px-2 rounded <?php if($pedido['estado']===1){?>text-muted opacity-50 <?php }?>" >Enviado</p>
											</li>
											<li class="list-inline-item items-list">
												<p class="py-1 px-2 rounded <?php if($pedido['estado']===1 ||$pedido['estado']===2){?>text-muted opacity-50 <?php }?> ">Entregado</p>
										</ul>

									</div>
									<?php }?>
								</div>
							</div>
							<div class="row">
							<div class="col-6 col-sm-8">
							<button onclick="Cargar('<?php AdminApp::app_dir()?>/control/ListarPedidos.php', 'cuerpo')"
					class="btn btn-dark negrita btn-frm mt-4 mb-5 mx-4">Volver a pedidos</button>
							</div></div>
							

						</div>
					</div>
				</div>
			</div>
		</div></div>
	</div>
	</body>
</html>