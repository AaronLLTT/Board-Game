/// @description Draw Deck and Discard 

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
draw_set_font(fntNames);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, bbox_bottom + 32, name);

if (can_play == false) {
	draw_set_color(c_green);
	draw_text(x, bbox_bottom + 80, "Readied");
	draw_set_color(c_white);
}


//Game ending
if (player_local) {
	//Show who's who
	draw_text(x, bbox_top - 48, "I'm local!");
	if (lost == false) {
		draw_set_font(fntWar);
		draw_text_color(room_width / 2, room_height - 125, "You Won!", c_red, c_blue, c_orange, c_teal, 1);
	}
	else if (lost == true) {
		draw_set_font(fntWar);
		draw_text_color(room_width / 2, room_height - 125, "You Lost...", c_blue, c_grey, c_orange, c_silver, 1);
	}
}

//Debugging
if (debug) {
	draw_set_font(fntInstructions);
	if (x > room_width / 2) {
		draw_set_halign(fa_right);
	}
	else {
		draw_set_halign(fa_left);
	}
	draw_text(x, 32, "Deck size: " + string(array_length(deck)));
	draw_text(x, 64, "Discard size: " + string(array_length(discard)));
	if (my_card != undefined && instance_exists(my_card)) {
		draw_text(x, 96, "Card: " + string(my_card));
		var _state;
		if (my_card.just_drawn) {
			_state = "Just Drawn";
		}
		else if (my_card.in_war) {
			_state = "In War";
		}
		else if (my_card.in_discard) {
			_state = "Discarded";
		}
		draw_text(x, 132, "Card State: " + string(_state));
	}
	draw_text(x, 164, "Lost " + string(lost));
}