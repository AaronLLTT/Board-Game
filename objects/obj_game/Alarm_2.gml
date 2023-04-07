/// @description Game's over

//Create new decks
create_decks();

//Reset the decks so they can play again
for(var _i = 0; _i < array_length(players); ++_i) {
	var _player = players[_i];
	//Empty the deck and discard
	_player.deck = [];
	_player.discard = [];
	_player.lost = undefined;
	
	//Reset the deck
	_player.deck = decks[_i];
	
	//Get ready to play again
	_player.can_play = true;
	
	//Reset draw power
	if(_player.two_cards == true) {
		_player.draw_pool = 4;
	}
}

audio_stop_all();
music = audio_play_sound(snd_volcanic_theme, 1, true);