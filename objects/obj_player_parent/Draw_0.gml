/// @description Draw Deck and Discard 

draw_self();

if (array_length(deck) > 0) {
	draw_sprite(sprCardDeckStackTop, 0, deck_x, deck_y);
}
else {
	draw_sprite(sprCardSlot, 0, deck_x, deck_y);
}

//Draw it empty until there's a card on top
if (array_length(discard) == 0) {
	draw_sprite(sprCardSlot, 0, discard_x, discard_y);
}
else {
	draw_sprite(sprCardBack, 0, discard_x, discard_y);
}