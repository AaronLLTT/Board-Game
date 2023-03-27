/// @description Init 

//Multiplayer specific settings
if (player_id == 0) {
	x = 125;
	y = 384;
	image_xscale = 0.25;
	image_yscale = 0.25;
	name = "Harley";
}
else if (player_id == 1) {
	x = 1241;
	y = 384;
	sprite_index = spr_computer;
	image_xscale = -0.25;
	image_yscale = .25;
	name = "Bobby";
}

deck = [];
discard = [];

deck_x = x + 200 * sign(image_xscale);
deck_y = y + 100;

discard_x = x + 200 * sign(image_xscale);
discard_y = y - 100;

play_x = x + 450 * sign(image_xscale);
play_y = y;

ready = false;

shuffle_discard = function() {
	deck = array_shuffle(discard);
	discard = [];
	//shuffle_seq = layer_sequence_create("Battle_Cards", discard_x, discard_y, seq_shuffle);
	
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
	
	audio_play_sound(snd_play_card, 1, false);
	
	//Sort based on depth
	_battle_card.depth = -_battle_card.goal_x;
	
	repeat (_cards_to_create) {
		var _card = instance_create_layer(deck_x, deck_y, "War_Cards", obj_card, {
			owner : id,
			goal_x : id.play_x + (_war_x_offset * 64) - 95,
			goal_y : id.play_y + (offset * 64),
		});
		
		//Adjust for the computer
		if (_card.owner == instance_find(obj_computer, 0)) {
			_card.goal_x = obj_computer.play_x + (_war_x_offset * 64) - 95;
			_card.goal_y = obj_computer.play_y - (offset * 64);
		}
			
		_card.sprite_index = spr_card_backs;
		_card.image_index = 0;
		_card.in_war = true;
			
		++_war_x_offset;
	}
	
	//Outside of the loop, do these things.
	_war_x_offset = 1;
	
	return _battle_card;
}

draw_card = function() {
	audio_play_sound(snd_play_card, 1, false);
	
	card = instance_create_layer(deck_x, deck_y, "Battle_Cards", obj_card, {
		sprite_index: spr_card_backs,
		goal_x : play_x,
		goal_y : play_y,
		owner : id,
	});
	
	obj_war_general.cards[player_id] = card;
	
	ready = true;
}