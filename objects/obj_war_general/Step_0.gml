/// @description Compare Cards 

//Check for win / loss
if (array_length(obj_player.deck) == 0 and can_draw) {
	//The player loses
	//instance_destroy(obj_player_parent);
	//Play sequence showing lose and try again
	game_restart();
}
if (array_length(obj_computer.deck) == 0 and can_draw) {
	//The player loses
	//instance_destroy(obj_player_parent);
	//Play sequence showing lose and try again
	game_restart();
}