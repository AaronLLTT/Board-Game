/// @description Create the Decks 

//Create an empty array
var _full_deck = [];

//Get the amount of cards we'll use in our deck
var _cards = sprite_get_number(sprCards) - 40; //THIS 40 IS FOR MAKING THE DECK SHORTER FOR TESTING

//Fill up the deck array with numbers
for(var _i = 0; _i < _cards; ++_i) {
	_full_deck[_i] = _i;
}

//Shuffle the array
_full_deck = array_shuffle(_full_deck);

//full_deck = array_create(52, 5); //TESTING ONLY

//Give the player and computer half the deck each
with(obj_player) {
	array_copy(deck, 0, _full_deck, 0, array_length(_full_deck) / 2);
}
with (obj_computer) {
	array_copy(deck, 0, _full_deck, array_length(_full_deck) / 2, array_length(_full_deck));
}

ready_for_war = false;
player_card = undefined;
computer_card = undefined;
can_draw = true;