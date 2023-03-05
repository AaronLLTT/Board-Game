/// @description Go to War! 

if (can_draw) {
	//Create a card for the player
	var _card = instance_create_layer(obj_player.x + 128, obj_player.y, "Cards", obj_card, {
		owner : obj_player,
		goal_x : 683,
		goal_y: 450,
		in_war : true
	});

	player_card = _card;

	_card = instance_create_layer(obj_computer.x + 128, obj_computer.y, "Cards", obj_card, {
		owner: obj_computer,
		goal_x : 683,
		goal_y : 300,
		in_war : true
	});

	computer_card = _card;

	can_draw = false;
}