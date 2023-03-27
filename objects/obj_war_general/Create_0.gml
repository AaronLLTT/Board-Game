/// @description Create the Decks 

//Create an empty array
var _full_deck = array_create(2);

//Get the amount of cards we'll use in our deck
var _cards = 2;//sprite_get_number(spr_playing_cards);

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

//DEBUGGING ONLY
/*with(obj_player) {
	deck[array_length(deck) - 1] = 17;
	deck[array_length(deck) - 2] = 45;
}*/

//Initialize the variables this object needs during the game
cards = array_create(2, undefined);
can_draw = true; //If the player can draw a card
war_level = 0; //The war level of the game, 0 means no war

review_time = 60; //How long to wait before moving the cards to the discard
war = false; //If there's an active war
//global.TIME_SOURCE = -1; //The active time source

music = audio_play_sound(snd_volcanic_theme, 1, true); //The main theme music
war_music = undefined; //Music specifically for the war

reveal_cards = function() {
	if (cards[0] == undefined || cards[1] == undefined) {
		exit;
	}
	if (cards[0].in_war == false && cards[1].in_war == false) {
		exit;
	}
	
	//Reveal the cards
	cards[0].sprite_index = spr_playing_cards;
	cards[0].image_index = cards[0].face;
	cards[1].sprite_index = spr_playing_cards;
	cards[1].image_index = cards[1].face;
	
	alarm[1] = review_time;
}

//The function to compare the player and computer cards and determine a winner
compare_cards = function() {
	
	//Check if we can compare
	if (cards[0] == undefined || cards[1] == undefined) {
		exit;
	}
	if (cards[0].in_war == false && cards[1].in_war == false) {
		exit;
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
		audio_sound_gain(music, 0, 2000);
		war_music = audio_play_sound(snd_war_time, 1, true, 0.5);
		can_draw = true;
		war = true;
		//Increase war level and call each player to war
		++war_level;
		obj_player.ready = false;
		//cards[0] = cards[0].owner.declare_war(war_level);
		//cards[1] = cards[1].owner.declare_war(war_level);
		cards[0] = undefined;
		cards[1] = undefined;
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
	
	//Cannot keep a reference to a destroyed instance in Rollback
	cards[0] = undefined;
	cards[1] = undefined;
}

//Check if the war is over
check_war_status = function() {
	if (cards[0] == undefined || cards[1] == undefined) {
		exit;
	}
	if (cards[0].in_war == false && cards[1].in_war == false) {
		exit;
	}
	
	//Create the variable to hold the winner, whomever it is
	var _winner = undefined;
	
	//The player wins!
	if (cards[0].value > cards[1].value) {
		_winner = cards[0].owner;
	}
	//Player loses!
	else if (cards[0].value < cards[1].value) {
		_winner = cards[1].owner;
	}
	//Another war
	else {
		++war_level;
		can_draw = true;
		obj_player.ready = false;
		cards[0] = undefined;
		cards[1] = undefined;
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
	war = false;
	war_level = 1;
	cards[0] = undefined;
	cards[1] = undefined;
	audio_sound_gain(war_music, 0, 2000);
	audio_sound_gain(music, 1, 2000);
}

game_over = function() {
	with(obj_player) {
		audio_sound_gain(other.music, 0, 500);
		if (lost == false && player_local) {
			audio_play_sound(snd_won_game, 100, false);
		}
		else if (lost == true && player_local) {
			audio_play_sound(snd_lost_game, 100, false);
		}
		other.alarm[2] = audio_sound_length(snd_lost_game);
	}
}