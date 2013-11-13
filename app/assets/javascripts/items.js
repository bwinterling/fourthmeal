$document.ready(function(){
  var $tile1 = $("#item_2").liveTile({mode: 'flip', repeatCount: 0, delay:0 });
  $("#item_2").click(function(){
    $(this).liveTile('hide');
  });
});