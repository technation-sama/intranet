function ChartData (data) {
Highcharts.chart('container_graph', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Employee of the month, Last month for top 5 Nominees'
    },
    subtitle: {
        text: ''
    },
    xAxis: {
        type: 'category',
        labels: {
          rotation: -45,          
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Votes (hundreds)',
            align: 'high'
        },
    },
    tooltip: {
        valueSuffix: ''
    },
    plotOptions: {
        bar: {
            dataLabels: {
                enabled: true
            }
        }
    },
    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'top',
        x: -40,
        y: 80,
        floating: true,
        borderWidth: 1,
        backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
        shadow: true
    },
    credits: {
        enabled: false
    },
    series: [{
        name: 'Votes',
        data: data
    }],
	colors: ['#000']
	

});
}
$(document).on ("turbolinks:load",function() {
 $.ajax({
    url: 'polls/chart',
    type: 'GET',
    async: true,
    dataType: "json",
    success: function (data) {
        ChartData(data);
    }
  });
 });

