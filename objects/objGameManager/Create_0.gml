/// @description Set Decks 

//Create an empty array
full_deck = [];

//Get the amount of cards we'll use in our deck
var _cards = sprite_get_number(sprCards);

//Fill up the deck array with numbers
for(var _i = 0; _i < _cards; ++_i) {
	full_deck[_i] = _i;
}

//Shuffle the array
full_deck = array_shuffle(full_deck);

//Give each player half of the deck
with(objDeck) {
	if (owner == obj_war_enemy) {
		array_copy(owner.deck, 0, other.full_deck, 0, array_length(other.full_deck) / 2);
	}
	else {
		array_copy(owner.deck, 0, other.full_deck, array_length(other.full_deck) / 2, array_length(other.full_deck));
	}
}