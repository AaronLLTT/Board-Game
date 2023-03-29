/// @description Draw when Ready

var _input = rollback_get_input();

if (rollback_game_running) {
	if (_input.space_pressed && obj_game.war == true && !ready) {
		declare_war(obj_game.war_level);
	}
	else if (_input.space_pressed && !ready) {
		draw_card();
	}

	if (_input.up_pressed) {
		debug = !debug;
	}
}