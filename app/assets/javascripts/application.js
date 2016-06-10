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
  var i = 0;
  localStorage.setItem('score', i);
  var stored = localStorage.score;
  $(scoreKeeper(i, stored));

  // $("#score").text(stored);


  function scoreKeeper(talliedScore, storedScore){
    $('#next-card').click(function(){
      // var choice = $('.radio_button').val();
      // var correctChoice = $('#deck-word').val();
      // if ( choice === correctChoice ){
      //   talliedScore++ ;
      //   $("#score").text(storedScore);
      // } else {
      //   $("#score").text(storedScore);
      // };

      talliedScore++;
      $('#score').text(storedScore);
    })
  };


})


// collect answers in session in controller; each time it's right increase the talliedScore; when hit last question, trigger function that makes ajax call to namespaced api/v1/study_sessions/score?talliedScore = int ; update action to StudySessionsController#create record; modal is also triggered that shows final score; when exit modal session is refreshed

// birdeck sample
// $("#create-post").on("click", function(){
//   var postDescription = $("#post-description").val();
//   var postData = { post: { description: postDescription } };
//   $.ajax({
//     method: "POST",
//     url: "https://birdeck.herokuapp.com/api/v1/posts.json",
//     dataType: "JSON",
//     data: postData,
//     success: function(newPost){
//         $("#latest-posts").append(
//           "<div class='post'>" + newPost.description + "</div>"
//         );
//     },
//     error: function(errorBody){
//       console.log(errorResponse, responseText);
//     }
//   });
// })
