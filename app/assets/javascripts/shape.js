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
