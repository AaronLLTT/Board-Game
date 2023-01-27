/// @description Move

if (path_speed != 0) {
	//Move until at goal
	//var toGoal = point_distance(x, y, path_get_point_x(path_index, point), path_get_point_y(path_index, point));
	if (path_position >= positionOnPath) {
		path_speed = 0;
		path_position = positionOnPath;
		
		//Finished
		if (point == path_get_number(path_index)) {
			show_message("You win!");
		}
	}
}



show_debug_message("Path Position: " + string(path_position) + "     Position to go for: " + string(positionOnPath)); //31 points