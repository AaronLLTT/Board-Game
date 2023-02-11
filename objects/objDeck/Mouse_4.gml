/// @description Create sequence 

if (owner == obj_war_player) {
	var _new_card = instance_create_layer(0, 0, "Instances", objCard);
	var _card_number = array_pop(owner.deck);
	_new_card.image_index = _card_number;
	
	var _seq = layer_sequence_create("Instances", x, y, seqDrawWarCardPlayer);
	
	//Get the sequence info
	var _seq_inst = layer_sequence_get_instance(_seq);
	
	//Pick the next card on the deck
	sequence_instance_override_object(_seq_inst, objCard, _new_card);
}