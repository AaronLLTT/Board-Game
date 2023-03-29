/// @description Draw Option
draw_self();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fntInstructions);
draw_set_alpha(0.5);
draw_set_color(c_orange);
draw_rectangle(bbox_left, bbox_bottom + 32, bbox_right, bbox_bottom + 96, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(x, bbox_bottom + 64, my_text);