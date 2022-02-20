$("#btnEliminar_2").click(function(){
    swal({
      title: "Desea Eliminar este Proveedor?",
      text: "Cuando se elimine este Proveedor este ya no se volvera a recuperar!",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        swal("El Proveedor se elimino con exito!", {
          icon: "success",
        });
      } else {
        swal("no se haran los cambios!");
      }
    });  

 }); 

$("#btnEliminar1").click(function(){
    swal({
      title: "Desea Eliminar este Proveedor?",
      text: "Cuando se elimine este Proveedor este ya no se volvera a recuperar!",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        swal("El Proveedor se elimino con exito!", {
          icon: "success",
        });
      } else {
        swal("no se haran los cambios!");
      }
    });  

 }); 


$("#btnregistrarProveedor").click(function(){
    swal({
      title: "Desea guardar este proveedor?",
      
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        swal("El Proveedor se guardo  con exito!", {
          icon: "success",
        });
      } else {
        swal("No se hizo el registro!");
      }
    });  

 }); 
$("#btnregistrarPedido").click(function(){
    swal({
      title: "Desea guardar este pedido?",
      
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        swal("El Pedido se guardo  con exito!", {
          icon: "success",
        });
      } else {
        swal("No se hizo el registro!");
      }
    });  

 }); 
