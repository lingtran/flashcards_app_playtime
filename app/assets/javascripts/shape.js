//
//= require jquery
//= require jquery_ujs
//= require_tree .

//= require semantic-ui/modules/behavior/form.js
//= require semantic-ui/modules/popup.js
//= require semantic-ui/modules/shape.js

$(document).ready(function() {

    var flipUpButtonId = '#flip-up-button-0';
    var flipDownButtonId = '#flip-down-button-0';
    var flipRightButtonId = '#flip-right-button-0';
    var flipLeftButtonId = '#flip-left-button-0';
    var flashcardId = '#flashcard-0';

    $(animateShape(flipUpButtonId, flashcardId, 'flip up'));
    $(animateShape(flipDownButtonId, flashcardId, 'flip down'));
    $(animateShape(flipRightButtonId, flashcardId, 'flip right'));
    $(animateShape(flipLeftButtonId, flashcardId, 'flip left'));

    informOfAction(flipUpButtonId);
    informOfAction(flipDownButtonId);
    informOfAction(flipRightButtonId);
    informOfAction(flipLeftButtonId);
    informOfAction('#stats-button')
    informOfAction('#home-link')

  function animateShape(directionalButtonId, flashcardId, direction) {
    $(directionalButtonId).click(function(){
      $(flashcardId).shape(direction);
    })
  };

  function informOfAction(directionalButtonId) {
    $(directionalButtonId).popup();
  };
});
