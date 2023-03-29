/// @description Draw when Ready

if (rollback_game_running) {
	if (obj_game.game_finished == false) {
		if (obj_game.war == true && !ready) {
			declare_war(obj_game.war_level);
		}
		else if (!ready) {
			draw_card();
		}
	}
}