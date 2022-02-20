var diasTrabajo = document.getElementById('dias').getContext('2d');

var horasTrabajadas = {
  label: 'Horas trabajadas por día',
  data: [8,6.9,8,7.5,8, 0],
  backgroundColor: 'rgba(0, 99, 132, 0.6)'
};
 
var barChart = new Chart(diasTrabajo , {
  type: 'bar',
  data: {
    labels: ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes",],
    datasets: [horasTrabajadas]
  }
});

var novedades = document.getElementById('novedades').getContext('2d');

var tipoNovedad = {
  label: 'Novedades del Empleado',
  data: [2,5,10,0,],
    backgroundColor:[
        '#9AE19D',
        '#A1C6EA',
        '#FAA916'
    ]
};
 
var barChart = new Chart(novedades, {
  type: 'bar',
  data: {
    labels: ["Ausencias", "Permisos", "Retrasos"],
    datasets: [tipoNovedad]
  }
});