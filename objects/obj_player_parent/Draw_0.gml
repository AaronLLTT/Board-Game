/// @description Draw Deck and Discard 

//Draw our portrait
draw_self();

//Draw a sprite for our deck based on the amount of cards remaining
if (array_length(deck) > 1) {
	draw_sprite(spr_card_stacks, 0, deck_x, deck_y);
}
else if (array_length(deck) == 1) {
	draw_sprite(spr_card_backs, 0, deck_x, deck_y);
}
else {
	draw_sprite(spr_empty_card_stack, 0, deck_x, deck_y);
}

//Draw a sprite for our discard based on if there are cards in it yet
draw_sprite(spr_empty_card_stack, 0, discard_x, discard_y);
if (array_length(discard) > 0) {
	draw_sprite(spr_card_backs, 0, discard_x, discard_y);
}

//Draw our name
draw_set_font(fntNames);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, bbox_bottom + 32, name);