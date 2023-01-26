/// @description Choose any face

sprite_index = choose(sprCardClubs, sprCardDiamonds, sprCardHearts, sprCardSpades);

image_index = irandom(sprite_get_number(sprite_index) - 1);

myValue = image_index + 1;

inHand = false;
beingPlayed = false;
movingToHand = false;
adjustingHand = false;
beingSelected = false;

handX = 750 - (75 * (instance_number(objCardFront) - 1));
handY = 675;

enum AC {
	Slow = 0,
	Normal = 1,
	Fast = 2,
	VeryFast = 3
}

customCurve = InitDynamicCurves(AC.Slow);

//Assign self to a player's deck
objPlayer.AddToHand(sprite_index, myValue);

cards = ds_list_create();