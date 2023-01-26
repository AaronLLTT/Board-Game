/// @description Player Data

myPortrait = sprPlayerFemale;
handStartX = 750;
handStartY = 675;
cardSpacing = 75;

CreateDeck = function(size) {
	var deck = [];
	for (var i = 0; i < size; ++i) {
		deck[i] = irandom(13);
	}
	return deck;
}
card = {
	sprite : undefined,
	value : undefined
}
AddToHand = function(sprite, value, cardID) {
	var card = {
		sprite : sprite,
		value : value,
		myID : cardID,
	}
	array_push(myHand, card);
}
RemoveFromHand = function(cardID) {
	for (var i = 0; i < array_length(myHand); ++i) {
		if (myHand[i].myID == cardID) {
			array_delete(myHand, i, 1);
			OrganizeHand();
			return;
		}
	}
}
OrganizeHand = function() {
	for (var i = 0; i < array_length(myHand); ++i) {
		if (i == 0) {
			myHand[i].myID.MoveTo(handStartX, handStartY);
		}
		else {
			myHand[i].myID.MoveTo(handStartX - (75 * i), handStartY);
		}
	}
}

myDeck = CreateDeck(60);
myHand = [];

cards = ds_list_create();