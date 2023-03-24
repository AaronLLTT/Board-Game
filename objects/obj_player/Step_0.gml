/// @description Draw when Ready

var _input = rollback_get_input();

if (_input.space_pressed && !ready) {
	draw_card();
	//show_message("draw");
}