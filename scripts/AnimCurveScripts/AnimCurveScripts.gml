function CreateCustomCurveFromCurve(animCurve, channels) {
	var originalPoints = [];
	for(var i = 0; i < array_length(channels); ++i) {
		//This copies the information over, but doesn't copy with the pointer. 
		//Now I can modify the points dynamically without effecting the original
		originalPoints[i] = json_parse(json_stringify(animcurve_get_channel(animcurve_get(animCurve), channels[i]))).points;
	}
				
	//Create a custom curve based on the points in the original curve
	var customCurve = animcurve_create();
	//Create the correct amount of arrays
	var tempChannels = array_create(array_length(channels) - 1);
	//Set the info for those channels
	for(var i = 0; i < array_length(channels); ++i) {
		tempChannels[i] = animcurve_channel_new();
		tempChannels[i].iterations = 8;
		tempChannels[i].type = animcurvetype_linear;
		tempChannels[i].name = channels[i];
		
		//Create the correct amount of points needed
		var points = array_create(array_length(originalPoints[i]));
		
		for(var j = 0; j < array_length(points); ++j) {
			points[j] = animcurve_point_new();
			points[j].posx = originalPoints[i][j].posx;
			points[j].value = originalPoints[i][j].value;
		}
		
		tempChannels[i].points = points;
	}
	
	customCurve.channels = tempChannels;
	
	curvePos = 0;
	
	return customCurve;
}

function ModifyCurvePointsForMovement(curve, channels, endX, endY) {
	//Set the first point to where we are now
	curve.channels[0].points[0].value = x;
	var totalChange = endX - x;
	var xCurveChannel = animcurve_get_channel(curve, channels[0]).points;
	for (var i = 1; i < array_length(xCurveChannel); ++i) {
		//Multiply the percent from the values, against the difference between the start and end point
		xCurveChannel[i].value = x + (totalChange * xCurveChannel[i].value);
	}

	//Alter the first point to where we're starting
	curve.channels[1].points[0].value = y;
	totalChange = endY - y;
	var yCurveChannel = animcurve_get_channel(curve, channels[1]).points;
	for (var i = 1; i < array_length(yCurveChannel); ++i) {
		yCurveChannel[i].value = y + (totalChange * yCurveChannel[i].value);
	};
	
	//Modify for speed
	if (curveSpeed != 0.5) {
		for (var i = 0; i < array_length(xCurveChannel); ++i) {
			xCurveChannel[i].posx /= curveSpeed;
		}
	
		for (var i = 0; i < array_length(yCurveChannel); ++i) {
			yCurveChannel[i].posx /= curveSpeed;
		}
	}
}

function ApplyCurve(curve, channel) {
	//Start moving along the curve
	if (curveTimer == undefined && !curveFinished) {
		curveTimer = time_source_create(time_source_game, curveTicker, time_source_units_seconds, id.IncreaseCurvePos, [], -1);
		time_source_start(curveTimer);
	}
	
	//Get values
	var curveChannel = animcurve_get_channel(curve, channel);
	var curveValue = animcurve_channel_evaluate(curveChannel, curvePos);
	
	if (curveValue == curveChannel.points[array_length(curveChannel.points) - 1].value) {
		return round(curveValue);
	}
	
	return curveValue;
}

function InitDynamicCurves(animSpeed) {
	//Init the variables the object needs to move
	curvePos = 0;
	if (animSpeed == 0) {
		curveSpeed = 0.5;
	}
	else {
		curveSpeed = animSpeed;
	}
	curveFinished = false;
	curveTimer = undefined;
	if (animSpeed == AC.Slow) {
		curveTicker = 0.01;
	}
	else {
		curveTicker = 0.02;
	}
	
	//Create a method function so we can pass it in the timer
	IncreaseCurvePos = function() {
		curvePos += curveTicker;
		
		//Check if we are done with the timer
		if ((curvePos >= 1 / curveSpeed) && curveSpeed != AC.Slow) {
			time_source_stop(curveTimer);
			time_source_destroy(curveTimer);
			curveTimer = undefined;
			curveFinished = true;
		}
		else if (curveSpeed == AC.Slow && curveSpeed >= 1) {
			time_source_stop(curveTimer);
			time_source_destroy(curveTimer);
			curveTimer = undefined;
			curveFinished = true;
		}
	}
	
	//Return undefined so the variable used with this function is named by the object
	return undefined;
}