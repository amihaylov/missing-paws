var PawsCyclopedia = (function() {

	var articles =[{'category':'dogs','specie':'Husky','picture':'http://static.baubau.bg/resources/haski.jpg',
					'text':'Husky is a general name for a type of dog used to pull sleds in northern regions, differentiated from other sled-dog types by their fast pulling style.[1] They are "an ever-changing cross-breed of the...fastest dogs."[1] The Alaskan Malamute, by contrast, is "the largest and most powerful" sled dog,[2] and was used for heavier loads. Huskies are used in sled dog racing. In recent years, companies have been marketing tourist treks with dog sledges for adventure travelers in snow regions as well.[3] Huskies are also today kept as pets, and groups work to find new pet homes for retired racing and adventure trekking dogs.[4]'},
					{'category':'others','specie':'Quokka','picture':'http://static.baubau.bg/resources/kuoka.jpg',
					'text':'The quokka (Setonix brachyurus), the only member of the genus Setonix, is a small macropod about the size of a domestic cat.[2] Like other marsupials in the macropod family (such as kangaroos and wallabies), the quokka is herbivorous and mainly nocturnal. Quokkas can be found on some smaller islands off the coast of Western Australia, in particular on Rottnest Island just off Perth and Bald Island near Albany. A small mainland colony exists in the protected area of Two Peoples Bay Nature Reserve, where they co-exist with Gilberts potoroo.'},
					{'category':'cats','specie':'Persian','picture':'http://static.baubau.bg/resources/dalgokosmesti-kotki.jpg',
					'text':'The Persian is a long-haired breed of cat characterized by its round face and short muzzle. In Britain, it is sometimes called the Longhair or Persian Longhair. It is also known as the Shiraz or Shirazi, particularly in the Middle East. The first documented ancestors of the Persian were imported into Europe from Persia around 1620.[1] Recognized by the cat fancy since the late 19th century, it was developed first by the English, and then mainly by American breeders after the Second World War. Some cat fancier organizations breed standards subsume the Himalayan and Exotic Shorthair as variants of this breed, while others treat them as separate breeds.'}
	];

	//isThumb to determine whether the display is thumbnail or full
	var display = function(data, isThumb) {
		var container = $("#main-content");
		container.empty();

		for (var i=0; i<data.length; i+=1){
			var row = $("<div></div>").addClass("row article").attr({'id':data[i].specie});
			var title = $("<h4></h4>").text(data[i].specie);
			var picture = $("<div></div>").addClass("col-md-4").prepend($('<img>',{class: 'img', src: data[i].picture, alt: data[i].specie}));
			var text = $("<div></div>").text(data[i].text);
			if(isThumb){
				text.addClass("col-md-4 short-text");
				var tempRow = $("<div></div>").addClass("row");
				tempRow.append(picture).append(text);
				row.append(title).append(tempRow);
			}
			else{
				row.append(title).append(picture).append(text);
			}
			container.append(row);
		}
	};

	//Search for animal by specie
	var searchAnimal = function(animal){
		var result =[];
		for (var i=0; i<articles.length; i+=1){
			if(articles[i].specie === animal)
				result.push(articles[i]);
		}

		return result;
	};

	//Search for animals by categorie
	var searchCategory = function(category){
		var result =[];
		for (var i=0; i<articles.length; i+=1){
			if(articles[i].category === category)
				result.push(articles[i]);
		}

		return result;
	};

	//public api
	return {
		display:display,
		searchAnimal:searchAnimal,
		searchCategory:searchCategory
	};

})(); 
