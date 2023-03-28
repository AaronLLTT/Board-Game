/// @description Move 

//Smoothly move toward destination
x = lerp(x, goal_x, 0.1);
y = lerp(y, goal_y, 0.1);

//Check if we are at our goal and return true or false based on that info
var _done_moving = at_goal();

#region Just Drawn State

if (just_drawn && _done_moving) {
	
	obj_war_general.reveal_cards();
	
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
			for(var i = 0; i < array_length(obj_war_general.players); ++i) {
				obj_war_general.players[i].shuffle_discard();
			}
		}
	}
}
	
#endregion