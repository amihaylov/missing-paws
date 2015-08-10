"use strict"
// on document ready
$( document ).ready(function(){
	$('button#button-search').bind('click', function(){
	    	var animal = $("input#search-animal").val();
	    	var result = PawsCyclopedia.searchAnimal(animal);
	    	PawsCyclopedia.display(result, true);
	 });

	$('span.category').bind('click', function(){
		var category = $(this)[0].textContent.toLowerCase();
		console.log(category);
		var result = PawsCyclopedia.searchCategory(category);
		PawsCyclopedia.display(result, true);
	});

	$('.article').bind('click', function(){
		
		var specie = $(this).attr('id');

		var result = PawsCyclopedia.searchAnimal(specie);
	    PawsCyclopedia.display(result, false);

	});
}); 
