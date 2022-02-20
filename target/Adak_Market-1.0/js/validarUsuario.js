function validarCambios() {
	var nombre, apellidos, correo, telefono, identificacion, edad, expresion;

	nombre = document.getElementById("nombre").value;
	apellidos = document.getElementById("apellidos").value;
	correo = document.getElementById("correo").value;
	telefono = document.getElementById("telefono").value;
	identificacion = document.getElementById("identificacion").value;
	edad = document.getElementById("edad").value;

	expresion = /\w+@\w+\.+[a-z]/;

	if (nombre === "" || apellidos === "" || correo === ""){
		alert("El campo nombre está vacío");
		return false;
	}
	else if (nombre.length > 30) {
		alert("El nombre es muy largo");
		return false;
	}
	else if (apellidos.length > 30) {
		alert("Los apellidos son muy largos");
		return false;
	}
	else if (edad < 18 || edad > 75) {
		alert("La edad debe ser mayor a 18 y menor a 75");
		return false;
	}
	else if (!expresion.test(correo))
	{
		alert("El correo no es válido")
		return false;
	}
	else if (identificacion.length > 16) {
		alert("El No. de identificación debe tener 16 digitos");
		return false;
	}
	else if (telefono.length != 10) {
		alert ("El teléfono debe tener 10 cifras");
		return false;
	}
	else if (isNaN(telefono)) {
		alert("El télefono ingresado no es un número");
		return false;
	}
	else {
		swal({
		  title: "Desea guardar los cambios?",
		  text: "Perdera los datos anteriores",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		    swal("Cambios realizados satisfactoriamente!", {
		      icon: "success",
		    });
		  } else {
		    swal("No se realizaron cambios!");
		    document.getElementById("modificarEmpleado").reset();
		  }
		});
		return false;
	}
}

function cambiarContrasenia() {
	var newPassword, newPassword2;

	newPassword = document.getElementById("newPassword").value;
	newPassword2 = document.getElementById("newPassword2").value;

	if (newPassword == newPassword2) {
		swal("Contraseña Actualizada!", "Los datos se han guardado", "success");
		document.getElementById("nuevaContrasenia").reset();

		return false;
	}
	else{
		swal({
		title: "Las contraseñas no coinciden !!!",
		  icon: "error",
		});

		return false;
	}
}

function validarRegistro() {
	var nombre, apellidos, correo, telefono, identificacion, edad, expresion;

	nombre = document.getElementById("nombre").value;
	apellidos = document.getElementById("apellidos").value;
	correo = document.getElementById("correo").value;
	telefono = document.getElementById("telefono").value;
	identificacion = document.getElementById("identificacion").value;
	edad = document.getElementById("edad").value;

	expresion = /\w+@\w+\.+[a-z]/;

	if (nombre === "" || apellidos === "" || correo === ""){
		alert("El campo nombre está vacío");
		return false;
	}
	else if (nombre.length > 30) {
		alert("El nombre es muy largo");
		return false;
	}
	else if (apellidos.length > 30) {
		alert("Los apellidos son muy largos");
		return false;
	}
	else if (edad < 18 || edad > 75) {
		alert("La edad debe ser mayor a 18 y menor a 75");
		return false;
	}
	else if (!expresion.test(correo))
	{
		alert("El correo no es válido")
		return false;
	}
	else if (identificacion.length > 16) {
		alert("El No. de identificación debe tener 16 digitos");
		return false;
	}
	else if (telefono.length != 10) {
		alert ("El teléfono debe tener 10 cifras");
		return false;
	}
	else if (isNaN(telefono)) {
		alert("El télefono ingresado no es un número");
		return false;
	}
	else {
		swal({
		  title: "Usuario Registrado",
		  icon: "success",
		});

		return false;
	}
}