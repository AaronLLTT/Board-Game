/// @description Draw Instructions 

draw_set_font(fntNames);
if (can_draw) {
	draw_text(room_width / 2, room_height - 200, "Draw a card");
}
else if (can_draw == false) {
	draw_text(room_width / 2, room_height - 200, "Wait");
}


if (global.WAR) {
	draw_set_font(fntWar);
	draw_text_color(room_width / 2, room_height - 125, "WAR TIME!!", c_red, c_blue, c_orange, c_teal, 1);
}

//Game ending
if (audio_is_playing(snd_won_game)) {
	draw_set_font(fntWar);
	draw_text_color(room_width / 2, room_height - 125, "You Won!", c_red, c_blue, c_orange, c_teal, 1);
}
else if (audio_is_playing(snd_lost_game)) {
	draw_set_font(fntWar);
	draw_text_color(room_width / 2, room_height - 125, "You Lost...", c_blue, c_grey, c_orange, c_silver, 1);
}