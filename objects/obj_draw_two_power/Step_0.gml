/// @description Determine if power can be used

//The owner has run out of power
if (owner.draw_pool <= 0) {
	image_index = 2;
	owner.using_power = false;
}
//A war is happening
if (obj_game.war) {
	image_index = 2;
	owner.using_power = false;
}
//The owner doesn't have enough cards
if (array_length(owner.deck) + array_length(owner.discard) <= 1) {
	image_index = 2;
	owner.using_power = false;
}