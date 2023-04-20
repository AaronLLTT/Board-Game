/// @description Override for Multiplayer

//Multiplayer specific settings
if (player_id == 0) {
	x = 125;
	y = 384;
	image_xscale = 0.25;
	image_yscale = 0.25;
}
else if (player_id == 1) {
	x = 1241;
	y = 384;
	image_index = 1;
	image_xscale = -0.25;
	image_yscale = .25;
}

event_inherited();

//Read and set any preferences
var prefs = rollback_get_player_prefs();

if (prefs.powers == 0) {
	init_draw_two_power(id);
}
else if (prefs.powers == 1) {
	init_more_war_power(id);
}

//For single player games
if (obj_game.game_local) {
	instance_create_layer(0, 0, "Instances", obj_computer);
}