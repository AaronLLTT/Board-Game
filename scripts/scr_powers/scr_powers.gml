function init_powers() {
	two_cards = false; //Set this power to what the player can use
	draw_pool = undefined; //How many times they can still use this power
	using_power = false;
	more_war = false;
}

function init_draw_two_power(_player) {
	//Set the variables and methods needed to run this power
	with(_player) {
		init_powers();
		//Set these specific powers
		two_cards = true;
		draw_pool = 4;
		
		use_special_power = function() {
			//Check we have enough cards in our deck
			if (array_length(deck) <= 1) {
				shuffle_discard();
			}
			audio_play_sound(snd_play_card, 1, false);
	
			var _card = instance_create_layer(deck_x, deck_y, "Battle_Cards", obj_card, {
				goal_x : play_x - 45,
				goal_y : play_y,
				owner : id,
				battle_card : true,
			});
			var _card_2 = instance_create_layer(deck_x, deck_y, "Battle_Cards", obj_card, {
				goal_x : play_x + 45,
				goal_y : play_y,
				owner : id,
				battle_card : true,
			});
			
			_card.value += _card_2.value;
			
			obj_game.add_card(_card);
			my_card = _card;
	
			can_play = false;
			
			//Set we've used this power in the game object
			obj_game.powers[get_player_index(id)] = DRAW_TWO;
			
			using_power = true;
			draw_pool -= 1;
		}
	}
	
	shuffle_discard = function() {
		//Haven't lost, proceed as normal
		deck = array_shuffle(discard);
		discard = [];
		
		draw_pool += 2;
	
		//Destroy all cards in the discard pile
		with(obj_card) {
			if (owner == other.id) {
				instance_destroy();
			}
		}
	}
	//Create the special power button
	power_toggle = instance_create_layer(_player.x, _player.bbox_bottom + 80, "Instances", obj_draw_two_power, {
		owner : _player,
	});
}

function init_more_war_power(_player) {
	with(_player) {
		init_powers();
		more_war = true;
	}
	
	declare_more_war = function(_offset) {
		var _deck_size = array_length(deck);
		var _reward_amount = 6;
		
		if (_deck_size <= 0) {
			shuffle_discard();
		}
	
		//If we're out of cards
		if (_deck_size == 0) {
			end_of_round();
			exit;
		}
		//We don't have enough for a full war, so adjust
		else if (_deck_size <= _reward_amount) {
			_reward_amount = _deck_size - 1;
		}
	
		var _war_x_offset = 1;
		
		audio_play_sound(snd_play_card, 1, false);
		//Draw the new battle card, too
		var _battle_card = instance_create_layer(deck_x, deck_y, "War_Cards", obj_card, {
			owner : id,
			goal_x : id.play_x + (_offset * 30),
			goal_y : id.play_y,
		});
		
		_battle_card.value += 1;
		//Sort based on depth
		_battle_card.depth = -_battle_card.goal_x;
	
		obj_game.add_card(_battle_card);
	
		repeat (_reward_amount) {
			var _card = instance_create_layer(deck_x, deck_y, "War_Cards", obj_card, {
				owner : id,
				goal_x : id.play_x + (_war_x_offset * 64) - 95,
				goal_y : id.play_y + (_offset * 64),
			});
		
			_card.in_war = true;
			_card.just_drawn = false;
			_card.battle_card = false;
			
			++_war_x_offset;
			
			//Move the cards down 1
			if (_war_x_offset > 3) {
				_war_x_offset = 1;
				_offset += 1;
			}
		}
	
		can_play = false;
	}
	
	instance_create_layer(_player.x, _player.bbox_bottom + 80, "Instances", obj_more_war_power, {
		image_xscale : 0.15,
		image_yscale : 0.15,
	});
	
	obj_game.more_war = true;
}

function get_player_index(_player) {
	var index = 0;
	if (obj_game.players[index] == _player) {
		return index;
	}
	
	++index;
	
	return index;
}