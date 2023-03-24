/// @description Create the Decks 

//Create an empty array
var _full_deck = array_create(52);

//Get the amount of cards we'll use in our deck
var _cards = sprite_get_number(spr_playing_cards);

//Fill up the deck array with numbers
for(var _i = 0; _i < _cards; ++_i) {
	_full_deck[_i] = _i;
}

//Shuffle the array
_full_deck = array_shuffle(_full_deck);

//Give the player and computer half the deck each
with(obj_player) {
	if (player_id == 0) {
		array_copy(deck, 0, _full_deck, 0, array_length(_full_deck) / 2);
	}
	else {
		array_copy(deck, 0, _full_deck, array_length(_full_deck) / 2, array_length(_full_deck));
	}
}

//Initialize the variables this object needs during the game
cards = array_create(2, undefined);
can_draw = true; //If the player can draw a card
war_level = 0; //The war level of the game, 0 means no war

global.REVIEW_TIME = 60; //How long to wait before moving the cards to the discard
global.WAR = false; //If there's an active war
//global.TIME_SOURCE = -1; //The active time source

music = audio_play_sound(snd_volcanic_theme, 1, true); //The main theme music
war_music = undefined; //Music specifically for the war

//The function to compare the player and computer cards and determine a winner
compare_cards = function() {
	//This function is called by a time source, so destroy it
	//time_source_destroy(global.TIME_SOURCE);
	
	//Check if we can compare
	if (cards[0] == undefined || cards[1] == undefined) {
		exit;
	}
	else {
		cards[0].sprite_index = spr_playing_cards;
		cards[0].image_index = cards[0].face;
		cards[1].sprite_index = spr_playing_cards;
		cards[1].image_index = cards[1].face;
	}
	//Create the variable to hold the winner, whomever it is
	var _winner = undefined;
	
	//The player wins!
	if (cards[0].value > cards[1].value) {
		_winner = cards[0].owner;
	}
	//Player loses!
	else if (cards[0].value < cards[1].value) {
		_winner = cards[1].owner
	}
	//They tie - WAR TIME!
	else {
		audio_sound_gain(music, 0, 1);
		war_music = audio_play_sound(snd_war_time, 1, true);
		can_draw = true;
		global.WAR = true;
		exit;
	}
	
	//If we've made it this far, we're not in a war and need to give the cards to the winner
	with (cards[0]) {
		goal_x = _winner.discard_x;
		goal_y = _winner.discard_y;
		in_war = false;
		in_discard = true;
		owner = _winner;
	}
	with (cards[1]) {
		goal_x = _winner.discard_x;
		goal_y = _winner.discard_y;
		in_war = false;
		in_discard = true;
		owner = _winner;
	}
}

//Check if the war is over
check_war_status = function() {
	//This function was called by a time source, so destroy it
	//time_source_destroy(global.TIME_SOURCE);
	//Create the variable to hold the winner, whomever it is
	var _winner = undefined;
	
	//The player wins!
	if (first_player_card.value > second_player_card.value) {
		_winner = obj_player;
	}
	//Player loses!
	else if (first_player_card.value < second_player_card.value) {
		_winner = obj_computer;
	}
	//Another war
	else {
		can_draw = true;
		exit;
	}
	
	//If we're this far, there is no war, so hand out the cards to the winner
	for (var _i = 0; _i < instance_number(obj_card); ++_i) {
		with(instance_find(obj_card, _i)) {
			owner = _winner;
			goal_x = owner.discard_x;
			goal_y = owner.discard_y;
			in_discard = true;
		}
	}
	//Reset all the things that changed during the war
	global.WAR = false;
	war_level = 1;
	audio_sound_gain(war_music, 0, 2000);
	audio_sound_gain(music, 1, 2000);
}