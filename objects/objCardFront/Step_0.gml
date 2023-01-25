/// @description Fly into hand 

if (movingToHand) {
	x = ApplyCurve(customCurve, "x");
	y = ApplyCurve(customCurve, "y");
	
	if (curvePos >= 1) {
		movingToHand = false;
		animcurve_destroy(customCurve);
		inHand = true;
	}
}

//Check for a card slot
if (beingPlayed) {
	x = mouse_x;
	y = mouse_y;
}