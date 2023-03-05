/// @description Move 

//Smoothly move toward destination
x = lerp(x, goal_x, 0.1);
y = lerp(y, goal_y, 0.1);

//Finally snap to spot
if (point_distance(x, y, goal_x, goal_y) < 0.1) {
	x = goal_x;
	y = goal_y;
	
	//Check if we're reaching the discard and the deck is empty
	if (array_length(owner.deck) == 0 and in_war == false) {
		owner.shuffle_discard();
	}
}

if (in_war) {
	//Report back
	if (x == goal_x and y == goal_y) {
		obj_war_general.ready_for_war = true;
	}
	else {
		obj_war_general.ready_for_war = false;
	}
}