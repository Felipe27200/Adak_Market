$("#btnEliminar").click(function(){
    swal({
      title: "Está seguro que quiere eliminar el empleado?",
      text: "Una vez eliminado no se podrá recuperar la información",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        swal("Empleado Eliminado!!!", {
          icon: "success",
        });
      } else {
        swal("No se hicieron cambios");
      }
    });  
});


$("#Eliminar").click(function(){
    swal({
      title: "Está seguro que quiere eliminar el producto?",
      text: "Una vez eliminado no se podrá recuperar la información",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        swal("Producto Eliminado!!!", {
          icon: "success",
        });
      } else {
        swal("No se hicieron cambios");
      }
    });  
});

$("#eliminarAgenda").click(function(){
    swal({
      title: "Está seguro que quiere eliminar la agenda del empleado?",
      text: "Una vez eliminado no se podrá recuperar la información",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        swal("Agenda Eliminada!!!", {
          icon: "success",
        });
      } else {
        swal("No se hicieron cambios");
      }
    });  
});

$("#eliminarContrato").click(function(){
    swal({
      title: "Está seguro que quiere eliminar el contrato del empleado?",
      text: "Una vez eliminado no se podrá recuperar la información",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        swal("Contrato Eliminado!!!", {
          icon: "success",
        });
      } else {
        swal("No se hicieron cambios");
      }
    });  
});