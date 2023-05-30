/**
 * 
 */
function cargarPopup() {
  const toastTriggers = document.getElementsByName('liveToastBtn')
  const toastLiveExample = document.getElementById('liveToast')

  if (toastTriggers) {
    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample)
    toastTriggers.forEach(function(toastTrigger) {
      toastTrigger.addEventListener('click', function() {
        toastBootstrap.show()
      })
    })
  }
}

function menuConectado(){
			
			// obtener el div donde se mostrará el carrito
			const dropdown = document.getElementById("dropdown");
				
			dropdown.innerHTML = `
					<li><a class="dropdown-item" href="#"
						onclick="Cargar('modifica-datos.html', 'cuerpo')">Mis
						datos</a></li>
					<li><a class="dropdown-item" href="#"
						onclick="Cargar('pedidos-usuario.html', 'cuerpo')">Mis
						pedidos</a></li>
					<li><a class="dropdown-item" href="#"
						onclick="Cargar('mis-mensajes.html', 'cuerpo')">Mis
						mensajes</a></li>
					<li><hr class="dropdown-divider"></li>
					<li>
      					<form onsubmit="ProcesarForm(this, 'cerrar-sesion.html', 'cuerpo');return false">
        					<button class="dropdown-item" type="submit">Cerrar sesión</button>
      					</form>
    				</li>
				`
}
function menuDesconectado(){
			
			// obtener el div donde se mostrará el carrito
			const dropdown = document.getElementById("dropdown");
				
			dropdown.innerHTML = `
					<li><a class="dropdown-item" href="#"
										onclick="Cargar('login.html', 'cuerpo')">Iniciar
											sesi&oacute;n</a></li>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="#"
										onclick="Cargar('registro.html', 'cuerpo')">Registrarse
									</a></li>
				`
}