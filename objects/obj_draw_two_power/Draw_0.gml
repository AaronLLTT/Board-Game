/// @description Draw Instructions

draw_self();

if (image_index == 1) {
	draw_text_below("Power Remaining: " + string(owner.draw_pool) + "\n Press up to Activate", 
	fnt_powers, 40, c_white);
}
else if (image_index == 2) {
	draw_text_below("Power Remaining: " + string(owner.draw_pool), fnt_powers, 40, c_white);
}
else {
	draw_text_below("Unable to use power.", fnt_powers, 40, c_white);
}