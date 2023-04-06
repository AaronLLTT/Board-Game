/// @description 

//Choosing a power
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
else if (room == rm_powers && instance_exists(obj_portrait_select)) {
	if (keyboard_check_pressed(vk_right)) {
		obj_portrait_select.image_index += 1;
	}
	else if (keyboard_check_pressed(vk_left)) {
		obj_portrait_select.image_index -= 1;
	}
	else if (keyboard_check_pressed(vk_enter)) {
		var prefs = 
		{
			portrait : obj_portrait_select.image_index
		}
		
		rollback_set_player_prefs(prefs);
		rollback_start_game();
	}
}