/// @description Call function
//Multiplayer game
if (image_index == 1) {
	obj_network_general.create_game(2);
}
//Single player game
else if (image_index == 3) {
	obj_network_general.create_game(1);
}