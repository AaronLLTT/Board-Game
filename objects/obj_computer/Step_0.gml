/// @description Draw when Ready

//If we can play a card, play it
if (can_play && lost == undefined) 
{
	//If we're in a war, act like it
	if (obj_game.war == true) {
		if (more_war) {
			declare_more_war(obj_game.war_level);
		}
		else {
			declare_war(obj_game.war_level);
		}
	}
	//No war, so draw a card like normal
	else {
		if (two_cards) {
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
				draw_two_cards();
			}
		}
		//Doesn't have the drawing power, so just draw a card
		else {
			draw_card();
		}
	}
}

//For whatever reason, image index is getting set to 0 when moving to room_war
image_index = 1;