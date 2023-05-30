/**
 * 
 */

var carrito = []; // Array que contendrá los objetos.

function addCarrito(id, desc, talla, precio, img, color, genero, marca){
  let band = false;
  carrito = JSON.parse(localStorage.getItem('carrito')) || [];
  if (carrito.length === 0) {
    let producto = new Object();
    producto.codigo = id;
    producto.descripcion = desc; 
    producto.talla = talla;
    producto.cantidad = 1; 
    producto.precio = precio;
    parseFloat(producto.precio);
    producto.imagen = img;
    producto.color = color;
    producto.genero = genero;
    producto.marca = marca;
    carrito.push(producto);
  } else {
    for (let i = 0; i < carrito.length; i++) {
      let prod = carrito[i];
      if (prod.codigo === id) {
        prod.cantidad = prod.cantidad + 1;
        band = true;
        break;
      }
    }
    if (!band) {
      let producto = new Object();
      producto.codigo = id;
      producto.descripcion = desc; 
      producto.talla = talla;
      producto.cantidad = 1; 
      producto.precio = precio;
      producto.imagen = img;
      producto.color = color;
      producto.genero = genero;
      producto.marca = marca;
      carrito.push(producto);
    }
  }
  localStorage.setItem('carrito', JSON.stringify(carrito));
}


function removeCarrito(id) {
  let carrito = JSON.parse(localStorage.getItem('carrito')) || [];
  carrito = carrito.filter(item => item.codigo !== id);
  localStorage.setItem('carrito', JSON.stringify(carrito));
  const divProductos = document.getElementById("productos");
  divProductos.innerHTML = ``
  mostrarCarrito();
}

function sumaCantidad(id) {
	for (let i = 0; i < carrito.length; i++) {
      if (carrito[i].codigo === id) {
        carrito[i].cantidad = carrito[i].cantidad + 1;
        break;
      }
    }
    localStorage.setItem('carrito', JSON.stringify(carrito));
    const divProductos = document.getElementById("productos");
    divProductos.innerHTML = ``
    mostrarCarrito();
}

function restaCantidad(id) {
	for (let i = 0; i < carrito.length; i++) {
      if (carrito[i].codigo === id) {
        carrito[i].cantidad = carrito[i].cantidad - 1;
        if(carrito[i].cantidad ===0){
			removeCarrito(id);
		}
        break;
      }
    }
    localStorage.setItem('carrito', JSON.stringify(carrito));
    const divProductos = document.getElementById("productos");
    divProductos.innerHTML = ``
    mostrarCarrito();
}
function mostrarCarrito() {
			// obtener el carrito almacenado en localStorage
			carrito = JSON.parse(localStorage.getItem("carrito")) || [];
			
			// obtener el div donde se mostrará el carrito
			const divProductos = document.getElementById("productos");
			
			const divCarrito= document.getElementById("carrito");
			
			if(carrito.length === 0){
				
				divCarrito.innerHTML = `
					<div class = "row text-center">
						<h1>TU CARRITO ESTÁ VACIO</h1>
					</div>
				`
			}
			
			else{
				let m;
				// recorrer los productos del carrito y mostrarlos en el div
				carrito.forEach(producto => {
					switch(producto.marca){
						case 1:
							m = "ADIDAS";
							break;
						case 2:
							m = "NIKE";
							break;
						case 3:
							m = "PUMA";	
							break;
					}
					let div = document.createElement("div");
					div.innerHTML= `
						
							<div class="card rounded-3 mb-4">
	          <div class="card-body p-4">
	            <div class="row d-flex justify-content-between align-items-center">
	              <div class="col-md-2 col-lg-2 col-xl-2">
	                <img
	                  src="${producto.imagen}"
	                  class="img-fluid rounded-3" alt="Cotton T-shirt">
	              </div>
	              <div class="col-md-5 col-lg-5 col-xl-5">
	                <p class="lead fw-normal mb-1">${producto.descripcion}\n</p>
	                <p class="text-muted">${m}</p>
	                <p><span class="text-muted">Talla: </span>${producto.talla} <span class="text-muted">Color: </span>${producto.color}</p>
	              </div>
	              <div class="col-md-1 col-lg-1 col-xl-1 d-flex">
	                <a class="text-muted" href="#" onclick="restaCantidad(${producto.codigo})"><i class="fa fa-minus fa-lg" aria-hidden="true"></i></a>
	                <h5 class = "px-lg-3 px-md-1 px-sm-4 text-center">${producto.cantidad}</h5>
	                <a class="text-muted" href="#" onclick="sumaCantidad(${producto.codigo})"><i class="fa fa-plus fa-lg" aria-hidden="true"></i></a>
	              </div>
	              <div class="col-md-2 col-lg-2 col-xl-2 offset-lg-1">
	                <h5 class="mb-0">${producto.precio*producto.cantidad} €</h5>
	              </div>
	              <div class="col-md-1 col-lg-1 col-xl-1 text-end">
	                <a href="#" onclick = "removeCarrito(${producto.codigo})"class="text-danger"><i class="fa fa-trash fa-lg" aria-hidden="true"></i></a>
	              </div>
	            </div>
	          </div>
	        </div>
						
					`;
					divProductos.appendChild(div);
				});
			}
		}
		
		function resetCarrito(){
  			carrito = JSON.parse(localStorage.getItem('carrito')) || [];
  			carrito.length =0;
  			localStorage.setItem('carrito', JSON.stringify(carrito));
		}
		
		function EnviarCarrito(url, capa)
		{
			var contenido = document.getElementById(capa);
			var conexion = nuevaConexion();
		
			conexion.open("POST", url,true);
			conexion.onreadystatechange=function()
			{ 
				if((conexion.readyState == 4) && (conexion.status == 200))
				{
					contenido.innerHTML = conexion.responseText;
					invokeScript(document.getElementById(capa));
				}
			} 
			conexion.setRequestHeader('Content-Type','application/json; charset=utf-8');
			conexion.send(JSON.stringify(carrito));
		}
		
		
