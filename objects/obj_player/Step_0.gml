/// @description Draw when Ready

//Get input via Rollback
var _input = rollback_get_input();

//We're ready to play
if (can_play && _input.space_pressed) 
{
	//Check for war 
	if (obj_game.war == true) {
		declare_war(obj_game.war_level);
	}
	//Draw like regular
	else {
		draw_card();
	}
	
	//For debugging
	if (_input.up_pressed) {
		debug = !debug;
	}
}