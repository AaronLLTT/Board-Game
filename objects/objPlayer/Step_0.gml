/// @description Selecting a card

if (collision_point_list(mouse_x, mouse_y, objCardFront, false, false, cards, false)) {
	var selectedCard = 0;
	cards[| selectedCard].beingSelected = true;
	for (var i = 1; i < ds_list_size(cards); ++i) {
		if (cards[| i].x > cards[| selectedCard].x) {
			cards[| i].beingSelected = true;
			cards[| selectedCard].beingSelected = false;
			selectedCard = i;
		}
	}
	ds_list_clear(cards);
}





