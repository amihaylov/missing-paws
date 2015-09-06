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
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require twitter/bootstrap
//= require_tree .


function main () {

	// for adoptions page
	var expanded = false;

	// for lost and found contacts.
	var showContacts = false;


	$('.adoption-item-wrapper').on('click', function(){
		if (!expanded) {
			$(this).animate({width: '650px'});
			$(this).prev(".even").css('display', 'none');
			expanded = true;
		} else{
			$(this).animate({width: '300px'});
			$(this).prev(".even").css('display', 'inline-block');
			expanded = false;
		}
	});

	$('.show-contacts').on('click', function(){
		if (!expanded) {
			$(this).parent().parent().parent().find(".bottom").slideDown(1000).css({display: 'block'});
			expanded = true;
		} else{
			$(this).parent().parent().parent().find(".bottom").slideUp(1000).css({display: 'hidden'});
			expanded = false;
		}
	});

}


$(document).ready(main);