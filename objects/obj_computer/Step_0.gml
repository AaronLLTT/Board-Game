/// @description Draw when Ready

//If we can play a card, play it
if (can_play == true && obj_game.game_finished == false) 
{
	if (obj_game.war == true) {
		declare_war(obj_game.war_level);
	}
	else {
		//Choose to use the power randomly
		var _num = irandom(1);
		if (draw_pool <= 0 || array_length(deck) + array_length(discard) <= 1) {
			_num = 0;
		}
		if (_num == 0) {
			power_toggle.image_index = 0;
			draw_card();
		}
		else {
			power_toggle.image_index = 1;
			use_special_power();
		}
	}
}

//For whatever reason, image index is getting set to 0 when moving to room_war
image_index = 1;