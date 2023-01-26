/// @description Insert 

if (event_data[? "event_type"] == "sequence event") {
	switch (event_data[? "message"])
	{
		case "MoveToPlayersHand":
			if (!in_sequence && customCurve == undefined) {
				customCurve = CreateCustomCurveFromCurve(acCardMove, ["x", "y"]);
				ModifyCurvePointsForMovement(customCurve, ["x", "y"], 
				global.HandStartX - (global.HandSpacing *  array_length(objPlayer.myHand)), global.HandStartY);
				//Assign self to a player's deck
				objPlayer.AddToHand(sprite_index, myValue, id);
				
				movingToHand = true;
			}
		break;
	}
}