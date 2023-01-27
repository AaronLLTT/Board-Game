/// @description Data

path_start(pthBoard, 2, path_action_stop, true);
path_speed = 0;
point = 0;
//Normalize the points along a path by dividing 1 by the number of points
positionOnPath = (1 / path_get_number(path_index)) * point;

SetGoal = function(spot) {
	goalX = path_get_point_x(path_index, spot);
	goalY = path_get_point_y(path_index, spot);
	point += spot;
	if (point > path_get_number(path_index)) {
		point = path_get_number(path_index);
	}
	positionOnPath = (1 / path_get_number(path_index)) * point;
	path_speed = 3;
}


