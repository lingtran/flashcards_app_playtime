//= require jquery
//= require jquery_ujs
//= require_tree .

//= require semantic-ui/modules/behavior/form.js
//= require semantic-ui/modules/popup.js

$(document).ready(function(){

  google.charts.load('current', {'packages':['corechart']});

  google.charts.setOnLoadCallback(drawSeriesChart);

  function drawSeriesChart() {
    var toBuildTable = [['ID', 'Average Deck Score', 'Study Rate Per Week', 'Mastery Level']];

    var id = $('#deck_id').val();

    $.getJSON( "/api/v1/users/scores?deck_id=" + id, function( json ) {
      for (var n=0; n < json.length; n++){
       var toAppend = [String(json[n]["user_name"]),
                       Number(json[n]["average_deck_score"]),
                       Number(json[n]["study_rate_per_week"]),
                       String(json[n]["level"])];
       toBuildTable.push(toAppend);
      }

     toBuildTable;

     var data = google.visualization.arrayToDataTable(toBuildTable);

     var options = {
       title: 'Lingo App Users ' +
       '- How are they faring?',
       hAxis: {title: 'Average Deck Score', gridlines: {color: "#FFF"}},
       vAxis: {title: 'Study Rate Per Week', gridlines: {color: "#FFF"}},
       bubble: {textStyle: {fontSize: 11}},
       sizeAxis: {maxSize: 20}
     };

     var chart = new google.visualization.BubbleChart(document.getElementById('series_chart_div'));
     chart.draw(data, options);
    });
  };


  var scoresChart = $('#series_chart_div').val();

  $('#stats-button').click(function(){
    $('#series_chart_div').toggle(scoresChart);
  })

})
