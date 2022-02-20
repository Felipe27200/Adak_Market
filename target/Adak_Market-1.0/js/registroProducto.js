function validarProducto() {
	var nombreP, codigo, precio, expresion;

	nombreP = document.getElementById("nombrep").value;
	codigo = document.getElementById("codigo").value;
	precio = document.getElementById("precio").value;


	expresion = /\w+@\w+\.+[a-z]/;

	if (nombreP === "" || codigo === "" || precio=== ""){
		alert("El campo está vacío");
		return false;
	}

	else {
		swal({
		  title: "Desea guardar este producto?",
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