/// @description Go back to hand

if (beingPlayed && place_meeting(x, y, objCardSlot) == false) {
	customCurve = CreateCustomCurveFromCurve(acTest, ["x", "y"]);
	ModifyCurvePointsForMovement(customCurve, ["x", "y"], handX, handY);
	movingToHand = true;
	beingPlayed = false;
}