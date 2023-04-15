/// @description Move Between Rooms

//Choosing a power
/*
if (room == rm_powers && instance_exists(obj_select_draw_two)) {
	if (keyboard_check_pressed(ord("A"))) {
		//init_draw_two_power(id);
		instance_destroy(obj_select_draw_two);
		instance_destroy(obj_select_more_war);
		room_goto(rm_war); //This is causing another player to be created
		var prefs = 
		{
			powers : DRAW_TWO
		}
		
		rollback_set_player_prefs(prefs);
		rollback_start_game();
	}
	else if (keyboard_check_pressed(ord("L"))) {
		instance_destroy(obj_select_draw_two);
		instance_destroy(obj_select_more_war);
		room_goto(rm_war);
		var prefs = 
		{
			powers : MORE_WAR
		}
		
		rollback_set_player_prefs(prefs);
		rollback_start_game();
	}
}