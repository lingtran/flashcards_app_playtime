// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
  if (localStorage.score ){
    $("#score").text(localStorage.score);
    $('#series_chart_div').hide();
  } else {
    $('.tally.ui').hide();
    localStorage.score = 0;
  }

  var currentScore = Number(localStorage.score);

  scoreKeeper(currentScore);

  function scoreKeeper(currentScore){
    $('.submit-button').on('click', function(){
      var choice = $(this).closest('form').find('input:checked').val();
      var correctChoice = $('#deck-word').val();
      if ( choice === correctChoice ){
        currentScore+=1 ;
        localStorage.score = currentScore;
        $("#score").text(currentScore);
      };
    })
  };

  var scoresChart = $('#series_chart_div').val();

  $("#booyeah-done").on('click', function(){
    $('#deck-stats').show(scoresChart);
    localStorage.clear();
    $('.tally').hide();
  });

  $("#home-link").on('click', function(){
    if (localStorage.score){
      localStorage.clear();
      }
    })

})
