/// @description 

if (owner.draw_pool <= 0) {
	image_index = 2;
	owner.using_power = false;
}

if (obj_game.war) {
	image_index = 2;
	owner.using_power = false;
}

if (array_length(owner.deck) + array_length(owner.discard) <= 1) {
	image_index = 2;
	owner.using_power = false;
}