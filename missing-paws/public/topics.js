// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
"use strict"
// on document ready
$( document ).ready(function(){
	$('.topic').click(function(){
	   	$(this).removeClass('topic');
	   	$('.topic').css({"display":"none"});
	   	$('.short-text').removeClass('short-text');
	});
});