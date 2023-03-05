/// @description Stop moving at discard 

if (!active) {
	var _discard = owner.discard;

	if (distance_to_point(discard.x, discard.y) <= speed) {
		x = discard.x;
		y = discard.y;
		speed = 0;
	}
}

//Sort by its depth
depth = -y;