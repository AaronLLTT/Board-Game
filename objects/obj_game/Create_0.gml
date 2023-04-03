/// @description Methods and Data

#region Multiplayer specific
//Init multiplayer
rollback_define_player(obj_player);
//If we're joining a game with a link, this will take us there immediately
var _joined = rollback_join_game();
//If joined is true, then we're in a live multiplayer game and ready to begin
if (_joined) {
	room_goto(rm_powers);
}
#endregion

#region Variables for this object
//Keep track of players
players = [];
//Keep track of the decks we will distribute in a 2D array
decks[0][0] = [];
decks[1][0] = [];
//Track active powers
powers = [];

//Initialize the variables this object needs during the game
cards = array_create(2, undefined); //The 2 active cards in battle
can_draw = true; //If the player can draw a card
war_level = 0; //The war level of the game, 0 means no war

review_time = 60; //How long to wait before moving the cards to the discard
war = false; //If there's an active war

music = audio_play_sound(snd_volcanic_theme, 1, true, 0.5); //The main theme music
war_music = undefined; //Music specifically for the war

game_finished = false;
//Assume the game is online
game_local = false;
#endregion

#region Methods
create_game = function(_player_count) {
	room_goto(rm_powers);
	
	rollback_create_game(_player_count, false);
	
	if (_player_count == 1) {
		instance_create_layer(-500, -500, "Instances", obj_computer);
		//Set the game to local
		game_local = true;
	}
	
	instance_deactivate_all(true);
}

create_decks = function() {
	//Create and save the decks to distribute later
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
	
	//Save the decks to distribute later
	array_copy(decks[0], 0, _full_deck, 0, array_length(_full_deck) / 2);
	array_copy(decks[1], 0, _full_deck, array_length(_full_deck) / 2, array_length(_full_deck));
	
	//DEBUGGING ONLY
	/*
	with(players[0]) {
		deck[array_length(deck) - 1] = 17;
		deck[array_length(deck) - 2] = 45;
	}
	with(players[1]) {
		deck[array_length(deck) - 1] = 17;
		deck[array_length(deck) - 2] = 45;
	} */
}

init_player = function(_id) {
	//Add the newly created player to our data
	var _count = array_length(players);
	players[_count] = _id;
	
	//Give the player a deck
	_id.deck = decks[_count];
}

is_battle_time = function() {
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
	if (is_battle_time() == false) {
		return;
	}
	
	//Reveal the cards
	/*cards[0].sprite_index = spr_playing_cards;
	cards[0].image_index = cards[0].face;
	cards[1].sprite_index = spr_playing_cards;
	cards[1].image_index = cards[1].face;*/
	
	//Reveal all active battle cards
	with(obj_card) {
		if (battle_card) {
			sprite_index = spr_playing_cards;
			image_index = face;
		}
	}
	
	alarm[1] = review_time;
}

//The function to compare the player and computer cards and determine a winner
compare_cards = function() {
	if (is_battle_time() == false) {
		return;
	}
	
	//Check for powers that change comparing
	for(var _i = 0; _i < array_length(players); ++_i) {
		if (players[_i].using_power == true) {
			
		}
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
		players[0].can_play = true;
		players[1].can_play = true
		//cards[0] = cards[0].owner.declare_war(war_level);
		//cards[1] = cards[1].owner.declare_war(war_level);
		cards[0] = undefined;
		cards[1] = undefined;
		//Reset all battle status on cards
		with(obj_card) {
			battle_card = false;
		}
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
	/*with (cards[1]) {
		goal_x = _winner.discard_x;
		goal_y = _winner.discard_y;
		in_war = false;
		in_discard = true;
		owner = _winner;
	}*/
	
	//Cannot keep a reference to a destroyed instance in Rollback
	cards[0] = undefined;
	cards[1] = undefined;
}

//Check if the war is over
check_war_status = function() {
	if (is_battle_time() == false) {
		return;
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
	war_level = 1;
	cards[0] = undefined;
	cards[1] = undefined;
	audio_sound_gain(war_music, 0, 2000);
	audio_sound_gain(music, 1, 2000);
}

//@Function game_over - Called when any player has 0 cards in their deck and discard
//Loops through each player and plays the appropriate music and sets the game_finished variable to true
game_over = function() {
	with(obj_player) {
		if (lost == true) {
			audio_play_sound(snd_lost_game, 100, false);
		}
		else if (lost == false) {
			audio_play_sound(snd_won_game, 100, false);
		}
	}

	//Mute current music
	audio_sound_gain(music, 0, 1000);
	//Set the alarm to trigger to restart the game
	alarm[2] = audio_sound_length(snd_won_game) * 60;
	//Set to true for any game logic that depends on it
	game_finished = true;
}
#endregion

#region Call any methods we need
create_decks();
#endregion

#region Power Macros and Methods
#macro DRAW_TWO 0
#endregion