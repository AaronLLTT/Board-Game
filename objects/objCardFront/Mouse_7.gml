/// @description Go back to hand or go down

//Dragging around, but not setting on a viable slot
if (beingPlayed && place_meeting(mouse_x, mouse_y, objCardSlot) == false) {
	customCurve = CreateCustomCurveFromCurve(acCardMove, ["x", "y"]);
	ModifyCurvePointsForMovement(customCurve, ["x", "y"], handX, handY);
	movingToHand = true;
	beingPlayed = false;
	beingSelected = false;
}
else if (beingPlayed && place_meeting(mouse_x, mouse_y, objCardSlot) == true && instance_nearest(mouse_x, mouse_y, objCardSlot).taken == true) {
	customCurve = CreateCustomCurveFromCurve(acCardMove, ["x", "y"]);
	ModifyCurvePointsForMovement(customCurve, ["x", "y"], handX, handY);
	movingToHand = true;
	beingPlayed = false;
	beingSelected = false;
}
//Dragging around and set on a viable spot
else if (beingPlayed && place_meeting(mouse_x, mouse_y, objCardSlot) == true) {
	customCurve = CreateCustomCurveFromCurve(acCardPlayedDown, ["x", "y", "x_scale", "y_scale"]);
	var slot = instance_nearest(mouse_x, mouse_y, objCardSlot);
	ModifyCurvePointsForMovement(customCurve, ["x", "y"], slot.x, slot.y);
	ModifyCurvePointsForScale(customCurve, ["x_scale", "y_scale"], 1, 1);
	goingToSlot = true;
	beingPlayed = false;
	beingSelected = false;
	slot.taken = true;
	objPlayer.RemoveFromHand(id);
	//Change the depth
	layer_add_instance("PlayedCards", id);
}