/// @description Apply Shaders

if (beingSelected) {
	shader_set(shdOutline);
	var outlineColor = shader_get_uniform(shdOutline, "outlineColor");
	shader_set_uniform_f(outlineColor, make_color_rgb(209, 33, 56), 1);
	
	var outlineWidth = shader_get_uniform(shdOutline,"outlineW");
	shader_set_uniform_f(outlineWidth, 1 / sprite_width);

	var outlineHeight = shader_get_uniform(shdOutline,"outlineH");
	shader_set_uniform_f(outlineHeight, 1 / sprite_height);

	draw_self();
	shader_reset();
}
else {
	draw_self();
}



