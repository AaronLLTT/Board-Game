function init_draw_two_power(_player) {
	//Set the variables and methods needed to run this power
	with(_player) {
		two_cards = true; //Set this power to what the player can use
		draw_pool = 6; //How many times they can still use this power
		using_power = false;
		
		use_special_power = function() {
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
	//Create the special power button
	power_toggle = instance_create_layer(_player.x, _player.bbox_bottom + 80, "Instances", obj_draw_two_power, {
		owner : _player,
	});
}

function get_player_index(_player) {
	var index = 0;
	if (obj_game.players[index] == _player) {
		return index;
	}
	
	++index;
	
	return index;
}