/// @description Multiplayer Specific

// Inherit the parent event
event_inherited();

//Game ending
if (player_local) {
	if (lost == false) {
		draw_set_font(fnt_war);
		draw_text_color(room_width / 2, room_height - 125, "You Won!", c_red, c_blue, c_orange, c_teal, 1);
	}
	else if (lost == true) {
		draw_set_font(fnt_war);
		draw_text_color(room_width / 2, room_height - 125, "You Lost...", c_blue, c_grey, c_orange, c_silver, 1);
	}
}