/// @description Init 

deck = [];
discard = [];

deck_x = x + 132;
deck_y = y;

discard_x = x - 132;
discard_y = y;

play_x = x;
play_y = y - 256;

shuffle_seq = -1;

shuffle_discard = function() {
	deck = array_shuffle(discard);
	discard = [];
	shuffle_seq = layer_sequence_create("Battle_Cards", discard_x, discard_y, seq_shuffle);
	
	//Destroy all cards in the discard pile
	with(obj_card) {
		if (owner == other.id) {
			instance_destroy();
		}
	}
}

declare_war = function(offset) {
	var _deck_size = array_length(deck);
	var _cards_to_create = 3;
	
	//If we're out of cards
	if (_deck_size == 0) {
		exit;
	}
	//Adjust cards to draw based on remaining cards
	else if (_deck_size >= 4) { //Enough cards for all of them
		_cards_to_create = 3;
	}

	//We don't have enough for a full war, so adjust
	else if (_deck_size <= 3) {
		_cards_to_create = _deck_size - 1;
	}
	
	var _war_x_offset = 1;
	
	//Draw the new battle card, too
	var _battle_card = instance_create_layer(deck_x, deck_y, "War_Cards", obj_card, {
		owner : id,
		goal_x : id.play_x + (offset * 30),
		goal_y : id.play_y,
		in_war : true,
	});
	//Sort based on depth
	_battle_card.depth = -_battle_card.goal_x;
	
	repeat(_cards_to_create) {
		var _card = instance_create_layer(deck_x, deck_y, "War_Cards", obj_card, {
			owner : id,
			goal_x : id.play_x + (_war_x_offset * 30),
			goal_y : id.play_y + (offset * 30),
		});
		//Adjust for the computer
		if (_card.owner == instance_find(obj_computer, 0)) {
			_card.goal_y = obj_computer.play_y - (offset * 30);
		}
			
		_card.sprite_index = sprCardBack;
		_card.in_war = true;
			
		++_war_x_offset;
	}
	
	//Outside of the loop, do these things.
	_war_x_offset = 1;
	
	return _battle_card;
}