/// @description Move 

//Smoothly move toward destination
x = lerp(x, goal_x, 0.1);
y = lerp(y, goal_y, 0.1);

var _done_moving = at_goal();

#region Just Drawn State

	if (just_drawn && _done_moving) {
		//We could be in war, so check that first
		if (global.WAR == true) {
			var _timer = time_source_create(time_source_global, global.REVIEW_TIME, time_source_units_frames, obj_war_general.check_war_status);
			time_source_start(_timer);
		}
		//Not in a war, so compare the two cards as usual
		else {
			var _timer = time_source_create(time_source_global, global.REVIEW_TIME, time_source_units_frames, obj_war_general.compare_cards);
			time_source_start(_timer);
		}
		
		//Either way, update the cards state
		in_war = true;
		just_drawn = false;
	}

#endregion

#region In the war state

	if (in_war) {
		//Do nothing
	}

#endregion
	
	
#region In the discard state
	
	if (in_discard) {
		
		sprite_index = spr_card_backs;
		image_index = 0;
	//Check if we're reaching the discard and the deck is empty
	if (_done_moving) {
		//Add ourself to the discard array
		array_push(owner.discard, face);
		//Deactivate ourselves
		instance_destroy();
		
		if (instance_number(obj_card) == 0) {
			
			//This allows the player to draw another card
			//It must be in this if section otherwise the
			//end section will trigger by the first card
			//adding itself to the array
			obj_war_general.can_draw = true;
			
			with(obj_player) {
				if (array_length(deck) == 0) {
					shuffle_discard();
				}
			}
			with(obj_computer) {
				if (array_length(deck) == 0) {
					shuffle_discard();
				}
			}
		}
	}
}
	
#endregion