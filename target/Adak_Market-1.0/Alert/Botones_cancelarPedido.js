$("#btnCancelar").click(function(){
    swal({
      title: "Desea Cancelar este Pedido?",
      text: "Cuando se elimine este Pedido este ya no se volvera a recuperar!",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        swal("El Pedido se cancelo con exito!", {
          icon: "success",
        });
      } else {
        swal("no se hizo el cambio!");
      }
    });  

 }); 

