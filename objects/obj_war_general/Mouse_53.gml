/// @description Allow clicking on the player / deck to draw a card

if (point_in_rectangle(mouse_x, mouse_y, obj_player.bbox_left, obj_player.bbox_top, obj_player.bbox_right + 200, obj_player.bbox_bottom + 100)) {
	event_perform(ev_keypress, vk_space);
}