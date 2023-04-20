/// @description Draw Instructions 

if (rollback_game_running && room == rm_war) {
	draw_set_font(fnt_instructions);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	if (war) {
		draw_text_center("WAR!", fnt_war, 200, c_red);
	}
}
else if (rollback_game_running && room == rm_powers) {
	draw_text_center("Choose a power.", fnt_instructions, -50, c_white);
}
//We're waiting for other players to join, so put instructions on the screen
else {
	if (room == rm_war) {
		draw_text_center("Copy the URL and share it with a friend to begin playing", fnt_instructions, 100, c_white);
	}
}