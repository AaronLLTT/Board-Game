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
}

//Reset ending data
game_finished = false;