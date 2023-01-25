/// @description Apply Shaders

if (beingSelected) {
	shader_set(shdOutline);
	var outlineColor = shader_get_uniform(shdOutline, "outlineColor");
	shader_set_uniform_f(outlineColor, 1, 1, 1, 1);
	
	var outlineWidth = shader_get_uniform(shdOutline,"outlineW");
	shader_set_uniform_f(outlineWidth, 5 / sprite_width);

	var outlineHeight = shader_get_uniform(shdOutline,"outlineH");
	shader_set_uniform_f(outlineHeight, 5 / sprite_height);

	draw_self();
	shader_reset();
}
else {
	draw_self();
}

draw_set_halign(fa_center);
draw_text(x, y - (sprite_height / 2) - 48, "X Pos: " + string(x) + "\nY Pos: " + string(y));



