/// @description Draw Deck and Discard 

draw_self();

if (array_length(deck) > 0) {
	draw_sprite(sprCardDeckStackTop, 0, x + 132, y);
}
else {
	draw_sprite(sprCardSlot, 0, x + 132, y);
}

draw_sprite(sprCardSlot, 0, x - 132, y);