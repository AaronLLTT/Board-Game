/// @description Draw Power Description

draw_self();

draw_set_font(fnt_powers);
draw_set_halign(fa_left);
draw_text_ext(bbox_left, bbox_bottom + 90, "You can draw two cards and add their values together. " +
"You may do this up to 6 times during the game.\n\nPress A to select me.", 32, sprite_width);