/// @description Required Data and Method 

//Determine image and value
image_index = array_pop(owner.deck);
card_value = image_index mod 13 + 2;
card_face = image_index;

card_scale = 0.45;
image_xscale = card_scale;
image_yscale = card_scale;

//Don't show the front of the card when first drawn
image_index = 0;
sprite_index = spr_card_back;

//Both check to see if the card is close to the goal location and set it there once close enough
//will return true once it's reached its goal, and false until it has
at_goal = function() {
	if (point_distance(x, y, goal_x, goal_y) < 3) {
		x = goal_x;
		y = goal_y;
		return true;
	}
	else {
		return false;
	}
}