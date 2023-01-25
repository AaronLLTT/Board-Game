/// @description Player Data

myPortrait = sprPlayerFemale;

CreateDeck = function(size) {
	var deck = [];
	for (var i = 0; i < size; ++i) {
		deck[i] = irandom(13);
	}
	return deck;
}
card = {
	sprite : undefined,
	value : undefined
}
AddToHand = function(sprite, value) {
	var card = {
		sprite : sprite,
		value : value
	}
	array_push(myHand, card);
}

myDeck = CreateDeck(60);
myHand = [];

cards = ds_list_create();