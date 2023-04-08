/// @description Draw when Ready

//Get input via Rollback
var _input = rollback_get_input();

//We're ready to play
if (can_play && _input.space_pressed) {
	//Check for war 
	if (obj_game.war == true) {
		//check for war power
		if (more_war == true) {
			declare_more_war(obj_game.war_level);
		}
		else {
			declare_war(obj_game.war_level);
		}
	}
	//Draw like regular
	else {
		//Check for power
		if (two_cards && using_power) {
			draw_two_cards();
		}
		else {
			draw_card();
		}
	}
}

//Control the draw two power toggle
if (_input.up_pressed && power_toggle != undefined) {
	if (power_toggle.image_index == 0) {
		++power_toggle.image_index;
		using_power = true;
		//Check there's enough cards left
		if (array_length(deck) <= 1) {
			shuffle_discard();
			if (array_length(deck) <= 1) {
				using_power = false;
				power_toggle.image_index = 0;
			}
		}
	}
	else if (power_toggle.image_index == 1) {
		--power_toggle.image_index;
		using_power = false;
	}	
}