/// @description Init 

//Determine image and Value
image_index = array_pop(owner.deck);
value = image_index mod 13 + 2;

//Both check to see if the card is close to the goal location and set it there once close enough
//will return true once it's reached its goal, and false until it has
at_goal = function() {
	if point_distance(x, y, goal_x, goal_y) < 3
	{
		x = goal_x;
		y = goal_y;
		return true;
	}
	else 
	{
		return false;
	}
}