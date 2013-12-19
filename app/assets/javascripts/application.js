// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree .

$(function() {
  // find the view order link
  // add event handler for click
  $(".view-order-link").on("click", function(event){
  	// prevent the default action
  	event.preventDefault();
  	// toggle visibility of order partial
  	$("#current_order").slideToggle();
  	$(".order-header").fadeToggle();
  	// toggle out view order link
  	$(this).toggle();
    $(".order-total").toggle();
  	// toggle in "Your Current order" header
  	// toggle in close link
  });
    // find close link
  	// do the opposite as above
  $(".hide-order").on("click", function(event){
  	event.preventDefault();
  	$(".order-header").toggle();
  	$(".view-order-link").fadeToggle();
    $(".order-total").fadeToggle();
  	$("#current_order").slideToggle();
  });

});

$(document).ready(function(){
  $("[data-view-toggle]").viewToggle();
})
