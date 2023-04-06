/// @description Draw when Ready

//Get input via Rollback
var _input = rollback_get_input();

//We're ready to play
if (can_play && _input.space_pressed) {
	//Check for war 
	if (obj_game.war == true) {
		//check for war power
		if (more_war == true) {
			declare_more_war(obj_game.war_level);
		}
		else {
			declare_war(obj_game.war_level);
		}
	}
	//Draw like regular
	else {
		//Check for power
		if (two_cards == true) {
			use_special_power();
		}
		else {
			draw_card();
		}
	}
	
	//For debugging
	if (_input.up_pressed) {
		debug = !debug;
	}
}