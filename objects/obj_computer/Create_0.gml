/// @description 

//Computer specific data
player_name = "Computer";
image_xscale = -0.25;
image_yscale = 0.25;
x = 1241;
y = 384;

// Inherit the parent event
event_inherited();

//Choose a power randomly
var _num = random(1);

if (_num == 0) {
	init_draw_two_power(id);
}
else {
	init_more_war_power(id);
}