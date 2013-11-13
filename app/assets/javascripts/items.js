$document.onReady(function ({
  var $tile1 = $("#item_1").liveTile({mode: 'flip', repeatCount: 0, delay:0 });
  $("#item_1").click(function(){
    $(this).liveTile('play');
  });
}));