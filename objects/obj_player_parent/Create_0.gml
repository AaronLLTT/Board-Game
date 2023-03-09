/// @description Init 

deck = [];
discard = [];

deck_x = x + 132;
deck_y = y;

discard_x = x - 132;
discard_y = y;

shuffle_seq = -1;

shuffle_discard = function() {
	deck = array_shuffle(discard);
	discard = [];
	shuffle_seq = layer_sequence_create("Cards", discard_x, discard_y, seq_shuffle);
	
	//Destroy all cards in the discard pile
	with(obj_card) {
		if (owner == other.id) {
			instance_destroy();
		}
	}
}