/// @description Move 

//Smoothly move toward destination
x = lerp(x, goal_x, 0.1);
y = lerp(y, goal_y, 0.1);

//Check if we are at our goal and return true or false based on that info
var _done_moving = at_goal();

#region Just Drawn State

if (just_drawn && _done_moving) {
	//We could be in war, so check that first
	if (global.WAR == true) {
		//Check that we don't already have a time source active
		if (time_source_exists(global.TIME_SOURCE) == false) {
			global.TIME_SOURCE = time_source_create(time_source_global, global.REVIEW_TIME, time_source_units_frames, obj_war_general.check_war_status);
			time_source_start(global.TIME_SOURCE);
		}
	}
	//Not in a war, so compare the two cards as usual
	else {
		if (time_source_exists(global.TIME_SOURCE) == false) {
			global.TIME_SOURCE = time_source_create(time_source_global, global.REVIEW_TIME, time_source_units_frames, obj_war_general.compare_cards);
			time_source_start(global.TIME_SOURCE);
		}
	}
		
	//Either way, update the cards state
	in_war = true;
	just_drawn = false;
}

#endregion

#region In the war state

//This state exists for the card to sit and do nothing
if (in_war) {
	//Do nothing
}

#endregion
	
	
#region In the discard state
	
if (in_discard) {
	//Set the card's sprite to the back of the card while moving to the discard
	//sprite_index = spr_card_backs;
	//image_index = 0;
		
	//Check if we're reaching the discard and the deck is empty
	if (_done_moving) {
		//Add ourself to the discard array
		array_push(owner.discard, image_index);
		//Deactivate ourselves
		instance_destroy();
		//Only active this effect for the last of the cards heading to the discard
		if (instance_number(obj_card) == 0) {
			//This allows the player to draw another card
			//It must be in this if section otherwise the
			//end section will trigger by the first card
			//adding itself to the array
			obj_war_general.can_draw = true;
			//If either the player or computer are empty, shuffle their cards
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