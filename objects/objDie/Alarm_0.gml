/// @description Change face

//Choose a new face for the die
var selectedFace = irandom(array_length(faces) - 1);

//Ensure the die doesn't choose the same face
//if it does, it feels glitchy. When rolling a real
//die, it can't ever roll onto a new side and still
//be the same number, so this keeps it feeling much
//smoother
if (faces[selectedFace] == sprite_index) {
	while(faces[selectedFace] == sprite_index) {
		selectedFace = irandom(array_length(faces) - 1);
	}
}

//Change our sprite
sprite_index = faces[selectedFace];

//Start the appropriate timers
if (rollTimer < maxRollTime) { //If there's still time left, change face again
	alarm[0] = rollTimer / rollSpeed;
}
else { //If we're done, show the results of the final roll
	finalFace = selectedFace + 1;
	rollTimer = 10;
}