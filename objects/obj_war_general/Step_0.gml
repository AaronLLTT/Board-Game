/// @description Compare Cards 

if (ready_for_war) {
	//Compare the cards
	var _winner = undefined;
	//The player wins!
	if (player_card.value > computer_card.value) {
		_winner = obj_player;
	}
	//Player loses!
	else if (player_card.value < computer_card.value) {
		_winner = obj_computer;
	}
	//Tie! It's time for war
	else {
		
	}
	
	if (_winner != undefined) {
		//Do the thing
		array_push(_winner.discard, player_card.value);
		array_push(_winner.discard, player_card.value);
		
		with (player_card) {
			goal_x = _winner.x - 128;
			goal_y = _winner.y;
			in_war = false;
		}
		with (computer_card) {
			goal_x = _winner.x - 128;
			goal_y = _winner.y
			in_war = false;
		}
		
		//Reset and get ready for the next war
		ready_for_war = false;
		can_draw = true;
	}
}