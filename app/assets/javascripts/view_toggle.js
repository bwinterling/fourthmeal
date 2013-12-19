(function($){
  $.fn.viewToggle = function(){
    $(this).click(function(event){
      var $element = $(this);
      event.preventDefault();
      var itemLayoutClass = $element.attr("data-view-toggle");
      console.log(itemLayoutClass);
      var $container = $element.parents("#menu-list");
      $container.removeClass();
      $container.addClass(itemLayoutClass);
    });
  };
})(jQuery);
