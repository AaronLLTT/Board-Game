/// @description 

//Computer specific data
player_name = "Aaron";
image_xscale = -0.25;
image_yscale = 0.25;
x = 1241;
y = 384;
image_blend = c_red;

// Inherit the parent event
event_inherited();

//Choose a power randomly
var _num = random(100);

if (_num == 0) {
	init_draw_two_power(id);
}
else {
	init_more_war_power(id);
}