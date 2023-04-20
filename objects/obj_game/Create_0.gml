/// @description Methods and Data
#region Multiplayer specific
//Define the player object
rollback_define_player(obj_player);
//We'll be using preferences for the players to choose a character and power
rollback_use_player_prefs()
//If we're joining a game with a link, this will take us there immediately
var _joined = rollback_join_game();
//If joined is true, then we're in a live multiplayer game and ready to begin
if (_joined) {
	room_goto(rm_powers);
}
#endregion

#region Variables necessary to track data during the game
//Keep track of the players and cards
players = []; //The 2 active players
cards = array_create(2, undefined); //The 2 active cards in battle

//Keep track of the decks we will distribute in a 2D array
decks[0][0] = [];
decks[1][0] = [];

war_level = 0; //The war level of the game, 0 means no war. Used for position cards
war = false; //If there's an active war

review_time = 60; //How long to wait before moving the cards to the discard

music = audio_play_sound(snd_volcanic_theme, 1, true, 0.5); //The main theme music
war_music = undefined; //Music specifically for the war

//Assume the game is online
game_local = false;
#endregion

#region Methods
//@description - Create the online game with Rollback
create_game = function(_player_count) {
	//Move to the room so they can choose their power
	room_goto(rm_powers);
	
	//Set the game to local
	if (_player_count == 1) {
		game_local = true;
	}
	
	//Create the online game
	rollback_create_game(_player_count, false);
}

create_decks = function() {
	//Reset the decks to blank
	decks[0] = [];
	decks[1] = [];
	
	//Get the amount of cards we'll use in our deck
	var _cards = sprite_get_number(spr_playing_cards);
	
	//Create an empty array
	var _full_deck = array_create(_cards);

	//Fill up the deck array with numbers
	for(var _i = 0; _i < _cards; ++_i) {
		_full_deck[_i] = _i;
	}

	//Shuffle the array
	_full_deck = array_shuffle(_full_deck);
	
	//Save the decks to distribute later
	array_copy(decks[0], 0, _full_deck, 0, array_length(_full_deck) / 2);
	array_copy(decks[1], 0, _full_deck, array_length(_full_deck) / 2, array_length(_full_deck));
}

init_player = function(_player) {
	//Add the newly created player to our data
	var _count = array_length(players);
	players[_count] = _player;
	
	//Give the player a deck
	_player.deck = decks[_count];
}

set_power = function(_power) {

		var prefs = 
		{
			powers : _power
		}
		
		rollback_set_player_prefs(prefs);
		
		room_goto(rm_war);
		
		if (game_local) {
			rollback_start_game();
		}
}

can_battle = function() {
	if (cards[0] == undefined || cards[1] == undefined) {
		return false;
	}
	if (cards[0].in_war == false && cards[1].in_war == false) {
		return false;
	}
	
	return true;
}

add_card = function(_card) {
	first_slot = players[0];
	
	if (_card.owner == first_slot) {
		cards[0] = _card;
	}
	else {
		cards[1] = _card;
	}
}

reveal_cards = function() {
	if (can_battle() == false) {
		return;
	}
	
	//Reveal all active battle cards
	with(obj_card) {
		if (battle_card) {
			sprite_index = spr_playing_cards;
			image_index = card_face;
		}
	}
	
	alarm[0] = review_time;
}

//The function to compare the player and computer cards and determine a winner
compare_cards = function() {
	//If it's not time to compare the cards, yeet out of this function
	if (can_battle() == false) {
		return;
	}
	
	//Get the values of the cards and save them temporarily
	var _val_1 = cards[0].card_value;
	var _val_2 = cards[1].card_value;
	
	//Check for the war power
	if (more_war) {
		if (abs(_val_1 - _val_2) <= war_tolerance) {
			_val_1 = 0;
			_val_2 = 0;
		}
	}
	
	//Create the variable to hold the winner, whomever it is
	var _winner = undefined;
	
	//The first card wins
	if (_val_1 > _val_2) {
		_winner = cards[0].owner;
	}
	//The second card wins
	else if (_val_1 < _val_2) {
		_winner = cards[1].owner
	}
	//They tie - WAR TIME!
	else {
		//Fade old music out and new music in
		audio_sound_gain(music, 0, 2000);
		war_music = audio_play_sound(snd_war_time, 1, true, 0.5);
		can_draw = true;
		war = true;
		//Increase war level and call each player to war
		++war_level;
		players[0].can_play = true;
		players[1].can_play = true
		cards[0] = undefined;
		cards[1] = undefined;
		//Reset all battle status on cards
		obj_card.battle_card = false;
		exit;
	}
	
	//If we've made it this far, we're not in a war and need to give the cards to the winner
	with (obj_card) {
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
	if (can_battle() == false) {
		return;
	}
	
	//Check for the war power
	if (more_war) {
		if (abs(cards[0].card_value - cards[1].card_value) <= 2) {
			cards[0].card_value = 0;
			cards[1].card_value = 0;
		}
	}
	
	//Create the variable to hold the winner, whomever it is
	var _winner = undefined;
	
	//The player wins!
	if (cards[0].card_value > cards[1].card_value) {
		_winner = cards[0].owner;
	}
	//Player loses!
	else if (cards[0].card_value < cards[1].card_value) {
		_winner = cards[1].owner;
	}
	//Another war
	else {
		++war_level;
		//can_draw = true;
		players[0].can_play = true;
		players[1].can_play = true
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
	with(obj_draw_two_power) {
		image_index = 1;
	}
	//Remove the boosted attribute so it stops drawing its text
	with(obj_card) {
		boosted = false;
	}
	war_level = 0;
	cards[0] = undefined;
	cards[1] = undefined;
	audio_sound_gain(war_music, 0, 2000);
	audio_sound_gain(music, 1, 2000);
}

//@Function game_over - Called when any player has 0 cards in their deck and discard
//Loops through each player and plays the appropriate music
game_over = function() {
	with(obj_player) {
		if (lost == true) {
			audio_play_sound(snd_lost_game, 100, false);
		}
		else if (lost == false) {
			audio_play_sound(snd_won_game, 100, false);
		}
		can_play = false;
	}
	
	with(obj_computer) {
		can_play = false;
	}

	//Mute current music
	audio_sound_gain(music, 0, 1000);
	//Set the alarm to trigger to restart the game
	alarm[1] = audio_sound_length(snd_won_game) * 60;
}
#endregion

#region Call any methods we need
create_decks();
#endregion

#region Power Macros and Methods
#macro DRAW_TWO 0
#macro MORE_WAR 1

more_war = false;
war_tolerance = 2;
#endregion