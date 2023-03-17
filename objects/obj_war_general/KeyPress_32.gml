/// @description Go to War! 

if (can_draw && global.WAR == false) {
	audio_play_sound(snd_play_card, 1, false);
	
	//Create a card for the player
	var _card = instance_create_layer(obj_player.deck_x, obj_player.deck_y, "Battle_Cards", obj_card, {
		owner : obj_player,
		goal_x : obj_player.play_x,
		goal_y: obj_player.play_y,
		in_war : true
	});

	player_card = _card;

	_card = instance_create_layer(obj_computer.deck_x, obj_computer.deck_y, "Battle_Cards", obj_card, {
		owner: obj_computer,
		goal_x : obj_computer.play_x,
		goal_y: obj_computer.play_y,
		in_war : true
	});

	computer_card = _card;

	can_draw = false;
}
else if (can_draw && global.WAR == true) {
	
	player_card = obj_player.declare_war(war_level);
	computer_card = obj_computer.declare_war(war_level);
	
	++war_level;
	
	can_draw = false;
}