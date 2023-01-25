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

customCurve = InitDynamicCurves(0.01);

//Assign self to a player's deck
objPlayer.AddToHand(sprite_index, myValue);

cards = ds_list_create();