$(document).ready(function(){
  $("#item_2").click(function(){
    $("#item_2").liveTile({mode: 'fade', repeatCount: 0, delay:0 });
    $(this).liveTile('play');
  });
});