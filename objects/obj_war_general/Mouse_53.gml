/// @description Draw 

if (point_in_rectangle(mouse_x, mouse_y, 500, 630, 900, 800)) {
	event_perform(ev_keypress, vk_space);
}