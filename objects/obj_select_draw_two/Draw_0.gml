/// @description Draw Power Description

draw_self();

draw_set_font(fnt_powers);
draw_set_halign(fa_left);
draw_text_ext(bbox_left, bbox_bottom + 120, "You can draw two cards and add their values together. This cannot be done during a war. " +
"Start with a power pool of 4 and gain 2 every time you shuffle.", 32, sprite_width);