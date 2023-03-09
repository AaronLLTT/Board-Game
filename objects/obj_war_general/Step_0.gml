/// @description Compare Cards 

if (cards_in_war mod 2 == 0 && cards_in_war != 0) {
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
		//Have the cards add themselves once in the discard proper
		//array_push(_winner.discard, player_card.value);
		//array_push(_winner.discard, computer_card.value);
		
		with (player_card) {
			goal_x = _winner.discard_x;
			goal_y = _winner.discard_y;
			in_war = false;
			in_discard = true;
			owner = _winner;
		}
		with (computer_card) {
			goal_x = _winner.discard_x;
			goal_y = _winner.discard_y;
			in_war = false;
			in_discard = true;
			owner = _winner;
		}

		//Reset and get ready for the next war
		cards_in_war = 0;
	}
}

//Check for win / loss
if (array_length(obj_player.deck) == 0 and can_draw) {
	//The player loses
	//instance_destroy(obj_player_parent);
	//Play sequence showing lose and try again
	game_restart();
}
if (array_length(obj_computer.deck) == 0 and can_draw) {
	//The player loses
	instance_destroy(obj_player_parent);
	//Play sequence showing lose and try again
	//game_restart();
}