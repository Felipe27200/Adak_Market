var ctx = document.getElementById('graf_1').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'line',

    // The data for our dataset
    data: {
        labels: ['Diciembre', 'Enero', 'Febrero', 'Marzo'],
        datasets: [{
            label: "Empleados contratados",
            lineTension: 0,
            backgroundColor: 'transparent',
            borderColor: '#3E8914',
            data: [3,5,4,2, 0]
        }]
    },

    // Configuration options go here
    options: {}
});

var contratoCircular = document.getElementById('graf_2').getContext('2d');
var chart = new Chart(contratoCircular, {
    // The type of chart we want to create
    type: 'pie',

    // The data for our dataset
    data: {
    labels: [
        "Definido",
        "Indefinido"
    ],
    datasets: [
        {
            data: [27, 73],
            backgroundColor: [
                "#0094C6",
                "#96E072"
            ]
        }]
    },

    options: {}
});