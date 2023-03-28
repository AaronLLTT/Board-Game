/// @description Draw when Ready

if (obj_war_general.game_finished == false) {
	if (obj_war_general.war == true && !ready) {
		declare_war(obj_war_general.war_level);
	}
	else if (!ready) {
		draw_card();
	}
}