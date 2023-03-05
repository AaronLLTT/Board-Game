/// @description Insert 

deck = [];
discard = [];

shuffle_discard = function() {
	deck = array_shuffle(discard);
	discard = [];
	layer_sequence_create("Cards", x - 132, y, seq_shuffle);
}