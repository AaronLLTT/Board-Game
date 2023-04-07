function draw_text_below(text, font, spacing, color) {
	draw_set_font(font);
	draw_set_color(color)
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x, bbox_bottom + spacing, text);
	draw_set_color(c_white);
}

function draw_text_above(text, font, spacing, color) {
	draw_set_font(font);
	draw_set_color(color)
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x, bbox_top - spacing, text);
	draw_set_color(c_white);
}

function draw_text_center(text, font, spacing, color) {
	draw_set_font(font);
	draw_set_color(color)
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(room_width / 2, room_height / 2 - spacing, text);
	draw_set_color(c_white);
}