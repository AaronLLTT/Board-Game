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

lost = undefined;

debug = false;
my_card = undefined;

shuffle_discard = function() {
	//Check if lost
	if (array_length(discard) == 0) {
		lost = true;
		//audio_play_sound(snd_lost_game, 1, false);
		with(obj_player) {
			lost ??= false; //Nullish coalescing operator
			if (lost == false) {
				//audio_play_sound(snd_won_game, 1, false);
			}
		}
		obj_war_general.game_over();
		exit;
	}
	
	//Haven't lost, proceed as normal
	deck = array_shuffle(discard);
	discard = [];
	
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
	});
	
	audio_play_sound(snd_play_card, 1, false);
	
	//Sort based on depth
	_battle_card.depth = -_battle_card.goal_x;
	
	obj_war_general.cards[player_id] = _battle_card;
	
	repeat (_cards_to_create) {
		var _card = instance_create_layer(deck_x, deck_y, "War_Cards", obj_card, {
			owner : id,
			goal_x : id.play_x + (_war_x_offset * 64) - 95,
			goal_y : id.play_y + (offset * 64),
		});
		
		_card.in_war = true;
		_card.just_drawn = false;
			
		++_war_x_offset;
	}
	
	ready = true;
}

draw_card = function() {
	audio_play_sound(snd_play_card, 1, false);
	
	var _card = instance_create_layer(deck_x, deck_y, "Battle_Cards", obj_card, {
		goal_x : play_x,
		goal_y : play_y,
		owner : id,
	});
	
	obj_war_general.cards[player_id] = _card;
	my_card = _card;
	
	ready = true;
}