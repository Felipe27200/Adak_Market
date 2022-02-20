function validarInventario() {
	var id_inv, stock, entrada, salida, expresion;

	id_inv = document.getElementById("id_inv").value;
	stock = document.getElementById("stock").value;
	entrada = document.getElementById("entrada").value;
	salida = document.getElementById("salida").value;

	expresion = /\w+@\w+\.+[a-z]/;

	if (id_inv === "" || stock === "" || entrada === "" || salida === ""){
		alert("El campo está vacío");
		return false;
	}

	else {
		swal({
		  title: "Desea guardar?",
		  text:"",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		    swal("Se ha registrado satisfactoriamente!", {
		      icon: "success",
		    });
		  } else {
		    swal("No se hizo el registro!");
		    document.getElementById("modificarEmpleado").reset();
		  }
		});
		return false;
	}
}

