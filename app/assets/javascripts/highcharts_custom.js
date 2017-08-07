Highcharts.chart('container_graph', {
    chart: {
        type: 'bar'
    },
    title: {
        text: 'Employee of the month voting live Feed for top 5 Nominees by Graph'
    },
    subtitle: {
        text: 'Source: <a href="#">Voting Feedback</a>'
    },
    xAxis: {
        categories: ['Nominee I', 'Nominee II', 'Nominee III', 'Nominee IV', 'Nominee V'],
        title: {
            text: null
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Votes (hundreds)',
            align: 'high'
        },
        labels: {
            overflow: 'justify'
        }
		
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
        data: [107, 31, 635, 203, 2]
    }],
	colors: ['#000']
	

});

