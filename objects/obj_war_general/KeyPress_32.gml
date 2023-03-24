/// @description Draw Cards 

//The primary state of the game, drawing 1 card for each player
/*
if (can_draw && global.WAR == false) {
	audio_play_sound(snd_play_card, 1, false);
	
	//Create a card for the player
	var _card = instance_create_layer(obj_player.deck_x, obj_player.deck_y, "Battle_Cards", obj_card, {
		owner : obj_player,
		goal_x : obj_player.play_x,
		goal_y: obj_player.play_y,
		in_war : true
	});
	//Keep track of the card in this object
	first_player_card = _card;
	
	//Create the card for the computer
	_card = instance_create_layer(obj_computer.deck_x, obj_computer.deck_y, "Battle_Cards", obj_card, {
		owner: obj_computer,
		goal_x : obj_computer.play_x,
		goal_y: obj_computer.play_y,
		in_war : true
	});
	//Keep track of the card in this object
	second_player_card = _card;
	
	//Don't allow drawing just yet. The cards, when put into the discard, will enable this boolean
	can_draw = false;
}
//If there's a war, call the player's wartime function
else if (can_draw && global.WAR == true) {
	//Increase war level and call each player to war
	++war_level;
	first_player_card = obj_player.declare_war(war_level);
	second_player_card = obj_computer.declare_war(war_level);
	
	can_draw = false;
}