/// @description Draw Instructions 

draw_set_font(fntInstructions);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (can_draw) {
	draw_text(room_width / 2, room_height - 200, "Draw a card");
}
else if (can_draw == false) {
	draw_text(room_width / 2, room_height - 200, "Wait");
}


if (war) {
	draw_set_font(fntWar);
	draw_text_color(room_width / 2, room_height - 125, "WAR TIME!!", c_red, c_blue, c_orange, c_teal, 1);
}