$(document).ready(function(){

  Array.max = function( array ){
    return Math.max.apply( Math, array );
  };

  Array.min = function( array ){
    return Math.min.apply( Math, array );
  };

  var min_price, tix_remain, name;

  $('.most_recent').click(function(){
    var minPrice_array = [], 
        minPrice, 
        event_count, 
        tix_array = [],
        tix, 
        tix_length, 
        date_as_of_array = [],
        date_as_of,
        id, 
        name;

    id = $(this).attr("id");

    name = $(this).find('.act_secondary').html() + " @ " + $(this).find('.act_primary').html() + " on " + $(this).find('.event_date_local').html();

    event_count = $('body').find('#' + id + ' .minPrice').size();

    for(var i = 0; i < event_count; i++){

      minPrice = $('body').find('#' + id + ' .minPrice' + ':eq(' + i + ')').text();
      minPrice_array[i] = parseFloat(minPrice);

      tix = $('body').find('#' + id + ' .totalTickets' + ':eq(' + i + ')').text();
      tix_array[i] = parseFloat(tix);

      date_as_of = $('body').find('#' + id + ' .created_at ' + ':eq(' + i + ')').text();
      date_as_of_array[i] = date_as_of;
      console.log(date_as_of_array);
    };

    var event_chart = new Highcharts.Chart({
      chart: {
        renderTo: 'event_chart',
        type: 'line'
      },
      title: {
        text: "Title" 
      },
      xAxis: {
        categories: [1, 2, 3]
      },
      yAxis: [{
        title: {
          text: "Minimum Price"
        },
      }, {
          title: {
            text: "Tickets Remaining"
          },
        opposite: true 
        }],
      series: [{
        name: 'Min Ticket Price (LHS)',
        type: 'line',
        data: [1, 0, 4]
      }, {
        name: 'Tickets Remaining (RHS)',
        type: 'line',
        yAxis: 1,
        data: [4, 3, 7]
      }]
      });

    event_chart.yAxis[0].setExtremes(Array.min(minPrice_array)/2, Array.max(minPrice_array)*2);
    event_chart.series[0].setData(minPrice_array.reverse());

    event_chart.yAxis[1].setExtremes(Array.min(tix_array)/2, Array.max(tix_array)*2);
    event_chart.series[1].setData(tix_array.reverse());
    event_chart.xAxis[0].setCategories(date_as_of_array.reverse());
    event_chart.setTitle({text: name});

      console.log(tix_array);


  });

  });