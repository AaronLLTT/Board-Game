/// @description Game's over

//Create new decks
create_decks();

//Reset the decks so they can play again
for(var _i = 0; _i < array_length(players); ++_i) {
	//Empty the deck and discard
	players[_i].deck = [];
	players[_i].discard = [];
	players[_i].lost = undefined;
	
	//Reset the deck
	players[_i].deck = decks[_i];
	
	//Get ready to play again
	players[_i].can_play = true;
	
	//Reset draw power
	if(players[_i].two_cards == true) {
		players[_i].draw_pool = 4;
	}
}

//Reset ending data
game_finished = false;

audio_stop_all();
music = audio_play_sound(snd_volcanic_theme, 1, true);