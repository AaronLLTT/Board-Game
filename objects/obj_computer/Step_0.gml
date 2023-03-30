/// @description Draw when Ready

//If we can play a card, play it
if (can_play == true) 
{
	if (obj_game.war == true) {
		declare_war(obj_game.war_level);
	}
	else {
		draw_card();
	}
}

//For whatever reason, image index is getting set to 0 when moving to room_war
image_index = 1;