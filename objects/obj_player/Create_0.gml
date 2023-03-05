/// @description Init 

deck = [];
discard = [];

shuffle_discard = function() {
	deck = array_shuffle(discard);
	discard = [];
	layer_sequence_create("Cards", x - 132, y, seq_shuffle);
	
	//Destroy all cards in the discard pile
	with(obj_card) {
		if (owner == other.id) {
			instance_destroy();
		}
	}
}