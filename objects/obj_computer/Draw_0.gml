/// @description Draw Deck and Discard 
if (room == rm_war) {
	//Draw our portrait
	draw_self();

	//Draw a sprite for our deck based on the amount of cards remaining
	if (array_length(deck) >= 1) {
		draw_sprite_ext(spr_card_back, 0, deck_x, deck_y, 0.45, 0.45, 0, c_white, 1);
	}
	else {
		draw_sprite(spr_empty_card_stack, 0, deck_x, deck_y);
	}

	//Draw a sprite for our discard based on if there are cards in it yet
	draw_sprite(spr_empty_card_stack, 0, discard_x, discard_y);
	if (array_length(discard) > 0) {
		draw_sprite_ext(spr_card_back, 0, discard_x, discard_y, 0.45, 0.45, 0, c_white, 1);
	}

	//Draw our name
	draw_text_below(name, fnt_names, 16, c_white);

	if (can_play == false) {
		draw_text_above("Ready!", fnt_names, 4, c_green);
	}
}