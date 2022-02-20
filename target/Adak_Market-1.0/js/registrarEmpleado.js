function validarEmpleado() {
    var nombre, apellidos, correo, telefono, identificacion, edad, expresion;

    nombre = document.getElementById("nombres").value;
    apellidos = document.getElementById("apellidos").value;
    correo = document.getElementById("correo").value;
    telefono = document.getElementById("telefono").value;
    identificacion = document.getElementById("documento").value;
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
            alert("El correo no es válido");
            return false;
    }
    else if (identificacion.length > 16) {
            alert("El No. de identificación debe tener máximo 16 digitos");
            return false;
    }
    else if (telefono.length !== 10) {
            alert ("El teléfono debe tener 10 cifras");
            return false;
    }
    else if (isNaN(telefono)) {
            alert("El télefono ingresado no es un número");
            return false;
    }
    else {
            swal("Empleado Registrado!", "Los datos se han guardado", "success");
            return true;
    }
}

function validarContrato() {
	var nombreEmpleador, nombreEmpleado, direccionEstablecimiento, ciudadEstablecimiento;
	var duracionContrato, expresion;

	expresion = /^[a-zA-ZÀ-ÿ\s]{1,40}$/;

	nombreEmpleador = document.getElementById("nombreEmpleador").value;
	nombreEmpleado = document.getElementById("nombreEmpleado").value;
	direccionEstablecimiento = document.getElementById("direccionEstablecimiento").value;
	ciudadEstablecimiento = document.getElementById("ciudadEstablecimiento").value;
	duracionContrato = document.getElementById("duracionContrato").value;

	if (!expresion.test(nombreEmpleador)) {
		alert("Los caracteres del nombre del empleador no son válidos");
		return false;
	}
	else if (!expresion.test(nombreEmpleado)) {
		alert("Los caracteres del nombre del empleado no son válidos");
		return false;
	}
	else if (direccionEstablecimiento.length > 30) {
		alert("la dirección es demasiado larga");
		return false;
	}
	else if (ciudadEstablecimiento.length > 30) {
		alert("El nombre de la ciudad es demasiado largo");
		return false;		
	}
	else if (duracionContrato < 0) {
		alert("Los meses no pueden ser negativos");
		return false;
	}
	else {
		swal("Contrato del Empleado Registrado!", "Los datos se han guardado", "success");
		return true;
	}

}

