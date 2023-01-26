/// @description Fly into hand 

if (movingToHand) {
	x = ApplyCurve(customCurve, "x");
	y = ApplyCurve(customCurve, "y");
	
	if (curveFinished) {
		movingToHand = false;
		animcurve_destroy(customCurve);
		curveFinished = false;
		handX = x;
		handY = y;
	}
}

//Check for a card slot
if (beingPlayed) {
	x = mouse_x;
	y = mouse_y;
}

//Being played down in a slot
if (goingToSlot) {
	x = ApplyCurve(customCurve, "x");
	y = ApplyCurve(customCurve, "y");
	image_xscale = ApplyCurve(customCurve, "x_scale");
	image_yscale = ApplyCurve(customCurve, "y_scale");
	
	if (curveFinished) {
		onField = true;
	}
}
