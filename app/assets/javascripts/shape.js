//
//= require jquery
//= require jquery_ujs
//= require_tree .

//= require semantic-ui/modules/accordion.js
//= require semantic-ui/modules/behavior/api.js
//= require semantic-ui/modules/behavior/colorize.js
//= require semantic-ui/modules/behavior/form.js
//= require semantic-ui/modules/behavior/state.js
//= require semantic-ui/modules/chatroom.js
//= require semantic-ui/modules/checkbox.js
//= require semantic-ui/modules/dimmer.js
//= require semantic-ui/modules/dropdown.js
//= require semantic-ui/modules/modal.js
//= require semantic-ui/modules/nag.js
//= require semantic-ui/modules/popup.js
//= require semantic-ui/modules/rating.js
//= require semantic-ui/modules/search.js
//= require semantic-ui/modules/shape.js
//= require semantic-ui/modules/sidebar.js
//= require semantic-ui/modules/tab.js
//= require semantic-ui/modules/transition.js
//= require semantic-ui/modules/video.js

$(document).ready(function() {
  $(animateShape('#up-button', 'flip up'));
  $(animateShape('#down-button', 'flip down'));
  $(animateShape('#left-button', 'flip left'));
  $(animateShape('#right-button', 'flip right'));


  function animateShape(elementID, direction) {
    $(elementID).click(function(){
      $('.shape').shape(direction);
    })
  };
});
