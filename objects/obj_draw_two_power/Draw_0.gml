/// @description 

if (array_length(owner.deck) + array_length(owner.discard) > 1) {
	draw_self();
	draw_set_font(fntInstructions);
	draw_text(x, y + 64, "Power Remaining: " + string(owner.draw_pool));
}
else {
	draw_self();
	draw_set_font(fntInstructions);
	draw_text(x, y + 64, "Not enough cards.");
}