var ctx = document.getElementById('graf_1').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'line',

    // The data for our dataset
    data: {
        labels: ['Proveedor 1', 'Proveedor 2', 'Proveedor 3', 'Proveeor 4', 'Proveedor 5', 'Proveedor 6', 'Proveedor 7','Proveedor 8','Proveedor 9','Proveedor 10','Proveedor 11','Proveedor 12','Proveedor 13','Proveedor 14','Proveedor 15','Proveedor 16','Proveedor 17','Proveedor 18','Proveedor 19',],
        datasets: [{
            label: 'Productos Entregados',
            backgroundColor: '#70e000',
            borderColor: '#70e000',
            data: [75, 100, 58, 29, 25, 30, 45,80,89,66,95,78,32,56,45,49,87,45,78,]
        }]
    },

    // Configuration options go here
    options: {}
});

var densityCanvas = document.getElementById("graf_2");

Chart.defaults.global.defaultFontFamily = "Lato";
Chart.defaults.global.defaultFontSize = 18;

var densityData = {
  label: 'Productos Entregados',
  data: [75, 100, 58, 29, 25, 30, 45,80,89,66,95,78,32,56,45,49,87,45,78,],
  backgroundColor: [
    'rgba(0, 99, 132, 0.6)',
    'rgba(30, 99, 132, 0.6)',
    'rgba(60, 99, 132, 0.6)',
    'rgba(90, 99, 132, 0.6)',
    'rgba(120, 99, 132, 0.6)',
    'rgba(150, 99, 132, 0.6)',
    'rgba(180, 99, 132, 0.6)',
    'rgba(210, 99, 132, 0.6)',
    'rgba(240, 99, 132, 0.6)'
  ],
  borderColor: [
    'rgba(0, 99, 132, 1)',
    'rgba(30, 99, 132, 1)',
    'rgba(60, 99, 132, 1)',
    'rgba(90, 99, 132, 1)',
    'rgba(120, 99, 132, 1)',
    'rgba(150, 99, 132, 1)',
    'rgba(180, 99, 132, 1)',
    'rgba(210, 99, 132, 1)',
    'rgba(240, 99, 132, 1)'
  ],
  borderWidth: 2,
  hoverBorderWidth: 0
};

var chartOptions = {
  scales: {
    yAxes: [{
      barPercentage: 0.5
    }]
  },
  elements: {
    rectangle: {
      borderSkipped: 'left',
    }
  }
};

var barChart = new Chart(densityCanvas, {
  type: 'horizontalBar',
  data: {
    labels: ['Proveedor 1', 'Proveedor 2', 'Proveedor 3', 'Proveeor 4', 'Proveedor 5', 'Proveedor 6', 'Proveedor 7','Proveedor 8','Proveedor 9','Proveedor 10','Proveedor 11','Proveedor 12','Proveedor 13','Proveedor 14','Proveedor 15','Proveedor 16','Proveedor 17','Proveedor 18','Proveedor 19',],
    datasets: [densityData],
  },
  options: chartOptions
});