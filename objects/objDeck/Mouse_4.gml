/// @description Create sequence 

if (owner == obj_war_player) {
	var _new_card = instance_create_layer(0, 0, "Instances", objCard);
	_new_card.image_index = array_pop(owner.deck);
	_new_card.value = _new_card.image_index mod 13 + 2;
	_new_card.owner = owner;
	
	var _seq = layer_sequence_create("Instances", room_width / 2, room_height / 2, seqDrawWarCardPlayer);
	
	//Get the sequence info
	var _seq_inst = layer_sequence_get_instance(_seq);
	
	//Pick the next card on the deck
	sequence_instance_override_object(_seq_inst, objCard, _new_card);
	
	//Do it again but for the enemy
	var _enemy_deck = instance_nearest(obj_war_enemy.x, obj_war_enemy.y, objDeck);
	_new_card = instance_create_layer(0, 0, "Instances", objCard);
	_new_card.image_index = array_pop(obj_war_enemy.deck);
	_new_card.value = _new_card.image_index mod 13 + 2;
	_new_card.owner = obj_war_enemy;
	
	_seq = layer_sequence_create("Instances", room_width / 2, room_height / 2, seqDrawWarCardEnemy);
	
	//Get the sequence info
	_seq_inst = layer_sequence_get_instance(_seq);
	
	//Pick the next card on the deck
	sequence_instance_override_object(_seq_inst, objCard, _new_card);
}