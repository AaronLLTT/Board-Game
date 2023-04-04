/// @description Draw Power Description

draw_self();

if (image_index == 0) {
	draw_set_font(fnt_powers);
	draw_set_halign(fa_left);
	draw_text(bbox_left, bbox_bottom + 64, "You can draw two cards and add their values together." +
	"\nYou may do this up to 6 times during the game.\nPress A to select me.");
}