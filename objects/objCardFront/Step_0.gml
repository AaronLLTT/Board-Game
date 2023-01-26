/// @description Fly into hand 

if (movingToHand) {
	x = ApplyCurve(customCurve, "x");
	y = ApplyCurve(customCurve, "y");
	
	if (curveFinished) {
		movingToHand = false;
		animcurve_destroy(customCurve);
		inHand = true;
		curveFinished = false;
	}
}

//Check for a card slot
if (beingPlayed) {
	x = mouse_x;
	y = mouse_y;
}