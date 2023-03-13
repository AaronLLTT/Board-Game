/// @description Create the Decks 

//Create an empty array
var _full_deck = [];

//Get the amount of cards we'll use in our deck
var _cards = sprite_get_number(sprCards) - 42; //THIS 40 IS FOR MAKING THE DECK SHORTER FOR TESTING

//Fill up the deck array with numbers
for(var _i = 0; _i < _cards; ++_i) {
	_full_deck[_i] = _i;
}

//Shuffle the array
_full_deck = array_shuffle(_full_deck);

_full_deck = [5, 5, 22, 12, 0, 45, 20, 12]; //TESTING ONLY

//Give the player and computer half the deck each
with(obj_player) {
	array_copy(deck, 0, _full_deck, 0, array_length(_full_deck) / 2);
}
with (obj_computer) {
	array_copy(deck, 0, _full_deck, array_length(_full_deck) / 2, array_length(_full_deck));
}

cards_in_war = 0;
player_card = undefined;
computer_card = undefined;
can_draw = true;
in_war = false;
war_level = 1;

global.WAR = false;

//Check if the war is over
check_war_status = function() {
	var _winner = undefined;
	//The player wins!
	if (player_card.value > computer_card.value) {
		_winner = obj_player;
	}
	//Player loses!
	else if (player_card.value < computer_card.value) {
		_winner = obj_computer;
	}
	else {
		exit;
	}
	
	for (var _i = 0; _i < instance_number(obj_card); ++_i) {
		with(instance_find(obj_card, _i)) {
			owner = _winner;
			goal_x = owner.discard_x;
			goal_y = owner.discoard_y;
			in_discard = true;
		}
	}
	
	global.WAR = false;
}