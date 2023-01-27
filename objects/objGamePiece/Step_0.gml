/// @description Move

if (path_speed != 0) {
	//Move until at goal
	var toGoal = point_distance(x, y, path_get_point_x(path_index, point), path_get_point_y(path_index, point));
	if (toGoal <= 5) {
		path_speed = 0;
		
		//Finished
		if (path_position >= 1) {
			show_message("You win!");
		}
	}
}


//show_debug_message("Point X: " + string(path_get_point_x(path_index, point)) + "   Point Y: " + string(path_get_point_y(path_index, point)));
//show_debug_message("Path Position: " + string(path_position) + "     Position to go for: " + string(positionOnPath)); //31 points