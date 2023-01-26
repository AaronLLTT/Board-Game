/// @description Draw Text
draw_self();

draw_set_font(fntNames);
var _scribble = scribble("Ashira");
//draw_text_scribble(x, y + 96, "[shake][rainbow]Ashira");

_scribble.starting_format("fntNames", c_red);
_scribble.draw(x, y + 72);
