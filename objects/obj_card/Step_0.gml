/// @description Move 

//Smoothly move toward destination
x = lerp(x, goal_x, 0.1);
y = lerp(y, goal_y, 0.1);

//Finally snap to spot
if (point_distance(x, y, goal_x, goal_y) < 3) {
	x = goal_x;
	y = goal_y;
}

//When first created, the card is in the war state
if (just_drawn) {
	//We've reached out location and are ready for war
	if (x == goal_x and y == goal_y) {
		obj_war_general.cards_in_war += 1;
		in_war = true;
		just_drawn = false;
	}
}
//While in a war
if (in_war) {
	//Chill out
}
//When it's done warring, it goes to the discard
if (in_discard) {
	//Check if we're reaching the discard and the deck is empty
	if (x == owner.discard_x && y == owner.discard_y) {
		//Add ourself to the discard array
		array_push(owner.discard, image_index);
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