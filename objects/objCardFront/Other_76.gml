/// @description Insert 

if (event_data[? "event_type"] == "sequence event") {
	switch (event_data[? "message"])
	{
		case "MoveToPlayersHand":
			if (!in_sequence && customCurve == undefined) {
				customCurve = CreateCustomCurveFromCurve(acCardMove, ["x", "y"]);
				ModifyCurvePointsForMovement(customCurve, ["x", "y"], handX, handY);
				
				movingToHand = true;
			}
		break;
	}
}