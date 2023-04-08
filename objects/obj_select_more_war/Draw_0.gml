/// @description Draw Power Description

draw_self();

draw_set_font(fnt_powers);
draw_set_halign(fa_left);
draw_text_ext(bbox_left, bbox_bottom + 90, "Wars will trigger on cards with a value difference of up to " + string(obj_game.war_tolerance) +
"Your war card gets + 2 to its value, but you must offer double the rewards.\n\n" +
"Press L to select this power", 32, sprite_width);