/// @description Choose any face

sprite_index = choose(sprCardClubs, sprCardDiamonds, sprCardHearts, sprCardSpades);

image_index = irandom(sprite_get_number(sprite_index) - 1);

myValue = image_index + 1;

beingPlayed = false; //Being dragged around
movingToHand = false; //MOving from sequence to hand
beingSelected = false; //Whether to show an outline or not
goingToSlot = false; //Moving from dragged around to put into a slot
onField = false

handX = 750 - (75 * array_length(objPlayer.myHand));
handY = 675;

enum AC {
	Slow = 0,
	Normal = 1,
	Fast = 2,
	VeryFast = 3
}

customCurve = InitDynamicCurves(AC.Fast);

//Assign self to a player's deck
objPlayer.AddToHand(sprite_index, myValue, id);

MoveTo = function(newX, newY) {
	customCurve = CreateCustomCurveFromCurve(acCardMove, ["x", "y"]);
	ModifyCurvePointsForMovement(customCurve, ["x", "y"], newX, newY);
	movingToHand = true;
}