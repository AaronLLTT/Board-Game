/// @description 

if (owner.draw_pool <= 0) {
	image_index = 2;
	owner.using_power = false;
}

if (obj_game.war) {
	image_index = 2;
	owner.using_power = false;
}