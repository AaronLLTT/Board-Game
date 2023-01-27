/// @description Data

path_start(pthBoard, 1, path_action_stop, false);
path_speed = 0;
point = 0;

SetGoal = function(spot) {
	goalX = path_get_point_x(path_index, spot);
	goalY = path_get_point_y(path_index, spot);
	point += spot;
	//At the end of the path
	if (point > path_get_number(path_index)) {
		point = path_get_number(path_index);
	}
	path_speed = 3;
}

pointsOnPath = [];
for (var i = 0; i <= 1; i += 0.00025) {
	var pathX = round(path_get_x(path_index, i));
	var pathY = round(path_get_y(path_index, i));
	var nextPoint = array_length(pointsOnPath);
	var nextPointX = round(path_get_point_x(path_index, nextPoint));
	var nextPointY = round(path_get_point_y(path_index, nextPoint));
	
	if (pathX == nextPointX && pathY == nextPointY) {
		var index = array_length(pointsOnPath);
		pointsOnPath[index][0] = pathX;
		pointsOnPath[index][1] = pathY;
	}
}

//Move along the path
//Stop at a specific point, as each point represents 1 square
//The points can be curved, which means I need the path_position of the point, not the x and y
