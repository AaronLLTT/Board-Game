/// @description Draw when Ready

var _input = rollback_get_input();

if (_input.space_pressed && obj_war_general.war == true && !ready) {
	declare_war(obj_war_general.war_level);
}
else if (_input.space_pressed && !ready) {
	draw_card();
}